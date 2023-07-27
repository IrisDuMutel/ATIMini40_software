# ATI Mini40 DAQ F/T sensor software resources
ATI Mini40 DAQ F/T sensor is connected differentially to the first slot of the Keysight 34970A DAQ (16-channel multiplexer). The DAQ is connected to a PC using the GPIB-HS-USB connector from National Instruments, allowing the use of Virtual Instrument Software Architecture (VISA) libraries. 


## LabView (2023)

 - Keysight_ATIMini40.vi: A simple data collection project using LabView and VISA blocks for the Keysight 34970A Data Acquisition Unit

## Python
Using [PyVisa](https://pyvisa.readthedocs.io/en/latest/index.html) python package to communicate with Keysight 34970A Data Acquisition Unit

### SCRIPTS AND DESCRIPTION (KEYSIGHT 34970A):

- IDN_query.py: Asking list of resources found by PyVisa and identification query to instruments address. WORKING
- test_query.py: Script made for testing different query commands. Use this script as test script.
- Raw_voltages.py: Short configuration file that measures the raw voltages from the insturment and prints them on terminal. WORKING
- Raw_voltages_trigger.py: Short configuration file that measures the raw voltages from the insturment and prints them on terminal using timer trigger. NOT WORKING: ERROR 410: Buffer is full

- DAQ_acquire_Voltages.py: Script that obtains voltages and measures the time required for ten scans of a number of channels that can be changed by the user. Trigger_sampling has the following config: Aperture is 400 us, trigger timer is 5 ms and trigger count is 10  Manual_sampling uses the read command. Both funstions execute just once. WORKING

- DAQ_acquire_Voltages2.py: Same as DAQ_acquire_Voltages but reads as fast as possible and writes data nito a CVS file which path is declared at the beginning of the script. 

- DAQ_acquire_Voltages3.py: Acquires voltages as fast as possible. The number of scans is infinite (granting a more continuous data rate). The trigger timer is set to MIN, to set the scan-to-scan interval to a minimum. Using the <span style="font-family:Calibri;"> R? [<max_count>]</span> command to erase read and erase from non-volatile memory not stopping the scan.

- DAQ_acquire_Voltages_GUI.py: Launches ATIMini40_GUI.ui, which allows easier configuration of the instrument and data log. Working using QTimer 1 ms. The fastest you can get is 10Hz. The instrument is the limitation. WORKING

Commands used in these scripts can be found (with additional examples) in the [Keysight 34970A Command reference manual](https://documentation.help/Keysight-34970A-34972A/)

### SCRIPTS AND DESCRIPTION (NI USB 6008):

- ni_daq_6chan_continuous.py

#### FROM [ENGR EDU](http://engredu.com/2022/11/21/ni-articles/):

- ni_daq_ai_single_demand.py
- ni_daq_ai_single_demand_gui.py
- ni_max_onDemand.ui
- ni_daq_ai_single_continuous.py
- ni_daq_ai_single_continuous_gui.py
- ni_max_Continuous.ui

### QT UI files

- ATIMini40_GUI.ui

## MATLAB

- Keysight34970A.m
- readCSV_n_plot2.m: reads CSV file and plots forces and torques
- test500g.csv: file obtained using cal_mat from Python\NI_USB_6008\ni_daq_6chan_continuous.py
- test500g2.csv: file obtained using cal_mat2 from Python\NI_USB_6008\ni_daq_6chan_continuous.py

## Docs
Personally crafted documentation containing (what I consider) the most important information from all the components in the setup. In progress.


