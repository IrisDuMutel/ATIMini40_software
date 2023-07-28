import sys
import nidaqmx
from nidaqmx import constants
from nidaqmx.stream_readers import AnalogSingleChannelReader
from timeit import default_timer as timer

from PyQt6 import QtCore, QtGui, QtWidgets, uic
from PyQt6.QtWidgets import QApplication
from PyQt6.QtCore import QThread, QObject, pyqtSignal, QTimer

import pyqtgraph as pg
from pyqtgraph import PlotWidget
from pyqtgraph.Qt import QtGui, QtCore

from collections import deque
import numpy as np

DAQ_ADDRESS = 'Dev3'
FILE_PATH = "TestData/ccc.txt"
RANGE = "10"
RESOLUTION = "0.001"
CHANNEL_LIST = "Dev3/ai0,Dev3/ai1,Dev3/ai2,Dev3/ai3,Dev3/ai4,Dev3/ai5"
FILE_PATH = "TestData/fff2.txt"
analog_task = None
write_path = open(FILE_PATH, 'a')
absolute_start = timer()
FS = "50.0"  # Hz
SAMPLE_PER_CHANNEL = "1"

cal_mat2 = [[0.02058, -0.03389, -0.11862, 2.75633, 0.12850, -2.92805],  # Fx
            [ 0.10871, -3.22046, -0.04227, 1.55904, -0.08018, 1.69995], #   Fy
            [ 4.71416, 0.03714, 4.63646, 0.05165, 4.77859, -0.02723],   #   Fz
            [ 0.02905, -0.69919, 2.62607, 0.37939, -2.65824, 0.36622],  #   Tx
            [ -2.99499, -0.02691, 1.49603, -0.57982, 1.57237, 0.62804], #   Ty
            [ 0.05304, -1.48329, 0.05987, -1.45823, 0.07161, -1.56646]] #   Tz]


class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.absolute_start = timer()
        self.N_Nm = False
        
        # Load ui File
        uic.loadUi("Python/NI_USB_6008/ATIMini40_GUI.ui", self)
    
        
        # Initialize Components on the GUI
        self.comboBox_deviceName.addItem(DAQ_ADDRESS)
        self.textEdit_channelList.setText(CHANNEL_LIST)
        self.textEdit_Range.setText(RANGE)
        self.textEdit_Resolution.setText(RESOLUTION)
        self.textEdit_FS.setText(FS)
        self.textEdit_SPC.setText(SAMPLE_PER_CHANNEL)
        self.textEdit_FilePath.setText(FILE_PATH)
        self.savaDataFlag = False

        self.timer=QTimer()
        self.timer.timeout.connect(self.my_callback)
        # Callback Functions
        self.startButton.clicked.connect(self.on_press)
        self.stopButton.clicked.connect(self.on_release)
        self.checkBox.stateChanged.connect(self.save_data)
        self.timer.timeout.connect(self.my_callback)

    def save_data(self):
        self.savaDataFlag = True


    def on_press(self):
        self.ai_single_continuous()
        self.timer.start(1)

    def on_release(self):
        self.timer.stop()


    def my_callback(self,task_handle, every_n_samples_event_type, number_of_samples, callback_data):
        global analog_task
        global write_path
        global absolute_start
        global bias_vector
        global cal_mat2
        np_values = analog_task.read(number_of_samples_per_channel=nidaqmx.constants.READ_ALL_AVAILABLE,
                                    timeout=nidaqmx.constants.WAIT_INFINITELY)
        end = timer()
        print("Sample Size: " + str(len(np_values)))
        # print(np_values)
        
        # print("[" + str(np_values[0][0]-bias_vector[0])+", "+str(np_values[1][0]-bias_vector[1])+", "+str(np_values[2][0]-bias_vector[2]) + ", "+str(np_values[3][0]-bias_vector[3])+", "+str(np_values[4][0]-bias_vector[4])+", "+str(np_values[5][0]-bias_vector[5])+"]")
        unbiased_volt = [(np_values[0][0]-bias_vector[0]), (np_values[1][0]-bias_vector[1]), (np_values[2][0]-bias_vector[2]), (np_values[3][0]-bias_vector[3]), (np_values[4][0]-bias_vector[4]), (np_values[5][0]-bias_vector[5])]
        res = np.dot(cal_mat2,unbiased_volt)
        if self.N_Nm is True:
            write_path.write(str(end-absolute_start)+","+str(res[0]*4.4482216152605)+","+str(res[1]*4.4482216152605)+","+str(res[2]*4.4482216152605)+","+str(res[3]*0.1129848333)+","+str(res[4]*0.1129848333)+","+str(res[5]*0.1129848333)+"\n" )
        else:
            write_path.write(str(end-absolute_start)+","+str(res[0])+","+str(res[1])+","+str(res[2])+","+str(res[3])+","+str(res[4])+","+str(res[5])+"\n" )

            
        write_path.write(str(end-absolute_start)+","+str(res[0]*4.4482216152605)+","+str(res[1]*4.4482216152605)+","+str(res[2]*4.4482216152605)+","+str(res[3]*0.1129848333)+","+str(res[4]*0.1129848333)+","+str(res[5]*0.1129848333)+"\n" )
        print((end-absolute_start) , res )
        return 0


    def ai_single_continuous(self):
        global analog_task
        global bias_vector
        #  Create Task
        # --------------
        analog_task = nidaqmx.Task()

        #  Create Virtual Channel - Analog Input
        # --------------------------------------
        analog_task.ai_channels.add_ai_voltage_chan(physical_channel=self.textEdit_channelList.text(),
                                                    name_to_assign_to_channel="",
                                                    terminal_config=constants.TerminalConfiguration.RSE,
                                                    min_val=-int(self.textEdit_Range.text()),
                                                    max_val=int(self.textEdit_Range.text()),
                                                    units=constants.VoltageUnits.VOLTS,
                                                    custom_scale_name=None)

        #  Sets the source of the Sample Clock, the rate of the Sample
        #  Clock, and the number of samples to acquire or generate.
        
        # analog_task.start()
        bias_vector = analog_task.read()
    

        analog_task.timing.cfg_samp_clk_timing(rate=int(self.textEdit_FS.text()),
                                            source=None,
                                            active_edge=nidaqmx.constants.Edge.RISING,
                                            sample_mode=nidaqmx.constants.AcquisitionType.CONTINUOUS,
                                            samps_per_chan=int(self.textEdit_SPC.text()))

        # Register my_callback function
        analog_task.register_every_n_samples_acquired_into_buffer_event(int(self.textEdit_SPC.text()), self.my_callback)

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
    app = QApplication(sys.argv)
    win = MainWindow()
    win.show()
    sys.exit(app.exec())
