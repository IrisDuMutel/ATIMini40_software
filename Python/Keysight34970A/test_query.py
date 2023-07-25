import sys
from time import sleep
import numpy as np

import pyvisa as visa

DAQ_ADDRESS = 'GPIB0::9::INSTR'  # DAQ -> KEYSIGHT 3497A
rm = visa.ResourceManager()
inst = rm.open_resource(DAQ_ADDRESS)
inst.write("*rst; status:preset; *cls")
inst.write("ROUT:OPEN (@101)")  # Open channels
inst.write("INST:DMM ON")  # Enables the internal DMM
inst.write("ROUT:SCAN (@101)")
inst.write("TRIG:SOURCE TIMER")  # Select the interval timer configuration
inst.write("TRIG:TIMER 50E-03")  # Set the scan interval to 50 msec
inst.write("VOLT:DC:APER 400E-06,(@101)")
inst.write("TRIG:COUNT 10")
inst.write("INITIATE")  # Initiate the scan -> stores readings in memory
inst.write("FETCH?")
# points = inst.query("DATA:POINTS?")

# print('[Number of Readings]: ', points, flush=True)
memo = inst.query('MEMory:NSTAtes?')
print('[Memory Limit]: ', memo, flush=True)
inst.write("MEM:STAT:DEL 1")
memo = inst.query('MEMory:NSTAtes?')
print('[Memory Limit]: ', memo, flush=True)
thresh = inst.query("DATA:POINts:EVENt:THReshold?")
print("[Memory threshold]: ", thresh, flush=True)