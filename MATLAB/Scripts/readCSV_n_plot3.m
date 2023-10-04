clear variables
close all

%%%% For extended files containing voltages and time vector
folder = fileparts(pwd);
filepath = '../LogFiles/';
file1 = '20230916/log_20230916_2.csv';
file2 = '20231002/FT/log_20231002_10inch1R_test3.csv';
title_size = 6;

filepath1 = strcat(filepath,file1);
filepath2 = strcat(filepath,file2);


test1 = readtable(filepath1);
test2 = readtable(filepath2);


Weight_series = -[0.01,0.02,0.05,0.1,0.2,0.5,1]'*9.798;
time1 = [0:1/test1{1,1}:1/test1{1,1}*(length(test1{:,2})-2)];
time2 = [0:1/test2{1,1}:1/test2{1,1}*(length(test2{:,2})-2)];
index = 0;
offset = 20;

Fx1 = (test1{2:end,index+1});% - test1{offset,index+1});
Fy1 = (test1{2:end,index+2});% - test1{offset,index+2});
Fz1 = (test1{2:end,index+3});% - test1{offset,index+3});
Mx1 = (test1{2:end,index+4});% - test1{offset,index+4});
My1 = (test1{2:end,index+5});% - test1{offset,index+5});
Mz1 = (test1{2:end,index+6});% - test1{offset,index+6});
Fx2 = (test2{2:end,index+1});% - test2{offset,index+1});
Fy2 = (test2{2:end,index+2});% - test2{offset,index+2});
Fz2 = (test2{2:end,index+3});% - test2{offset,index+3});
Mx2 = (test2{2:end,index+4});% - test2{offset,index+4});
My2 = (test2{2:end,index+5});% - test2{offset,index+5});
Mz2 = (test2{2:end,index+6});% - test2{offset,index+6});

% figure()
% hold on;grid on;
% plot(time1,Fx1,'linewidth',2)
% plot(time1,Fy1,'linewidth',2)
% plot(time1,Fz1,'linewidth',2)
% plot(time1,Mx1,'linewidth',2)
% plot(time1,My1,'linewidth',2)
% plot(time1,Mz1,'linewidth',2)
% plot(time1,ones(1,length(time1))*Weight_series(1))
% plot(time1,ones(1,length(time1))*Weight_series(2))
% plot(time1,ones(1,length(time1))*Weight_series(3))
% plot(time1,ones(1,length(time1))*Weight_series(4))
% plot(time1,ones(1,length(time1))*Weight_series(5))
% plot(time1,ones(1,length(time1))*Weight_series(6))
% plot(time1,ones(1,length(time1))*Weight_series(7))
% legend('Fx','Fy','Fz','Mx','My','Mz')
% xlabel('Time [s]')
% ylabel('Force-Torque [N, N-m]')


%% FFT and filtering

fft_Fx1 = fft(Fx1);
fft_Fy1 = fft(Fy1);
fft_Fz1 = fft(Fz1);
fft_Mx1 = fft(Mx1);
fft_My1 = fft(My1);
fft_Mz1 = fft(Mz1);

sampl_f = 150; % Sampling frequency of the signal
Ts = 1/sampl_f;
fx = (0:length(fft_Fx1)-1)*sampl_f/length(fft_Fx1);
fy = (0:length(fft_Fy1)-1)*sampl_f/length(fft_Fy1);
fz = (0:length(fft_Fz1)-1)*sampl_f/length(fft_Fz1);
mx = (0:length(fft_Mx1)-1)*sampl_f/length(fft_Mx1);
my = (0:length(fft_My1)-1)*sampl_f/length(fft_My1);
mz = (0:length(fft_Mz1)-1)*sampl_f/length(fft_Mz1);

figure()
subplot(3,1,1)
plot(fx,abs(fft_Fx1))
grid on
title(strcat(file1,' ---vs--- ',file2),'FontSize',title_size,'Interpreter','none')
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
% t = annotation('textbox','String',strcat(file1,' VS ',file2),'FitBoxToText','on');
% sz = t.FontSize;
% t.FontSize = 8;
grid on

figure()
subplot(3,1,1)
title(strcat(file1,' ---vs--- ',file2),'FontSize',title_size,'Interpreter','none')
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
wpass_fz = 0.2;%[0.1];
wpass_mx = 0.5;%[2.5, 3.5];
wpass_my = 0.5;%[56, 60];
wpass_mz = 0.5;%[0.1];
filtered_Fx1 = lowpass(Fx1,wpass_fx,sampl_f);
filtered_Fy1 = lowpass(Fy1,wpass_fy,sampl_f);
filtered_Fz1 = lowpass(Fz1,wpass_fz,sampl_f);
filtered_Mx1 = lowpass(Mx1,wpass_mx,sampl_f);
filtered_My1 = lowpass(My1,wpass_my,sampl_f);
filtered_Mz1 = lowpass(Mz1,wpass_mz,sampl_f);

filtered_Fx2 = lowpass(Fx2,wpass_fx,sampl_f);
filtered_Fy2 = lowpass(Fy2,wpass_fy,sampl_f);
filtered_Fz2 = lowpass(Fz2,wpass_fz,sampl_f);
filtered_Mx2 = lowpass(Mx2,wpass_mx,sampl_f);
filtered_My2 = lowpass(My2,wpass_my,sampl_f);
filtered_Mz2 = lowpass(Mz2,wpass_mz,sampl_f);

% figure()
% subplot(3,1,1)
% hold on
% plot(time1,Fx1,'linewidth',2)
% plot(time1,filtered_Fx1,'linewidth',2)
% legend('Fx','Fx filtered')
% grid on
% ylabel('Fx [N]')
% subplot(3,1,2)
% hold on
% plot(time1,Fy1,'linewidth',2)
% plot(time1,filtered_Fy1,'linewidth',2)
% legend('Fy','Fy filtered')
% grid on
% ylabel('Fy [N]')
% subplot(3,1,3)
% hold on
% plot(time1,Fz1,'linewidth',2)
% plot(time1,filtered_Fz1,'linewidth',2)
% legend('Fz','Fz filtered')
% grid on
% ylabel('Fz [N]')
% xlabel('Time [s]')
% grid on

figure()
subplot(3,1,1)
hold on
title(strcat(file1,' ---vs--- ',file2),'FontSize',title_size,'Interpreter','none')
plot(time1,filtered_Fx1,'linewidth',1.5)
plot(time2,filtered_Fx2,'linewidth',1.5)
legend('Fx_{noWall}','Fx 1R')
ylim([-3 3])
grid on
ylabel('Fx [N]')
subplot(3,1,2)
hold on
plot(time1,filtered_Fy1,'linewidth',1.5)
plot(time2,filtered_Fy2,'linewidth',1.5)
legend('Fy_{noWall}','Fy 1R')
ylim([-3 3])
grid on
ylabel('Fy [N]')
subplot(3,1,3)
hold on
plot(time1,filtered_Fz1,'linewidth',1.5)
plot(time2,filtered_Fz2,'linewidth',1.5)
legend('Fz_{noWall}','Fz 1R')
grid on
ylabel('Fz [N]')
xlabel('Time [s]')
grid on

% figure()
% subplot(3,1,1)
% hold on
% plot(time1,Mx1,'linewidth',2)
% plot(time1,filtered_Mx1,'linewidth',2)
% legend('Mx','Mx filtered')
% grid on
% ylabel('Mx [N·m]')
% subplot(3,1,2)
% hold on
% plot(time1,My1,'linewidth',2)
% plot(time1,filtered_My1,'linewidth',2)
% legend('My','My filtered')
% grid on
% ylabel('My [N·m]')
% subplot(3,1,3)
% hold on
% plot(time1,Mz1,'linewidth',2)
% plot(time1,filtered_Mz1,'linewidth',2)
% legend('Mz','Mz filtered')
% grid on
% ylabel('Mz [N·m]')
% xlabel('Time [s]')
% grid on

figure()
subplot(3,1,1)
hold on
title(strcat(file1,' ---vs--- ',file2),'FontSize',title_size,'Interpreter','none')
plot(time1,filtered_Mx1,'linewidth',1.5)
plot(time2,filtered_Mx2,'linewidth',1.5)
legend('Mx_{noWall}','Mx 1R')
ylim([-0.1 0.15])
grid on
ylabel('Mx [N·m]')
subplot(3,1,2)
hold on
plot(time1,filtered_My1,'linewidth',1.5)
plot(time2,filtered_My2,'linewidth',1.5)
legend('My_{noWall}','My 1R')
ylim([-0.1 0.15])
grid on
ylabel('My [N·m]')
subplot(3,1,3)
hold on
plot(time1,filtered_Mz1,'linewidth',1.5)
plot(time2,filtered_Mz2,'linewidth',1.5)
legend('Mz_{noWall}','Mz 1R')
ylim([-0.1 0.15])
grid on
ylabel('Mz [N·m]')
xlabel('Time [s]')
grid on


filtered_Fz1_1 = lowpass(Fz1,0.5,150);
filtered_Fz1_2 = highpass(Fz1,140,150);
% filtered_Fz1_3 = bandpass(Fz1,[0.001,0.5],150);


figure()
hold on
title(strcat(file1,' ---vs--- ',file2),'FontSize',title_size,'Interpreter','none')
plot(time1,Fz1,'linewidth',2)
plot(time1,filtered_Fz1_1,'linewidth',2)
plot(time1,filtered_Fz1_2,'linewidth',2)
% plot(time1,filtered_Fz1_3,'linewidth',2)
legend('Fz','Fz filtered1','Fz filtered2')%,'Fz filtered3')
grid on



