# Original code provided by Prof. Goncalo Fernandes Pereira Martins
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
from PyQt6.QtCore import QThread, QObject, pyqtSignal

import pyqtgraph as pg
from pyqtgraph import PlotWidget
from pyqtgraph.Qt import QtGui, QtCore

from collections import deque
import numpy as np

DAQ_ADDRESS = 'GPIB0::9::INSTR'
CHANNEL_LIST = "(@101:106)"
SCAN_N = "1"
APERTURE_TIME = "400E-06"
TRIGGER_TIME = "5E-03"
FILE_PATH = "TestData/ccc.csv"
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
        # self.lineEdit_Errors.setReadOnly()
        self.savaDataFlag = False


        # Callback Functions
        self.loadConfigButton.clicked.connect(self.DAQ_configNinit)
        self.startButton.clicked.connect(self.Read_cont)
        self.stopButton.clicked.connect(self.Read_Errors)
        self.stopButton.setCheckable(True)
        self.startButton.setCheckable(True)
        self.checkBox.stateChanged.connect(self.save_data)


    def save_data(self):
        self.savaDataFlag = True

    def DAQ_configNinit(self):
        # create the csv writer
        write_path = open(self.textEdit_FilePath.text(), "w")
        self.writer = csv.writer(write_path)
        self.inst = self.rm.open_resource(self.comboBox_deviceName.currentText())
        # # Reset Device
        self.inst.write("*rst; status:preset; *cls")
        # print("ROUT:SCAN " + self.textEdit_channelList.text())
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
        self.inst.write("INITIATE")    # Initiate the scan when trig condition happens -> stores readings in memory



    def Read_cont(self):
        
        
        flag_terminate = False
        while flag_terminate==False:
            start = timer()  # TIC
            # self.lineEdit_Values.clear()
            # self.inst.write("FETCH?")
            # values = self.inst.read()

            end = timer()  # TOC
            flag_terminate = self.stopButton.isChecked()
            # First component is time, the rest are measurements
            # print(str(end), ", " + values)
            # print("[Execution Time for reading data]: " + str(end - start) + " secs")  # execution time = TOC - TIC
            # write a row to the csv file: relative time, v1, v2, v3 ,v4 ,v5, v6
            # if self.savaDataFlag is True:
            #     self.writer.writerow(("%.6f" % end + "," + values  ))
            # self.lineEdit_Values.setText(values)   
            # self.lineEdit_Time.setText("%.6f" % (end-self.absolute_start))  
    


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
        self.textEdit_FilePath.close()
        

if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = MainWindow()
    win.show()
    sys.exit(app.exec())

    
