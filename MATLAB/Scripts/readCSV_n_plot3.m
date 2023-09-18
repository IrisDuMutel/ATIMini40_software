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
fft_Fy1 = fft(Fy1);
fft_Fz1 = fft(Fz1);
fft_Mx1 = fft(Mx1);
fft_My1 = fft(My1);
fft_Mz1 = fft(Mz1);

fs = 150;
Ts = 1/fs;
fx = (0:length(fft_Fx1)-1)*fs/length(fft_Fx1);
fy = (0:length(fft_Fy1)-1)*fs/length(fft_Fy1);
fz = (0:length(fft_Fz1)-1)*fs/length(fft_Fz1);
mx = (0:length(fft_Mx1)-1)*fs/length(fft_Mx1);
my = (0:length(fft_My1)-1)*fs/length(fft_My1);
mz = (0:length(fft_Mz1)-1)*fs/length(fft_Mz1);

figure()
subplot(3,1,1)
plot(fx,abs(fft_Fx1))
grid on
ylabel('fft(Fx)')
subplot(3,1,2)
plot(fy,abs(fft_Fy1))
grid on
ylabel('fft(Fy)')
subplot(3,1,3)
plot(fz,abs(fft_Fz1))
ylabel('fft(Fz)')
% title('FFT')
xlabel('Frequency (Hz)')
grid on

figure()
subplot(3,1,1)
plot(mx,abs(fft_Mx1))
grid on
ylabel('fft(Mx)')
subplot(3,1,2)
plot(my,abs(fft_My1))
grid on
ylabel('fft(My)')
subplot(3,1,3)
plot(mz,abs(fft_Mz1))
ylabel('fft(Mz)')
% title('FFT')
xlabel('Frequency (Hz)')
grid on

wpass_fx = 0.5;%[2.5, 3.5];
wpass_fy = 0.5;%[56, 60];
wpass_fz = 0.5;%[0.1];
wpass_mx = 0.5;%[2.5, 3.5];
wpass_my = 0.5;%[56, 60];
wpass_mz = 0.5;%[0.1];
filtered_Fx1 = lowpass(Fx1,wpass_fx,150);
filtered_Fy1 = lowpass(Fy1,wpass_fy,150);
filtered_Fz1 = lowpass(Fz1,wpass_fz,150);
filtered_Mx1 = lowpass(Mx1,wpass_mx,150);
filtered_My1 = lowpass(My1,wpass_my,150);
filtered_Mz1 = lowpass(Mz1,wpass_mz,150);

figure()
subplot(3,1,1)
hold on
plot(time1,Fx1,'linewidth',2)
plot(time1,filtered_Fx1,'linewidth',2)
legend('Fx','Fx filtered')
grid on
ylabel('Fx [N]')
subplot(3,1,2)
hold on
plot(time1,Fy1,'linewidth',2)
plot(time1,filtered_Fy1,'linewidth',2)
legend('Fy','Fy filtered')
grid on
ylabel('Fy [N]')
subplot(3,1,3)
hold on
plot(time1,Fz1,'linewidth',2)
plot(time1,filtered_Fz1,'linewidth',2)
legend('Fz','Fz filtered')
grid on
ylabel('Fz [N]')
xlabel('Time [s]')
grid on

figure()
subplot(3,1,1)
hold on
plot(time1,Mx1,'linewidth',2)
plot(time1,filtered_Mx1,'linewidth',2)
legend('Mx','Mx filtered')
grid on
ylabel('Mx [N·m]')
subplot(3,1,2)
hold on
plot(time1,My1,'linewidth',2)
plot(time1,filtered_My1,'linewidth',2)
legend('My','My filtered')
grid on
ylabel('My [N·m]')
subplot(3,1,3)
hold on
plot(time1,Mz1,'linewidth',2)
plot(time1,filtered_Mz1,'linewidth',2)
legend('Mz','Mz filtered')
grid on
ylabel('Mz [N·m]')
xlabel('Time [s]')
grid on


%% Plots F/T


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
