clear variables
close all

%%%% This script compares two .mat files obtained from average_equal.m or
%%%% average_equal_4files.m

ft_path1_10  = '../LogFiles/20231017/FT/';
ft_path2_10  = '../LogFiles/20231018/FT/';
ft_path3_10  = '../LogFiles/20231018/FT/';
ft_path4_10  = '../LogFiles/20231018/FT/';
ft_path5_10  = '../LogFiles/20231018/FT/';
ft_path6_10  = '../LogFiles/20231018/FT/';
ft_path7_10  = '../LogFiles/20231018/FT/';
ft_path8_10  = '../LogFiles/20231018/FT/';


file1_10 = 'log_20231017_10inch_Rinf_avg.mat';
file2_10 = 'log_20231017_10inch_R1_avgAll.mat';
file3_10 = 'log_20231018_10inch_R125_avgAll.mat';
file4_10 = 'log_20231018_10inch_R15_avgAll.mat';
file5_10 = 'log_20231018_10inch_R175_avgAll.mat';
file6_10 = 'log_20231018_10inch_R2_avgAll.mat';
file7_10 = 'log_20231018_10inch_R25_avgAll.mat';
file8_10 = 'log_20231018_10inch_R3_avgAll.mat';



Ts1 = 1/150;

filepath1_10 = strcat(ft_path1_10,file1_10);
filepath2_10 = strcat(ft_path2_10,file2_10);
filepath3_10 = strcat(ft_path3_10,file3_10);
filepath4_10 = strcat(ft_path4_10,file4_10);
filepath5_10 = strcat(ft_path5_10,file5_10);
filepath6_10 = strcat(ft_path6_10,file6_10);
filepath7_10 = strcat(ft_path7_10,file7_10);
filepath8_10 = strcat(ft_path8_10,file8_10);

file1_10 = load(filepath1_10);
file2_10 = load(filepath2_10);
file3_10 = load(filepath3_10);
file4_10 = load(filepath4_10);
file5_10 = load(filepath5_10);
file6_10 = load(filepath6_10);
file7_10 = load(filepath7_10);
file8_10 = load(filepath8_10);

ft_path1_12  = '../LogFiles/20231019/FT/';
ft_path2_12  = '../LogFiles/20231019/FT/';
ft_path3_12  = '../LogFiles/20231019/FT/';
ft_path4_12  = '../LogFiles/20231019/FT/';
ft_path5_12  = '../LogFiles/20231019/FT/';
ft_path6_12  = '../LogFiles/20231019/FT/';
ft_path7_12  = '../LogFiles/20231019/FT/';
ft_path8_12  = '../LogFiles/20231019/FT/';

file1_12  = 'log_20231019_12inch_Rinf_avgAll.mat';
file2_12  = 'log_20231019_12inch_R1_avgAll.mat';
file3_12  = 'log_20231019_12inch_R125_avgAll.mat';
file4_12  = 'log_20231019_12inch_R15_avgAll.mat';
file5_12  = 'log_20231019_12inch_R175_avgAll.mat';
file6_12  = 'log_20231019_12inch_R2_avgAll.mat';
file7_12  = 'log_20231019_12inch_R25_avgAll.mat';
file8_12  = 'log_20231019_12inch_R3_avgAll.mat';

filepath1_12 = strcat(ft_path1_12,file1_12);
filepath2_12 = strcat(ft_path2_12,file2_12);
filepath3_12 = strcat(ft_path3_12,file3_12);
filepath4_12 = strcat(ft_path4_12,file4_12);
filepath5_12 = strcat(ft_path5_12,file5_12);
filepath6_12 = strcat(ft_path6_12,file6_12);
filepath7_12 = strcat(ft_path7_12,file7_12);
filepath8_12 = strcat(ft_path8_12,file8_12);

file1_12 = load(filepath1_12);
file2_12 = load(filepath2_12);
file3_12 = load(filepath3_12);
file4_12 = load(filepath4_12);
file5_12 = load(filepath5_12);
file6_12 = load(filepath6_12);
file7_12 = load(filepath7_12);
file8_12 = load(filepath8_12);

fxlim = 0.65;
fylim = 0.65;
mxlim = 0.1;
mylim = 0.1;
point_to_see = 13;
distances_vec = [10,1,1.25,1.5,1.75,2,2.5,3];
steps_per_stair = 6;




figure()
title('Raw data')
subplot(3,1,1)
hold on;grid on;
plot(distances_vec(1),file1_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(2),file2_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8_10.result.Fx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(1),file1_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(3),file3_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(4),file4_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(5),file5_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(6),file6_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(7),file7_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(8),file8_12.result.Fx_points(point_to_see),'x','color','b','linewidth',2)
% ylim([-1*fxlim fxlim])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),file1_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(2),file2_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8_10.result.Fy_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(1),file1_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(3),file3_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(4),file4_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(5),file5_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(6),file6_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(7),file7_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(8),file8_12.result.Fy_points(point_to_see),'x','color','b','linewidth',2)
% ylim([-1*fylim fylim])
ylabel('F_y [N]')
legend('File1','File2')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),file1_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(2),file2_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8_10.result.Fz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(1),file1_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(3),file3_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(4),file4_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(5),file5_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(6),file6_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(7),file7_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(8),file8_12.result.Fz_points(point_to_see),'x','color','b','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
hold on;grid on;
plot(distances_vec(1),file1_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(2),file2_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8_10.result.Mx_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(1),file1_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(3),file3_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(4),file4_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(5),file5_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(6),file6_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(7),file7_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(8),file8_12.result.Mx_points(point_to_see),'x','color','b','linewidth',2)
ylabel('M_x [N\cdot m]')
% ylim([-1*mxlim mxlim])
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),file1_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(2),file2_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8_10.result.My_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(1),file1_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(3),file3_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(4),file4_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(5),file5_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(6),file6_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(7),file7_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(8),file8_12.result.My_points(point_to_see),'x','color','b','linewidth',2)
ylabel('M_y [N\cdot m]')
% ylim([-1*mylim mylim])
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),file1_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(2),file2_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(3),file3_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(4),file4_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(5),file5_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(6),file6_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(7),file7_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(8),file8_10.result.Mz_points(point_to_see),'x','color','k','linewidth',2)
plot(distances_vec(1),file1_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(2),file2_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(3),file3_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(4),file4_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(5),file5_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(6),file6_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(7),file7_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
plot(distances_vec(8),file8_12.result.Mz_points(point_to_see),'x','color','b','linewidth',2)
ylabel('M_z [N\cdot m]')
% ylim([-1*mylim mylim])


%  We may also want to see what the average between the two stairs are
Fx_points1_10 = mean([file1_10.result.Fx_points(point_to_see),file1_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points2_10 = mean([file2_10.result.Fx_points(point_to_see),file2_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points3_10 = mean([file3_10.result.Fx_points(point_to_see),file3_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points4_10 = mean([file4_10.result.Fx_points(point_to_see),file4_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points5_10 = mean([file5_10.result.Fx_points(point_to_see),file5_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points6_10 = mean([file6_10.result.Fx_points(point_to_see),file6_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points7_10 = mean([file7_10.result.Fx_points(point_to_see),file7_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points8_10 = mean([file8_10.result.Fx_points(point_to_see),file8_10.result.Fx_points(point_to_see-steps_per_stair)]);
Fy_points1_10 = mean([file1_10.result.Fy_points(point_to_see),file1_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points2_10 = mean([file2_10.result.Fy_points(point_to_see),file2_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points3_10 = mean([file3_10.result.Fy_points(point_to_see),file3_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points4_10 = mean([file4_10.result.Fy_points(point_to_see),file4_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points5_10 = mean([file5_10.result.Fy_points(point_to_see),file5_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points6_10 = mean([file6_10.result.Fy_points(point_to_see),file6_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points7_10 = mean([file7_10.result.Fy_points(point_to_see),file7_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points8_10 = mean([file8_10.result.Fy_points(point_to_see),file8_10.result.Fy_points(point_to_see-steps_per_stair)]);
Fz_points1_10 = mean([file1_10.result.Fz_points(point_to_see),file1_10.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points2_10 = mean([file2_10.result.Fz_points(point_to_see),file2_10.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points3_10 = mean([file3_10.result.Fz_points(point_to_see),file3_10.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points4_10 = mean([file4_10.result.Fz_points(point_to_see),file4_10.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points5_10 = mean([file5_10.result.Fz_points(point_to_see),file5_10.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points6_10 = mean([file6_10.result.Fz_points(point_to_see),file6_10.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points7_10 = mean([file7_10.result.Fz_points(point_to_see),file7_10.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points8_10 = mean([file8_10.result.Fz_points(point_to_see),file8_10.result.Fz_points(point_to_see-steps_per_stair)]);
Mx_points1_10 = mean([file1_10.result.Mx_points(point_to_see),file1_10.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points2_10 = mean([file2_10.result.Mx_points(point_to_see),file2_10.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points3_10 = mean([file3_10.result.Mx_points(point_to_see),file3_10.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points4_10 = mean([file4_10.result.Mx_points(point_to_see),file4_10.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points5_10 = mean([file5_10.result.Mx_points(point_to_see),file5_10.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points6_10 = mean([file6_10.result.Mx_points(point_to_see),file6_10.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points7_10 = mean([file7_10.result.Mx_points(point_to_see),file7_10.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points8_10 = mean([file8_10.result.Mx_points(point_to_see),file8_10.result.Mx_points(point_to_see-steps_per_stair)]);
My_points1_10 = mean([file1_10.result.My_points(point_to_see),file1_10.result.My_points(point_to_see-steps_per_stair)]);
My_points2_10 = mean([file2_10.result.My_points(point_to_see),file2_10.result.My_points(point_to_see-steps_per_stair)]);
My_points3_10 = mean([file3_10.result.My_points(point_to_see),file3_10.result.My_points(point_to_see-steps_per_stair)]);
My_points4_10 = mean([file4_10.result.My_points(point_to_see),file4_10.result.My_points(point_to_see-steps_per_stair)]);
My_points5_10 = mean([file5_10.result.My_points(point_to_see),file5_10.result.My_points(point_to_see-steps_per_stair)]);
My_points6_10 = mean([file6_10.result.My_points(point_to_see),file6_10.result.My_points(point_to_see-steps_per_stair)]);
My_points7_10 = mean([file7_10.result.My_points(point_to_see),file7_10.result.My_points(point_to_see-steps_per_stair)]);
My_points8_10 = mean([file8_10.result.My_points(point_to_see),file8_10.result.My_points(point_to_see-steps_per_stair)]);
Mz_points1_10 = mean([file1_10.result.Mz_points(point_to_see),file1_10.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points2_10 = mean([file2_10.result.Mz_points(point_to_see),file2_10.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points3_10 = mean([file3_10.result.Mz_points(point_to_see),file3_10.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points4_10 = mean([file4_10.result.Mz_points(point_to_see),file4_10.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points5_10 = mean([file5_10.result.Mz_points(point_to_see),file5_10.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points6_10 = mean([file6_10.result.Mz_points(point_to_see),file6_10.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points7_10 = mean([file7_10.result.Mz_points(point_to_see),file7_10.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points8_10 = mean([file8_10.result.Mz_points(point_to_see),file8_10.result.Mz_points(point_to_see-steps_per_stair)]);


Fx_points1_12 = mean([file1_12.result.Fx_points(point_to_see),file1_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points2_12 = mean([file2_12.result.Fx_points(point_to_see),file2_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points3_12 = mean([file3_12.result.Fx_points(point_to_see),file3_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points4_12 = mean([file4_12.result.Fx_points(point_to_see),file4_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points5_12 = mean([file5_12.result.Fx_points(point_to_see),file5_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points6_12 = mean([file6_12.result.Fx_points(point_to_see),file6_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points7_12 = mean([file7_12.result.Fx_points(point_to_see),file7_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fx_points8_12 = mean([file8_12.result.Fx_points(point_to_see),file8_12.result.Fx_points(point_to_see-steps_per_stair)]);
Fy_points1_12 = mean([file1_12.result.Fy_points(point_to_see),file1_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points2_12 = mean([file2_12.result.Fy_points(point_to_see),file2_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points3_12 = mean([file3_12.result.Fy_points(point_to_see),file3_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points4_12 = mean([file4_12.result.Fy_points(point_to_see),file4_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points5_12 = mean([file5_12.result.Fy_points(point_to_see),file5_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points6_12 = mean([file6_12.result.Fy_points(point_to_see),file6_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points7_12 = mean([file7_12.result.Fy_points(point_to_see),file7_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fy_points8_12 = mean([file8_12.result.Fy_points(point_to_see),file8_12.result.Fy_points(point_to_see-steps_per_stair)]);
Fz_points1_12 = mean([file1_12.result.Fz_points(point_to_see),file1_12.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points2_12 = mean([file2_12.result.Fz_points(point_to_see),file2_12.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points3_12 = mean([file3_12.result.Fz_points(point_to_see),file3_12.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points4_12 = mean([file4_12.result.Fz_points(point_to_see),file4_12.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points5_12 = mean([file5_12.result.Fz_points(point_to_see),file5_12.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points6_12 = mean([file6_12.result.Fz_points(point_to_see),file6_12.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points7_12 = mean([file7_12.result.Fz_points(point_to_see),file7_12.result.Fz_points(point_to_see-steps_per_stair)]);
Fz_points8_12 = mean([file8_12.result.Fz_points(point_to_see),file8_12.result.Fz_points(point_to_see-steps_per_stair)]);
Mx_points1_12 = mean([file1_12.result.Mx_points(point_to_see),file1_12.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points2_12 = mean([file2_12.result.Mx_points(point_to_see),file2_12.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points3_12 = mean([file3_12.result.Mx_points(point_to_see),file3_12.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points4_12 = mean([file4_12.result.Mx_points(point_to_see),file4_12.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points5_12 = mean([file5_12.result.Mx_points(point_to_see),file5_12.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points6_12 = mean([file6_12.result.Mx_points(point_to_see),file6_12.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points7_12 = mean([file7_12.result.Mx_points(point_to_see),file7_12.result.Mx_points(point_to_see-steps_per_stair)]);
Mx_points8_12 = mean([file8_12.result.Mx_points(point_to_see),file8_12.result.Mx_points(point_to_see-steps_per_stair)]);
My_points1_12 = mean([file1_12.result.My_points(point_to_see),file1_12.result.My_points(point_to_see-steps_per_stair)]);
My_points2_12 = mean([file2_12.result.My_points(point_to_see),file2_12.result.My_points(point_to_see-steps_per_stair)]);
My_points3_12 = mean([file3_12.result.My_points(point_to_see),file3_12.result.My_points(point_to_see-steps_per_stair)]);
My_points4_12 = mean([file4_12.result.My_points(point_to_see),file4_12.result.My_points(point_to_see-steps_per_stair)]);
My_points5_12 = mean([file5_12.result.My_points(point_to_see),file5_12.result.My_points(point_to_see-steps_per_stair)]);
My_points6_12 = mean([file6_12.result.My_points(point_to_see),file6_12.result.My_points(point_to_see-steps_per_stair)]);
My_points7_12 = mean([file7_12.result.My_points(point_to_see),file7_12.result.My_points(point_to_see-steps_per_stair)]);
My_points8_12 = mean([file8_12.result.My_points(point_to_see),file8_12.result.My_points(point_to_see-steps_per_stair)]);
Mz_points1_12 = mean([file1_12.result.Mz_points(point_to_see),file1_12.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points2_12 = mean([file2_12.result.Mz_points(point_to_see),file2_12.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points3_12 = mean([file3_12.result.Mz_points(point_to_see),file3_12.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points4_12 = mean([file4_12.result.Mz_points(point_to_see),file4_12.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points5_12 = mean([file5_12.result.Mz_points(point_to_see),file5_12.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points6_12 = mean([file6_12.result.Mz_points(point_to_see),file6_12.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points7_12 = mean([file7_12.result.Mz_points(point_to_see),file7_12.result.Mz_points(point_to_see-steps_per_stair)]);
Mz_points8_12 = mean([file8_12.result.Mz_points(point_to_see),file8_12.result.Mz_points(point_to_see-steps_per_stair)]);


figure()
subplot(3,1,1)
hold on;grid on;
title('Average of two stairs')
plot(distances_vec(1),Fx_points1_10,'x','color','k','linewidth',2)
plot(distances_vec(2),Fx_points2_10,'x','color','k','linewidth',2)
plot(distances_vec(3),Fx_points3_10,'x','color','k','linewidth',2)
plot(distances_vec(4),Fx_points4_10,'x','color','k','linewidth',2)
plot(distances_vec(5),Fx_points5_10,'x','color','k','linewidth',2)
plot(distances_vec(6),Fx_points6_10,'x','color','k','linewidth',2)
plot(distances_vec(7),Fx_points7_10,'x','color','k','linewidth',2)
plot(distances_vec(8),Fx_points8_10,'x','color','k','linewidth',2)
plot(distances_vec(1),Fx_points1_12,'x','color','b','linewidth',2)
plot(distances_vec(2),Fx_points2_12,'x','color','b','linewidth',2)
plot(distances_vec(3),Fx_points3_12,'x','color','b','linewidth',2)
plot(distances_vec(4),Fx_points4_12,'x','color','b','linewidth',2)
plot(distances_vec(5),Fx_points5_12,'x','color','b','linewidth',2)
plot(distances_vec(6),Fx_points6_12,'x','color','b','linewidth',2)
plot(distances_vec(7),Fx_points7_12,'x','color','b','linewidth',2)
plot(distances_vec(8),Fx_points8_12,'x','color','b','linewidth',2)
% ylim([-1*fxlim fxlim])
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_10,'x','color','k','linewidth',2)
plot(distances_vec(2),Fy_points2_10,'x','color','k','linewidth',2)
plot(distances_vec(3),Fy_points3_10,'x','color','k','linewidth',2)
plot(distances_vec(4),Fy_points4_10,'x','color','k','linewidth',2)
plot(distances_vec(5),Fy_points5_10,'x','color','k','linewidth',2)
plot(distances_vec(6),Fy_points6_10,'x','color','k','linewidth',2)
plot(distances_vec(7),Fy_points7_10,'x','color','k','linewidth',2)
plot(distances_vec(8),Fy_points8_10,'x','color','k','linewidth',2)
plot(distances_vec(1),Fy_points1_12,'x','color','b','linewidth',2)
plot(distances_vec(2),Fy_points2_12,'x','color','b','linewidth',2)
plot(distances_vec(3),Fy_points3_12,'x','color','b','linewidth',2)
plot(distances_vec(4),Fy_points4_12,'x','color','b','linewidth',2)
plot(distances_vec(5),Fy_points5_12,'x','color','b','linewidth',2)
plot(distances_vec(6),Fy_points6_12,'x','color','b','linewidth',2)
plot(distances_vec(7),Fy_points7_12,'x','color','b','linewidth',2)
plot(distances_vec(8),Fy_points8_12,'x','color','b','linewidth',2)
% ylim([-1*fylim fylim])
ylabel('F_y [N]')
legend('File1','File2')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Fz_points1_10,'x','color','k','linewidth',2)
plot(distances_vec(2),Fz_points2_10,'x','color','k','linewidth',2)
plot(distances_vec(3),Fz_points3_10,'x','color','k','linewidth',2)
plot(distances_vec(4),Fz_points4_10,'x','color','k','linewidth',2)
plot(distances_vec(5),Fz_points5_10,'x','color','k','linewidth',2)
plot(distances_vec(6),Fz_points6_10,'x','color','k','linewidth',2)
plot(distances_vec(7),Fz_points7_10,'x','color','k','linewidth',2)
plot(distances_vec(8),Fz_points8_10,'x','color','k','linewidth',2)
plot(distances_vec(1),Fz_points1_12,'x','color','b','linewidth',2)
plot(distances_vec(2),Fz_points2_12,'x','color','b','linewidth',2)
plot(distances_vec(3),Fz_points3_12,'x','color','b','linewidth',2)
plot(distances_vec(4),Fz_points4_12,'x','color','b','linewidth',2)
plot(distances_vec(5),Fz_points5_12,'x','color','b','linewidth',2)
plot(distances_vec(6),Fz_points6_12,'x','color','b','linewidth',2)
plot(distances_vec(7),Fz_points7_12,'x','color','b','linewidth',2)
plot(distances_vec(8),Fz_points8_12,'x','color','b','linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
hold on;grid on;
title('Average of two stairs')
plot(distances_vec(1),Mx_points1_10,'x','color','k','linewidth',2)
plot(distances_vec(2),Mx_points2_10,'x','color','k','linewidth',2)
plot(distances_vec(3),Mx_points3_10,'x','color','k','linewidth',2)
plot(distances_vec(4),Mx_points4_10,'x','color','k','linewidth',2)
plot(distances_vec(5),Mx_points5_10,'x','color','k','linewidth',2)
plot(distances_vec(6),Mx_points6_10,'x','color','k','linewidth',2)
plot(distances_vec(7),Mx_points7_10,'x','color','k','linewidth',2)
plot(distances_vec(8),Mx_points8_10,'x','color','k','linewidth',2)
plot(distances_vec(1),Mx_points1_12,'x','color','b','linewidth',2)
plot(distances_vec(2),Mx_points2_12,'x','color','b','linewidth',2)
plot(distances_vec(3),Mx_points3_12,'x','color','b','linewidth',2)
plot(distances_vec(4),Mx_points4_12,'x','color','b','linewidth',2)
plot(distances_vec(5),Mx_points5_12,'x','color','b','linewidth',2)
plot(distances_vec(6),Mx_points6_12,'x','color','b','linewidth',2)
plot(distances_vec(7),Mx_points7_12,'x','color','b','linewidth',2)
plot(distances_vec(8),Mx_points8_12,'x','color','b','linewidth',2)
ylabel('M_x [N\cdot m]')
% ylim([-1*mxlim mxlim])
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),My_points1_10,'x','color','k','linewidth',2)
plot(distances_vec(2),My_points2_10,'x','color','k','linewidth',2)
plot(distances_vec(3),My_points3_10,'x','color','k','linewidth',2)
plot(distances_vec(4),My_points4_10,'x','color','k','linewidth',2)
plot(distances_vec(5),My_points5_10,'x','color','k','linewidth',2)
plot(distances_vec(6),My_points6_10,'x','color','k','linewidth',2)
plot(distances_vec(7),My_points7_10,'x','color','k','linewidth',2)
plot(distances_vec(8),My_points8_10,'x','color','k','linewidth',2)
plot(distances_vec(1),My_points1_12,'x','color','b','linewidth',2)
plot(distances_vec(2),My_points2_12,'x','color','b','linewidth',2)
plot(distances_vec(3),My_points3_12,'x','color','b','linewidth',2)
plot(distances_vec(4),My_points4_12,'x','color','b','linewidth',2)
plot(distances_vec(5),My_points5_12,'x','color','b','linewidth',2)
plot(distances_vec(6),My_points6_12,'x','color','b','linewidth',2)
plot(distances_vec(7),My_points7_12,'x','color','b','linewidth',2)
plot(distances_vec(8),My_points8_12,'x','color','b','linewidth',2)
ylabel('M_y [N\cdot m]')
% ylim([-1*mylim mylim])
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Mz_points1_10,'x','color','k','linewidth',2)
plot(distances_vec(2),Mz_points2_10,'x','color','k','linewidth',2)
plot(distances_vec(3),Mz_points3_10,'x','color','k','linewidth',2)
plot(distances_vec(4),Mz_points4_10,'x','color','k','linewidth',2)
plot(distances_vec(5),Mz_points5_10,'x','color','k','linewidth',2)
plot(distances_vec(6),Mz_points6_10,'x','color','k','linewidth',2)
plot(distances_vec(7),Mz_points7_10,'x','color','k','linewidth',2)
plot(distances_vec(8),Mz_points8_10,'x','color','k','linewidth',2)
plot(distances_vec(1),Mz_points1_12,'x','color','b','linewidth',2)
plot(distances_vec(2),Mz_points2_12,'x','color','b','linewidth',2)
plot(distances_vec(3),Mz_points3_12,'x','color','b','linewidth',2)
plot(distances_vec(4),Mz_points4_12,'x','color','b','linewidth',2)
plot(distances_vec(5),Mz_points5_12,'x','color','b','linewidth',2)
plot(distances_vec(6),Mz_points6_12,'x','color','b','linewidth',2)
plot(distances_vec(7),Mz_points7_12,'x','color','b','linewidth',2)
plot(distances_vec(8),Mz_points8_12,'x','color','b','linewidth',2)
ylabel('M_z [N\cdot m]')
% ylim([-1*mylim mylim])
