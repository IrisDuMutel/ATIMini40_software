clear variables
close all

%%%% This script compares two .mat files obtained from average_equal.m or
%%%% average_equal_4files.m

ft_path1  = '../LogFiles/20231017/FT/';
ft_path2  = '../LogFiles/20231018/FT/';
ft_path3  = '../LogFiles/20231018/FT/';
ft_path4  = '../LogFiles/20231018/FT/';
ft_path5  = '../LogFiles/20231018/FT/';
ft_path6  = '../LogFiles/20231018/FT/';
ft_path7  = '../LogFiles/20231018/FT/';


file1 = 'log_20231017_10inch_Rinf_avg.mat';
file2 = 'log_20231017_10inch_R1_avgAll.mat';
file3 = 'log_20231018_10inch_R125_0degavg.mat';
file4 = 'log_20231018_10inch_R15_0degavg.mat';
file5 = 'log_20231018_10inch_R175_0degavg.mat';
file6 = 'log_20231018_10inch_R2_0degavg.mat';
file7 = 'log_20231018_10inch_R25_0degavg.mat';

Ts1 = 1/150;

filepath1 = strcat(ft_path1,file1);
filepath2 = strcat(ft_path2,file2);
filepath3 = strcat(ft_path3,file3);
filepath4 = strcat(ft_path4,file4);
filepath5 = strcat(ft_path5,file5);
filepath6 = strcat(ft_path6,file6);
filepath7 = strcat(ft_path7,file7);

file1 = load(filepath1);
file2 = load(filepath2);
file3 = load(filepath3);
file4 = load(filepath4);
file5 = load(filepath5);
file6 = load(filepath6);
file7 = load(filepath7);

fxlim = 0.65;
fylim = 0.65;
mxlim = 0.1;
mylim = 0.1;
point_to_see = 12;
figure()
title('Raw data')
subplot(3,1,1)
hold on;grid on;
plot(file1.result.time,file1.result.Fx,'linewidth',2)
plot(file2.result.time,file2.result.Fx,'linewidth',2)
plot(file3.result.time,file3.result.Fx,'linewidth',2)
plot(file4.result.time,file4.result.Fx,'linewidth',2)
plot(file5.result.time,file5.result.Fx,'linewidth',2)
plot(file6.result.time,file6.result.Fx,'linewidth',2)
plot(file7.result.time,file7.result.Fx,'linewidth',2)
ylim([-1, 1])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.Fy,'linewidth',2)
plot(file2.result.time,file2.result.Fy,'linewidth',2)
plot(file3.result.time,file3.result.Fy,'linewidth',2)
plot(file4.result.time,file4.result.Fy,'linewidth',2)
plot(file5.result.time,file5.result.Fy,'linewidth',2)
plot(file6.result.time,file6.result.Fy,'linewidth',2)
plot(file7.result.time,file7.result.Fy,'linewidth',2)
ylim([-1, 1])
ylabel('F_y [N]')
legend('File1','File2')
subplot(3,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Fz,'linewidth',2)
plot(file2.result.time,file2.result.Fz,'linewidth',2)
plot(file3.result.time,file3.result.Fz,'linewidth',2)
plot(file4.result.time,file4.result.Fz,'linewidth',2)
plot(file5.result.time,file5.result.Fz,'linewidth',2)
plot(file6.result.time,file6.result.Fz,'linewidth',2)
plot(file7.result.time,file7.result.Fz,'linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')


figure()
subplot(3,1,1)
hold on;grid on;
title("Raw data")
plot(file1.result.time,file1.result.Mx,'linewidth',2)
plot(file2.result.time,file2.result.Mx,'linewidth',2)
plot(file3.result.time,file3.result.Mx,'linewidth',2)
plot(file4.result.time,file4.result.Mx,'linewidth',2)
plot(file5.result.time,file5.result.Mx,'linewidth',2)
plot(file6.result.time,file6.result.Mx,'linewidth',2)
plot(file7.result.time,file7.result.Mx,'linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-0.2, 0.2])
subplot(3,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.My,'linewidth',2)
plot(file2.result.time,file2.result.My,'linewidth',2)
plot(file3.result.time,file3.result.My,'linewidth',2)
plot(file4.result.time,file4.result.My,'linewidth',2)
plot(file5.result.time,file5.result.My,'linewidth',2)
plot(file6.result.time,file6.result.My,'linewidth',2)
plot(file7.result.time,file7.result.My,'linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-0.2, 0.2])
subplot(3,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Mz,'linewidth',2)
plot(file2.result.time,file2.result.Mz,'linewidth',2)
plot(file3.result.time,file3.result.Mz,'linewidth',2)
plot(file4.result.time,file4.result.Mz,'linewidth',2)
plot(file5.result.time,file5.result.Mz,'linewidth',2)
plot(file6.result.time,file6.result.Mz,'linewidth',2)
plot(file7.result.time,file7.result.Mz,'linewidth',2)
ylabel('M_z [N\cdot m]')
ylim([-0.2, 0.2])


figure()
title('Raw data')
subplot(3,1,1)
hold on;grid on;
plot(10,file1.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(1,file2.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(1.25,file3.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(1.5,file4.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(1.75,file5.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(2,file6.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(2.5,file7.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
ylim([-1*fxlim fxlim])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(10,file1.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(1,file2.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(1.25,file3.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(1.5,file4.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(1.75,file5.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(2,file6.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(2.5,file7.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
legend('File1','File2')
subplot(3,1,3)
hold on;grid on;
plot(10,file1.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(1,file2.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(1.25,file3.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(1.5,file4.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(1.75,file5.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(2,file6.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(2.5,file7.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
hold on;grid on;
plot(10,file1.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(1,file2.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(1.25,file3.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(1.5,file4.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(1.75,file5.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(2,file6.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(2.5,file7.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-1*mxlim mxlim])
subplot(3,1,2)
hold on;grid on;
plot(10,file1.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(1,file2.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(1.25,file3.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(1.5,file4.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(1.75,file5.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(2,file6.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(2.5,file7.result.My_points(point_to_see),'x','color','k','linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-1*mylim mylim])
subplot(3,1,3)
hold on;grid on;
plot(10,file1.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(1,file2.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(1.25,file3.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(1.5,file4.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(1.75,file5.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(2,file6.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(2.5,file7.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
ylabel('M_z [N\cdot m]')
ylim([-1*mylim mylim])

figure()
title('Forces [N]')
subplot(3,1,1)
hold on;grid on;
plot(file1.result.time,file1.result.Fx,'linewidth',2)
plot(file2.result.time,file2.result.Fx,'linewidth',2)
plot(file3.result.time,file3.result.Fx,'linewidth',2)
plot(file4.result.time,file4.result.Fx,'linewidth',2)
plot(file5.result.time,file5.result.Fx,'linewidth',2)
plot(file6.result.time,file6.result.Fx,'linewidth',2)
plot(file7.result.time,file7.result.Fx,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.Fx_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.Fx_points,'x','color','k','linewidth',2)
plot(file3.result.timing*Ts1,file3.result.Fx_points,'x','color','k','linewidth',2)
plot(file4.result.timing*Ts1,file4.result.Fx_points,'x','color','k','linewidth',2)
plot(file5.result.timing*Ts1,file5.result.Fx_points,'x','color','k','linewidth',2)
plot(file6.result.timing*Ts1,file6.result.Fx_points,'x','color','k','linewidth',2)
plot(file7.result.timing*Ts1,file7.result.Fx_points,'x','color','k','linewidth',2)
ylim([-1, 1])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.Fy,'linewidth',2)
plot(file2.result.time,file2.result.Fy,'linewidth',2)
plot(file3.result.time,file3.result.Fy,'linewidth',2)
plot(file4.result.time,file4.result.Fy,'linewidth',2)
plot(file5.result.time,file5.result.Fy,'linewidth',2)
plot(file6.result.time,file6.result.Fy,'linewidth',2)
plot(file7.result.time,file7.result.Fy,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.Fy_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.Fy_points,'x','color','k','linewidth',2)
plot(file3.result.timing*Ts1,file3.result.Fy_points,'x','color','k','linewidth',2)
plot(file4.result.timing*Ts1,file4.result.Fy_points,'x','color','k','linewidth',2)
plot(file5.result.timing*Ts1,file5.result.Fy_points,'x','color','k','linewidth',2)
plot(file6.result.timing*Ts1,file6.result.Fy_points,'x','color','k','linewidth',2)
plot(file7.result.timing*Ts1,file7.result.Fy_points,'x','color','k','linewidth',2)
ylim([-1, 1])
ylabel('F_y [N]')
legend('Rinf','1R')
subplot(3,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Fz,'linewidth',2)
plot(file2.result.time,file2.result.Fz,'linewidth',2)
plot(file3.result.time,file3.result.Fz,'linewidth',2)
plot(file4.result.time,file4.result.Fz,'linewidth',2)
plot(file5.result.time,file5.result.Fz,'linewidth',2)
plot(file6.result.time,file6.result.Fz,'linewidth',2)
plot(file7.result.time,file7.result.Fz,'linewidth',2)
plot(file1.result.timing*Ts1,file1.result.Fz_points,'x','color','b','linewidth',2)
plot(file2.result.timing*Ts1,file2.result.Fz_points,'x','color','k','linewidth',2)
plot(file3.result.timing*Ts1,file3.result.Fz_points,'x','color','k','linewidth',2)
plot(file4.result.timing*Ts1,file4.result.Fz_points,'x','color','k','linewidth',2)
plot(file5.result.timing*Ts1,file5.result.Fz_points,'x','color','k','linewidth',2)
plot(file6.result.timing*Ts1,file6.result.Fz_points,'x','color','k','linewidth',2)
plot(file7.result.timing*Ts1,file7.result.Fz_points,'x','color','k','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')
% 
% figure()
% title('Torques [Nm]')
% subplot(3,1,1)
% hold on;grid on;
% plot(file1.result.time,file1.result.Mx,'linewidth',2)
% plot(file2.result.time,file2.result.Mx,'linewidth',2)
% plot(file3.result.time,file3.result.Mx,'linewidth',2)
% plot(file4.result.time,file4.result.Mx,'linewidth',2)
% plot(file5.result.time,file5.result.Mx,'linewidth',2)
% plot(file6.result.time,file6.result.Mx,'linewidth',2)
% plot(file7.result.time,file7.result.Mx,'linewidth',2)
% plot(file1.result.timing*Ts1,file1.result.Mx_points,'x','color','b','linewidth',2)
% plot(file2.result.timing*Ts1,file2.result.Mx_points,'x','color','k','linewidth',2)
% plot(file3.result.timing*Ts1,file3.result.Mx_points,'x','color','k','linewidth',2)
% plot(file4.result.timing*Ts1,file4.result.Mx_points,'x','color','k','linewidth',2)
% plot(file5.result.timing*Ts1,file5.result.Mx_points,'x','color','k','linewidth',2)
% plot(file6.result.timing*Ts1,file6.result.Mx_points,'x','color','k','linewidth',2)
% plot(file7.result.timing*Ts1,file7.result.Mx_points,'x','color','k','linewidth',2)
% ylabel('M_x [N\cdot m]')
% ylim([-0.2, 0.2])
% subplot(3,1,2)
% hold on;grid on;
% plot(file1.result.time,file1.result.My,'linewidth',2)
% plot(file2.result.time,file2.result.My,'linewidth',2)
% plot(file3.result.time,file3.result.My,'linewidth',2)
% plot(file4.result.time,file4.result.My,'linewidth',2)
% plot(file5.result.time,file5.result.My,'linewidth',2)
% plot(file6.result.time,file6.result.My,'linewidth',2)
% plot(file7.result.time,file7.result.My,'linewidth',2)
% plot(file1.result.timing*Ts1,file1.result.My_points,'x','color','b','linewidth',2)
% plot(file2.result.timing*Ts1,file2.result.My_points,'x','color','k','linewidth',2)
% plot(file3.result.timing*Ts1,file3.result.My_points,'x','color','k','linewidth',2)
% plot(file4.result.timing*Ts1,file4.result.My_points,'x','color','k','linewidth',2)
% plot(file5.result.timing*Ts1,file5.result.My_points,'x','color','k','linewidth',2)
% plot(file6.result.timing*Ts1,file6.result.My_points,'x','color','k','linewidth',2)
% plot(file7.result.timing*Ts1,file7.result.My_points,'x','color','k','linewidth',2)
% ylabel('M_y [N\cdot m]')
% ylim([-0.2, 0.2])
% subplot(3,1,3)
% hold on;grid on;
% plot(file1.result.time,file1.result.Mz,'linewidth',2)
% plot(file2.result.time,file2.result.Mz,'linewidth',2)
% plot(file3.result.time,file3.result.Mz,'linewidth',2)
% plot(file4.result.time,file4.result.Mz,'linewidth',2)
% plot(file5.result.time,file5.result.Mz,'linewidth',2)
% plot(file6.result.time,file6.result.Mz,'linewidth',2)
% plot(file7.result.time,file7.result.Mz,'linewidth',2)
% plot(file1.result.timing*Ts1,file1.result.Mz_points,'x','color','b','linewidth',2)
% plot(file2.result.timing*Ts1,file2.result.Mz_points,'x','color','k','linewidth',2)
% plot(file3.result.timing*Ts1,file3.result.Mz_points,'x','color','k','linewidth',2)
% plot(file4.result.timing*Ts1,file4.result.Mz_points,'x','color','k','linewidth',2)
% plot(file5.result.timing*Ts1,file5.result.Mz_points,'x','color','k','linewidth',2)
% plot(file6.result.timing*Ts1,file6.result.Mz_points,'x','color','k','linewidth',2)
% plot(file7.result.timing*Ts1,file7.result.Mz_points,'x','color','k','linewidth',2)
% ylabel('M_z [N\cdot m]')
% ylim([-0.2, 0.2])
