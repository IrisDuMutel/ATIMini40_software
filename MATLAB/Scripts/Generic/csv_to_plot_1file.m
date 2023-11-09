clear variables
close all

%%%% This script reads the data from a test file organized in the following
%%%% format
%%%% Columns of the file:
%%%% Fx  Fy  Fz  Mx  My  Mz

%%%% No filtering or offset removal is performed, only plotting of raw data
%%%% The time vector is constructed as the number of datapoints. If
%%%% sampling time is known, use Ts to convert to seconds
file1 = 'LogFiles/log_20230728.csv';
test1 = readtable(file1);

Ts = 1;
time1 = (test1{1:end,1} - test1{1,1})*Ts;
index = 1;
offset = 1;
Fx1 = (test1{1:end,index+1});% - test1{offset,index+1});  %% Uncomment for offset removal
Fy1 = (test1{1:end,index+2});% - test1{offset,index+2});  %% Uncomment for offset removal
Fz1 = (test1{1:end,index+3});% - test1{offset,index+3});  %% Uncomment for offset removal
Mx1 = (test1{1:end,index+4});% - test1{offset,index+4});  %% Uncomment for offset removal
My1 = (test1{1:end,index+5});% - test1{offset,index+5});  %% Uncomment for offset removal
Mz1 = (test1{1:end,index+6});% - test1{offset,index+6});  %% Uncomment for offset removal



figure()
hold on;grid on;
plot(time1,Fx1,'linewidth',2)
plot(time1,Fy1,'linewidth',2)
plot(time1,Fz1,'linewidth',2)
plot(time1,Mx1,'linewidth',2)
plot(time1,My1,'linewidth',2)
plot(time1,Mz1,'linewidth',2)
legend('Fx','Fy','Fz','Mx','My','Mz')
xlabel('Time [s]')
ylabel('Force-Torque [N, N-m]')


figure()
subplot(3,1,1)
hold on;grid on;
plot(time1,Fx1,'linewidth',2)
ylabel('Fx [N]')
subplot(3,1,2)
hold on;grid on;
plot(time1,Fy1,'linewidth',2)
ylabel('Fy [N]')
subplot(3,1,3)
hold on;grid on;
plot(time1,Fz1,'linewidth',2)
ylabel('Fz [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
hold on;grid on;
plot(time1,Mx1,'linewidth',2)
ylabel('Mx [N]')
subplot(3,1,2)
hold on;grid on;
plot(time1,My1,'linewidth',2)
ylabel('My [N]')
subplot(3,1,3)
hold on;grid on;
plot(time1,Mz1,'linewidth',2)
ylabel('Mz [N]')
xlabel('Time [s]')

figure()
subplot(2,1,1)
hold on;grid on;
plot(time1,Fx1,'linewidth',2)
plot(time1,Fy1,'linewidth',2)
plot(time1,Fz1,'linewidth',2)
legend('Fx','Fy','Fz')
ylabel('Forces [N]')
subplot(2,1,2)
hold on;grid on;
plot(time1,Mx1,'linewidth',2)
plot(time1,My1,'linewidth',2)
plot(time1,Mz1,'linewidth',2)
legend('Mx','My','Mz')
ylabel('Torques [N-m]')
xlabel('Time [s]')