import sys
from time import sleep
import numpy as np

import pyvisa as visa

DAQ_ADDRESS = 'GPIB0::9::INSTR'  # DAQ -> KEYSIGHT 3497A
PS_ADDRESS = 'GPIB0::5::INSTR'  # Power Supply -> KEYSIGHT E3631A

rm = visa.ResourceManager()


def List_Available_Devices():
    global rm
    print('\nVISA library version:\n  ', rm)
    print('\nPython version:\n  ', sys.version)

    print('\nList of instruments discovered by Keysight Connection Expert:')
    i = 1
    for key, value in rm.list_resources_info().items():
        print('\nInstrument ', str(i), ': ', key)
        print('  Interface type: ', value.interface_type)
        print('  Interface board number: ', value.interface_board_number)
        print('  Resource class: ', value.resource_class)
        print('  Resource name: ', value.resource_name)
        print('  Resource alias: ', value.alias)
        i += 1


def Power_Supply_Example():
    # https://github.com/MarkDing/GPIB-pyvisa

    # Open connection
    inst = rm.open_resource(PS_ADDRESS)

    print('INSTRUMENT ID string:\n  ', inst.query('*IDN?'), flush=True)

    # Reset Device
    inst.write("*rst; status:preset; *cls")
    sleep(1)

    inst.write("INST P6V")  # Select +6V output
    inst.write("VOLT 2.0")  # Set output voltage to 3.0 V
    #inst.write("CURR 1.0")  # Set output current to 1.0 A
    # or
    #inst.write("APPL P6V, 3.0, 1.0")

    #inst.write("OUTP OFF")
    inst.write("OUTP ON")

    inst.write("INST P25V")  # Select +6V output
    inst.write("VOLT 10.0")  # Set output voltage to 3.0 V
    # inst.write("OUTP OFF")
    inst.write("OUTP ON")

    inst.write("INST N25V")  # Select +6V output
    inst.write("VOLT -7.0")  # Set output voltage to 3.0 V
    # inst.write("OUTP OFF")
    inst.write("OUTP ON")

    # Close connection
    inst.close()


def DAQ_Example():
    # System Information
    # ---------------------
    # Open connection
    inst = rm.open_resource(DAQ_ADDRESS)
    print('INSTRUMENT ID string:\n  ', inst.query('*IDN?'), flush=True)
    print("SCPI Version: ", inst.query("SYST:VERS?"), flush=True)
    # Reset Device
    inst.write("*rst; status:preset; *cls")
    sleep(1)
    # ---------------------

    # Channels Configuration
    # ---------------------
    inst.write("ROUT:OPEN (@101:102)")  # Open channels

    print("[Gains]: ", inst.query("CALC:SCAL:GAIN? (@101:102)"), flush=True)
    #inst.write("CALC:SCAL:GAIN 1.0,(@101:102)")  # Set to 1
    print("[Offsets]: ", inst.query("CALC:SCAL:OFFS? (@101:102)"), flush=True)
    #inst.write("CALC:SCAL:OFFS 0.0,(@101:102)")  # Set to 0
    print("[Scaling]: ", inst.query("CALC:SCAL:STAT? (@101:102)"), flush=True)
    #inst.write("CALC:SCAL:STAT ON,(@101:102)")  # Apply (gain*measurement) + offset

    print("[Config]: ", inst.query("CONF? (@101:102)"), flush=True)
    inst.write("CONF:VOLT:DC (@101:102)")  # Configure channel for DC voltage
    #inst.write("VOLT:DC:RANG 10,(@101:102)")  # sets the voltage range

    print("[Resolution]: ", inst.query("VOLT:DC:RES? (@101:102)"), flush=True)
    #inst.write("VOLT:DC:RES 0.00001,(@101:102)")  # sets the resolution

    inst.write("FORMAT:READING:CHAN ON")  # Return channel number with each reading
    inst.write("FORMAT:READING:TIME ON")  # Return time stamp with each reading
    print("[Scaling]: ", inst.query("FORMAT:READING:UNIT?"), flush=True)
    #inst.write("FORMAT:READING:UNIT ON")  # Return unit with each reading

    #inst.write('DIAG:POKE:SLOT:DATA 101,"SIG0_0"')  # adds label to channel  # TODO - Doesn't work
    #inst.write('DIAG:POKE:SLOT:DATA 102,"SIG0_1"')  # adds label to channel  # TODO - Doesn't work

    print("[Delay]: ", inst.query("ROUT:CHAN:DELAY? (@101:102)"), flush=True)
    inst.write("ROUT:CHAN:DELAY:AUTO ON,(@101:102)")  # enables automatic delay
    # inst.write("ROUT:CHAN:DELAY 1,(@101:102)")  # Set the delay (msecs) between relay closure and measurement
    # ---------------------

    # Measurement Setup
    # ---------------------

    inst.write("DISP OFF")  # turns display off for slight increase in measurement rates
    inst.write("DISP:TEXT 'SCANNING...'")

    inst.write("INST:DMM ON")  # Enables the internal DMM

    # Scan List of the desired multiplex channels
    inst.write("ROUT:SCAN (@101:102)")

    #inst.write("TRIG:SOURCE IMMEDIATE")  # Select continous scan trigger
    inst.write("TRIG:SOURCE TIMER")  # Select the interval timer configuration
    inst.write("TRIG:TIMER 50E-03")  # Set the scan interval to 50 msec
    # TODO - Error +305
    # print("[Curr aperture]: ", inst.query("CURR:DC:APER?"), flush=True)
    print("[APER]: ", inst.query("VOLT:DC:APER? (@101:102)"), flush=True)
    inst.write("VOLT:DC:APER 400E-06,(@101:102)")  # time in seconds between 400 μs and 1 second, with 4 μs
    print("[APER]: ", inst.query("VOLT:DC:APER? (@101:102)"), flush=True)

    # inst.write("CURR:DC:APER 400E-06,(@101:102)")  # time in seconds between 400 μs and 1 second, with 4 μs
    inst.write("TRIG:COUNT 10")  # Sweep the scan list -> TRIG:TIMER/(CURR:DC:APER*Num_Channels)
    #(Note: 10 is for 12 channels)

    inst.write("INITIATE")  # Initiate the scan -> stores readings in memory
    inst.write("FETCH?")  # Transfers the readings from memory to the instrument's output buffer.

    # Wait until there a data available
    points = 0
    while (points==0):
        # Returns the number of readings in memory
        points = inst.query("DATA:POINTS?")
        print('[Number of Readings]: ', points, flush=True)

    # Returns N readings (starting with the oldest reading first) and erases them from memory.
    #print('[Data]: ', inst.query("DATA:REMOVE? 1"), flush=True)
    #values = np.array(inst.query_ascii_values("DATA:REMOVE? 1"))
    values = inst.query_ascii_values("DATA:REMOVE? 2", container=np.array)
    print(values[0])
    # https://edadocs.software.keysight.com/kkbopen/use-a-python-program-to-scan-6-channels-on-a-3497xa-or-daq97xa-data-acquisition-unit-620693047.html

    inst.write("DISP ON")
    inst.write("DISP:TEXT 'Done.'")

    # Close connection
    inst.close()
    # ---------------------

def Read_Errors():
    global rm

    # Open connection
    inst = rm.open_resource(DAQ_ADDRESS)

    emptyFlag = False
    while not emptyFlag:
        msg = inst.query("SYST:ERR?")
        print("[Error]: ", msg)

        if msg.find('No error') != -1:
            emptyFlag = True

    # Close connection
    inst.close()


if __name__ == '__main__':
    #List_Available_Devices()
    #Power_Supply_Example()
    DAQ_Example()

    Read_Errors()
