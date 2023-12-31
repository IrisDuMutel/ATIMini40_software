# Original code provided by Prof. Goncalo Fernandes Pereira Martins
import sys
from time import sleep
import numpy as np
from timeit import default_timer as timer
import csv
import pyvisa as visa

DAQ_ADDRESS = 'GPIB0::9::INSTR'  # DAQ -> KEYSIGHT 3497A
CHANNEL_LIST = "(@101:106)"
write_path = open('TestData/bbb.csv', 'w')
rm = visa.ResourceManager()


def DAQ_Info():
    # System Information
    # ---------------------
    # Open connection
    inst = rm.open_resource(DAQ_ADDRESS)
    print('INSTRUMENT ID string:\n  ', inst.query('*IDN?'), flush=True)
    print("SCPI Version: ", inst.query("SYST:VERS?"), flush=True)
    # Reset Device
    inst.write("*rst; status:preset; *cls")
    # ---------------------

    # Close connection
    inst.close()
    # ---------------------


def DAQ_Test_Commands():
    # Open connection
    inst = rm.open_resource(DAQ_ADDRESS)

    # Reset Device
    inst.write("*rst; status:preset; *cls")
    sleep(1)

    # Channels Configuration
    # ---------------------
    inst.write("ROUT:OPEN CHANNEL_LIST")  # Open channels

    print("[Default Config]: ", inst.query("CONF? CHANNEL_LIST"), flush=True)
    inst.write("CONF:VOLT:AC CHANNEL_LIST")  # Configure channel for AC voltage
    # inst.write("VOLT:AC:RANG 10,CHANNEL_LIST")  # sets the voltage range

    print("[Default Resolution]: ", inst.query("VOLT:AC:RES? CHANNEL_LIST"), flush=True)
    # inst.write("VOLT:AC:RES 0.00001,CHANNEL_LIST")  # sets the resolution

    print("[Default Delay]: ", inst.query("ROUT:CHAN:DELAY? CHANNEL_LIST"), flush=True)
    inst.write("ROUT:CHAN:DELAY:AUTO ON,CHANNEL_LIST")  # enables automatic delay
    # ---------------------

    # Measurement Setup
    # ---------------------

    inst.write("DISP OFF")  # turns display off for slight increase in measurement rates
    inst.write("DISP:TEXT 'SCANNING...'")

    inst.write("INST:DMM ON")  # Enables the internal DMM

    # Scan List of the desired multiplex channels
    inst.write("ROUT:SCAN CHANNEL_LIST")

    #inst.write("TRIG:SOURCE IMMEDIATE")  # Select continous scan trigger
    inst.write("TRIG:SOURCE TIMER")  # Select the interval timer configuration
    inst.write("TRIG:TIMER 50E-03")  # Set the scan interval to 50 msec

    inst.write("TRIG:COUNT 10")  # Sweep the scan list -> TRIG:TIMER / (VOLT:DC:APER * Num_Channels)
    # (Note: 10 is for 12 channels)

    print("[OPER]: ", inst.query("STAT:OPER:COND?"), flush=True)

    inst.write("INITIATE")  # Initiate the scan -> stores readings in memory
    inst.write("FETCH?")  # Transfers the readings from memory to the instrument's output buffer.

    # Wait until a data is available
    lenPoints = 0
    while (lenPoints == 0):
        # Returns the number of readings in memory
        points = inst.query_ascii_values("DATA:POINTS?", container=np.array)
        lenPoints = len(points)
        print('[Number of Readings]: ', len(points), flush=True)
        print(points)

    # Returns N readings (starting with the oldest reading first) and erases them from memory.
    # print('[Data]: ', inst.query("DATA:REMOVE? 1"), flush=True)
    # values = np.array(inst.query_ascii_values("DATA:REMOVE? 1"))
    values = inst.query_ascii_values("DATA:REMOVE? 2", container=np.array)
    print(values[1])

    inst.write("DISP ON")
    inst.write("DISP:TEXT 'Done.'")

    # Close connection
    inst.close()
    # ---------------------


def DAQ_Manual_Sampling():
    global write_path
    global CHANNEL_LIST

    # Open connection
    # ---------------------
    inst = rm.open_resource(DAQ_ADDRESS)

    # Reset Device
    # ---------------------
    inst.write("*rst; status:preset; *cls")
    sleep(1)

    # Channels Configuration
    # ---------------------
    inst.write("ROUT:OPEN " + CHANNEL_LIST)  # Open channels

    # Configure channel for DC voltage
    print("[Config]: ", inst.query("CONF? {}".format(CHANNEL_LIST)), flush=True)
    inst.write("CONF:VOLT:DC 10,0.001," + CHANNEL_LIST)
    print("[Config]: ", inst.query("CONF? {}".format(CHANNEL_LIST)), flush=True)

    # Enables automatic delay
    print("[Delay]: ", inst.query("ROUT:CHAN:DELAY? {}".format(CHANNEL_LIST)), flush=True)
    inst.write("ROUT:CHAN:DELAY:AUTO ON," + CHANNEL_LIST)
    print("[Delay]: ", inst.query("ROUT:CHAN:DELAY? {}".format(CHANNEL_LIST)), flush=True)

    # Measurement Setup
    # ---------------------

    inst.write("DISP:TEXT 'SCANNING...'")
    print("Scanning...")

    # Enables the internal DMM
    inst.write("INST:DMM ON")

    # Turns display off for slight increase in measurement rates
    inst.write("DISP OFF")

    # This should take 10 msec
    start = timer()  # TIC

    for i in range(10):
        inst.write("MEAS:VOLT:DC? " + CHANNEL_LIST)
        inst.read()
        #print(inst.read())
        sleep(0.001)

    end = timer()  # TOC

    print("[Execution Time]: " + str(end-start) + " secs")  # execution time = TOC - TIC

    print("Done.")

    # Close connection
    # ---------------------
    inst.close()


def DAQ_Timer_Sampling(write_path):
    global CHANNEL_LIST
    start_func = timer()  # TIC

    # create the csv writer
    writer = csv.writer(write_path)
    
    # Open connection
    # ---------------------
    inst = rm.open_resource(DAQ_ADDRESS)
    # Reset Device
    # ---------------------
    inst.write("*rst; status:preset; *cls")
    #sleep(1)

    # Channels Configuration
    # ---------------------
    inst.write("ROUT:OPEN " + CHANNEL_LIST)  # Open channels

    # Configure channel for DC voltage
    # print("[Default Config]: ", inst.query("CONF? {}".format(CHANNEL_LIST)), flush=True)
    inst.write("CONF:VOLT:DC 10,0.001," + CHANNEL_LIST)
    # print("[Config]: ", inst.query("CONF? {}".format(CHANNEL_LIST)), flush=True)

    # Enables automatic delay
    # print("[Default Delay]: ", inst.query("ROUT:CHAN:DELAY? {}".format(CHANNEL_LIST)), flush=True)
    inst.write("ROUT:CHAN:DELAY:AUTO ON," + CHANNEL_LIST)
    # print("[Delay]: ", inst.query("ROUT:CHAN:DELAY? {}".format(CHANNEL_LIST)), flush=True)
    # Measurement Setup
    # ---------------------

    inst.write("DISP:TEXT 'SCANNING...'")
    # print("Scanning...")

    # Enables the internal DMM
    inst.write("INST:DMM ON")

    # Turns display off for slight increase in measurement rates
    inst.write("DISP OFF")

    # Scan List of the desired multiplex channels
    inst.write("ROUT:SCAN " + CHANNEL_LIST)

    # Timer Trigger Example
    # ------------------------
    # Select the interval timer configuration
    inst.write("TRIG:SOURCE TIMER")
    # Set the scan interval to 50 msec
    inst.write("TRIG:TIMER 50E-03")
    # Time in seconds between 400 μs and 1 second, with 4 μs
    inst.write("VOLT:DC:APER 400E-06," + CHANNEL_LIST)
    # Sweep the scan list
    inst.write("TRIG:COUNT 10") # -> TRIG:TIMER / (VOLT:DC:APER * Num_Channels)

    # Initiate the scan when trig condition happens -> stores readings in memory
    
    return inst,writer
    


def Read_cont(inst,writer):
    global CHANNEL_LIST
    start = timer()  # TIC
    inst.write("INITIATE")
    inst.write("FETCH?")
    values = inst.read()
    # print(np.size(values))
    end = timer()  # TOC
    # First component is time, the rest are measurements
    print(str(end), ", " + values)
    print("[Execution Time for reading data]: " + str(end - start) + " secs")  # execution time = TOC - TIC
    print("[Sample rate is]: "+ str(10/(end - start)) + " Hz")
    # write a row to the csv file: relative time, v1, v2, v3 ,v4 ,v5, v6
    # writer.writerow(("%.6f" % end + "," + values, ))
    


def Read_Errors(inst):
    global write_path
    global DAQ_ADDRESS
    global rm

    emptyFlag = False
    while not emptyFlag:
        msg = inst.query("SYST:ERR?")
        print("[Error]: ", msg)

        if msg.find('No error') != -1:
            emptyFlag = True

    # Close connection
    inst.close()
    write_path.close()


if __name__ == '__main__':
    #DAQ_Info()
    # Read_Errors()  # Clear error buffer
    [inst,writer] = DAQ_Timer_Sampling(write_path)
    # Run this to see the challenge with manual sampling
    # DAQ_Manual_Sampling()
    try:
        while True:
            # Run this to see good sampling
            Read_cont(inst,writer)
    except KeyboardInterrupt:
        print('interrupted!')
        Read_Errors(inst)  # Get new errors