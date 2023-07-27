clear variables
close all

%%%% For extended files containing voltages and time vector

file1 = 'test500g2.csv';
test1 = readtable(file1);
SampleRate = 10; %Hz --- time is correct

Weight_series = -[0.01,0.02,0.02,0.05,0.1,0.2,0.2,0.5,1]'*9.81;
time1 = (test1{1:end,1} - test1{1,1});
index = 1;
Fx1 = (test1{1:end,index+1} - test1{10,index+1})*0.453592369999995;
Fy1 = (test1{1:end,index+2} - test1{10,index+2})*0.453592369999995;
Fz1 = (test1{1:end,index+3} - test1{10,index+3})*0.453592369999995;
Mx1 = (test1{1:end,index+4} - test1{10,index+4})*0.1129848333;
My1 = (test1{1:end,index+5} - test1{10,index+5})*0.1129848333;
Mz1 = (test1{1:end,index+6} - test1{10,index+6})*0.1129848333;



figure()
hold on;grid on;
plot(time1,Fx1,'linewidth',2)
plot(time1,Fy1,'linewidth',2)
plot(time1,Fz1,'linewidth',2)
plot(time1,Mx1,'linewidth',2)
plot(time1,My1,'linewidth',2)
plot(time1,Mz1,'linewidth',2)
plot(time1,ones(1,length(time1))*Weight_series(end))
legend('Fx','Fy','Fz','Mx','My','Mz')
xlabel('Time [s]')
ylabel('Force-Torque [N, N-m]')


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