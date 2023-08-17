# Instructions on how to use this repository

### 1.- Clone repository

`git clone https://github.com/IrisDuMutel/ATIMini40_software.git`

### 2.- Choose software based on your instrument

Refer to the **bold** text in the different subfolders to find the most updated scripts. Use **DAQ_acquire_Voltages_GUI.py** when using Keysight 34970A and **ni_daq_6chan_continuous_GUI2.py** when using a NI DAQ unit.

Change data sampling parameters on the GUI that will come up when launching the scritps. For more information, check the [documentation file](Docs\Notes.pdf).


# This repository contains code for the use of the following devices:

- *SICK WLA16 Photoelectric sensors* using an Arduino Mega 2560 R3
- *ATI Mini40 DAQ F/T* sensor using:
    - DAQ NI USB-6008
    - Keysight 34970A Digital Acquisition Unit

# ATI Mini40 DAQ F/T sensor software resources
ATI Mini40 DAQ F/T sensor is connected differentially to the first slot of the Keysight 34970A DAQ (16-channel multiplexer). The DAQ is connected to a PC using the GPIB-HS-USB connector from National Instruments, allowing the use of Virtual Instrument Software Architecture (VISA) libraries. 

## [Arduino](Arduino)

Scripts created to check the functionality of SICK W16 photoelectric sensors.

- sensor_analog.ino: Script that reads both outputs of one sensor as analog signals and prints them in serial at 9600 baud.
- sensor_digital.ino: Script that reads both outputs of one sensor as digital signals and prints them at 9600 baud.
- Potentiometer.ino: This is a very simple script to use with any arduino that allows you to control any BLDC motor (with and ESC) with a potentiometer.
- timer_example.ino: Simple implemetation of a timer overflow print. Timer 1 is enabled and so is the counter overflow interrupt, in which the value of the timer is set to be printed.
- tachometer_1sensor.ino: Tachometer code using timer 1 and overflow interrupt to measure the time that passes between every sensor occurrence. Only one sensor is tested in this code. Refer to the [documentation](https://github.com/IrisDuMutel/ATIMini40_software/blob/master/Docs/Notes.pdf) for more information on this method.
- tachometer_2sensor.ino: Same as the previous code but applied to two sensors. Two timers are enables with identical prescaler value. Strange behaviour is observed and the timer approach is abandoned for multiple-sensor codes.
- **tachometer_3sensor.ino** : Using three interrupts and a delay, three sensors are being monitored and overall RPM are comuted and printed according to the delay frequency.
- tachometer_4sensor.ino: same principle as in the 3 sensor case, applied to 4 sensors. 

Use PuTTY for logging of serial data. When using VSCode serial monitor, the data might be corrupted.

## [LabView](LabView) (2023)

 - **Keysight_ATIMini40.vi**: A simple data collection project using LabView and VISA blocks for the Keysight 34970A Data Acquisition Unit
 - atidaqftmx.vi: Data acquisition VI using NI DAQ as NI USB 6002 and 6008. Obtained from [ATI Mini40 software downloads](https://www.ati-ia.com/products/ft/software/daq_software.aspx)


## [Python](Python)

### [Scripts and description using KEYSIGHT 34970A](Python\Keysight34970A):
Using [PyVisa](https://pyvisa.readthedocs.io/en/latest/index.html) python package to communicate with Keysight 34970A Data Acquisition Unit


- IDN_query.py: Asking list of resources found by PyVisa and identification query to instruments address. WORKING
- test_query.py: Script made for testing different query commands. Use this script as test script.
- Raw_voltages.py: Short configuration file that measures the raw voltages from the insturment and prints them on terminal. WORKING
- Raw_voltages_trigger.py: Short configuration file that measures the raw voltages from the insturment and prints them on terminal using timer trigger. NOT WORKING: ERROR 410: Buffer is full

- DAQ_acquire_Voltages.py: Script that obtains voltages and measures the time required for ten scans of a number of channels that can be changed by the user. Trigger_sampling has the following config: Aperture is 400 us, trigger timer is 5 ms and trigger count is 10  Manual_sampling uses the read command. Both funstions execute just once. WORKING

- DAQ_acquire_Voltages2.py: Same as DAQ_acquire_Voltages but reads as fast as possible and writes data nito a CVS file which path is declared at the beginning of the script. 

- DAQ_acquire_Voltages3.py: Acquires voltages as fast as possible. The number of scans is infinite (granting a more continuous data rate). The trigger timer is set to MIN, to set the scan-to-scan interval to a minimum. Using the <span style="font-family:Calibri;"> R? [<max_count>]</span> command to erase read and erase from non-volatile memory not stopping the scan.

- **DAQ_acquire_Voltages_GUI.py**: Launches ATIMini40_GUI.ui, which allows easier configuration of the instrument and data log. Working using QTimer 1 ms. The fastest you can get is 10Hz. The instrument is the limitation. CRASHING
 

Commands used in these scripts can be found (with additional examples) in the [Keysight 34970A Command reference manual](https://documentation.help/Keysight-34970A-34972A/)

### [Scripts and description using NI USB 6008](Python\NI_USB_6008):

Due to the instrument's limited number of inputs, the differential connection of the sensor cannot be implemented. A single-ended connection is used

Using [NI-DAQmx](https://nidaqmx-python.readthedocs.io/en/latest/)

- ni_daq_6chan_continuous.py: Obtains forces and torques (lbf and lbf-in, respectively) from ATIMini40 with a single-ended connection. Use cal_mat2 for correct results on F/T. Bias voltage is obtained at the beginning of the readings and automatically subtracted from all the other measurements.

- ni_daq_6chan_continuous_GUI.py: Using 1 sample per channel and sample rate as high as 50Hz. Otherwise, crashes. 

- **ni_daq_6chan_continuous_GUI2.py**: WORKING. Uses streamers To be explained soon

The single ended connection is as follows:

<img src="Docs\Images\NIUSB6008_ATIMini40Connection_grounded.jpg"  width="400" height="300">

Reference cables have been grounded, obtaining less noisy signals.

The GUI currently looks like this:


<img src="Docs\Images\NIUSB6008_GUI.png"  width="700" height="400">


#### FROM [ENGR EDU](http://engredu.com/2022/11/21/ni-articles/):

- ni_daq_ai_single_demand.py
- ni_daq_ai_single_demand_gui.py
- ni_max_onDemand.ui
- ni_daq_ai_single_continuous.py
- ni_daq_ai_single_continuous_gui.py
- ni_max_Continuous.ui

### [Scripts and description using SICK WLA16 sensors with NI USB-6008](Python\SICKWLA16):

- RPM_1sensor.py: This script contains the same exact code as the example from the [nidaqmx-python](https://github.com/ni/nidaqmx-python/blob/master/examples/di_sw_timed.py) GitHub repository.
- RPM_4sensor.py: Includes GUI interface. Reads from four channels using Qt timers. NOT WORKING

### QT UI files

- **ATIMini40_GUI.ui**
- RPM_GUI.ui (NOT FINISHED)

## [MATLAB](MATLAB)

### [Scripts](MATLAB/Scripts)

- ATImatrices.m: Script containing the conversion matrices from voltages to lbf/lbf-in. This is the matrix to be used. An additional conversion is needed to obtain forces and torques in N and N-m. 
- readCSV_n_plot2.m: reads CSV file and plots forces and torques
- **readCSV_n_plot3.m**: reads CSV file and plots forces and torques fromatted by DAQ_acquire_Voltages_GUI2.py. Be careful when setting the value for QTimer, If chosen too small, the GUI may crash or a delay may be noticed on the display.

### [Log files](MATLAB/LogFiles)

This folder contains some of the log files obtained during the creation of this project. Simply grab any .txt file generated by any of the scripts and change its extension to .csv. Once done that, use the MATLAB scripts to process the data in them.

- test500g.csv: file obtained using cal_mat from Python\NI_USB_6008\ni_daq_6chan_continuous.py
- test500g2.csv: file obtained using cal_mat2 from Python\NI_USB_6008\ni_daq_6chan_continuous.py
- log_20230728.csv: file obtained with ni_daq_6chan_continuous_GUI.py, 50Hz sampling rate and no grounding of sensor's reference cables.
- log_20230728_grounded.csv: file obtained with ni_daq_6chan_continuous_GUI.py, 50Hz sampling rate and grounding sensor's reference cables, as in the image in this document.
- log_20230728_100Hz.csv: file obtained with ni_daq_6chan_continuous_GUI.py, 100Hz sampling rate and no grounding of sensor's reference cables. No improvement has been obtained with respect to noise.

## [Docs](Docs)
Personally crafted documentation containing (what is considered) the most important information from all the components in the setup. Forgive any incompleteness, we'll try and keep it up-to-date as much as possible.





