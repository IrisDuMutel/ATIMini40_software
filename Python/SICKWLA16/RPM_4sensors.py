import sys
import nidaqmx
from nidaqmx import constants
from nidaqmx.stream_readers import AnalogSingleChannelReader
from timeit import default_timer as timer

from PyQt6 import QtCore, QtGui, QtWidgets, uic
from PyQt6.QtWidgets import QApplication
from PyQt6.QtCore import QThread, QObject, pyqtSignal, QTimer

import pyqtgraph as pg
from pyqtgraph import PlotWidget
from pyqtgraph.Qt import QtGui, QtCore

from collections import deque
import numpy as np

from nidaqmx.stream_readers import DigitalMultiChannelReader
from nidaqmx.constants import LineGrouping

DAQ_ADDRESS = 'Dev3'
FILE_PATH = "TestData/ccc.txt"
RANGE = "10"
RESOLUTION = "0.001"
CHANNEL_LIST = "Dev3/port0/line0:3"
FILE_PATH = "TestData/log_20230728.txt"

QTIM_VAL = '100' # In ms
absolute_start = timer()
FS = "10"  # Hz
SAMPLE_PER_CHANNEL = str(np.floor(int(QTIM_VAL)*int(FS)*0.001))


class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.instream_reader = None
        # Load ui File
        uic.loadUi("Python/SICKWLA16/RPM_GUI.ui", self)
    
        
        # Initialize Components on the GUI
        self.textEdit_channelList.setText(CHANNEL_LIST)
        self.textEdit_FS.setText(FS)
        self.textEdit_QTIM_VAL.setText(QTIM_VAL)
        self.textEdit_FilePath.setText(FILE_PATH)
        

        # Variable initialiation
        self.timer=QTimer()
        self.absolute_start = timer()   
        self.timer.setInterval(int(QTIM_VAL))

        # Callback Functions
        self.startButton.clicked.connect(self.on_press_start)
        self.stopButton.clicked.connect(self.on_press_stop)
        self.checkBox.stateChanged.connect(self.save_data)
        self.timer.timeout.connect(self.my_callback)
        
        # Flag initialization
        self.savaDataFlag = False
        self.reset_abs_time = False
        self.N_Nm = False
        self.digital_task_flag = False
        self.header_flag = False



    # If logging data into .txt file
    def save_data(self):
        self.SPC = int(int(self.textEdit_FS.text())*int(self.textEdit_QTIM_VAL.text())*0.001)
        self.lineEdit_Errors.insertPlainText("Logging data in " + self.textEdit_FilePath.text() + "\n")
        if self.savaDataFlag == True:
            self.savaDataFlag = False
            self.write_path.close()
        else:
            self.savaDataFlag = True
            self.write_path = open(self.textEdit_FilePath.text(), 'a')
            if self.header_flag==False:
                self.write_path.write("First line indicates sampling freq [Hz], samples per channel, QTimer [ms] \n")
                self.write_path.write("Fx, Fy, Fz, Mz, My, Mz \n")
                self.write_path.write((self.textEdit_FS.text()) + "," +  str(self.SPC) +","+ str(self.textEdit_QTIM_VAL.text()) + ",0"+ ",0" +"\n")
                self.header_flag = True

    # Pressing start
    def on_press_start(self):
        self.lineEdit_Errors.clear()
        self.lineEdit_Errors.insertPlainText("Start logging... \n")
        self.di_single_continuous()
        self.timer.start()

    # Pressing stop
    def on_press_stop(self):
        self.close_all()
        self.timer.stop()


    def my_callback(self):

        if self.reset_abs_time == True:
            self.absolute_start = timer()
            self.reset_abs_time = False


        
        np_values = self.instream_reader.read_many_sample_port_uint16(self.in_stream_array,timeout = 10)

        # np_values = self.digital_task.read(number_of_samples_per_channel=2)
        print(np_values)
        # TOC
        end = timer()

       
        return 0

    def di_single_continuous(self):
        

        #  Create Task
        # --------------
        self.digital_task = nidaqmx.Task()
        #  Create Virtual Channel - Analog Input
        # --------------------------------------
        self.digital_task.di_channels.add_di_chan(CHANNEL_LIST, line_grouping=LineGrouping.CHAN_PER_LINE)

        #  Sets the source of the Sample Clock, the rate of the Sample
        #  Clock, and the number of samples to acquire or generate.
        self.digital_task.timing.cfg_samp_clk_timing(rate=float(10),
                                            source=None,
                                            active_edge=nidaqmx.constants.Edge.RISING,
                                            sample_mode=nidaqmx.constants.AcquisitionType.CONTINUOUS,
                                            samps_per_chan=int(1*4))
        
        self.digital_task.timing.cfg_change_detection_timing()
        self.instream_reader = DigitalMultiChannelReader(self.digital_task.in_stream)
        self.in_stream_array = np.array([np.zeros(int(1),dtype=np.uint16)]*4)

        #  Start Task
        # -----------
        self.digital_task.start()
        self.lineEdit_Errors.insertPlainText("Start data stream... \n")
        self.digital_task_flag = True
        
            

    def close_all(self):
        self.timer.stop()
        self.reset_abs_time = True
        self.lineEdit_Errors.insertPlainText("Stopping... \n")
        #  Stop and Clear Task
        # --------------------
        self.digital_task_flag = False
        self.digital_task.stop()
        self.digital_task.close()

    def closeEvent(self):
        if self.digital_task_flag:
            self.digital_task.stop()
            self.digital_task.close()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = MainWindow()
    win.show()
    sys.exit(app.exec())
