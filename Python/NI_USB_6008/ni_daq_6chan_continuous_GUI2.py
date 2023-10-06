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

from nidaqmx.stream_readers import AnalogMultiChannelReader

DAQ_ADDRESS = 'Dev3'
FILE_PATH = "TestData/ccc.txt"
RANGE = "10"
RESOLUTION = "0.001"
CHANNEL_LIST = "Dev3/ai0,Dev3/ai1,Dev3/ai2,Dev3/ai3,Dev3/ai4,Dev3/ai5"
FILE_PATH = "TestData/log_today.txt"
TEMP = "25"
PRES = "800"

QTIM_VAL = '500' # In ms
absolute_start = timer()
FS = "150"  # Hz
SAMPLE_PER_CHANNEL = str(np.floor(int(QTIM_VAL)*int(FS)*0.001))


cal_mat2 = [[0.02058, -0.03389, -0.11862, 2.75633, 0.12850, -2.92805],  #   Fx
            [ 0.10871, -3.22046, -0.04227, 1.55904, -0.08018, 1.69995], #   Fy
            [ 4.71416, 0.03714, 4.63646, 0.05165, 4.77859, -0.02723],   #   Fz
            [ 0.02905, -0.69919, 2.62607, 0.37939, -2.65824, 0.36622],  #   Tx
            [ -2.99499, -0.02691, 1.49603, -0.57982, 1.57237, 0.62804], #   Ty
            [ 0.05304, -1.48329, 0.05987, -1.45823, 0.07161, -1.56646]] #   Tz

TRANS_MAT = [[4.4482216152605, 0, 0, 0, 0, 0],
             [0, 4.4482216152605, 0, 0, 0, 0],
             [0, 0, 4.4482216152605, 0, 0, 0],
             [0, 0, 0, 0.1129848333, 0, 0],
             [0, 0, 0, 0, 0.1129848333, 0],
             [0, 0, 0, 0, 0, 0.1129848333]]

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.instream_reader = None
        # Load ui File
        uic.loadUi("Python/NI_USB_6008/ATIMini40_GUI.ui", self)
    
        
        # Initialize Components on the GUI
        self.comboBox_deviceName.addItem(DAQ_ADDRESS)
        self.textEdit_channelList.setText(CHANNEL_LIST)
        self.textEdit_Range.setText(RANGE)
        self.textEdit_Resolution.setText(RESOLUTION)
        self.textEdit_FS.setText(FS)
        self.textEdit_QTIM_VAL.setText(QTIM_VAL)
        self.textEdit_FilePath.setText(FILE_PATH)
        self.textEdit_Temp.setText(TEMP)
        self.textEdit_Pres.setText(PRES)
        

        # Variable initialiation
        self.timer=QTimer()
        self.absolute_start = timer()   
        self.timer.setInterval(int(QTIM_VAL))

        # Callback Functions
        self.startButton.clicked.connect(self.on_press_start)
        self.stopButton.clicked.connect(self.on_press_stop)
        self.checkBox.stateChanged.connect(self.save_data)
        self.checkBox_NNm.stateChanged.connect(self.NNm)
        self.timer.timeout.connect(self.my_callback)
        
        # Flag initialization
        self.saveDataFlag = False
        self.reset_abs_time = False
        self.N_Nm = False
        self.analog_task_flag = False
        self.header_flag = False

    # If measuring in N and N-m
    def NNm(self):
        if self.N_Nm == True:
            self.N_Nm = False
        else:
            self.N_Nm = True

    # If logging data into .txt file
    def save_data(self):
        if self.checkBox.isChecked() == False:
            self.lineEdit_Errors.insertPlainText("Insert new log file name and check save box \n")
            self.saveDataFlag = False
            self.header_flag = False
            self.write_path.close()

        else:
            self.saveDataFlag = True
            self.SPC = int(int(self.textEdit_FS.text())*int(self.textEdit_QTIM_VAL.text())*0.001)
            self.lineEdit_Errors.insertPlainText("Logging data in " + self.textEdit_FilePath.text() + "\n")
            self.write_path = open(self.textEdit_FilePath.text(), 'a')
            if self.header_flag==False:
                self.write_path.write("First line indicates sampling freq [Hz], samples per channel, QTimer [ms] \n")
                self.write_path.write("Fx, Fy, Fz, Mz, My, Mz \n")
                self.write_path.write((self.textEdit_FS.text()) + "," +  str(self.SPC) +","+ str(self.textEdit_QTIM_VAL.text()) + "," + (self.textEdit_Temp.text()) + "," + (self.textEdit_Pres.text()) + "," + "0" +"\n")
                self.header_flag = True

    # Pressing start
    def on_press_start(self):
        self.lineEdit_Errors.clear()
        self.lineEdit_Errors.insertPlainText("Start logging... \n")
        self.ai_single_continuous()
        self.timer.start()

    # Pressing stop
    def on_press_stop(self):
        self.close_all()
        self.timer.stop()


    def my_callback(self):
        global bias_vector
        global cal_mat2
        global TRANS_MAT
        if self.reset_abs_time == True:
            self.absolute_start = timer()
            self.reset_abs_time = False


        self.instream_reader.read_many_sample(self.in_stream_array,self.SPC,timeout = 10)
        np_values = np.array(self.in_stream_array)
        # print(np_values)

        # TOC
        end = timer()

        
        # Remove bias voltages
        unbiased_volt = [(np_values[0]-bias_vector[0]), (np_values[1]-bias_vector[1]), (np_values[2]-bias_vector[2]), (np_values[3]-bias_vector[3]), (np_values[4]-bias_vector[4]), (np_values[5]-bias_vector[5])]

        # Multiply by calibration matrix. Results are in lbf, lbf-in
        res = np.dot(cal_mat2,unbiased_volt)
        res_trans = res.transpose()
        print(res_trans)
        if self.N_Nm is True:
            self.lineEdit_Values.setText  ("{:.2f}".format(np.mean(res[0]*4.4482216152605)) )
            self.lineEdit_Values_2.setText("{:.2f}".format(np.mean(res[1]*4.4482216152605)) )
            self.lineEdit_Values_3.setText("{:.2f}".format(np.mean(res[2]*4.4482216152605)) )
            self.lineEdit_Values_4.setText("{:.2f}".format(np.mean(res[3]*0.1129848333)) )
            self.lineEdit_Values_5.setText("{:.2f}".format(np.mean(res[4]*0.1129848333)) )
            self.lineEdit_Values_6.setText("{:.2f}".format(np.mean(res[5]*0.1129848333)))
            if self.saveDataFlag==True:
                for i in range(0,self.SPC):
                    self.write_path.write(str(res_trans[i][0]*4.4482216152605)+","+str(res_trans[i][1]*4.4482216152605)+","+str(res_trans[i][2]*4.4482216152605)+","+str(res_trans[i][3]*0.1129848333)+","+str(res_trans[i][4]*0.1129848333)+","+str(res_trans[i][5]*0.1129848333)+"\n")
        else:
            self.lineEdit_Values.setText  ("{:.2f}".format(np.mean(res[0]))) 
            self.lineEdit_Values_2.setText("{:.2f}".format(np.mean(res[1]))) 
            self.lineEdit_Values_3.setText("{:.2f}".format(np.mean(res[2]))) 
            self.lineEdit_Values_4.setText("{:.2f}".format(np.mean(res[3]))) 
            self.lineEdit_Values_5.setText("{:.2f}".format(np.mean(res[4]))) 
            self.lineEdit_Values_6.setText("{:.2f}".format(np.mean(res[5])))
            if self.saveDataFlag==True:
                for i in range(0,self.SPC):
                    self.write_path.write(str(res_trans[i][0])+","+str(res_trans[i][1])+","+str(res_trans[i][2])+","+str(res_trans[i][3])+","+str(res_trans[i][4])+","+str(res_trans[i][5])+"\n")

        self.lineEdit_Time.setText("{:.2f}".format(end-self.absolute_start))
        print("{:.2f}".format(end-self.absolute_start))
        return 0

    def ai_single_continuous(self):
        
        global bias_vector

        self.SPC = int(int(self.textEdit_FS.text())*int(self.textEdit_QTIM_VAL.text())*0.001)
        #  Create Task
        # --------------
        self.analog_task = nidaqmx.Task()
        #  Create Virtual Channel - Analog Input
        # --------------------------------------
        self.analog_task.ai_channels.add_ai_voltage_chan(physical_channel=self.textEdit_channelList.text(),
                                                    name_to_assign_to_channel="",
                                                    terminal_config=constants.TerminalConfiguration.RSE,
                                                    min_val=-float(self.textEdit_Range.text()),
                                                    max_val=float(self.textEdit_Range.text()),
                                                    units=constants.VoltageUnits.VOLTS,
                                                    custom_scale_name=None)

        #  Sets the source of the Sample Clock, the rate of the Sample
        #  Clock, and the number of samples to acquire or generate.
        self.lineEdit_Errors.insertPlainText("Getting bias values... \n")
        bias_vector = self.analog_task.read()
        print(bias_vector)

        self.analog_task.timing.cfg_samp_clk_timing(rate=int(self.textEdit_FS.text()),
                                            source=None,
                                            active_edge=nidaqmx.constants.Edge.RISING,
                                            sample_mode=nidaqmx.constants.AcquisitionType.CONTINUOUS,
                                            samps_per_chan=int(self.SPC*6))

        # Register reader
        self.instream_reader = AnalogMultiChannelReader(self.analog_task.in_stream)
        self.in_stream_array = np.array([np.zeros(self.SPC,dtype=np.float64)]*6)



        #  Start Task
        # -----------
        self.analog_task.start()
        self.lineEdit_Errors.insertPlainText("Start data stream... \n")
        self.analog_task_flag = True
        
            

    def close_all(self):
        self.timer.stop()
        self.reset_abs_time = True
        self.lineEdit_Errors.clear()
        self.lineEdit_Errors.insertPlainText("Stopping... \n")
        self.checkBox.setChecked(False)
        self.checkBox_NNm.setChecked(False)
        # self.textEdit_FS.clear()
        self.lineEdit_Errors.insertPlainText("Please, reset all controls on GUI \n")
        #  Stop and Clear Task
        # --------------------
        self.analog_task_flag = False
        self.analog_task.stop()
        self.analog_task.close()

    def closeEvent(self):
        if self.analog_task_flag:
            self.analog_task.stop()
            self.analog_task.close()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = MainWindow()
    win.show()
    sys.exit(app.exec())
