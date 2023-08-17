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



def DAQ_Timer_Sampling(write_path):
    global CHANNEL_LIST
    # create the csv writer
    writer = csv.writer(write_path)
    # Open connection
    # ---------------------
    inst = rm.open_resource(DAQ_ADDRESS)
    # Reset Device
    # ---------------------
    inst.write("*rst; status:preset; *cls")

    # Channels Configuration
    # ---------------------
    inst.write("ROUT:OPEN " + CHANNEL_LIST)  # Open channels

   
    inst.write("CONF:VOLT:DC 10,0.001," + CHANNEL_LIST)

    # Enables automatic delay
    inst.write("ROUT:CHAN:DELAY:AUTO ON," + CHANNEL_LIST)

    # Measurement Setup
    inst.write("DISP:TEXT 'SCANNING...'")
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
    inst.write("TRIG:TIMER 5E-03")
    # Time in seconds between 400 μs and 1 second, with 4 μs
    inst.write("VOLT:DC:APER MIN," + CHANNEL_LIST)
    # Sweep the scan list
    inst.write("TRIG:COUNT INF") # -> TRIG:TIMER / (VOLT:DC:APER * Num_Channels)
    inst.write("INIT")
    # Initiate the scan when trig condition happens -> stores readings in memory
    
    return inst,writer
    


def Read_cont(inst,writer):
    global CHANNEL_LIST

    start = timer()  # TIC
    # inst.write("FETCH?")
    inst.write("R? ")
    values = inst.read()
    end = timer()  # TOC

    # First component is time, the rest are measurements
    print(str(end), ", " + values)
    print("[Execution Time for reading data]: " + str(end - start) + " secs")  # execution time = TOC - TIC
    print("[Sample rate is]: "+ str(1/(end - start)) + " Hz")

    # write a row to the csv file: relative time, v1, v2, v3 ,v4 ,v5, v6
    writer.writerow(("%.6f" % end + "," + values, ))
    print("[Number of points in memory]: " + inst.query("DATA:POINts?"))


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

    [inst,writer] = DAQ_Timer_Sampling(write_path)
    # Run this to see the challenge with manual sampling

    try:
        while True:
            # Run this to see good sampling
            Read_cont(inst,writer)
    except KeyboardInterrupt:
        print('interrupted!')
        Read_Errors(inst)  # Get new errors

    
