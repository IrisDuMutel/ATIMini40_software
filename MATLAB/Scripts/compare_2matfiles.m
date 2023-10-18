clear variables
close all

%%%% This script compares two .mat files obtained from average_equal.m or
%%%% average_equal_4files.m

ft_path1  = '../LogFiles/20231017/FT/';
ft_path2  = '../LogFiles/20231017/FT/';

file1 = 'log_20231017_10inch_Rinf_ave.mat';
file2 = 'log_20231017_10inch_R1_avgAll.mat';

Ts1 = 1/150;

filepath1 = strcat(ft_path1,file1);
filepath2 = strcat(ft_path2,file2);

file1 = load(filepath1);
file2 = load(filepath2);

fxlim = 0.65;
fylim = 0.65;
mxlim = 0.1;
mylim = 0.1;

figure()
title('Raw data')
subplot(5,1,1)
hold on;grid on;
plot(file1.result.time,file1.result.Fx,'linewidth',2)
plot(file2.result.time,file2.result.Fx,'linewidth',2)
ylim([-1, 1])
ylabel('F_x [N]')
subplot(5,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.Fy,'linewidth',2)
plot(file2.result.time,file2.result.Fy,'linewidth',2)
ylim([-1, 1])
ylabel('F_y [N]')
legend('File1','File2')
subplot(5,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Mx,'linewidth',2)
plot(file2.result.time,file2.result.Mx,'linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-0.2, 0.2])
subplot(5,1,4)
hold on;grid on;
plot(file1.result.time,file1.result.My,'linewidth',2)
plot(file2.result.time,file2.result.My,'linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-0.2, 0.2])
subplot(5,1,5)
hold on;grid on;
plot(file1.result.time,file1.result.Fz,'linewidth',2)
plot(file2.result.time,file2.result.Fz,'linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')


figure()
title('Raw data')
subplot(5,1,1)
hold on;grid on;
plot(file1.result.timing,file1.result.Fx_points,'x','color','b','linewidth',2)
plot(file2.result.timing,file2.result.Fx_points,'x','color','k','linewidth',2)
ylim([-1*fxlim fxlim])
ylabel('F_x [N]')
subplot(5,1,2)
hold on;grid on;
plot(file1.result.timing,file1.result.Fy_points,'x','color','b','linewidth',2)
plot(file2.result.timing,file2.result.Fy_points,'x','color','k','linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
legend('File1','File2')
subplot(5,1,3)
hold on;grid on;
plot(file1.result.timing,file1.result.Mx_points,'x','color','b','linewidth',2)
plot(file2.result.timing,file2.result.Mx_points,'x','color','k','linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-1*mxlim mxlim])
subplot(5,1,4)
hold on;grid on;
plot(file1.result.timing,file1.result.My_points,'x','color','b','linewidth',2)
plot(file2.result.timing,file2.result.My_points,'x','color','k','linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-1*mylim mylim])
subplot(5,1,5)
hold on;grid on;
plot(file1.result.timing,file1.result.Fz_points,'x','color','b','linewidth',2)
plot(file2.result.timing,file2.result.Fz_points,'x','color','k','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')

figure()
title('Forces [N]')
subplot(3,1,1)
hold on;grid on;
plot(file1.result.time,file1.result.Fx,'linewidth',2)
plot(file2.result.time,file2.result.Fx,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.Fx_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.Fx_points,'x','color','k','linewidth',2)
ylim([-1, 1])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.Fy,'linewidth',2)
plot(file2.result.time,file2.result.Fy,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.Fy_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.Fy_points,'x','color','k','linewidth',2)
ylim([-1, 1])
ylabel('F_y [N]')
legend('Rinf','1R')
subplot(3,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Fz,'linewidth',2)
plot(file2.result.time,file2.result.Fz,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.Fz_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.Fz_points,'x','color','k','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')

figure()
title('Torques [Nm]')
subplot(2,1,1)
hold on;grid on;
plot(file1.result.time,file1.result.Mx,'linewidth',2)
plot(file2.result.time,file2.result.Mx,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.Mx_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.Mx_points,'x','color','k','linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-0.2, 0.2])
subplot(2,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.My,'linewidth',2)
plot(file2.result.time,file2.result.My,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.My_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.My_points,'x','color','k','linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-0.2, 0.2])
