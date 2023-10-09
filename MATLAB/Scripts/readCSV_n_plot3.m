clear variables
close all


% Problem parameters
% L          = 0.20;     %m
% numBlades  = 2;
% Radius     = 0.2032/2; %m (diameter if 0.2 is used
% R_constant = 287.04; % m^2 /°Ksec^2
% toKelvin   = 273.15;
% rpm12 = [4,7,9,12];  %%% Levels to be taken for equal RPM comparison
% 
% step_duration = 1500;
% segment_points = 1350;           %100 8 inches           % how many points do we select
% offset_points  = 100;            % 80 8 inches
% steps_per_stair = 4;

%%%% For extended files containing voltages and time vector
folder = fileparts(pwd);
ft_path  = '../LogFiles/20231008/FT/';
rpm_path = '../LogFiles/20231008/RPM/';
file1 = 'log_20231008_13inch_auto7.csv';
file2 = 'log_20231008_13inch_auto7.csv';

title_size = 6;

filepath1 = strcat(ft_path,file1);
filepath2 = strcat(ft_path,file2);
filepath1_rpm = strcat(rpm_path,file1);
filepath2_rpm = strcat(rpm_path,file2);

test1 = readtable(filepath1);
test2 = readtable(filepath2);
rpm1  = readtable(filepath1_rpm);
rpm2  = readtable(filepath2_rpm);

sampl_f1 = test1{1,1}; % Sampling frequency of the signal
sampl_f2 = test2{1,1}; % Sampling frequency of the signal
Ts1 = 1/sampl_f1;
Ts2 = 1/sampl_f2;

temp1 = test1(1,4);
temp2 = test2(1,4);
pres1 = test1(1,5);
pres2 = test2(1,5);

offset    = 1;  % 3000 is 20s (offset*Ts = seconds)
fx_column = 1;
fy_column = 2;
fz_column = 3;
mx_column = 4;
my_column = 5;
mz_column = 6;

time1 = [0*Ts1:Ts1:Ts1*(length(test1{:,2})-2)];
time2 = [0*Ts2:Ts2:Ts2*(length(test2{:,2})-2)];

Fx1 = (test1{2:end,fx_column});
Fy1 = (test1{2:end,fy_column});
Fz1 = (test1{2:end,fz_column});
Mx1 = (test1{2:end,mx_column});
My1 = (test1{2:end,my_column});
Mz1 = (test1{2:end,mz_column});
Fx2 = (test2{2:end,fx_column});
Fy2 = (test2{2:end,fy_column});
Fz2 = (test2{2:end,fz_column});
Mx2 = (test2{2:end,mx_column});
My2 = (test2{2:end,my_column});
Mz2 = (test2{2:end,mz_column});



%% FFT and filtering

wpass_fx = 0.5;
wpass_fy = 0.5;
wpass_fz = 0.2;
wpass_mx = 0.5;
wpass_my = 0.5;
wpass_mz = 0.5;

%%% Filtering
filtered_Fx1 = lowpass(Fx1,wpass_fx,sampl_f1);
filtered_Fy1 = lowpass(Fy1,wpass_fy,sampl_f1);
filtered_Fz1 = lowpass(Fz1,wpass_fz,sampl_f1);
filtered_Mx1 = lowpass(Mx1,wpass_mx,sampl_f1);
filtered_My1 = lowpass(My1,wpass_my,sampl_f1);
filtered_Mz1 = lowpass(Mz1,wpass_mz,sampl_f1);

filtered_Fx2 = lowpass(Fx2,wpass_fx,sampl_f1);
filtered_Fy2 = lowpass(Fy2,wpass_fy,sampl_f1);
filtered_Fz2 = lowpass(Fz2,wpass_fz,sampl_f1);
filtered_Mx2 = lowpass(Mx2,wpass_mx,sampl_f1);
filtered_My2 = lowpass(My2,wpass_my,sampl_f1);
filtered_Mz2 = lowpass(Mz2,wpass_mz,sampl_f1);

%%% Offset removal
filtered_Fx1 = filtered_Fx1(offset:end) - filtered_Fx1(offset);
filtered_Fy1 = filtered_Fy1(offset:end) - filtered_Fy1(offset);
filtered_Fz1 = filtered_Fz1(offset:end) - filtered_Fz1(offset);
filtered_Mx1 = filtered_Mx1(offset:end) - filtered_Mx1(offset);
filtered_My1 = filtered_My1(offset:end) - filtered_My1(offset);
filtered_Mz1 = filtered_Mz1(offset:end) - filtered_Mz1(offset);

filtered_Fx2 = filtered_Fx2(offset:end) - filtered_Fx2(offset);
filtered_Fy2 = filtered_Fy2(offset:end) - filtered_Fy2(offset);
filtered_Fz2 = filtered_Fz2(offset:end) - filtered_Fz2(offset);
filtered_Mx2 = filtered_Mx2(offset:end) - filtered_Mx2(offset);
filtered_My2 = filtered_My2(offset:end) - filtered_My2(offset);
filtered_Mz2 = filtered_Mz2(offset:end) - filtered_Mz2(offset);


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

figure()
hold on; grid on;
plot([0:1:length(rpm1{:,1})-1],rpm1{:,1}/2,'lineWidth',2)
plot([0:1:length(rpm1{:,2})-1],rpm1{:,2}/2,'lineWidth',2)
plot([0:1:length(rpm1{:,3})-1],rpm1{:,3}/2,'lineWidth',2)
plot([0:1:length(rpm1{:,4})-1],rpm1{:,4}/2,'lineWidth',2)
