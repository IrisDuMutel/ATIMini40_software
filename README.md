# ATI Mini40 DAQ F/T sensor software resources
ATI Mini40 DAQ F/T sensor is connected differentially to the first slot of the Keysight 34970A DAQ (16-channel multiplexer). The DAQ is connected to a PC using the GPIB-HS-USB connector from National Instruments, allowing the use of Virtual Instrument Software Architecture (VISA) libraries. 


### LabView (2023)
 - Keysight_ATIMini40.vi: A simple data collection project using LabView and VISA blocks for the Keysight 34970A Data Acquisition Unit

### Python
Using [PyVisa](https://pyvisa.readthedocs.io/en/latest/index.html) python package to communicate with Keysight 34970A Data Acquisition Unit

- IDN_query.py: Asking list of resources found by PyVisa and identification query to instruments address
- Raw_voltages.py: Short configuration file that measures the raw voltages from the insturment and prints them on terminal


### MATLAB

### Docs
Personally crafted documentation containing (what I consider) the most important information from all the components in the setup. In progress.
