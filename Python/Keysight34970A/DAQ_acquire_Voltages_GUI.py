# Original code provided by Prof. Goncalo Fernandes Pereira Martins
# Timer GUI version
import sys
from time import sleep
import numpy as np
from timeit import default_timer as timer
import csv
import pyvisa as visa

DAQ_ADDRESS = 'GPIB0::9::INSTR'  # DAQ -> KEYSIGHT 3497A
CHANNEL_LIST = "(@101:106)"



from PyQt6 import QtCore, QtGui, QtWidgets, uic
from PyQt6.QtWidgets import QApplication
from PyQt6.QtCore import QThread, QObject, pyqtSignal, QTimer

import pyqtgraph as pg
from pyqtgraph import PlotWidget
from pyqtgraph.Qt import QtGui, QtCore

from collections import deque
import numpy as np

DAQ_ADDRESS = 'GPIB0::9::INSTR'
CHANNEL_LIST = "(@101:106)"
SCAN_N = "10"
APERTURE_TIME = "400E-06"
TRIGGER_TIME = "50E-03"
FILE_PATH = "TestData/ccc.txt"
RANGE = "10"
RESOLUTION = "0.001"

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.absolute_start = timer()

        # Load ui File
        uic.loadUi("Python/Keysight34970A/ATIMini40_GUI.ui", self)
        self.rm = visa.ResourceManager()
        
        # Initialize Components on the GUI
        self.comboBox_deviceName.addItem(DAQ_ADDRESS)
        self.textEdit_channelList.setText(CHANNEL_LIST)
        self.textEdit_ScanN.setText(SCAN_N)
        self.textEdit_Range.setText(RANGE)
        self.textEdit_Resolution.setText(RESOLUTION)
        self.textEdit_Aperture.setText(APERTURE_TIME)
        self.textEdit_Trigger.setText(TRIGGER_TIME)
        self.textEdit_FilePath.setText(FILE_PATH)
        self.savaDataFlag = False

        self.timer=QTimer()
        self.timer.timeout.connect(self.Read_cont)
        # Callback Functions
        self.startButton.clicked.connect(self.on_press)
        self.stopButton.clicked.connect(self.on_release)
        self.checkBox.stateChanged.connect(self.save_data)
        self.timer.timeout.connect(self.Read_cont)

    def save_data(self):
        self.savaDataFlag = True

    def on_press(self):
        self.DAQ_configuration()
        self.timer.start(1)

    def on_release(self):
        self.timer.stop()
        self.Read_Errors()

    def DAQ_configuration(self):
        # create the txt writer
        if self.savaDataFlag == True:
            self.write_path = open(self.textEdit_FilePath.text(), 'a')
        self.inst = self.rm.open_resource(self.comboBox_deviceName.currentText())
        # # Reset Device
        self.inst.write("*rst; status:preset; *cls")
        # # Channels Configuration
        self.inst.write("ROUT:OPEN " + self.textEdit_channelList.text())  # Open channels
        self.inst.write("CONF:VOLT:DC " + self.textEdit_Range.text() + "," + self.textEdit_Resolution.text() +", " + self.textEdit_channelList.text())    # Configure channel for DC voltage
        self.inst.write("ROUT:CHAN:DELAY:AUTO ON, " + self.textEdit_channelList.text())    # Enables automatic delay

        # # Measurement Setup
        self.inst.write("DISP:TEXT 'SCANNING...'")
        self.inst.write("INST:DMM ON")
        self.inst.write("DISP OFF")
        self.inst.write("ROUT:SCAN (@101:106)")

        # Timer Trigger Example
        self.inst.write("TRIG:SOURCE TIMER")    # Select the interval timer configuration
        self.inst.write("TRIG:TIMER " + self.textEdit_Trigger.text())    # Set the scan interval to 50 msec
        self.inst.write("VOLT:DC:APER "+ self.textEdit_Aperture.text() + "," + self.textEdit_channelList.text())    # Time in seconds between 400 μs and 1 second, with 4 μs
        # Sweep the scan list
        self.inst.write("TRIG:COUNT " + self.textEdit_ScanN.text()) # -> TRIG:TIMER / (VOLT:DC:APER * Num_Channels)
        



    
    def Read_cont(self):    
        
            start = timer()  # TIC
            self.inst.write("INITIATE")    # Initiate the scan when trig condition happens -> stores readings in memory
            self.inst.write("FETCH?")
            values = self.inst.read()

            end = timer()  # TOC
            # First component is time, the rest are measurements
            print(str(end-self.absolute_start), ", " + values)
            print("[Execution Time for reading data]: " + str(end - start) + " secs")  # execution time = TOC - TIC
            # write a row to the csv file: relative time, v1, v2, v3 ,v4 ,v5, v6
            if self.savaDataFlag is True:
                self.write_path.write(("%.6f" % (end-self.absolute_start) + "," + values  ))
            self.lineEdit_Values.setText(values)   
            self.lineEdit_Time.setText("%.6f" % (end-self.absolute_start))

    # def Data_Format(self, valuestring):
    #     self.values = valuestring.replace('+', '')
    #     self.values = self.values.split(,)

    def Read_Errors(self):
        emptyFlag = False
        while not emptyFlag:
            msg = self.inst.query("SYST:ERR?")
            if msg.find('No error') != -1:
                emptyFlag = True
                break
            print("[Error]: ", msg)
            self.lineEdit_Errors.setText("[Error]: "+ msg)
            
        
        # Close connection
        self.inst.close()
        # self.textEdit_FilePath.close()
        

if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = MainWindow()
    win.show()
    sys.exit(app.exec())

    
