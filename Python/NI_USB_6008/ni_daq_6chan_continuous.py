import nidaqmx
from nidaqmx import constants
from nidaqmx.stream_readers import AnalogSingleChannelReader
from timeit import default_timer as timer
import numpy as np

device_name = "Dev3/ai0,Dev3/ai1,Dev3/ai2,Dev3/ai3,Dev3/ai4,Dev3/ai5"
FILE_PATH = "TestData/fff2.txt"
analog_task = None
write_path = open(FILE_PATH, 'a')
absolute_start = timer()
N_Nm = False

cal_mat = [[0.23881,  -0.39328,  -1.37672,  31.98992,   1.49137, -33.98297],
           [1.26170, -37.37657,  -0.49064,  18.09416,  -0.93058,  19.72958],
           [18.58244,   0.14641,  18.27615,   0.20359,  18.83641,  -0.10735],
           [0.07510,  -0.24180,  32.37911,   0.61969, -32.45683,   0.09251],
           [-36.74939,  -0.41854,  18.07578,   0.02174,  19.65460,   0.12561],
           [0.65221, -18.23951,   0.73615, -17.93143,   0.88052, -19.26224]]

cal_mat2 = [[0.02058, -0.03389, -0.11862, 2.75633, 0.12850, -2.92805],  # Fx
            [ 0.10871, -3.22046, -0.04227, 1.55904, -0.08018, 1.69995], #   Fy
            [ 4.71416, 0.03714, 4.63646, 0.05165, 4.77859, -0.02723],   #   Fz
            [ 0.02905, -0.69919, 2.62607, 0.37939, -2.65824, 0.36622],  #   Tx
            [ -2.99499, -0.02691, 1.49603, -0.57982, 1.57237, 0.62804], #   Ty
            [ 0.05304, -1.48329, 0.05987, -1.45823, 0.07161, -1.56646]] #   Tz]

def my_callback(task_handle, every_n_samples_event_type, number_of_samples, callback_data):
    global analog_task
    global write_path
    global absolute_start
    global bias_vector
    global cal_mat2, N_Nm
    np_values = analog_task.read(number_of_samples_per_channel=nidaqmx.constants.READ_ALL_AVAILABLE,
                                 timeout=nidaqmx.constants.WAIT_INFINITELY)
    end = timer()
    print("Sample Size: " + str(len(np_values)))
    # print(np_values)
    
    # print("[" + str(np_values[0][0]-bias_vector[0])+", "+str(np_values[1][0]-bias_vector[1])+", "+str(np_values[2][0]-bias_vector[2]) + ", "+str(np_values[3][0]-bias_vector[3])+", "+str(np_values[4][0]-bias_vector[4])+", "+str(np_values[5][0]-bias_vector[5])+"]")
    unbiased_volt = [(np_values[0][0]-bias_vector[0]), (np_values[1][0]-bias_vector[1]), (np_values[2][0]-bias_vector[2]), (np_values[3][0]-bias_vector[3]), (np_values[4][0]-bias_vector[4]), (np_values[5][0]-bias_vector[5])]
    res = np.dot(cal_mat2,unbiased_volt)
    if N_Nm is True:
        write_path.write(str(end-absolute_start)+","+str(res[0]*4.4482216152605)+","+str(res[1]*4.4482216152605)+","+str(res[2]*4.4482216152605)+","+str(res[3]*0.1129848333)+","+str(res[4]*0.1129848333)+","+str(res[5]*0.1129848333)+"\n" )
    else:
        write_path.write(str(end-absolute_start)+","+str(res[0])+","+str(res[1])+","+str(res[2])+","+str(res[3])+","+str(res[4])+","+str(res[5])+"\n" )

        
    write_path.write(str(end-absolute_start)+","+str(res[0]*4.4482216152605)+","+str(res[1]*4.4482216152605)+","+str(res[2]*4.4482216152605)+","+str(res[3]*0.1129848333)+","+str(res[4]*0.1129848333)+","+str(res[5]*0.1129848333)+"\n" )
    print((end-absolute_start) , res )
    return 0


def ai_single_continuous():
    global analog_task
    global bias_vector
    #  Create Task
    # --------------
    analog_task = nidaqmx.Task()

    #  Create Virtual Channel - Analog Input
    # --------------------------------------
    analog_task.ai_channels.add_ai_voltage_chan(physical_channel=device_name,
                                                name_to_assign_to_channel="",
                                                terminal_config=constants.TerminalConfiguration.RSE,
                                                min_val=-10.0,
                                                max_val=10.0,
                                                units=constants.VoltageUnits.VOLTS,
                                                custom_scale_name=None)

    #  Sets the source of the Sample Clock, the rate of the Sample
    #  Clock, and the number of samples to acquire or generate.
    Fs = 50.0  # Hz
    samples_per_channel = 1
    # analog_task.start()
    bias_vector = analog_task.read()
 

    analog_task.timing.cfg_samp_clk_timing(rate=Fs,
                                           source=None,
                                           active_edge=nidaqmx.constants.Edge.RISING,
                                           sample_mode=nidaqmx.constants.AcquisitionType.CONTINUOUS,
                                           samps_per_chan=samples_per_channel)

    # Register my_callback function
    analog_task.register_every_n_samples_acquired_into_buffer_event(samples_per_channel, my_callback)

    #  Start Task
    # -----------
    analog_task.start()

    #  Acquire Analog Value
    # ---------------------
    # my_callback function takes care of the analog acquisition

    input("")

    #  Stop and Clear Task
    # --------------------
    analog_task.stop()
    analog_task.close()


if __name__ == "__main__":
    ai_single_continuous()
