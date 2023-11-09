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
ft_path8  = '../LogFiles/20231018/FT/';

ft_path1  = '../LogFiles/20231019/FT/';
ft_path2  = '../LogFiles/20231019/FT/';
ft_path3  = '../LogFiles/20231019/FT/';
ft_path4  = '../LogFiles/20231019/FT/';
ft_path5  = '../LogFiles/20231019/FT/';
ft_path6  = '../LogFiles/20231019/FT/';
ft_path7  = '../LogFiles/20231019/FT/';
ft_path8  = '../LogFiles/20231019/FT/';

file1 = 'log_20231017_10inch_Rinf_avg.mat';
file2 = 'log_20231017_10inch_R1_avgAll.mat';
file3 = 'log_20231018_10inch_R125_avgAll.mat';
file4 = 'log_20231018_10inch_R15_avgAll.mat';
file5 = 'log_20231018_10inch_R175_avgAll.mat';
file6 = 'log_20231018_10inch_R2_avgAll.mat';
file7 = 'log_20231018_10inch_R25_avgAll.mat';
file8 = 'log_20231018_10inch_R3_avgAll.mat';

file1 = 'log_20231019_12inch_Rinf_avgAll.mat';
file2 = 'log_20231019_12inch_R1_avgAll.mat';
file3 = 'log_20231019_12inch_R125_avgAll.mat';
file4 = 'log_20231019_12inch_R15_avgAll.mat';
file5 = 'log_20231019_12inch_R175_avgAll.mat';
file6 = 'log_20231019_12inch_R2_avgAll.mat';
file7 = 'log_20231019_12inch_R25_avgAll.mat';
file8 = 'log_20231019_12inch_R3_avgAll.mat';

Ts1 = 1/150;

filepath1 = strcat(ft_path1,file1);
filepath2 = strcat(ft_path2,file2);
filepath3 = strcat(ft_path3,file3);
filepath4 = strcat(ft_path4,file4);
filepath5 = strcat(ft_path5,file5);
filepath6 = strcat(ft_path6,file6);
filepath7 = strcat(ft_path7,file7);
filepath8 = strcat(ft_path8,file8);

file1 = load(filepath1);
file2 = load(filepath2);
file3 = load(filepath3);
file4 = load(filepath4);
file5 = load(filepath5);
file6 = load(filepath6);
file7 = load(filepath7);
file8 = load(filepath8);

fxlim = 0.65;
fylim = 0.65;
mxlim = 0.1;
mylim = 0.1;
point_to_see = 13;
distances_vec = [10,1,1.25,1.5,1.75,2,2.5,3];
steps_per_stair = 6;

% figure()
% title('Raw data')
% subplot(3,1,1)
% hold on;grid on;
% plot(file1.result.time,file1.result.Fx,'linewidth',2)
% plot(file2.result.time,file2.result.Fx,'linewidth',2)
% plot(file3.result.time,file3.result.Fx,'linewidth',2)
% plot(file4.result.time,file4.result.Fx,'linewidth',2)
% plot(file5.result.time,file5.result.Fx,'linewidth',2)
% plot(file6.result.time,file6.result.Fx,'linewidth',2)
% plot(file7.result.time,file7.result.Fx,'linewidth',2)
% plot(file8.result.time,file8.result.Fx,'linewidth',2)
% ylim([-1, 1])
% ylabel('F_x [N]')
% subplot(3,1,2)
% hold on;grid on;
% plot(file1.result.time,file1.result.Fy,'linewidth',2)
% plot(file2.result.time,file2.result.Fy,'linewidth',2)
% plot(file3.result.time,file3.result.Fy,'linewidth',2)
% plot(file4.result.time,file4.result.Fy,'linewidth',2)
% plot(file5.result.time,file5.result.Fy,'linewidth',2)
% plot(file6.result.time,file6.result.Fy,'linewidth',2)
% plot(file7.result.time,file7.result.Fy,'linewidth',2)
% plot(file8.result.time,file8.result.Fy,'linewidth',2)
% ylim([-1, 1])
% ylabel('F_y [N]')
% legend('File1','File2')
% subplot(3,1,3)
% hold on;grid on;
% plot(file1.result.time,file1.result.Fz,'linewidth',2)
% plot(file2.result.time,file2.result.Fz,'linewidth',2)
% plot(file3.result.time,file3.result.Fz,'linewidth',2)
% plot(file4.result.time,file4.result.Fz,'linewidth',2)
% plot(file5.result.time,file5.result.Fz,'linewidth',2)
% plot(file6.result.time,file6.result.Fz,'linewidth',2)
% plot(file7.result.time,file7.result.Fz,'linewidth',2)
% plot(file8.result.time,file8.result.Fz,'linewidth',2)
% ylabel('F_z [N]')
% xlabel('Time [s]')
% 
% 
% figure()
% subplot(3,1,1)
% hold on;grid on;
% title("Raw data")
% plot(file1.result.time,file1.result.Mx,'linewidth',2)
% plot(file2.result.time,file2.result.Mx,'linewidth',2)
% plot(file3.result.time,file3.result.Mx,'linewidth',2)
% plot(file4.result.time,file4.result.Mx,'linewidth',2)
% plot(file5.result.time,file5.result.Mx,'linewidth',2)
% plot(file6.result.time,file6.result.Mx,'linewidth',2)
% plot(file7.result.time,file7.result.Mx,'linewidth',2)
% plot(file8.result.time,file8.result.Mx,'linewidth',2)
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
% plot(file8.result.time,file8.result.My,'linewidth',2)
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
% plot(file8.result.time,file8.result.Mz,'linewidth',2)
% ylabel('M_z [N\cdot m]')
% ylim([-0.2, 0.2])


figure()
title('Raw data')
subplot(3,1,1)
hold on;grid on;
plot(distances_vec(1),file1.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
ylim([-1*fxlim fxlim])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),file1.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
legend('File1','File2')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),file1.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
hold on;grid on;
plot(distances_vec(1),file1.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-1*mxlim mxlim])
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),file1.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8.result.My_points(point_to_see),'x','color','k','linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-1*mylim mylim])
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),file1.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
ylabel('M_z [N\cdot m]')
ylim([-1*mylim mylim])

% 
% figure()
% title('Forces [N]')
% subplot(3,1,1)
% hold on;grid on;
% plot(file1.result.time,file1.result.Fx,'linewidth',2)
% plot(file2.result.time,file2.result.Fx,'linewidth',2)
% plot(file3.result.time,file3.result.Fx,'linewidth',2)
% plot(file4.result.time,file4.result.Fx,'linewidth',2)
% plot(file5.result.time,file5.result.Fx,'linewidth',2)
% plot(file6.result.time,file6.result.Fx,'linewidth',2)
% plot(file7.result.time,file7.result.Fx,'linewidth',2)
% plot(file8.result.time,file8.result.Fx,'linewidth',2)
% plot(file1.result.timing*Ts1,file1.result.Fx_points,'x','color','b','linewidth',2)
% plot(file2.result.timing*Ts1,file2.result.Fx_points,'x','color','k','linewidth',2)
% plot(file3.result.timing*Ts1,file3.result.Fx_points,'x','color','k','linewidth',2)
% plot(file4.result.timing*Ts1,file4.result.Fx_points,'x','color','k','linewidth',2)
% plot(file5.result.timing*Ts1,file5.result.Fx_points,'x','color','k','linewidth',2)
% plot(file6.result.timing*Ts1,file6.result.Fx_points,'x','color','k','linewidth',2)
% plot(file7.result.timing*Ts1,file7.result.Fx_points,'x','color','k','linewidth',2)
% plot(file8.result.timing*Ts1,file8.result.Fx_points,'x','color','k','linewidth',2)
% ylim([-1, 1])
% ylabel('F_x [N]')
% subplot(3,1,2)
% hold on;grid on;
% plot(file1.result.time,file1.result.Fy,'linewidth',2)
% plot(file2.result.time,file2.result.Fy,'linewidth',2)
% plot(file3.result.time,file3.result.Fy,'linewidth',2)
% plot(file4.result.time,file4.result.Fy,'linewidth',2)
% plot(file5.result.time,file5.result.Fy,'linewidth',2)
% plot(file6.result.time,file6.result.Fy,'linewidth',2)
% plot(file7.result.time,file7.result.Fy,'linewidth',2)
% plot(file8.result.time,file8.result.Fy,'linewidth',2)
% plot(file1.result.timing*Ts1,file1.result.Fy_points,'x','color','b','linewidth',2)
% plot(file2.result.timing*Ts1,file2.result.Fy_points,'x','color','k','linewidth',2)
% plot(file3.result.timing*Ts1,file3.result.Fy_points,'x','color','k','linewidth',2)
% plot(file4.result.timing*Ts1,file4.result.Fy_points,'x','color','k','linewidth',2)
% plot(file5.result.timing*Ts1,file5.result.Fy_points,'x','color','k','linewidth',2)
% plot(file6.result.timing*Ts1,file6.result.Fy_points,'x','color','k','linewidth',2)
% plot(file7.result.timing*Ts1,file7.result.Fy_points,'x','color','k','linewidth',2)
% plot(file8.result.timing*Ts1,file8.result.Fy_points,'x','color','k','linewidth',2)
% ylim([-1, 1])
% ylabel('F_y [N]')
% legend('Rinf','1R')
% subplot(3,1,3)
% hold on;grid on;
% plot(file1.result.time,file1.result.Fz,'linewidth',2)
% plot(file2.result.time,file2.result.Fz,'linewidth',2)
% plot(file3.result.time,file3.result.Fz,'linewidth',2)
% plot(file4.result.time,file4.result.Fz,'linewidth',2)
% plot(file5.result.time,file5.result.Fz,'linewidth',2)
% plot(file6.result.time,file6.result.Fz,'linewidth',2)
% plot(file7.result.time,file7.result.Fz,'linewidth',2)
% plot(file8.result.time,file8.result.Fz,'linewidth',2)
% plot(file1.result.timing*Ts1,file1.result.Fz_points,'x','color','b','linewidth',2)
% plot(file2.result.timing*Ts1,file2.result.Fz_points,'x','color','k','linewidth',2)
% plot(file3.result.timing*Ts1,file3.result.Fz_points,'x','color','k','linewidth',2)
% plot(file4.result.timing*Ts1,file4.result.Fz_points,'x','color','k','linewidth',2)
% plot(file5.result.timing*Ts1,file5.result.Fz_points,'x','color','k','linewidth',2)
% plot(file6.result.timing*Ts1,file6.result.Fz_points,'x','color','k','linewidth',2)
% plot(file7.result.timing*Ts1,file7.result.Fz_points,'x','color','k','linewidth',2)
% plot(file8.result.timing*Ts1,file8.result.Fz_points,'x','color','k','linewidth',2)
% ylabel('F_z [N]')
% xlabel('Time [s]')



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

%  We may also want to see what the average between the two stairs are
Fx_points1 = mean([file1.result.Fx_points(point_to_see),file1.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points2 = mean([file2.result.Fx_points(point_to_see),file2.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points3 = mean([file3.result.Fx_points(point_to_see),file3.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points4 = mean([file4.result.Fx_points(point_to_see),file4.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points5 = mean([file5.result.Fx_points(point_to_see),file5.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points6 = mean([file6.result.Fx_points(point_to_see),file6.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points7 = mean([file7.result.Fx_points(point_to_see),file7.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points8 = mean([file8.result.Fx_points(point_to_see),file8.result.Fx_points(point_to_see-steps_per_stair)]);

Fy_points1 = mean([file1.result.Fy_points(point_to_see),file1.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points2 = mean([file2.result.Fy_points(point_to_see),file2.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points3 = mean([file3.result.Fy_points(point_to_see),file3.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points4 = mean([file4.result.Fy_points(point_to_see),file4.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points5 = mean([file5.result.Fy_points(point_to_see),file5.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points6 = mean([file6.result.Fy_points(point_to_see),file6.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points7 = mean([file7.result.Fy_points(point_to_see),file7.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points8 = mean([file8.result.Fy_points(point_to_see),file8.result.Fy_points(point_to_see-steps_per_stair)]);

Fz_points1 = mean([file1.result.Fz_points(point_to_see),file1.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points2 = mean([file2.result.Fz_points(point_to_see),file2.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points3 = mean([file3.result.Fz_points(point_to_see),file3.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points4 = mean([file4.result.Fz_points(point_to_see),file4.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points5 = mean([file5.result.Fz_points(point_to_see),file5.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points6 = mean([file6.result.Fz_points(point_to_see),file6.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points7 = mean([file7.result.Fz_points(point_to_see),file7.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points8 = mean([file8.result.Fz_points(point_to_see),file8.result.Fz_points(point_to_see-steps_per_stair)]);

Mx_points1 = mean([file1.result.Mx_points(point_to_see),file1.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points2 = mean([file2.result.Mx_points(point_to_see),file2.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points3 = mean([file3.result.Mx_points(point_to_see),file3.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points4 = mean([file4.result.Mx_points(point_to_see),file4.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points5 = mean([file5.result.Mx_points(point_to_see),file5.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points6 = mean([file6.result.Mx_points(point_to_see),file6.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points7 = mean([file7.result.Mx_points(point_to_see),file7.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points8 = mean([file8.result.Mx_points(point_to_see),file8.result.Mx_points(point_to_see-steps_per_stair)]);

My_points1 = mean([file1.result.My_points(point_to_see),file1.result.My_points(point_to_see-steps_per_stair)]);
My_points2 = mean([file2.result.My_points(point_to_see),file2.result.My_points(point_to_see-steps_per_stair)]);
My_points3 = mean([file3.result.My_points(point_to_see),file3.result.My_points(point_to_see-steps_per_stair)]);
My_points4 = mean([file4.result.My_points(point_to_see),file4.result.My_points(point_to_see-steps_per_stair)]);
My_points5 = mean([file5.result.My_points(point_to_see),file5.result.My_points(point_to_see-steps_per_stair)]);
My_points6 = mean([file6.result.My_points(point_to_see),file6.result.My_points(point_to_see-steps_per_stair)]);
My_points7 = mean([file7.result.My_points(point_to_see),file7.result.My_points(point_to_see-steps_per_stair)]);
My_points8 = mean([file8.result.My_points(point_to_see),file8.result.My_points(point_to_see-steps_per_stair)]);

Mz_points1 = mean([file1.result.Mz_points(point_to_see),file1.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points2 = mean([file2.result.Mz_points(point_to_see),file2.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points3 = mean([file3.result.Mz_points(point_to_see),file3.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points4 = mean([file4.result.Mz_points(point_to_see),file4.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points5 = mean([file5.result.Mz_points(point_to_see),file5.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points6 = mean([file6.result.Mz_points(point_to_see),file6.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points7 = mean([file7.result.Mz_points(point_to_see),file7.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points8 = mean([file8.result.Mz_points(point_to_see),file8.result.Mz_points(point_to_see-steps_per_stair)]);


figure()
subplot(3,1,1)
hold on;grid on;
title('Average of two stairs')
plot(distances_vec(1),Fx_points1,'x','color','b','linewidth',2)
plot(distances_vec(2),Fx_points2,'x','color','k','linewidth',2)
plot(distances_vec(3),Fx_points3,'x','color','k','linewidth',2)
plot(distances_vec(4),Fx_points4,'x','color','k','linewidth',2)
plot(distances_vec(5),Fx_points5,'x','color','k','linewidth',2)
plot(distances_vec(6),Fx_points6,'x','color','k','linewidth',2)
plot(distances_vec(7),Fx_points7,'x','color','k','linewidth',2)
plot(distances_vec(8),Fx_points8,'x','color','k','linewidth',2)
ylim([-1*fxlim fxlim])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1,'x','color','b','linewidth',2)
plot(distances_vec(2),Fy_points2,'x','color','k','linewidth',2)
plot(distances_vec(3),Fy_points3,'x','color','k','linewidth',2)
plot(distances_vec(4),Fy_points4,'x','color','k','linewidth',2)
plot(distances_vec(5),Fy_points5,'x','color','k','linewidth',2)
plot(distances_vec(6),Fy_points6,'x','color','k','linewidth',2)
plot(distances_vec(7),Fy_points7,'x','color','k','linewidth',2)
plot(distances_vec(8),Fy_points8,'x','color','k','linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
legend('File1','File2')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Fz_points1,'x','color','b','linewidth',2)
plot(distances_vec(2),Fz_points2,'x','color','k','linewidth',2)
plot(distances_vec(3),Fz_points3,'x','color','k','linewidth',2)
plot(distances_vec(4),Fz_points4,'x','color','k','linewidth',2)
plot(distances_vec(5),Fz_points5,'x','color','k','linewidth',2)
plot(distances_vec(6),Fz_points6,'x','color','k','linewidth',2)
plot(distances_vec(7),Fz_points7,'x','color','k','linewidth',2)
plot(distances_vec(8),Fz_points8,'x','color','k','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
hold on;grid on;
title('Average of two stairs')
plot(distances_vec(1),Mx_points1,'x','color','b','linewidth',2)
plot(distances_vec(2),Mx_points2,'x','color','k','linewidth',2)
plot(distances_vec(3),Mx_points3,'x','color','k','linewidth',2)
plot(distances_vec(4),Mx_points4,'x','color','k','linewidth',2)
plot(distances_vec(5),Mx_points5,'x','color','k','linewidth',2)
plot(distances_vec(6),Mx_points6,'x','color','k','linewidth',2)
plot(distances_vec(7),Mx_points7,'x','color','k','linewidth',2)
plot(distances_vec(8),Mx_points8,'x','color','k','linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-1*mxlim mxlim])
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),My_points1,'x','color','b','linewidth',2)
plot(distances_vec(2),My_points2,'x','color','k','linewidth',2)
plot(distances_vec(3),My_points3,'x','color','k','linewidth',2)
plot(distances_vec(4),My_points4,'x','color','k','linewidth',2)
plot(distances_vec(5),My_points5,'x','color','k','linewidth',2)
plot(distances_vec(6),My_points6,'x','color','k','linewidth',2)
plot(distances_vec(7),My_points7,'x','color','k','linewidth',2)
plot(distances_vec(8),My_points8,'x','color','k','linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-1*mylim mylim])
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Mz_points1,'x','color','b','linewidth',2)
plot(distances_vec(2),Mz_points2,'x','color','k','linewidth',2)
plot(distances_vec(3),Mz_points3,'x','color','k','linewidth',2)
plot(distances_vec(4),Mz_points4,'x','color','k','linewidth',2)
plot(distances_vec(5),Mz_points5,'x','color','k','linewidth',2)
plot(distances_vec(6),Mz_points6,'x','color','k','linewidth',2)
plot(distances_vec(7),Mz_points7,'x','color','k','linewidth',2)
plot(distances_vec(8),Mz_points8,'x','color','k','linewidth',2)
ylabel('M_z [N\cdot m]')
ylim([-1*mylim mylim])
