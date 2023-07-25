# Original code provided by Prof. Goncalo Fernandes Pereira Martins
import sys
from time import sleep
import numpy as np
from timeit import default_timer as timer
import csv
import pyvisa as visa

DAQ_ADDRESS = 'GPIB0::9::INSTR'  # DAQ -> KEYSIGHT 3497A



from PyQt6 import QtCore, QtGui, QtWidgets, uic
from PyQt6.QtWidgets import QApplication
from PyQt6.QtCore import QThread, QObject, pyqtSignal

import pyqtgraph as pg
from pyqtgraph import PlotWidget
from pyqtgraph.Qt import QtGui, QtCore

from collections import deque
import numpy as np
from time import sleep

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Load ui File
        uic.loadUi("Python/Keysight34970A/ATIMini40_GUI.ui", self)
        self.rm = visa.ResourceManager()

        # Initialize Components on the GUI
        self.comboBox_deviceName.addItem(DAQ_ADDRESS)
        self.channelList.addItem("(@101:106)")
        self.spinBox_ScanNumber.addItem(1)
        self.apertureTime.addItem("400E-06")
        self.triggerTimer.addItem("50E-03")
        self.path2CSV.addItem("TestData/ccc.csv")
        self.savaDataFlag = False


        # Callback Functions
        self.loadConfigButton.clicked.connect(self.DAQ_configNinit)
        self.startButton.clicked.connect(self.Read_cont)
        self.stopButton.clicked.connect(self.Read_Errors)
        self.checkBox.stateChanged.connect(self.save_data)


    def save_data(self):
        self.savaDataFlag = True

    def DAQ_configNinit(self):

        # create the csv writer
        self.writer = csv.writer(self.path2CSV)
        
        # Open connection
        self.inst = self.rm.open_resource(DAQ_ADDRESS)

        # Reset Device
        self.inst.write("*rst; status:preset; *cls")

        # Channels Configuration
        self.inst.write("ROUT:OPEN " + self.channelList)  # Open channels
        self.inst.write("CONF:VOLT:DC 10,0.001," + self.channelList)    # Configure channel for DC voltage
        self.inst.write("ROUT:CHAN:DELAY:AUTO ON," + self.channelList)    # Enables automatic delay

        # Measurement Setup
        self.inst.write("DISP:TEXT 'SCANNING...'")
        self.inst.write("self.inst:DMM ON")
        self.inst.write("DISP OFF")
        self.inst.write("ROUT:SCAN " + self.channelList)

        # Timer Trigger Example
        self.inst.write("TRIG:SOURCE TIMER")    # Select the interval timer configuration
        self.inst.write("TRIG:TIMER 5E-03")    # Set the scan interval to 50 msec
        self.inst.write("VOLT:DC:APER 400E-06," + self.channelList)    # Time in seconds between 400 μs and 1 second, with 4 μs
        # Sweep the scan list
        self.inst.write("TRIG:COUNT 1") # -> TRIG:TIMER / (VOLT:DC:APER * Num_Channels)
        self.inst.write("INITIATE")    # Initiate the scan when trig condition happens -> stores readings in memory
        


    def Read_cont(self,):
        try:
            while True:
                        
                start = timer()  # TIC
                self.inst.write("FETCH?")
                values = self.inst.read()
                end = timer()  # TOC
                # First component is time, the rest are measurements
                print(str(end), ", " + values)
                print("[Execution Time for reading data]: " + str(end - start) + " secs")  # execution time = TOC - TIC
                # write a row to the csv file: relative time, v1, v2, v3 ,v4 ,v5, v6
                if self.savaDataFlag is True:
                    self.writer.writerow(("%.6f" % end + "," + values, ))
        except KeyboardInterrupt:
            print("Interrupted!")



    def Read_Errors(self):
        
        self.inst.close()
        # Open connection
        [self.inst] = self.rm.open_resource(DAQ_ADDRESS)

        emptyFlag = False
        while not emptyFlag:
            msg = self.inst.query("SYST:ERR?")
            print("[Error]: ", msg)

            if msg.find('No error') != -1:
                emptyFlag = True

        # Close connection
        self.inst.close()
        self.path2CSV.close()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = MainWindow()
    win.show()
    sys.exit(app.exec())

    
