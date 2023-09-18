clear variables
close all

%%%% For extended files containing voltages and time vector
folder = fileparts(pwd);
file1 = '../LogFiles/20230916/log_20230916_2.csv';
test1 = readtable(file1);


Weight_series = -[0.01,0.02,0.05,0.1,0.2,0.5,1]'*9.798;
time1 = [0:1/test1{1,1}:1/test1{1,1}*(length(test1{:,2})-2)];
index = 0;
Fx1 = (test1{2:end,index+1});% - test1{10,index+1});
Fy1 = (test1{2:end,index+2});% - test1{10,index+2});
Fz1 = (test1{2:end,index+3});% - test1{10,index+3});
Mx1 = (test1{2:end,index+4});% - test1{10,index+4});
My1 = (test1{2:end,index+5});% - test1{10,index+5});
Mz1 = (test1{2:end,index+6});% - test1{10,index+6});



figure()
hold on;grid on;
plot(time1,Fx1,'linewidth',2)
plot(time1,Fy1,'linewidth',2)
plot(time1,Fz1,'linewidth',2)
plot(time1,Mx1,'linewidth',2)
plot(time1,My1,'linewidth',2)
plot(time1,Mz1,'linewidth',2)
plot(time1,ones(1,length(time1))*Weight_series(1))
plot(time1,ones(1,length(time1))*Weight_series(2))
plot(time1,ones(1,length(time1))*Weight_series(3))
plot(time1,ones(1,length(time1))*Weight_series(4))
plot(time1,ones(1,length(time1))*Weight_series(5))
plot(time1,ones(1,length(time1))*Weight_series(6))
plot(time1,ones(1,length(time1))*Weight_series(7))
legend('Fx','Fy','Fz','Mx','My','Mz')
xlabel('Time [s]')
ylabel('Force-Torque [N, N-m]')


%% FFT and filtering
fft_Fx1 = fft(Fx1);
Ts = 1/150;




figure()
hold on;grid on;
plot(time1,Fx1,'linewidth',2)
plot(time1,Fy1,'linewidth',2)
plot(time1,Fz1,'linewidth',2)
legend('Fx','Fy','Fz')
xlabel('Time [s]')
ylabel('Force [N]')


figure()
hold on;grid on;
plot(time1,Mx1,'linewidth',2)
plot(time1,My1,'linewidth',2)
plot(time1,Mz1,'linewidth',2)
legend('Mx','My','Mz')
xlabel('Time [s]')
ylabel('Torque [N-m]')

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


figure()
subplot(3,1,1)
hold on;grid on;
plot(time1,Fx1,'linewidth',2)
xlim([0 time1(end)])
legend('Fx')
ylabel('Force X [N]')
subplot(3,1,2)
hold on;grid on;
plot(time1,Fy1,'linewidth',2,'Color', "#D95319")
xlim([0 time1(end)])
legend('Fy')
ylabel('Force Y [N]')
subplot(3,1,3)
hold on;grid on;
plot(time1,Fz1,'linewidth',2,'Color',"#EDB120")
xlim([0 time1(end)])
legend('Fz')
ylabel('Force Z [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
hold on;grid on;
plot(time1,Mx1,'linewidth',2)
xlim([0 time1(end)])
legend('Mx')
ylabel('Torque X [N·m]')
subplot(3,1,2)
hold on;grid on;
plot(time1,My1,'linewidth',2)
xlim([0 time1(end)])
legend('My')
ylabel('Torque Y [N·m]')
subplot(3,1,3)
hold on;grid on;
plot(time1,Mz1,'linewidth',2)
xlim([0 time1(end)])
legend('Mz')
ylabel('Torque Z [N·m]')
xlabel('Time [s]')
