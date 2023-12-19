clear variables
close all

%%%% This script compares two .mat files obtained from average_equal.m or
%%%% average_equal_4files.m
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');
set(groot,'defaultAxesTickLabelInterpreter','latex');

ft_path  = '../LogFiles/matfiles/avgAll/';

file1_10 = 'log_20231027_10inch_Rinf_avgAll.mat';
file2_10 = 'log_20231027_10inch_R1_avgAll.mat';
file3_10 = 'log_20231027_10inch_R125_avgAll.mat';
file4_10 = 'log_20231018_10inch_R15_avgAll.mat';
file5_10 = 'log_20231018_10inch_R175_avgAll.mat';
file6_10 = 'log_20231018_10inch_R2_avgAll.mat';
file7_10 = 'log_20231027_10inch_R25_avgAll.mat';
file8_10 = 'log_20231018_10inch_R3_avgAll.mat';

file1_12  = 'log_20231019_12inch_Rinf_avgAll.mat';
file2_12  = 'log_20231019_12inch_R1_avgAll.mat';
file3_12  = 'log_20231019_12inch_R125_avgAll.mat';
file4_12  = 'log_20231019_12inch_R15_avgAll.mat';
file5_12  = 'log_20231019_12inch_R175_avgAll.mat';
file6_12  = 'log_20231019_12inch_R2_avgAll.mat';
file7_12  = 'log_20231019_12inch_R25_avgAll.mat';
file8_12  = 'log_20231019_12inch_R3_avgAll.mat';

file1_13  = 'log_20231025_13inch_Rinf_avgAll.mat';
file2_13  = 'log_20231025_13inch_R1_avgAll.mat';
file3_13  = 'log_20231025_13inch_R125_avgAll.mat';
file4_13  = 'log_20231025_13inch_R15_avgAll.mat';
file5_13  = 'log_20231025_13inch_R175_avgAll.mat';
file6_13  = 'log_20231025_13inch_R2_avgAll.mat';
file7_13  = 'log_20231025_13inch_R25_avgAll.mat';
file8_13  = 'log_20231025_13inch_R3_avgAll.mat';

Ts1 = 1/150;

filepath1_10 = strcat(ft_path,file1_10);
filepath2_10 = strcat(ft_path,file2_10);
filepath3_10 = strcat(ft_path,file3_10);
filepath4_10 = strcat(ft_path,file4_10);
filepath5_10 = strcat(ft_path,file5_10);
filepath6_10 = strcat(ft_path,file6_10);
filepath7_10 = strcat(ft_path,file7_10);
filepath8_10 = strcat(ft_path,file8_10);

file1_10 = load(filepath1_10);
file2_10 = load(filepath2_10);
file3_10 = load(filepath3_10);
file4_10 = load(filepath4_10);
file5_10 = load(filepath5_10);
file6_10 = load(filepath6_10);
file7_10 = load(filepath7_10);
file8_10 = load(filepath8_10);

file11 = load('../LogFiles/txcWall_coeffs.mat');

filepath1_12 = strcat(ft_path,file1_12);
filepath2_12 = strcat(ft_path,file2_12);
filepath3_12 = strcat(ft_path,file3_12);
filepath4_12 = strcat(ft_path,file4_12);
filepath5_12 = strcat(ft_path,file5_12);
filepath6_12 = strcat(ft_path,file6_12);
filepath7_12 = strcat(ft_path,file7_12);
filepath8_12 = strcat(ft_path,file8_12);

file1_12 = load(filepath1_12);
file2_12 = load(filepath2_12);
file3_12 = load(filepath3_12);
file4_12 = load(filepath4_12);
file5_12 = load(filepath5_12);
file6_12 = load(filepath6_12);
file7_12 = load(filepath7_12);
file8_12 = load(filepath8_12);

filepath1_13 = strcat(ft_path,file1_13);
filepath2_13 = strcat(ft_path,file2_13);
filepath3_13 = strcat(ft_path,file3_13);
filepath4_13 = strcat(ft_path,file4_13);
filepath5_13 = strcat(ft_path,file5_13);
filepath6_13 = strcat(ft_path,file6_13);
filepath7_13 = strcat(ft_path,file7_13);
filepath8_13 = strcat(ft_path,file8_13);

file1_13 = load(filepath1_13);
file2_13 = load(filepath2_13);
file3_13 = load(filepath3_13);
file4_13 = load(filepath4_13);
file5_13 = load(filepath5_13);
file6_13 = load(filepath6_13);
file7_13 = load(filepath7_13);
file8_13 = load(filepath8_13);

fxlim = 1;
fylim = 1;
mxlim = 0.1;
mylim = 0.1;
point_to_see = 12;
point_to_see_10 = 5;
point_to_see_12 = 5;
point_to_see_13 = 2;
flag =0;
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
plot(distances_vec(1),file1_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(2),file2_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(3),file3_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(4),file4_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(5),file5_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(6),file6_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(7),file7_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(8),file8_13.result.Fx_points(point_to_see),'x','color','r','linewidth',2)
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylim([-1*fxlim fxlim])
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
plot(distances_vec(1),file1_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(2),file2_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(3),file3_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(4),file4_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(5),file5_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(6),file6_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(7),file7_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(8),file8_13.result.Fy_points(point_to_see),'x','color','r','linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
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
plot(distances_vec(1),file1_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(2),file2_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(3),file3_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(4),file4_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(5),file5_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(6),file6_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(7),file7_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(8),file8_13.result.Fz_points(point_to_see),'x','color','r','linewidth',2)
ylabel('F_z [N]')
xlabel('D/R [-]')

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
plot(distances_vec(1),file1_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(2),file2_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(3),file3_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(4),file4_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(5),file5_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(6),file6_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(7),file7_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(8),file8_13.result.Mx_points(point_to_see),'x','color','r','linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-1*mxlim mxlim])
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
plot(distances_vec(1),file1_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(2),file2_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(3),file3_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(4),file4_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(5),file5_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(6),file6_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(7),file7_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(8),file8_13.result.My_points(point_to_see),'x','color','r','linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-1*mylim mylim])
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
plot(distances_vec(1),file1_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(2),file2_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(3),file3_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(4),file4_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(5),file5_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(6),file6_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(7),file7_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
plot(distances_vec(8),file8_13.result.Mz_points(point_to_see),'x','color','r','linewidth',2)
ylabel('M_z [N\cdot m]')
ylim([-1*mylim mylim])
xlabel('D/R [-]')

%}

%  We may also want to see what the average between the two stairs are
for i = 13:-1:8
    Fx_points1_10(14-i) = mean([file1_10.result.Fx_points(i),file1_10.result.Fx_points(i-steps_per_stair)]);
    Fx_points2_10(14-i) = mean([file2_10.result.Fx_points(i),file2_10.result.Fx_points(i-steps_per_stair)]);
    Fx_points3_10(14-i) = mean([file3_10.result.Fx_points(i),file3_10.result.Fx_points(i-steps_per_stair)]);
    Fx_points4_10(14-i) = mean([file4_10.result.Fx_points(i),file4_10.result.Fx_points(i-steps_per_stair)]);
    Fx_points5_10(14-i) = mean([file5_10.result.Fx_points(i),file5_10.result.Fx_points(i-steps_per_stair)]);
    Fx_points6_10(14-i) = mean([file6_10.result.Fx_points(i),file6_10.result.Fx_points(i-steps_per_stair)]);
    Fx_points7_10(14-i) = mean([file7_10.result.Fx_points(i),file7_10.result.Fx_points(i-steps_per_stair)]);
    Fx_points8_10(14-i) = mean([file8_10.result.Fx_points(i),file8_10.result.Fx_points(i-steps_per_stair)]);
    Fy_points1_10(14-i) = mean([file1_10.result.Fy_points(i),file1_10.result.Fy_points(i-steps_per_stair)]);
    Fy_points2_10(14-i) = mean([file2_10.result.Fy_points(i),file2_10.result.Fy_points(i-steps_per_stair)]);
    Fy_points3_10(14-i) = mean([file3_10.result.Fy_points(i),file3_10.result.Fy_points(i-steps_per_stair)]);
    Fy_points4_10(14-i) = mean([file4_10.result.Fy_points(i),file4_10.result.Fy_points(i-steps_per_stair)]);
    Fy_points5_10(14-i) = mean([file5_10.result.Fy_points(i),file5_10.result.Fy_points(i-steps_per_stair)]);
    Fy_points6_10(14-i) = mean([file6_10.result.Fy_points(i),file6_10.result.Fy_points(i-steps_per_stair)]);
    Fy_points7_10(14-i) = mean([file7_10.result.Fy_points(i),file7_10.result.Fy_points(i-steps_per_stair)]);
    Fy_points8_10(14-i) = mean([file8_10.result.Fy_points(i),file8_10.result.Fy_points(i-steps_per_stair)]);
    Fz_points1_10(14-i) = mean([file1_10.result.Fz_points(i),file1_10.result.Fz_points(i-steps_per_stair)]);
    Fz_points2_10(14-i) = mean([file2_10.result.Fz_points(i),file2_10.result.Fz_points(i-steps_per_stair)]);
    Fz_points3_10(14-i) = mean([file3_10.result.Fz_points(i),file3_10.result.Fz_points(i-steps_per_stair)]);
    Fz_points4_10(14-i) = mean([file4_10.result.Fz_points(i),file4_10.result.Fz_points(i-steps_per_stair)]);
    Fz_points5_10(14-i) = mean([file5_10.result.Fz_points(i),file5_10.result.Fz_points(i-steps_per_stair)]);
    Fz_points6_10(14-i) = mean([file6_10.result.Fz_points(i),file6_10.result.Fz_points(i-steps_per_stair)]);
    Fz_points7_10(14-i) = mean([file7_10.result.Fz_points(i),file7_10.result.Fz_points(i-steps_per_stair)]);
    Fz_points8_10(14-i) = mean([file8_10.result.Fz_points(i),file8_10.result.Fz_points(i-steps_per_stair)]);
    Mx_points1_10(14-i) = mean([file1_10.result.Mx_points(i),file1_10.result.Mx_points(i-steps_per_stair)]);
    Mx_points2_10(14-i) = mean([file2_10.result.Mx_points(i),file2_10.result.Mx_points(i-steps_per_stair)]);
    Mx_points3_10(14-i) = mean([file3_10.result.Mx_points(i),file3_10.result.Mx_points(i-steps_per_stair)]);
    Mx_points4_10(14-i) = mean([file4_10.result.Mx_points(i),file4_10.result.Mx_points(i-steps_per_stair)]);
    Mx_points5_10(14-i) = mean([file5_10.result.Mx_points(i),file5_10.result.Mx_points(i-steps_per_stair)]);
    Mx_points6_10(14-i) = mean([file6_10.result.Mx_points(i),file6_10.result.Mx_points(i-steps_per_stair)]);
    Mx_points7_10(14-i) = mean([file7_10.result.Mx_points(i),file7_10.result.Mx_points(i-steps_per_stair)]);
    Mx_points8_10(14-i) = mean([file8_10.result.Mx_points(i),file8_10.result.Mx_points(i-steps_per_stair)]);
    My_points1_10(14-i) = mean([file1_10.result.My_points(i),file1_10.result.My_points(i-steps_per_stair)]);
    My_points2_10(14-i) = mean([file2_10.result.My_points(i),file2_10.result.My_points(i-steps_per_stair)]);
    My_points3_10(14-i) = mean([file3_10.result.My_points(i),file3_10.result.My_points(i-steps_per_stair)]);
    My_points4_10(14-i) = mean([file4_10.result.My_points(i),file4_10.result.My_points(i-steps_per_stair)]);
    My_points5_10(14-i) = mean([file5_10.result.My_points(i),file5_10.result.My_points(i-steps_per_stair)]);
    My_points6_10(14-i) = mean([file6_10.result.My_points(i),file6_10.result.My_points(i-steps_per_stair)]);
    My_points7_10(14-i) = mean([file7_10.result.My_points(i),file7_10.result.My_points(i-steps_per_stair)]);
    My_points8_10(14-i) = mean([file8_10.result.My_points(i),file8_10.result.My_points(i-steps_per_stair)]);
    Mz_points1_10(14-i) = mean([file1_10.result.Mz_points(i),file1_10.result.Mz_points(i-steps_per_stair)]);
    Mz_points2_10(14-i) = mean([file2_10.result.Mz_points(i),file2_10.result.Mz_points(i-steps_per_stair)]);
    Mz_points3_10(14-i) = mean([file3_10.result.Mz_points(i),file3_10.result.Mz_points(i-steps_per_stair)]);
    Mz_points4_10(14-i) = mean([file4_10.result.Mz_points(i),file4_10.result.Mz_points(i-steps_per_stair)]);
    Mz_points5_10(14-i) = mean([file5_10.result.Mz_points(i),file5_10.result.Mz_points(i-steps_per_stair)]);
    Mz_points6_10(14-i) = mean([file6_10.result.Mz_points(i),file6_10.result.Mz_points(i-steps_per_stair)]);
    Mz_points7_10(14-i) = mean([file7_10.result.Mz_points(i),file7_10.result.Mz_points(i-steps_per_stair)]);
    Mz_points8_10(14-i) = mean([file8_10.result.Mz_points(i),file8_10.result.Mz_points(i-steps_per_stair)]);
    Fx_points1_12(14-i) = mean([file1_12.result.Fx_points(i),file1_12.result.Fx_points(i-steps_per_stair)]);
    Fx_points2_12(14-i) = mean([file2_12.result.Fx_points(i),file2_12.result.Fx_points(i-steps_per_stair)]);
    Fx_points3_12(14-i) = mean([file3_12.result.Fx_points(i),file3_12.result.Fx_points(i-steps_per_stair)]);
    Fx_points4_12(14-i) = mean([file4_12.result.Fx_points(i),file4_12.result.Fx_points(i-steps_per_stair)]);
    Fx_points5_12(14-i) = mean([file5_12.result.Fx_points(i),file5_12.result.Fx_points(i-steps_per_stair)]);
    Fx_points6_12(14-i) = mean([file6_12.result.Fx_points(i),file6_12.result.Fx_points(i-steps_per_stair)]);
    Fx_points7_12(14-i) = mean([file7_12.result.Fx_points(i),file7_12.result.Fx_points(i-steps_per_stair)]);
    Fx_points8_12(14-i) = mean([file8_12.result.Fx_points(i),file8_12.result.Fx_points(i-steps_per_stair)]);
    Fy_points1_12(14-i) = mean([file1_12.result.Fy_points(i),file1_12.result.Fy_points(i-steps_per_stair)]);
    Fy_points2_12(14-i) = mean([file2_12.result.Fy_points(i),file2_12.result.Fy_points(i-steps_per_stair)]);
    Fy_points3_12(14-i) = mean([file3_12.result.Fy_points(i),file3_12.result.Fy_points(i-steps_per_stair)]);
    Fy_points4_12(14-i) = mean([file4_12.result.Fy_points(i),file4_12.result.Fy_points(i-steps_per_stair)]);
    Fy_points5_12(14-i) = mean([file5_12.result.Fy_points(i),file5_12.result.Fy_points(i-steps_per_stair)]);
    Fy_points6_12(14-i) = mean([file6_12.result.Fy_points(i),file6_12.result.Fy_points(i-steps_per_stair)]);
    Fy_points7_12(14-i) = mean([file7_12.result.Fy_points(i),file7_12.result.Fy_points(i-steps_per_stair)]);
    Fy_points8_12(14-i) = mean([file8_12.result.Fy_points(i),file8_12.result.Fy_points(i-steps_per_stair)]);
    Fz_points1_12(14-i) = mean([file1_12.result.Fz_points(i),file1_12.result.Fz_points(i-steps_per_stair)]);
    Fz_points2_12(14-i) = mean([file2_12.result.Fz_points(i),file2_12.result.Fz_points(i-steps_per_stair)]);
    Fz_points3_12(14-i) = mean([file3_12.result.Fz_points(i),file3_12.result.Fz_points(i-steps_per_stair)]);
    Fz_points4_12(14-i) = mean([file4_12.result.Fz_points(i),file4_12.result.Fz_points(i-steps_per_stair)]);
    Fz_points5_12(14-i) = mean([file5_12.result.Fz_points(i),file5_12.result.Fz_points(i-steps_per_stair)]);
    Fz_points6_12(14-i) = mean([file6_12.result.Fz_points(i),file6_12.result.Fz_points(i-steps_per_stair)]);
    Fz_points7_12(14-i) = mean([file7_12.result.Fz_points(i),file7_12.result.Fz_points(i-steps_per_stair)]);
    Fz_points8_12(14-i) = mean([file8_12.result.Fz_points(i),file8_12.result.Fz_points(i-steps_per_stair)]);
    Mx_points1_12(14-i) = mean([file1_12.result.Mx_points(i),file1_12.result.Mx_points(i-steps_per_stair)]);
    Mx_points2_12(14-i) = mean([file2_12.result.Mx_points(i),file2_12.result.Mx_points(i-steps_per_stair)]);
    Mx_points3_12(14-i) = mean([file3_12.result.Mx_points(i),file3_12.result.Mx_points(i-steps_per_stair)]);
    Mx_points4_12(14-i) = mean([file4_12.result.Mx_points(i),file4_12.result.Mx_points(i-steps_per_stair)]);
    Mx_points5_12(14-i) = mean([file5_12.result.Mx_points(i),file5_12.result.Mx_points(i-steps_per_stair)]);
    Mx_points6_12(14-i) = mean([file6_12.result.Mx_points(i),file6_12.result.Mx_points(i-steps_per_stair)]);
    Mx_points7_12(14-i) = mean([file7_12.result.Mx_points(i),file7_12.result.Mx_points(i-steps_per_stair)]);
    Mx_points8_12(14-i) = mean([file8_12.result.Mx_points(i),file8_12.result.Mx_points(i-steps_per_stair)]);
    My_points1_12(14-i) = mean([file1_12.result.My_points(i),file1_12.result.My_points(i-steps_per_stair)]);
    My_points2_12(14-i) = mean([file2_12.result.My_points(i),file2_12.result.My_points(i-steps_per_stair)]);
    My_points3_12(14-i) = mean([file3_12.result.My_points(i),file3_12.result.My_points(i-steps_per_stair)]);
    My_points4_12(14-i) = mean([file4_12.result.My_points(i),file4_12.result.My_points(i-steps_per_stair)]);
    My_points5_12(14-i) = mean([file5_12.result.My_points(i),file5_12.result.My_points(i-steps_per_stair)]);
    My_points6_12(14-i) = mean([file6_12.result.My_points(i),file6_12.result.My_points(i-steps_per_stair)]);
    My_points7_12(14-i) = mean([file7_12.result.My_points(i),file7_12.result.My_points(i-steps_per_stair)]);
    My_points8_12(14-i) = mean([file8_12.result.My_points(i),file8_12.result.My_points(i-steps_per_stair)]);
    Mz_points1_12(14-i) = mean([file1_12.result.Mz_points(i),file1_12.result.Mz_points(i-steps_per_stair)]);
    Mz_points2_12(14-i) = mean([file2_12.result.Mz_points(i),file2_12.result.Mz_points(i-steps_per_stair)]);
    Mz_points3_12(14-i) = mean([file3_12.result.Mz_points(i),file3_12.result.Mz_points(i-steps_per_stair)]);
    Mz_points4_12(14-i) = mean([file4_12.result.Mz_points(i),file4_12.result.Mz_points(i-steps_per_stair)]);
    Mz_points5_12(14-i) = mean([file5_12.result.Mz_points(i),file5_12.result.Mz_points(i-steps_per_stair)]);
    Mz_points6_12(14-i) = mean([file6_12.result.Mz_points(i),file6_12.result.Mz_points(i-steps_per_stair)]);
    Mz_points7_12(14-i) = mean([file7_12.result.Mz_points(i),file7_12.result.Mz_points(i-steps_per_stair)]);
    Mz_points8_12(14-i) = mean([file8_12.result.Mz_points(i),file8_12.result.Mz_points(i-steps_per_stair)]);
    Fx_points1_13(14-i) = mean([file1_13.result.Fx_points(i),file1_13.result.Fx_points(i-steps_per_stair)]);
    Fx_points2_13(14-i) = mean([file2_13.result.Fx_points(i),file2_13.result.Fx_points(i-steps_per_stair)]);
    Fx_points3_13(14-i) = mean([file3_13.result.Fx_points(i),file3_13.result.Fx_points(i-steps_per_stair)]);
    Fx_points4_13(14-i) = mean([file4_13.result.Fx_points(i),file4_13.result.Fx_points(i-steps_per_stair)]);
    Fx_points5_13(14-i) = mean([file5_13.result.Fx_points(i),file5_13.result.Fx_points(i-steps_per_stair)]);
    Fx_points6_13(14-i) = mean([file6_13.result.Fx_points(i),file6_13.result.Fx_points(i-steps_per_stair)]);
    Fx_points7_13(14-i) = mean([file7_13.result.Fx_points(i),file7_13.result.Fx_points(i-steps_per_stair)]);
    Fx_points8_13(14-i) = mean([file8_13.result.Fx_points(i),file8_13.result.Fx_points(i-steps_per_stair)]);
    Fy_points1_13(14-i) = mean([file1_13.result.Fy_points(i),file1_13.result.Fy_points(i-steps_per_stair)]);
    Fy_points2_13(14-i) = mean([file2_13.result.Fy_points(i),file2_13.result.Fy_points(i-steps_per_stair)]);
    Fy_points3_13(14-i) = mean([file3_13.result.Fy_points(i),file3_13.result.Fy_points(i-steps_per_stair)]);
    Fy_points4_13(14-i) = mean([file4_13.result.Fy_points(i),file4_13.result.Fy_points(i-steps_per_stair)]);
    Fy_points5_13(14-i) = mean([file5_13.result.Fy_points(i),file5_13.result.Fy_points(i-steps_per_stair)]);
    Fy_points6_13(14-i) = mean([file6_13.result.Fy_points(i),file6_13.result.Fy_points(i-steps_per_stair)]);
    Fy_points7_13(14-i) = mean([file7_13.result.Fy_points(i),file7_13.result.Fy_points(i-steps_per_stair)]);
    Fy_points8_13(14-i) = mean([file8_13.result.Fy_points(i),file8_13.result.Fy_points(i-steps_per_stair)]);
    Fz_points1_13(14-i) = mean([file1_13.result.Fz_points(i),file1_13.result.Fz_points(i-steps_per_stair)]);
    Fz_points2_13(14-i) = mean([file2_13.result.Fz_points(i),file2_13.result.Fz_points(i-steps_per_stair)]);
    Fz_points3_13(14-i) = mean([file3_13.result.Fz_points(i),file3_13.result.Fz_points(i-steps_per_stair)]);
    Fz_points4_13(14-i) = mean([file4_13.result.Fz_points(i),file4_13.result.Fz_points(i-steps_per_stair)]);
    Fz_points5_13(14-i) = mean([file5_13.result.Fz_points(i),file5_13.result.Fz_points(i-steps_per_stair)]);
    Fz_points6_13(14-i) = mean([file6_13.result.Fz_points(i),file6_13.result.Fz_points(i-steps_per_stair)]);
    Fz_points7_13(14-i) = mean([file7_13.result.Fz_points(i),file7_13.result.Fz_points(i-steps_per_stair)]);
    Fz_points8_13(14-i) = mean([file8_13.result.Fz_points(i),file8_13.result.Fz_points(i-steps_per_stair)]);
    Mx_points1_13(14-i) = mean([file1_13.result.Mx_points(i),file1_13.result.Mx_points(i-steps_per_stair)]);
    Mx_points2_13(14-i) = mean([file2_13.result.Mx_points(i),file2_13.result.Mx_points(i-steps_per_stair)]);
    Mx_points3_13(14-i) = mean([file3_13.result.Mx_points(i),file3_13.result.Mx_points(i-steps_per_stair)]);
    Mx_points4_13(14-i) = mean([file4_13.result.Mx_points(i),file4_13.result.Mx_points(i-steps_per_stair)]);
    Mx_points5_13(14-i) = mean([file5_13.result.Mx_points(i),file5_13.result.Mx_points(i-steps_per_stair)]);
    Mx_points6_13(14-i) = mean([file6_13.result.Mx_points(i),file6_13.result.Mx_points(i-steps_per_stair)]);
    Mx_points7_13(14-i) = mean([file7_13.result.Mx_points(i),file7_13.result.Mx_points(i-steps_per_stair)]);
    Mx_points8_13(14-i) = mean([file8_13.result.Mx_points(i),file8_13.result.Mx_points(i-steps_per_stair)]);
    My_points1_13(14-i) = mean([file1_13.result.My_points(i),file1_13.result.My_points(i-steps_per_stair)]);
    My_points2_13(14-i) = mean([file2_13.result.My_points(i),file2_13.result.My_points(i-steps_per_stair)]);
    My_points3_13(14-i) = mean([file3_13.result.My_points(i),file3_13.result.My_points(i-steps_per_stair)]);
    My_points4_13(14-i) = mean([file4_13.result.My_points(i),file4_13.result.My_points(i-steps_per_stair)]);
    My_points5_13(14-i) = mean([file5_13.result.My_points(i),file5_13.result.My_points(i-steps_per_stair)]);
    My_points6_13(14-i) = mean([file6_13.result.My_points(i),file6_13.result.My_points(i-steps_per_stair)]);
    My_points7_13(14-i) = mean([file7_13.result.My_points(i),file7_13.result.My_points(i-steps_per_stair)]);
    My_points8_13(14-i) = mean([file8_13.result.My_points(i),file8_13.result.My_points(i-steps_per_stair)]);
    Mz_points1_13(14-i) = mean([file1_13.result.Mz_points(i),file1_13.result.Mz_points(i-steps_per_stair)]);
    Mz_points2_13(14-i) = mean([file2_13.result.Mz_points(i),file2_13.result.Mz_points(i-steps_per_stair)]);
    Mz_points3_13(14-i) = mean([file3_13.result.Mz_points(i),file3_13.result.Mz_points(i-steps_per_stair)]);
    Mz_points4_13(14-i) = mean([file4_13.result.Mz_points(i),file4_13.result.Mz_points(i-steps_per_stair)]);
    Mz_points5_13(14-i) = mean([file5_13.result.Mz_points(i),file5_13.result.Mz_points(i-steps_per_stair)]);
    Mz_points6_13(14-i) = mean([file6_13.result.Mz_points(i),file6_13.result.Mz_points(i-steps_per_stair)]);
    Mz_points7_13(14-i) = mean([file7_13.result.Mz_points(i),file7_13.result.Mz_points(i-steps_per_stair)]);
    Mz_points8_13(14-i) = mean([file8_13.result.Mz_points(i),file8_13.result.Mz_points(i-steps_per_stair)]);

end

figure()
grid on;hold on;
plot(file1_10.result.Fz)
plot(file1_12.result.Fz)
plot(file1_13.result.Fz)
plot(1e4,Fz_points1_10(point_to_see_10),'x','color','b','linewidth',2)
plot(1.2e4,Fz_points1_12(point_to_see_12),'x','color','r','linewidth',2)
plot(1.4e4,Fz_points1_13(point_to_see_13),'x','color','y','linewidth',2)
legend('10"','12"','13"')

%{
figure()
subplot(3,1,1)
hold on;grid on;
title('Average of two stairs')
plot(distances_vec(1),Fx_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),Fx_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),Fx_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),Fx_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),Fx_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),Fx_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),Fx_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),Fx_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),Fx_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),Fx_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),Fx_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),Fx_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),Fx_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),Fx_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),Fx_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),Fx_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),Fx_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),Fx_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),Fx_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),Fx_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),Fx_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),Fx_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),Fx_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),Fx_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylim([-1*fxlim fxlim])
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),Fy_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),Fy_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),Fy_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),Fy_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),Fy_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),Fy_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),Fy_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),Fy_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),Fy_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),Fy_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),Fy_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),Fy_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),Fy_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),Fy_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),Fy_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),Fy_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),Fy_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),Fy_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),Fy_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),Fy_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),Fy_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),Fy_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),Fy_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Fz_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),Fz_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),Fz_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),Fz_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),Fz_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),Fz_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),Fz_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),Fz_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),Fz_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),Fz_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),Fz_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),Fz_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),Fz_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),Fz_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),Fz_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),Fz_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),Fz_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),Fz_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),Fz_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),Fz_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),Fz_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),Fz_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),Fz_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),Fz_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylabel('F_z [N]')
xlabel('D/R [-]')

figure()
subplot(3,1,1)
hold on;grid on;
title('Average of two stairs')
plot(distances_vec(1),Mx_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),Mx_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),Mx_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),Mx_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),Mx_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),Mx_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),Mx_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),Mx_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),Mx_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),Mx_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),Mx_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),Mx_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),Mx_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),Mx_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),Mx_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),Mx_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),Mx_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),Mx_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),Mx_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),Mx_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),Mx_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),Mx_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),Mx_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),Mx_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-1*mxlim mxlim])
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),My_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),My_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),My_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),My_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),My_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),My_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),My_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),My_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),My_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),My_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),My_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),My_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),My_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),My_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),My_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),My_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),My_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),My_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),My_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),My_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),My_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),My_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),My_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),My_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-1*mylim mylim])
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Mz_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),Mz_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),Mz_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),Mz_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),Mz_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),Mz_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),Mz_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),Mz_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),Mz_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),Mz_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),Mz_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),Mz_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),Mz_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),Mz_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),Mz_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),Mz_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),Mz_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),Mz_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),Mz_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),Mz_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),Mz_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),Mz_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),Mz_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),Mz_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylabel('M_z [N\cdot m]')
ylim([-1*mylim mylim])
xlabel('D/R [-]')
%}

lightBLUE = [0.356862745098039,0.811764705882353,0.956862745098039];
darkBLUE = [0.0196078431372549,0.0745098039215686,0.670588235294118];
kk = 6;
blueGRADIENTfixed = [linspace(lightBLUE(1),darkBLUE(1),kk)', linspace(lightBLUE(2),darkBLUE(2),kk)', linspace(lightBLUE(3),darkBLUE(3),kk)'];
%% 10

%{
figure()
subplot(3,1,1)
hold on;grid on;
title('10"x4.5"')
plot(distances_vec(1),Fx_points1_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*fxlim fxlim])
legend('14N','','','','','','12N','','','','','','10N','','','','','','8N','','','','','','3000RPM','','','','','','0N')
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Fz_points1_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylabel('F_z [N]')
xlabel('D/R [-]')


figure()
subplot(3,1,1)
hold on;grid on;
title('10"x4.5"')
plot(distances_vec(1),Mx_points1_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mxlim mxlim])
legend('14N','','','','','','12N','','','','','','10N','','','','','','8N','','','','','','3000RPM','','','','','','0N')
ylabel('M_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),My_points1_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),My_points2_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),My_points3_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),My_points4_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),My_points5_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),My_points6_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),My_points7_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),My_points8_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),My_points1_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),My_points2_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),My_points3_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),My_points4_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),My_points5_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),My_points6_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),My_points7_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),My_points8_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),My_points1_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),My_points2_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),My_points3_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),My_points4_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),My_points5_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),My_points6_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),My_points7_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),My_points8_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),My_points1_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),My_points2_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),My_points3_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),My_points4_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),My_points5_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),My_points6_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),My_points7_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),My_points8_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),My_points1_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),My_points2_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),My_points3_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),My_points4_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),My_points5_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),My_points6_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),My_points7_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),My_points8_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),My_points1_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),My_points2_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),My_points3_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),My_points4_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),My_points5_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),My_points6_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),My_points7_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),My_points8_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mylim mylim])
ylabel('M_y [N]')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Mz_points1_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_10(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_10(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_10(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_10(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_10(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_10(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mylim mylim])
ylabel('M_z [N]')
xlabel('D/R [-]')
%}

%% 12

%{
figure()
subplot(3,1,1)
hold on;grid on;
title('12"x6"')
plot(distances_vec(1),Fx_points1_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*fxlim fxlim])
legend('14N','','','','','','12N','','','','','','10N','','','','','','8N','','','','','','3000RPM','','','','','','0N')
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Fz_points1_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylabel('F_z [N]')
xlabel('D/R [-]')


figure()
subplot(3,1,1)
hold on;grid on;
title('12"x6"')
plot(distances_vec(1),Mx_points1_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mxlim mxlim])
legend('14N','','','','','','12N','','','','','','10N','','','','','','8N','','','','','','3000RPM','','','','','','0N')
ylabel('M_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),My_points1_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),My_points2_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),My_points3_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),My_points4_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),My_points5_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),My_points6_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),My_points7_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),My_points8_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),My_points1_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),My_points2_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),My_points3_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),My_points4_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),My_points5_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),My_points6_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),My_points7_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),My_points8_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),My_points1_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),My_points2_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),My_points3_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),My_points4_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),My_points5_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),My_points6_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),My_points7_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),My_points8_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),My_points1_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),My_points2_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),My_points3_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),My_points4_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),My_points5_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),My_points6_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),My_points7_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),My_points8_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),My_points1_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),My_points2_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),My_points3_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),My_points4_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),My_points5_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),My_points6_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),My_points7_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),My_points8_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),My_points1_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),My_points2_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),My_points3_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),My_points4_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),My_points5_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),My_points6_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),My_points7_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),My_points8_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mylim mylim])
ylabel('M_y [N]')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Mz_points1_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_12(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_12(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_12(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_12(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_12(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_12(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mylim mylim])
ylabel('M_z [N]')
xlabel('D/R [-]')
%}

%% 13

%{
figure()
subplot(3,1,1)
hold on;grid on;
title('13"x6.5"')
plot(distances_vec(1),Fx_points1_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fx_points1_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fx_points2_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fx_points3_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fx_points4_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fx_points5_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fx_points6_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fx_points7_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fx_points8_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*fxlim fxlim])
legend('14N','','','','','','3000RPM','','','','','','12N','','','','','','10N','','','','','','8N','','','','','','0N')
ylabel('F_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fy_points1_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fy_points2_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fy_points3_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fy_points4_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fy_points5_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fy_points6_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fy_points7_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fy_points8_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*fylim fylim])
ylabel('F_y [N]')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Fz_points1_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Fz_points1_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Fz_points2_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Fz_points3_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Fz_points4_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Fz_points5_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Fz_points6_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Fz_points7_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Fz_points8_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylabel('F_z [N]')
xlabel('D/R [-]')


figure()
subplot(3,1,1)
hold on;grid on;
title('13"x6.5"')
plot(distances_vec(1),Mx_points1_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Mx_points1_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Mx_points2_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Mx_points3_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Mx_points4_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Mx_points5_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Mx_points6_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Mx_points7_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Mx_points8_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mxlim mxlim])
legend('14N','','','','','','3000RPM','','','','','','12N','','','','','','10N','','','','','','8N','','','','','','0N')
ylabel('M_x [N]')
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),My_points1_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),My_points2_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),My_points3_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),My_points4_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),My_points5_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),My_points6_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),My_points7_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),My_points8_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),My_points1_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),My_points2_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),My_points3_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),My_points4_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),My_points5_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),My_points6_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),My_points7_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),My_points8_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),My_points1_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),My_points2_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),My_points3_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),My_points4_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),My_points5_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),My_points6_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),My_points7_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),My_points8_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),My_points1_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),My_points2_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),My_points3_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),My_points4_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),My_points5_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),My_points6_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),My_points7_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),My_points8_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),My_points1_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),My_points2_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),My_points3_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),My_points4_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),My_points5_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),My_points6_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),My_points7_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),My_points8_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),My_points1_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),My_points2_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),My_points3_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),My_points4_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),My_points5_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),My_points6_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),My_points7_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),My_points8_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mylim mylim])
ylabel('M_y [N]')
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Mz_points1_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_13(1),'x','color',blueGRADIENTfixed(1,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_13(2),'x','color',blueGRADIENTfixed(2,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_13(3),'x','color',blueGRADIENTfixed(3,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_13(4),'x','color',blueGRADIENTfixed(4,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_13(5),'x','color',blueGRADIENTfixed(5,:),'linewidth',2)
plot(distances_vec(1),Mz_points1_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(2),Mz_points2_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(3),Mz_points3_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(4),Mz_points4_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(5),Mz_points5_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(6),Mz_points6_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(7),Mz_points7_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
plot(distances_vec(8),Mz_points8_13(6),'x','color',blueGRADIENTfixed(6,:),'linewidth',2)
ylim([-1*mylim mylim])
ylabel('M_z [N]')
xlabel('D/R [-]')

%}

%% JINT Extension


figure()
subplot(3,1,1)
hold on;grid on;
title('Average of two stairs')
plot(distances_vec(1),Fx_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),Fx_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),Fx_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),Fx_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),Fx_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),Fx_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),Fx_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),Fx_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),Fx_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),Fx_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),Fx_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),Fx_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),Fx_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),Fx_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),Fx_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),Fx_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),Fx_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),Fx_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),Fx_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),Fx_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),Fx_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),Fx_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),Fx_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),Fx_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylim([-1*fxlim fxlim])
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('F_x [N]')

subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Fz_points1_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(2),Fz_points2_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(3),Fz_points3_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(4),Fz_points4_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(5),Fz_points5_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(6),Fz_points6_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(7),Fz_points7_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(8),Fz_points8_10(point_to_see_10),'x','color','k','linewidth',2)
plot(distances_vec(1),Fz_points1_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(2),Fz_points2_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(3),Fz_points3_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(4),Fz_points4_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(5),Fz_points5_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(6),Fz_points6_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(7),Fz_points7_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(8),Fz_points8_12(point_to_see_12),'x','color','b','linewidth',2)
plot(distances_vec(1),Fz_points1_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(2),Fz_points2_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(3),Fz_points3_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(4),Fz_points4_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(5),Fz_points5_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(6),Fz_points6_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(7),Fz_points7_13(point_to_see_13),'x','color','r','linewidth',2)
plot(distances_vec(8),Fz_points8_13(point_to_see_13),'x','color','r','linewidth',2)
ylabel('F_z [N]')
xlabel('D/R [-]')

figure()
subplot(2,1,1)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(2),'o','color','r','linewidth',2);%,'markersize',8)
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
ylim([-1*mxlim mxlim])
subplot(2,1,2)
hold on;grid on;
plot(distances_vec(1),-Fy_points1_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(2),-Fy_points2_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(3),-Fy_points3_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(4),-Fy_points4_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(5),-Fy_points5_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(6),-Fy_points6_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(7),-Fy_points7_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(8),-Fy_points8_10(5),'o','color','k','linewidth',2);%,'markersize',8)
plot(distances_vec(1),-Fy_points1_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(2),-Fy_points2_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(3),-Fy_points3_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(4),-Fy_points4_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(5),-Fy_points5_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(6),-Fy_points6_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(7),-Fy_points7_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(8),-Fy_points8_12(5),'o','color','b','linewidth',2);%,'markersize',8)
plot(distances_vec(1),-Fy_points1_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(2),-Fy_points2_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(3),-Fy_points3_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(4),-Fy_points4_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(5),-Fy_points5_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(6),-Fy_points6_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(7),-Fy_points7_13(2),'o','color','r','linewidth',2);%,'markersize',8)
plot(distances_vec(8),-Fy_points8_13(2),'o','color','r','linewidth',2);%,'markersize',8)
ylim([-1*fylim fylim])
ylabel('F$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" 3000 RPM','','','','','','','','12"x6" 3000 RPM','','','','','','','','13"x6.5" 3000 RPM','fontsize',12)
xlabel('D/R [-]','fontsize',15)

figure()
subplot(2,1,1)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(1),'x','color','r','linewidth',2)%,'markersize',8)
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
ylim([-1*mxlim mxlim])
subplot(2,1,2)
hold on;grid on;
plot(distances_vec(1),-Fy_points1_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(2),-Fy_points2_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(3),-Fy_points3_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(4),-Fy_points4_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(5),-Fy_points5_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(6),-Fy_points6_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(7),-Fy_points7_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(8),-Fy_points8_10(1),'x','color','k','linewidth',2);%,'markersize',2)
plot(distances_vec(1),-Fy_points1_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(2),-Fy_points2_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(3),-Fy_points3_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(4),-Fy_points4_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(5),-Fy_points5_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(6),-Fy_points6_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(7),-Fy_points7_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(8),-Fy_points8_12(1),'x','color','b','linewidth',2);%,'markersize',2)
plot(distances_vec(1),-Fy_points1_13(1),'x','color','r','linewidth',2);%,'markersize',2)
plot(distances_vec(2),-Fy_points2_13(1),'x','color','r','linewidth',2);%,'markersize',2)
plot(distances_vec(3),-Fy_points3_13(1),'x','color','r','linewidth',2);%,'markersize',2)
plot(distances_vec(4),-Fy_points4_13(1),'x','color','r','linewidth',2);%,'markersize',2)
plot(distances_vec(5),-Fy_points5_13(1),'x','color','r','linewidth',2);%,'markersize',2)
plot(distances_vec(6),-Fy_points6_13(1),'x','color','r','linewidth',2);%,'markersize',2)
plot(distances_vec(7),-Fy_points7_13(1),'x','color','r','linewidth',2);%,'markersize',2)
plot(distances_vec(8),-Fy_points8_13(1),'x','color','r','linewidth',2);%,'markersize',2)
ylim([-1*fylim fylim])
ylabel('F$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 14 N','','','','','','','','12"x6" F$_z$ = 14 N','','','','','','','','13"x6.5" F$_z$ = 14 N','fontsize',12)
xlabel('D/R [-]','fontsize',15)


figure()
subplot(3,1,1)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(3),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(3),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(4),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(4),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(4),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(4),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(4),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(4),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(4),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(4),'o','color','r','linewidth',2)%,'markersize',8)
ylim([-1*0.05 0.15])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 10 N','','','','','','','','12"x6" F$_z$ = 10 N','','','','','','','','13"x6.5" F$_z$ = 10 N','fontsize',12)
subplot(3,1,2)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(2),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(2),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(3),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(3),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(3),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(3),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(3),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(3),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(3),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(3),'o','color','r','linewidth',2)%,'markersize',8)
ylim([-1*0.05 0.15])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 12 N','','','','','','','','12"x6" F$_z$ = 12 N','','','','','','','','13"x6.5" F$_z$ = 12 N','fontsize',12)
subplot(3,1,3)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(1),'o','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(1),'o','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(1),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(1),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(1),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(1),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(1),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(1),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(1),'o','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(1),'o','color','r','linewidth',2)%,'markersize',8)
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
legend('10"x4.5" F$_z$ = 14 N','','','','','','','','12"x6" F$_z$ = 14 N','','','','','','','','13"x6.5" F$_z$ = 14 N','fontsize',12)
ylim([-1*0.05 0.15])
xlabel('D/R [-]','fontsize',15)


figure()
subplot(4,1,1)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(5),'x','color','r','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 8 N','','','','','','','','12"x6" F$_z$ = 8 N','','','','','','','','13"x6.5" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(4),'x','color','r','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 10 N','','','','','','','','12"x6" F$_z$ = 10 N','','','','','','','','13"x6.5" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(3),'x','color','r','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 12 N','','','','','','','','12"x6" F$_z$ = 12 N','','','','','','','','13"x6.5" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(1),Mx_points1_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(1),'x','color','r','linewidth',2)%,'markersize',8)
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
legend('10"x4.5" F$_z$ = 14 N','','','','','','','','12"x6" F$_z$ = 14 N','','','','','','','','13"x6.5" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-1*0 mxlim])
xlabel('D/R [-]','fontsize',15)



figure()
subplot(4,1,1)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(4),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 8 N','','','','','','','','12"x6" F$_z$ = 8 N','','','','','','','','13"x6.5" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(3),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 10 N','','','','','','','','12"x6" F$_z$ = 10 N','','','','','','','','13"x6.5" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(2),'x','color','k','linewidth',2)%,'markersize',8=
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 12 N','','','','','','','','12"x6" F$_z$ = 12 N','','','','','','','','13"x6.5" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid on;
plot(distances_vec(1),Mx_points1_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(1),'x','color','k','linewidth',2)%,'markersize',8)
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
legend('10"x4.5" F$_z$ = 14 N','','','','','','','','12"x6" F$_z$ = 14 N','','','','','','','','13"x6.5" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-1*0 mxlim])
xlabel('D/R [-]','fontsize',15)



figure()
subplot(4,1,1)
hold on;grid on;
plot(distances_vec(1),Mx_points1_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(4),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('12"x6" F$_z$ = 8 N','','','','','','','','13"x6.5" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid on;
plot(distances_vec(1),Mx_points1_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(3),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('12"x6" F$_z$ = 10 N','','','','','','','','13"x6.5" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid on;
plot(distances_vec(1),Mx_points1_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(2),'x','color','k','linewidth',2)%,'markersize',8=
% xlim([1 3.5])
ylim([-1*0 mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('12"x6" F$_z$ = 12 N','','','','','','','','13"x6.5" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid on;
plot(distances_vec(1),Mx_points1_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(1),'x','color','k','linewidth',2)%,'markersize',8)
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
legend('12"x6" F$_z$ = 14 N','','','','','','','','13"x6.5" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-1*0 mxlim])
xlabel('D/R [-]','fontsize',15)



figure()
subplot(4,1,1)
hold on;grid on;
plot(distances_vec(1),Mx_points1_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(4),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('13"x6.5" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid on;
plot(distances_vec(1),Mx_points1_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(3),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*0 mxlim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('13"x6.5" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid on;
plot(distances_vec(1),Mx_points1_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(2),'x','color','k','linewidth',2)%,'markersize',8=
% xlim([1 3.5])
ylim([-1*0 mxlim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('13"x6.5" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid on;
plot(distances_vec(1),Mx_points1_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(1),'x','color','k','linewidth',2)%,'markersize',8)
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
legend('13"x6.5" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-1*0 mxlim])
xlabel('D/R [-]','fontsize',15)


figure()
subplot(4,1,1)
hold on;grid on;
plot(distances_vec(1),Fy_points1_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_10(4),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_10(3),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid on;
plot(distances_vec(1),Fy_points1_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_10(2),'x','color','k','linewidth',2)%,'markersize',8=
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid on;
plot(distances_vec(1),Fy_points1_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_10(1),'x','color','k','linewidth',2)%,'markersize',8)
ylabel('F$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-1*fylim fylim])
xlabel('D/R [-]','fontsize',15)



figure()
subplot(4,1,1)
hold on;grid on;
plot(distances_vec(1),Fy_points1_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_12(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_12(4),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('12"x6" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_12(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_12(3),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('12"x6" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid on;
plot(distances_vec(1),Fy_points1_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_12(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_12(2),'x','color','k','linewidth',2)%,'markersize',8=
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('12"x6" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid on;
plot(distances_vec(1),Fy_points1_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_12(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_12(1),'x','color','k','linewidth',2)%,'markersize',8)
ylabel('F$_{Wall}$ [N]','fontsize',15)
legend('12"x6" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-1*fylim fylim])
xlabel('D/R [-]','fontsize',15)


figure()
subplot(4,1,1)
hold on;grid on;
plot(distances_vec(1),Fy_points1_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_13(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_13(4),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('13"x6.5" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid on;
plot(distances_vec(1),Fy_points1_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_13(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_13(3),'x','color','k','linewidth',2)%,'markersize',8)
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('13"x6.5" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid on;
plot(distances_vec(1),Fy_points1_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_13(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_13(2),'x','color','k','linewidth',2)%,'markersize',8=
% xlim([1 3.5])
ylim([-1*fylim fylim])
% ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('13"x6.5" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid on;
plot(distances_vec(1),Fy_points1_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Fy_points2_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Fy_points3_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Fy_points4_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Fy_points5_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Fy_points6_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Fy_points7_13(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Fy_points8_13(1),'x','color','k','linewidth',2)%,'markersize',8)
ylabel('F$_{Wall}$ [N]','fontsize',15)
legend('13"x6.5" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-1*fylim fylim])
xlabel('D/R [-]','fontsize',15)


%% RPM and coefficients
%% Coefficient computation

% tach10 = load('MatFiles/tach10_wall_H0.mat');
% tach12 = load('MatFiles/tach12_wall_H0.mat');

R_10       = (24.5/2)*1e-2; %m
R_12       = (30.48/2)*1e-2; %m
R_13       = (33.02/2)*1e-2; %m
distances = distances_vec;
L          = 0.445; %m
R_constant = 287.04; % m^2 /°Ksec^2
toKelvin   = 273.15;

tach10_1 = file1_10.result.RPM_points;
tach10_2 = file2_10.result.RPM_points;
tach10_3 = file3_10.result.RPM_points;
tach10_4 = file4_10.result.RPM_points;
tach10_5 = file5_10.result.RPM_points;
tach10_6 = file6_10.result.RPM_points;
tach10_7 = file7_10.result.RPM_points;
tach10_8 = file8_10.result.RPM_points;
tach12_1 = file1_12.result.RPM_points;
tach12_2 = file2_12.result.RPM_points;
tach12_3 = file3_12.result.RPM_points;
tach12_4 = file4_12.result.RPM_points;
tach12_5 = file5_12.result.RPM_points;
tach12_6 = file6_12.result.RPM_points;
tach12_7 = file7_12.result.RPM_points;
tach12_8 = file8_12.result.RPM_points;
tach13_1 = file1_13.result.RPM_points;
tach13_2 = file2_13.result.RPM_points;
tach13_3 = file3_13.result.RPM_points;
tach13_4 = file4_13.result.RPM_points;
tach13_5 = file5_13.result.RPM_points;
tach13_6 = file6_13.result.RPM_points;
tach13_7 = file7_13.result.RPM_points;
tach13_8 = file8_13.result.RPM_points;

Temp1_10inch = file1_10.result.temp;
Temp2_10inch = file2_10.result.temp;
Temp3_10inch = file3_10.result.temp;
Temp4_10inch = file4_10.result.temp;
Temp5_10inch = file5_10.result.temp;
Temp6_10inch = file6_10.result.temp;
Temp7_10inch = file7_10.result.temp;
Temp8_10inch = file8_10.result.temp;

Temp1_12inch = file1_12.result.temp;
Temp2_12inch = file2_12.result.temp;
Temp3_12inch = file3_12.result.temp;
Temp4_12inch = file4_12.result.temp;
Temp5_12inch = file5_12.result.temp;
Temp6_12inch = file6_12.result.temp;
Temp7_12inch = file7_12.result.temp;
Temp8_12inch = file8_12.result.temp;

Temp1_13inch = file1_13.result.temp;
Temp2_13inch = file2_13.result.temp;
Temp3_13inch = file3_13.result.temp;
Temp4_13inch = file4_13.result.temp;
Temp5_13inch = file5_13.result.temp;
Temp6_13inch = file6_13.result.temp;
Temp7_13inch = file7_13.result.temp;
Temp8_13inch = file8_13.result.temp;

Pres1_10inch = file1_10.result.pres;
Pres2_10inch = file2_10.result.pres;
Pres3_10inch = file3_10.result.pres;
Pres4_10inch = file4_10.result.pres;
Pres5_10inch = file5_10.result.pres;
Pres6_10inch = file6_10.result.pres;
Pres7_10inch = file7_10.result.pres;
Pres8_10inch = file8_10.result.pres;
Pres1_12inch = file1_12.result.pres;
Pres2_12inch = file2_12.result.pres;
Pres3_12inch = file3_12.result.pres;
Pres4_12inch = file4_12.result.pres;
Pres5_12inch = file5_12.result.pres;
Pres6_12inch = file6_12.result.pres;
Pres7_12inch = file7_12.result.pres;
Pres8_12inch = file8_12.result.pres;
Pres1_13inch = file1_13.result.pres;
Pres2_13inch = file2_13.result.pres;
Pres3_13inch = file3_13.result.pres;
Pres4_13inch = file4_13.result.pres;
Pres5_13inch = file5_13.result.pres;
Pres6_13inch = file6_13.result.pres;
Pres7_13inch = file7_13.result.pres;
Pres8_13inch = file8_13.result.pres;

rho1_10inch = Pres1_10inch/(R_constant*(Temp1_10inch+toKelvin));
rho2_10inch = Pres2_10inch/(R_constant*(Temp2_10inch+toKelvin));
rho3_10inch = Pres3_10inch/(R_constant*(Temp3_10inch+toKelvin));
rho4_10inch = Pres4_10inch/(R_constant*(Temp4_10inch+toKelvin));
rho5_10inch = Pres5_10inch/(R_constant*(Temp5_10inch+toKelvin));
rho6_10inch = Pres6_10inch/(R_constant*(Temp6_10inch+toKelvin));
rho7_10inch = Pres7_10inch/(R_constant*(Temp7_10inch+toKelvin));
rho8_10inch = Pres8_10inch/(R_constant*(Temp8_10inch+toKelvin));

rho1_12inch = Pres1_12inch/(R_constant*(Temp1_12inch+toKelvin));
rho2_12inch = Pres2_12inch/(R_constant*(Temp2_12inch+toKelvin));
rho3_12inch = Pres3_12inch/(R_constant*(Temp3_12inch+toKelvin));
rho4_12inch = Pres4_12inch/(R_constant*(Temp4_12inch+toKelvin));
rho5_12inch = Pres5_12inch/(R_constant*(Temp5_12inch+toKelvin));
rho6_12inch = Pres6_12inch/(R_constant*(Temp6_12inch+toKelvin));
rho7_12inch = Pres7_12inch/(R_constant*(Temp7_12inch+toKelvin));
rho8_12inch = Pres8_12inch/(R_constant*(Temp8_12inch+toKelvin));

rho1_13inch = Pres1_13inch/(R_constant*(Temp1_13inch+toKelvin));
rho2_13inch = Pres2_13inch/(R_constant*(Temp2_13inch+toKelvin));
rho3_13inch = Pres3_13inch/(R_constant*(Temp3_13inch+toKelvin));
rho4_13inch = Pres4_13inch/(R_constant*(Temp4_13inch+toKelvin));
rho5_13inch = Pres5_13inch/(R_constant*(Temp5_13inch+toKelvin));
rho6_13inch = Pres6_13inch/(R_constant*(Temp6_13inch+toKelvin));
rho7_13inch = Pres7_13inch/(R_constant*(Temp7_13inch+toKelvin));
rho8_13inch = Pres8_13inch/(R_constant*(Temp8_13inch+toKelvin));

figure()
hold on; grid on;
plot([1:1:6], Fz_points1_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points2_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points3_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points4_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points5_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points6_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points7_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points8_10,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points1_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points2_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points3_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points4_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points5_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points6_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points7_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points8_12,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points1_13,'*','color','r','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points2_13,'*','color','r','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points3_13,'*','color','r','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points4_13,'*','color','r','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points5_13,'*','color','g','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points6_13,'*','color','r','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points7_13,'*','color','r','markersize',7,'lineWidth',2);
plot([1:1:6], Fz_points8_13,'*','color','r','markersize',7,'lineWidth',2);
xlabel('Segment [-]')
ylabel('Fz')

figure()
hold on; grid on;
plot([1:1:13], tach10_1,'o','color','r','markersize',7,'lineWidth',2);
plot([1:1:13], tach10_2,'o','color','g','markersize',7,'lineWidth',2);
plot([1:1:13], tach10_3,'o','color','b','markersize',7,'lineWidth',2);
plot([1:1:13], tach10_4,'o','color','m','markersize',7,'lineWidth',2);
plot([1:1:13], tach10_5,'o','color','c','markersize',7,'lineWidth',2);
plot([1:1:13], tach10_6,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach10_7,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach10_8,'o','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_1,'x','color','r','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_2,'x','color','g','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_3,'x','color','b','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_4,'x','color','m','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_5,'x','color','c','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_6,'x','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_7,'x','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach12_8,'x','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_1,'*','color','r','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_2,'*','color','g','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_3,'*','color','b','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_4,'*','color','m','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_5,'*','color','c','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_6,'*','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_7,'*','color','k','markersize',7,'lineWidth',2);
plot([1:1:13], tach13_8,'*','color','k','markersize',7,'lineWidth',2);
xlabel('Segment [-]')
ylabel('tachometers')


mom1Scana_10inch = 0.5*rho1_10inch*(tach10_1/60).^2*(R_10*2)^5;
mom2Scana_10inch = 0.5*rho2_10inch*(tach10_2/60).^2*(R_10*2)^5;
mom3Scana_10inch = 0.5*rho3_10inch*(tach10_3/60).^2*(R_10*2)^5;
mom4Scana_10inch = 0.5*rho4_10inch*(tach10_4/60).^2*(R_10*2)^5;
mom5Scana_10inch = 0.5*rho5_10inch*(tach10_5/60).^2*(R_10*2)^5;
mom6Scana_10inch = 0.5*rho6_10inch*(tach10_6/60).^2*(R_10*2)^5;
mom7Scana_10inch = 0.5*rho7_10inch*(tach10_7/60).^2*(R_10*2)^5;
mom8Scana_10inch = 0.5*rho8_10inch*(tach10_8/60).^2*(R_10*2)^5;
mom1Scana_12inch = 0.5*rho1_12inch*(tach12_1/60).^2*(R_12*2)^5;
mom2Scana_12inch = 0.5*rho2_12inch*(tach12_2/60).^2*(R_12*2)^5;
mom3Scana_12inch = 0.5*rho3_12inch*(tach12_3/60).^2*(R_12*2)^5;
mom4Scana_12inch = 0.5*rho4_12inch*(tach12_4/60).^2*(R_12*2)^5;
mom5Scana_12inch = 0.5*rho5_12inch*(tach12_5/60).^2*(R_12*2)^5;
mom6Scana_12inch = 0.5*rho6_12inch*(tach12_6/60).^2*(R_12*2)^5;
mom7Scana_12inch = 0.5*rho7_12inch*(tach12_7/60).^2*(R_12*2)^5;
mom8Scana_12inch = 0.5*rho8_12inch*(tach12_8/60).^2*(R_12*2)^5;
mom1Scana_13inch = 0.5*rho1_13inch*(tach13_1/60).^2*(R_13*2)^5;
mom2Scana_13inch = 0.5*rho2_13inch*(tach13_2/60).^2*(R_13*2)^5;
mom3Scana_13inch = 0.5*rho3_13inch*(tach13_3/60).^2*(R_13*2)^5;
mom4Scana_13inch = 0.5*rho4_13inch*(tach13_4/60).^2*(R_13*2)^5;
mom5Scana_13inch = 0.5*rho5_13inch*(tach13_5/60).^2*(R_13*2)^5;
mom6Scana_13inch = 0.5*rho6_13inch*(tach13_6/60).^2*(R_13*2)^5;
mom7Scana_13inch = 0.5*rho7_13inch*(tach13_7/60).^2*(R_13*2)^5;
mom8Scana_13inch = 0.5*rho8_13inch*(tach13_8/60).^2*(R_13*2)^5;
for1Scana_10inch = 0.5*rho1_10inch*(tach10_1/60).^2*(R_10*2)^4;
for2Scana_10inch = 0.5*rho2_10inch*(tach10_2/60).^2*(R_10*2)^4;
for3Scana_10inch = 0.5*rho3_10inch*(tach10_3/60).^2*(R_10*2)^4;
for4Scana_10inch = 0.5*rho4_10inch*(tach10_4/60).^2*(R_10*2)^4;
for5Scana_10inch = 0.5*rho5_10inch*(tach10_5/60).^2*(R_10*2)^4;
for6Scana_10inch = 0.5*rho6_10inch*(tach10_6/60).^2*(R_10*2)^4;
for7Scana_10inch = 0.5*rho7_10inch*(tach10_7/60).^2*(R_10*2)^4;
for8Scana_10inch = 0.5*rho8_10inch*(tach10_8/60).^2*(R_10*2)^4;
for1Scana_12inch = 0.5*rho1_12inch*(tach12_1/60).^2*(R_12*2)^4;
for2Scana_12inch = 0.5*rho2_12inch*(tach12_2/60).^2*(R_12*2)^4;
for3Scana_12inch = 0.5*rho3_12inch*(tach12_3/60).^2*(R_12*2)^4;
for4Scana_12inch = 0.5*rho4_12inch*(tach12_4/60).^2*(R_12*2)^4;
for5Scana_12inch = 0.5*rho5_12inch*(tach12_5/60).^2*(R_12*2)^4;
for6Scana_12inch = 0.5*rho6_12inch*(tach12_6/60).^2*(R_12*2)^4;
for7Scana_12inch = 0.5*rho7_12inch*(tach12_7/60).^2*(R_12*2)^4;
for8Scana_12inch = 0.5*rho8_12inch*(tach12_8/60).^2*(R_12*2)^4;
for1Scana_13inch = 0.5*rho1_13inch*(tach13_1/60).^2*(R_13*2)^4;
for2Scana_13inch = 0.5*rho2_13inch*(tach13_2/60).^2*(R_13*2)^4;
for3Scana_13inch = 0.5*rho3_13inch*(tach13_3/60).^2*(R_13*2)^4;
for4Scana_13inch = 0.5*rho4_13inch*(tach13_4/60).^2*(R_13*2)^4;
for5Scana_13inch = 0.5*rho5_13inch*(tach13_5/60).^2*(R_13*2)^4;
for6Scana_13inch = 0.5*rho6_13inch*(tach13_6/60).^2*(R_13*2)^4;
for7Scana_13inch = 0.5*rho7_13inch*(tach13_7/60).^2*(R_13*2)^4;
for8Scana_13inch = 0.5*rho8_13inch*(tach13_8/60).^2*(R_13*2)^4;

Cm1Scana_10inch  = abs(file1_10.result.Mx_points./mom1Scana_10inch);
Cm2Scana_10inch  = abs(file2_10.result.Mx_points./mom2Scana_10inch);
Cm3Scana_10inch  = abs(file3_10.result.Mx_points./mom3Scana_10inch);
Cm4Scana_10inch  = abs(file4_10.result.Mx_points./mom4Scana_10inch);
Cm5Scana_10inch  = abs(file5_10.result.Mx_points./mom5Scana_10inch);
Cm6Scana_10inch  = abs(file6_10.result.Mx_points./mom6Scana_10inch);
Cm7Scana_10inch  = abs(file7_10.result.Mx_points./mom7Scana_10inch);
Cm8Scana_10inch  = abs(file8_10.result.Mx_points./mom8Scana_10inch);
Cm1Scana_12inch  = abs(file1_12.result.Mx_points./mom1Scana_12inch);
Cm2Scana_12inch  = abs(file2_12.result.Mx_points./mom2Scana_12inch);
Cm3Scana_12inch  = abs(file3_12.result.Mx_points./mom3Scana_12inch);
Cm4Scana_12inch  = abs(file4_12.result.Mx_points./mom4Scana_12inch);
Cm5Scana_12inch  = abs(file5_12.result.Mx_points./mom5Scana_12inch);
Cm6Scana_12inch  = abs(file6_12.result.Mx_points./mom6Scana_12inch);
Cm7Scana_12inch  = abs(file7_12.result.Mx_points./mom7Scana_12inch);
Cm8Scana_12inch  = abs(file8_12.result.Mx_points./mom8Scana_12inch);
Cm1Scana_13inch  = abs(file1_13.result.Mx_points./mom1Scana_13inch);
Cm2Scana_13inch  = abs(file2_13.result.Mx_points./mom2Scana_13inch);
Cm3Scana_13inch  = abs(file3_13.result.Mx_points./mom3Scana_13inch);
Cm4Scana_13inch  = abs(file4_13.result.Mx_points./mom4Scana_13inch);
Cm5Scana_13inch  = abs(file5_13.result.Mx_points./mom5Scana_13inch);
Cm6Scana_13inch  = abs(file6_13.result.Mx_points./mom6Scana_13inch);
Cm7Scana_13inch  = abs(file7_13.result.Mx_points./mom7Scana_13inch);
Cm8Scana_13inch  = abs(file8_13.result.Mx_points./mom8Scana_13inch);
Cf1Scana_10inch  = abs(file1_10.result.Fy_points./for1Scana_10inch);
Cf2Scana_10inch  = abs(file2_10.result.Fy_points./for2Scana_10inch);
Cf3Scana_10inch  = abs(file3_10.result.Fy_points./for3Scana_10inch);
Cf4Scana_10inch  = abs(file4_10.result.Fy_points./for4Scana_10inch);
Cf5Scana_10inch  = abs(file5_10.result.Fy_points./for5Scana_10inch);
Cf6Scana_10inch  = abs(file6_10.result.Fy_points./for6Scana_10inch);
Cf7Scana_10inch  = abs(file7_10.result.Fy_points./for7Scana_10inch);
Cf8Scana_10inch  = abs(file8_10.result.Fy_points./for8Scana_10inch);
Cf1Scana_12inch  = abs(file1_12.result.Fy_points./for1Scana_12inch);
Cf2Scana_12inch  = abs(file2_12.result.Fy_points./for2Scana_12inch);
Cf3Scana_12inch  = abs(file3_12.result.Fy_points./for3Scana_12inch);
Cf4Scana_12inch  = abs(file4_12.result.Fy_points./for4Scana_12inch);
Cf5Scana_12inch  = abs(file5_12.result.Fy_points./for5Scana_12inch);
Cf6Scana_12inch  = abs(file6_12.result.Fy_points./for6Scana_12inch);
Cf7Scana_12inch  = abs(file7_12.result.Fy_points./for7Scana_12inch);
Cf8Scana_12inch  = abs(file8_12.result.Fy_points./for8Scana_12inch);
Cf1Scana_13inch  = abs(file1_13.result.Fy_points./for1Scana_13inch);
Cf2Scana_13inch  = abs(file2_13.result.Fy_points./for2Scana_13inch);
Cf3Scana_13inch  = abs(file3_13.result.Fy_points./for3Scana_13inch);
Cf4Scana_13inch  = abs(file4_13.result.Fy_points./for4Scana_13inch);
Cf5Scana_13inch  = abs(file5_13.result.Fy_points./for5Scana_13inch);
Cf6Scana_13inch  = abs(file6_13.result.Fy_points./for6Scana_13inch);
Cf7Scana_13inch  = abs(file7_13.result.Fy_points./for7Scana_13inch);
Cf8Scana_13inch  = abs(file8_13.result.Fy_points./for8Scana_13inch);


Ct1Scana_10inch  = abs(file1_10.result.Fz_points./for1Scana_10inch);
Ct2Scana_10inch  = abs(file2_10.result.Fz_points./for2Scana_10inch);
Ct3Scana_10inch  = abs(file3_10.result.Fz_points./for3Scana_10inch);
Ct4Scana_10inch  = abs(file4_10.result.Fz_points./for4Scana_10inch);
Ct5Scana_10inch  = abs(file5_10.result.Fz_points./for5Scana_10inch);
Ct6Scana_10inch  = abs(file6_10.result.Fz_points./for6Scana_10inch);
Ct7Scana_10inch  = abs(file7_10.result.Fz_points./for7Scana_10inch);
Ct8Scana_10inch  = abs(file8_10.result.Fz_points./for8Scana_10inch);
Ct1Scana_12inch  = abs(file1_12.result.Fz_points./for1Scana_12inch);
Ct2Scana_12inch  = abs(file2_12.result.Fz_points./for2Scana_12inch);
Ct3Scana_12inch  = abs(file3_12.result.Fz_points./for3Scana_12inch);
Ct4Scana_12inch  = abs(file4_12.result.Fz_points./for4Scana_12inch);
Ct5Scana_12inch  = abs(file5_12.result.Fz_points./for5Scana_12inch);
Ct6Scana_12inch  = abs(file6_12.result.Fz_points./for6Scana_12inch);
Ct7Scana_12inch  = abs(file7_12.result.Fz_points./for7Scana_12inch);
Ct8Scana_12inch  = abs(file8_12.result.Fz_points./for8Scana_12inch);
Ct1Scana_13inch  = abs(file1_13.result.Fz_points./for1Scana_13inch);
Ct2Scana_13inch  = abs(file2_13.result.Fz_points./for2Scana_13inch);
Ct3Scana_13inch  = abs(file3_13.result.Fz_points./for3Scana_13inch);
Ct4Scana_13inch  = abs(file4_13.result.Fz_points./for4Scana_13inch);
Ct5Scana_13inch  = abs(file5_13.result.Fz_points./for5Scana_13inch);
Ct6Scana_13inch  = abs(file6_13.result.Fz_points./for6Scana_13inch);
Ct7Scana_13inch  = abs(file7_13.result.Fz_points./for7Scana_13inch);
Ct8Scana_13inch  = abs(file8_13.result.Fz_points./for8Scana_13inch);


Ct_txc1_10inch_Fz1  = file11.txcWall10.Ct1{1};
Ct_txc1_10inch_Fz2  = file11.txcWall10.Ct1{2};
Ct_txc1_10inch_RPM1 = file11.txcWall10.Ct1{3};
Ct_txc1_10inch_RPM2 = file11.txcWall10.Ct1{4};
Ct_txc2_10inch_Fz1  = file11.txcWall10.Ct2{1};
Ct_txc2_10inch_Fz2  = file11.txcWall10.Ct2{2};
Ct_txc2_10inch_RPM1 = file11.txcWall10.Ct2{3};
Ct_txc2_10inch_RPM2 = file11.txcWall10.Ct2{4};
Ct_txc3_10inch_Fz1  = file11.txcWall10.Ct3{1};
Ct_txc3_10inch_Fz2  = file11.txcWall10.Ct3{2};
Ct_txc3_10inch_RPM1 = file11.txcWall10.Ct3{3};
Ct_txc3_10inch_RPM2 = file11.txcWall10.Ct3{4};
Ct_txc4_10inch_Fz1  = file11.txcWall10.Ct4{1};
Ct_txc4_10inch_Fz2  = file11.txcWall10.Ct4{2};
Ct_txc4_10inch_RPM1 = file11.txcWall10.Ct4{3};
Ct_txc4_10inch_RPM2 = file11.txcWall10.Ct4{4};
Ct_txc5_10inch_Fz1  = file11.txcWall10.Ct5{1};
Ct_txc5_10inch_Fz2  = file11.txcWall10.Ct5{2};
Ct_txc5_10inch_RPM1 = file11.txcWall10.Ct5{3};
Ct_txc5_10inch_RPM2 = file11.txcWall10.Ct5{4};
Ct_txc6_10inch_Fz1  = file11.txcWall10.Ct6{1};
Ct_txc6_10inch_Fz2  = file11.txcWall10.Ct6{2};
Ct_txc6_10inch_RPM1 = file11.txcWall10.Ct6{3};
Ct_txc6_10inch_RPM2 = file11.txcWall10.Ct6{4};

Ct_txc1_12inch_Fz1  = file11.txcWall12.Ct1{1};
Ct_txc1_12inch_Fz2  = file11.txcWall12.Ct1{2};
Ct_txc1_12inch_RPM1 = file11.txcWall12.Ct1{3};
Ct_txc1_12inch_RPM2 = file11.txcWall12.Ct1{4};
Ct_txc2_12inch_Fz1  = file11.txcWall12.Ct2{1};
Ct_txc2_12inch_Fz2  = file11.txcWall12.Ct2{2};
Ct_txc2_12inch_RPM1 = file11.txcWall12.Ct2{3};
Ct_txc2_12inch_RPM2 = file11.txcWall12.Ct2{4};
Ct_txc3_12inch_Fz1  = file11.txcWall12.Ct3{1};
Ct_txc3_12inch_Fz2  = file11.txcWall12.Ct3{2};
Ct_txc3_12inch_RPM1 = file11.txcWall12.Ct3{3};
Ct_txc3_12inch_RPM2 = file11.txcWall12.Ct3{4};
Ct_txc4_12inch_Fz1  = file11.txcWall12.Ct4{1};
Ct_txc4_12inch_Fz2  = file11.txcWall12.Ct4{2};
Ct_txc4_12inch_RPM1 = file11.txcWall12.Ct4{3};
Ct_txc4_12inch_RPM2 = file11.txcWall12.Ct4{4};
Ct_txc5_12inch_Fz1  = file11.txcWall12.Ct5{1};
Ct_txc5_12inch_Fz2  = file11.txcWall12.Ct5{2};
Ct_txc5_12inch_RPM1 = file11.txcWall12.Ct5{3};
Ct_txc5_12inch_RPM2 = file11.txcWall12.Ct5{4};
Ct_txc6_12inch_Fz1  = file11.txcWall12.Ct6{1};
Ct_txc6_12inch_Fz2  = file11.txcWall12.Ct6{2};
Ct_txc6_12inch_RPM1 = file11.txcWall12.Ct6{3};
Ct_txc6_12inch_RPM2 = file11.txcWall12.Ct6{4};

Temp1_10inch_txc = file11.txcWall10.temp1;
Temp2_10inch_txc = file11.txcWall10.temp2;
Temp3_10inch_txc = file11.txcWall10.temp3;
Temp4_10inch_txc = file11.txcWall10.temp4;
Temp5_10inch_txc = file11.txcWall10.temp5;
Temp6_10inch_txc = file11.txcWall10.temp6;
Pres1_10inch_txc = file11.txcWall10.pres1;
Pres2_10inch_txc = file11.txcWall10.pres2;
Pres3_10inch_txc = file11.txcWall10.pres3;
Pres4_10inch_txc = file11.txcWall10.pres4;
Pres5_10inch_txc = file11.txcWall10.pres5;
Pres6_10inch_txc = file11.txcWall10.pres6;

Temp1_12inch_txc = file11.txcWall12.temp1;
Temp2_12inch_txc = file11.txcWall12.temp2;
Temp3_12inch_txc = file11.txcWall12.temp3;
Temp4_12inch_txc = file11.txcWall12.temp4;
Temp5_12inch_txc = file11.txcWall12.temp5;
Temp6_12inch_txc = file11.txcWall12.temp6;
Pres1_12inch_txc = file11.txcWall12.pres1;
Pres2_12inch_txc = file11.txcWall12.pres2;
Pres3_12inch_txc = file11.txcWall12.pres3;
Pres4_12inch_txc = file11.txcWall12.pres4;
Pres5_12inch_txc = file11.txcWall12.pres5;
Pres6_12inch_txc = file11.txcWall12.pres6;

rho1_10inch_txc = Pres1_10inch_txc/(R_constant*(Temp1_10inch_txc+toKelvin));
rho2_10inch_txc = Pres2_10inch_txc/(R_constant*(Temp2_10inch_txc+toKelvin));
rho3_10inch_txc = Pres3_10inch_txc/(R_constant*(Temp3_10inch_txc+toKelvin));
rho4_10inch_txc = Pres4_10inch_txc/(R_constant*(Temp4_10inch_txc+toKelvin));
rho5_10inch_txc = Pres5_10inch_txc/(R_constant*(Temp5_10inch_txc+toKelvin));
rho6_10inch_txc = Pres6_10inch_txc/(R_constant*(Temp6_10inch_txc+toKelvin));

rho1_12inch_txc = Pres1_12inch_txc/(R_constant*(Temp1_12inch_txc+toKelvin));
rho2_12inch_txc = Pres2_12inch_txc/(R_constant*(Temp2_12inch_txc+toKelvin));
rho3_12inch_txc = Pres3_12inch_txc/(R_constant*(Temp3_12inch_txc+toKelvin));
rho4_12inch_txc = Pres4_12inch_txc/(R_constant*(Temp4_12inch_txc+toKelvin));
rho5_12inch_txc = Pres5_12inch_txc/(R_constant*(Temp5_12inch_txc+toKelvin));
rho6_12inch_txc = Pres6_12inch_txc/(R_constant*(Temp6_12inch_txc+toKelvin));

distances_txc = [1,1.5,2,2.5,3,10];

rpm10 = [3,9,4,10];  %%% Levels to be taken for equal RPM comparison
rpm12 = [3,9,5,11];  %%% Levels to be taken for equal RPM comparison
rpm13 = [6,12,5,11];  %%% Levels to be taken for equal RPM comparison
Fz10  = [4,10,5,11,6,12,7,13]; %%% Levels to be taken for equal Fz comparison
Fz12  = [4,10,5,11,6,12,7,13]; %%% Levels to be taken for equal Fz comparison
Fz13  = [3,6,4,10,5,11,7,13]; %%% Levels to be taken for equal Fz comparison



% figure()
% hold on;grid on;
% plot(rpm10,Cm1Scana_10inch(rpm10),'o','color','r','markersize',7,'lineWidth',2);
% plot(rpm10,Cm2Scana_10inch(rpm10),'o','color','g','markersize',7,'lineWidth',2);
% plot(rpm10,Cm3Scana_10inch(rpm10),'o','color','b','markersize',7,'lineWidth',2);
% plot(rpm10,Cm4Scana_10inch(rpm10),'o','color','m','markersize',7,'lineWidth',2);
% plot(rpm10,Cm5Scana_10inch(rpm10),'o','color','c','markersize',7,'lineWidth',2);
% plot(rpm10,Cm6Scana_10inch(rpm10),'o','color','k','markersize',7,'lineWidth',2);
% plot(rpm12,Cm1Scana_12inch(rpm12),'x','color','r','markersize',7,'lineWidth',2);
% plot(rpm12,Cm2Scana_12inch(rpm12),'x','color','g','markersize',7,'lineWidth',2);
% plot(rpm12,Cm3Scana_12inch(rpm12),'x','color','b','markersize',7,'lineWidth',2);
% plot(rpm12,Cm4Scana_12inch(rpm12),'x','color','m','markersize',7,'lineWidth',2);
% plot(rpm12,Cm5Scana_12inch(rpm12),'x','color','c','markersize',7,'lineWidth',2);
% plot(rpm12,Cm6Scana_12inch(rpm12),'x','color','k','markersize',7,'lineWidth',2);





Cm1_off_10inches_RPM_1 = mean([Cm1Scana_10inch(rpm10(1)),Cm1Scana_10inch(rpm10(2))]);
Cm2_off_10inches_RPM_1 = mean([Cm2Scana_10inch(rpm10(1)),Cm2Scana_10inch(rpm10(2))]);
Cm3_off_10inches_RPM_1 = mean([Cm3Scana_10inch(rpm10(1)),Cm3Scana_10inch(rpm10(2))]);
Cm4_off_10inches_RPM_1 = mean([Cm4Scana_10inch(rpm10(1)),Cm4Scana_10inch(rpm10(2))]);
Cm5_off_10inches_RPM_1 = mean([Cm5Scana_10inch(rpm10(1)),Cm5Scana_10inch(rpm10(2))]);
Cm6_off_10inches_RPM_1 = mean([Cm6Scana_10inch(rpm10(1)),Cm6Scana_10inch(rpm10(2))]);
Cm7_off_10inches_RPM_1 = mean([Cm7Scana_10inch(rpm10(1)),Cm7Scana_10inch(rpm10(2))]);
Cm8_off_10inches_RPM_1 = mean([Cm8Scana_10inch(rpm10(1)),Cm8Scana_10inch(rpm10(2))]);
Cf1_off_10inches_RPM_1 = mean([Cf1Scana_10inch(rpm10(1)),Cf1Scana_10inch(rpm10(2))]);
Cf2_off_10inches_RPM_1 = mean([Cf2Scana_10inch(rpm10(1)),Cf2Scana_10inch(rpm10(2))]);
Cf3_off_10inches_RPM_1 = mean([Cf3Scana_10inch(rpm10(1)),Cf3Scana_10inch(rpm10(2))]);
Cf4_off_10inches_RPM_1 = mean([Cf4Scana_10inch(rpm10(1)),Cf4Scana_10inch(rpm10(2))]);
Cf5_off_10inches_RPM_1 = mean([Cf5Scana_10inch(rpm10(1)),Cf5Scana_10inch(rpm10(2))]);
Cf6_off_10inches_RPM_1 = mean([Cf6Scana_10inch(rpm10(1)),Cf6Scana_10inch(rpm10(2))]);
Cf7_off_10inches_RPM_1 = mean([Cf7Scana_10inch(rpm10(1)),Cf7Scana_10inch(rpm10(2))]);
Cf8_off_10inches_RPM_1 = mean([Cf8Scana_10inch(rpm10(1)),Cf8Scana_10inch(rpm10(2))]);
Ct1_off_10inches_RPM_1 = mean([Ct1Scana_10inch(rpm10(1)),Ct1Scana_10inch(rpm10(2))]);
Ct2_off_10inches_RPM_1 = mean([Ct2Scana_10inch(rpm10(1)),Ct2Scana_10inch(rpm10(2))]);
Ct3_off_10inches_RPM_1 = mean([Ct3Scana_10inch(rpm10(1)),Ct3Scana_10inch(rpm10(2))]);
Ct4_off_10inches_RPM_1 = mean([Ct4Scana_10inch(rpm10(1)),Ct4Scana_10inch(rpm10(2))]);
Ct5_off_10inches_RPM_1 = mean([Ct5Scana_10inch(rpm10(1)),Ct5Scana_10inch(rpm10(2))]);
Ct6_off_10inches_RPM_1 = mean([Ct6Scana_10inch(rpm10(1)),Ct6Scana_10inch(rpm10(2))]);
Ct7_off_10inches_RPM_1 = mean([Ct7Scana_10inch(rpm10(1)),Ct7Scana_10inch(rpm10(2))]);
Ct8_off_10inches_RPM_1 = mean([Ct8Scana_10inch(rpm10(1)),Ct8Scana_10inch(rpm10(2))]);
Cm1_off_12inches_RPM_1 = mean([Cm1Scana_12inch(rpm12(1)),Cm1Scana_12inch(rpm12(2))]);
Cm2_off_12inches_RPM_1 = mean([Cm2Scana_12inch(rpm12(1)),Cm2Scana_12inch(rpm12(2))]);
Cm3_off_12inches_RPM_1 = mean([Cm3Scana_12inch(rpm12(1)),Cm3Scana_12inch(rpm12(2))]);
Cm4_off_12inches_RPM_1 = mean([Cm4Scana_12inch(rpm12(1)),Cm4Scana_12inch(rpm12(2))]);
Cm5_off_12inches_RPM_1 = mean([Cm5Scana_12inch(rpm12(1)),Cm5Scana_12inch(rpm12(2))]);
Cm6_off_12inches_RPM_1 = mean([Cm6Scana_12inch(rpm12(1)),Cm6Scana_12inch(rpm12(2))]);
Cm7_off_12inches_RPM_1 = mean([Cm7Scana_12inch(rpm12(1)),Cm7Scana_12inch(rpm12(2))]);
Cm8_off_12inches_RPM_1 = mean([Cm8Scana_12inch(rpm12(1)),Cm8Scana_12inch(rpm12(2))]);
Cf1_off_12inches_RPM_1 = mean([Cf1Scana_12inch(rpm12(1)),Cf1Scana_12inch(rpm12(2))]);
Cf2_off_12inches_RPM_1 = mean([Cf2Scana_12inch(rpm12(1)),Cf2Scana_12inch(rpm12(2))]);
Cf3_off_12inches_RPM_1 = mean([Cf3Scana_12inch(rpm12(1)),Cf3Scana_12inch(rpm12(2))]);
Cf4_off_12inches_RPM_1 = mean([Cf4Scana_12inch(rpm12(1)),Cf4Scana_12inch(rpm12(2))]);
Cf5_off_12inches_RPM_1 = mean([Cf5Scana_12inch(rpm12(1)),Cf5Scana_12inch(rpm12(2))]);
Cf6_off_12inches_RPM_1 = mean([Cf6Scana_12inch(rpm12(1)),Cf6Scana_12inch(rpm12(2))]);
Cf7_off_12inches_RPM_1 = mean([Cf7Scana_12inch(rpm12(1)),Cf7Scana_12inch(rpm12(2))]);
Cf8_off_12inches_RPM_1 = mean([Cf8Scana_12inch(rpm12(1)),Cf8Scana_12inch(rpm12(2))]);
Ct1_off_12inches_RPM_1 = mean([Ct1Scana_12inch(rpm12(1)),Ct1Scana_12inch(rpm12(2))]);
Ct2_off_12inches_RPM_1 = mean([Ct2Scana_12inch(rpm12(1)),Ct2Scana_12inch(rpm12(2))]);
Ct3_off_12inches_RPM_1 = mean([Ct3Scana_12inch(rpm12(1)),Ct3Scana_12inch(rpm12(2))]);
Ct4_off_12inches_RPM_1 = mean([Ct4Scana_12inch(rpm12(1)),Ct4Scana_12inch(rpm12(2))]);
Ct5_off_12inches_RPM_1 = mean([Ct5Scana_12inch(rpm12(1)),Ct5Scana_12inch(rpm12(2))]);
Ct6_off_12inches_RPM_1 = mean([Ct6Scana_12inch(rpm12(1)),Ct6Scana_12inch(rpm12(2))]);
Ct7_off_12inches_RPM_1 = mean([Ct7Scana_12inch(rpm12(1)),Ct7Scana_12inch(rpm12(2))]);
Ct8_off_12inches_RPM_1 = mean([Ct8Scana_12inch(rpm12(1)),Ct8Scana_12inch(rpm12(2))]);
Cm1_off_13inches_RPM_1 = mean([Cm1Scana_13inch(rpm13(1)),Cm1Scana_13inch(rpm13(2))]);
Cm2_off_13inches_RPM_1 = mean([Cm2Scana_13inch(rpm13(1)),Cm2Scana_13inch(rpm13(2))]);
Cm3_off_13inches_RPM_1 = mean([Cm3Scana_13inch(rpm13(1)),Cm3Scana_13inch(rpm13(2))]);
Cm4_off_13inches_RPM_1 = mean([Cm4Scana_13inch(rpm13(1)),Cm4Scana_13inch(rpm13(2))]);
Cm5_off_13inches_RPM_1 = mean([Cm5Scana_13inch(rpm13(1)),Cm5Scana_13inch(rpm13(2))]);
Cm6_off_13inches_RPM_1 = mean([Cm6Scana_13inch(rpm13(1)),Cm6Scana_13inch(rpm13(2))]);
Cm7_off_13inches_RPM_1 = mean([Cm7Scana_13inch(rpm13(1)),Cm7Scana_13inch(rpm13(2))]);
Cm8_off_13inches_RPM_1 = mean([Cm8Scana_13inch(rpm13(1)),Cm8Scana_13inch(rpm13(2))]);
Cf1_off_13inches_RPM_1 = mean([Cf1Scana_13inch(rpm13(1)),Cf1Scana_13inch(rpm13(2))]);
Cf2_off_13inches_RPM_1 = mean([Cf2Scana_13inch(rpm13(1)),Cf2Scana_13inch(rpm13(2))]);
Cf3_off_13inches_RPM_1 = mean([Cf3Scana_13inch(rpm13(1)),Cf3Scana_13inch(rpm13(2))]);
Cf4_off_13inches_RPM_1 = mean([Cf4Scana_13inch(rpm13(1)),Cf4Scana_13inch(rpm13(2))]);
Cf5_off_13inches_RPM_1 = mean([Cf5Scana_13inch(rpm13(1)),Cf5Scana_13inch(rpm13(2))]);
Cf6_off_13inches_RPM_1 = mean([Cf6Scana_13inch(rpm13(1)),Cf6Scana_13inch(rpm13(2))]);
Cf7_off_13inches_RPM_1 = mean([Cf7Scana_13inch(rpm13(1)),Cf7Scana_13inch(rpm13(2))]);
Cf8_off_13inches_RPM_1 = mean([Cf8Scana_13inch(rpm13(1)),Cf8Scana_13inch(rpm13(2))]);
Ct1_off_13inches_RPM_1 = mean([Ct1Scana_13inch(rpm13(1)),Ct1Scana_13inch(rpm13(2))]);
Ct2_off_13inches_RPM_1 = mean([Ct2Scana_13inch(rpm13(1)),Ct2Scana_13inch(rpm13(2))]);
Ct3_off_13inches_RPM_1 = mean([Ct3Scana_13inch(rpm13(1)),Ct3Scana_13inch(rpm13(2))]);
Ct4_off_13inches_RPM_1 = mean([Ct4Scana_13inch(rpm13(1)),Ct4Scana_13inch(rpm13(2))]);
Ct5_off_13inches_RPM_1 = mean([Ct5Scana_13inch(rpm13(1)),Ct5Scana_13inch(rpm13(2))]);
Ct6_off_13inches_RPM_1 = mean([Ct6Scana_13inch(rpm13(1)),Ct6Scana_13inch(rpm13(2))]);
Ct7_off_13inches_RPM_1 = mean([Ct7Scana_13inch(rpm13(1)),Ct7Scana_13inch(rpm13(2))]);
Ct8_off_13inches_RPM_1 = mean([Ct8Scana_13inch(rpm13(1)),Ct8Scana_13inch(rpm13(2))]);

Cm1_off_10inches_RPM_2 = mean([Cm1Scana_10inch(rpm10(3)),Cm1Scana_10inch(rpm10(4))]);
Cm2_off_10inches_RPM_2 = mean([Cm2Scana_10inch(rpm10(3)),Cm2Scana_10inch(rpm10(4))]);
Cm3_off_10inches_RPM_2 = mean([Cm3Scana_10inch(rpm10(3)),Cm3Scana_10inch(rpm10(4))]);
Cm4_off_10inches_RPM_2 = mean([Cm4Scana_10inch(rpm10(3)),Cm4Scana_10inch(rpm10(4))]);
Cm5_off_10inches_RPM_2 = mean([Cm5Scana_10inch(rpm10(3)),Cm5Scana_10inch(rpm10(4))]);
Cm6_off_10inches_RPM_2 = mean([Cm6Scana_10inch(rpm10(3)),Cm6Scana_10inch(rpm10(4))]);
Cm7_off_10inches_RPM_2 = mean([Cm7Scana_10inch(rpm10(3)),Cm7Scana_10inch(rpm10(4))]);
Cm8_off_10inches_RPM_2 = mean([Cm8Scana_10inch(rpm10(3)),Cm8Scana_10inch(rpm10(4))]);
Cf1_off_10inches_RPM_2 = mean([Cf1Scana_10inch(rpm10(3)),Cf1Scana_10inch(rpm10(4))]);
Cf2_off_10inches_RPM_2 = mean([Cf2Scana_10inch(rpm10(3)),Cf2Scana_10inch(rpm10(4))]);
Cf3_off_10inches_RPM_2 = mean([Cf3Scana_10inch(rpm10(3)),Cf3Scana_10inch(rpm10(4))]);
Cf4_off_10inches_RPM_2 = mean([Cf4Scana_10inch(rpm10(3)),Cf4Scana_10inch(rpm10(4))]);
Cf5_off_10inches_RPM_2 = mean([Cf5Scana_10inch(rpm10(3)),Cf5Scana_10inch(rpm10(4))]);
Cf6_off_10inches_RPM_2 = mean([Cf6Scana_10inch(rpm10(3)),Cf6Scana_10inch(rpm10(4))]);
Cf7_off_10inches_RPM_2 = mean([Cf7Scana_10inch(rpm10(3)),Cf7Scana_10inch(rpm10(4))]);
Cf8_off_10inches_RPM_2 = mean([Cf8Scana_10inch(rpm10(3)),Cf8Scana_10inch(rpm10(4))]);
Ct1_off_10inches_RPM_2 = mean([Ct1Scana_10inch(rpm10(3)),Ct1Scana_10inch(rpm10(4))]);
Ct2_off_10inches_RPM_2 = mean([Ct2Scana_10inch(rpm10(3)),Ct2Scana_10inch(rpm10(4))]);
Ct3_off_10inches_RPM_2 = mean([Ct3Scana_10inch(rpm10(3)),Ct3Scana_10inch(rpm10(4))]);
Ct4_off_10inches_RPM_2 = mean([Ct4Scana_10inch(rpm10(3)),Ct4Scana_10inch(rpm10(4))]);
Ct5_off_10inches_RPM_2 = mean([Ct5Scana_10inch(rpm10(3)),Ct5Scana_10inch(rpm10(4))]);
Ct6_off_10inches_RPM_2 = mean([Ct6Scana_10inch(rpm10(3)),Ct6Scana_10inch(rpm10(4))]);
Ct7_off_10inches_RPM_2 = mean([Ct7Scana_10inch(rpm10(3)),Ct7Scana_10inch(rpm10(4))]);
Ct8_off_10inches_RPM_2 = mean([Ct8Scana_10inch(rpm10(3)),Ct8Scana_10inch(rpm10(4))]);
Cm1_off_12inches_RPM_2 = mean([Cm1Scana_12inch(rpm12(3)),Cm1Scana_12inch(rpm12(4))]);
Cm2_off_12inches_RPM_2 = mean([Cm2Scana_12inch(rpm12(3)),Cm2Scana_12inch(rpm12(4))]);
Cm3_off_12inches_RPM_2 = mean([Cm3Scana_12inch(rpm12(3)),Cm3Scana_12inch(rpm12(4))]);
Cm4_off_12inches_RPM_2 = mean([Cm4Scana_12inch(rpm12(3)),Cm4Scana_12inch(rpm12(4))]);
Cm5_off_12inches_RPM_2 = mean([Cm5Scana_12inch(rpm12(3)),Cm5Scana_12inch(rpm12(4))]);
Cm6_off_12inches_RPM_2 = mean([Cm6Scana_12inch(rpm12(3)),Cm6Scana_12inch(rpm12(4))]);
Cm7_off_12inches_RPM_2 = mean([Cm7Scana_12inch(rpm12(3)),Cm7Scana_12inch(rpm12(4))]);
Cm8_off_12inches_RPM_2 = mean([Cm8Scana_12inch(rpm12(3)),Cm8Scana_12inch(rpm12(4))]);
Cf1_off_12inches_RPM_2 = mean([Cf1Scana_12inch(rpm12(3)),Cf1Scana_12inch(rpm12(4))]);
Cf2_off_12inches_RPM_2 = mean([Cf2Scana_12inch(rpm12(3)),Cf2Scana_12inch(rpm12(4))]);
Cf3_off_12inches_RPM_2 = mean([Cf3Scana_12inch(rpm12(3)),Cf3Scana_12inch(rpm12(4))]);
Cf4_off_12inches_RPM_2 = mean([Cf4Scana_12inch(rpm12(3)),Cf4Scana_12inch(rpm12(4))]);
Cf5_off_12inches_RPM_2 = mean([Cf5Scana_12inch(rpm12(3)),Cf5Scana_12inch(rpm12(4))]);
Cf6_off_12inches_RPM_2 = mean([Cf6Scana_12inch(rpm12(3)),Cf6Scana_12inch(rpm12(4))]);
Cf7_off_12inches_RPM_2 = mean([Cf7Scana_12inch(rpm12(3)),Cf7Scana_12inch(rpm12(4))]);
Cf8_off_12inches_RPM_2 = mean([Cf8Scana_12inch(rpm12(3)),Cf8Scana_12inch(rpm12(4))]);
Ct1_off_12inches_RPM_2 = mean([Ct1Scana_12inch(rpm12(3)),Ct1Scana_12inch(rpm12(4))]);
Ct2_off_12inches_RPM_2 = mean([Ct2Scana_12inch(rpm12(3)),Ct2Scana_12inch(rpm12(4))]);
Ct3_off_12inches_RPM_2 = mean([Ct3Scana_12inch(rpm12(3)),Ct3Scana_12inch(rpm12(4))]);
Ct4_off_12inches_RPM_2 = mean([Ct4Scana_12inch(rpm12(3)),Ct4Scana_12inch(rpm12(4))]);
Ct5_off_12inches_RPM_2 = mean([Ct5Scana_12inch(rpm12(3)),Ct5Scana_12inch(rpm12(4))]);
Ct6_off_12inches_RPM_2 = mean([Ct6Scana_12inch(rpm12(3)),Ct6Scana_12inch(rpm12(4))]);
Ct7_off_12inches_RPM_2 = mean([Ct7Scana_12inch(rpm12(3)),Ct7Scana_12inch(rpm12(4))]);
Ct8_off_12inches_RPM_2 = mean([Ct8Scana_12inch(rpm12(3)),Ct8Scana_12inch(rpm12(4))]);
Cm1_off_13inches_RPM_2 = mean([Cm1Scana_13inch(rpm13(3)),Cm1Scana_13inch(rpm13(4))]);
Cm2_off_13inches_RPM_2 = mean([Cm2Scana_13inch(rpm13(3)),Cm2Scana_13inch(rpm13(4))]);
Cm3_off_13inches_RPM_2 = mean([Cm3Scana_13inch(rpm13(3)),Cm3Scana_13inch(rpm13(4))]);
Cm4_off_13inches_RPM_2 = mean([Cm4Scana_13inch(rpm13(3)),Cm4Scana_13inch(rpm13(4))]);
Cm5_off_13inches_RPM_2 = mean([Cm5Scana_13inch(rpm13(3)),Cm5Scana_13inch(rpm13(4))]);
Cm6_off_13inches_RPM_2 = mean([Cm6Scana_13inch(rpm13(3)),Cm6Scana_13inch(rpm13(4))]);
Cm7_off_13inches_RPM_2 = mean([Cm7Scana_13inch(rpm13(3)),Cm7Scana_13inch(rpm13(4))]);
Cm8_off_13inches_RPM_2 = mean([Cm8Scana_13inch(rpm13(3)),Cm8Scana_13inch(rpm13(4))]);
Cf1_off_13inches_RPM_2 = mean([Cf1Scana_13inch(rpm13(3)),Cf1Scana_13inch(rpm13(4))]);
Cf2_off_13inches_RPM_2 = mean([Cf2Scana_13inch(rpm13(3)),Cf2Scana_13inch(rpm13(4))]);
Cf3_off_13inches_RPM_2 = mean([Cf3Scana_13inch(rpm13(3)),Cf3Scana_13inch(rpm13(4))]);
Cf4_off_13inches_RPM_2 = mean([Cf4Scana_13inch(rpm13(3)),Cf4Scana_13inch(rpm13(4))]);
Cf5_off_13inches_RPM_2 = mean([Cf5Scana_13inch(rpm13(3)),Cf5Scana_13inch(rpm13(4))]);
Cf6_off_13inches_RPM_2 = mean([Cf6Scana_13inch(rpm13(3)),Cf6Scana_13inch(rpm13(4))]);
Cf7_off_13inches_RPM_2 = mean([Cf7Scana_13inch(rpm13(3)),Cf7Scana_13inch(rpm13(4))]);
Cf8_off_13inches_RPM_2 = mean([Cf8Scana_13inch(rpm13(3)),Cf8Scana_13inch(rpm13(4))]);
Ct1_off_13inches_RPM_2 = mean([Ct1Scana_13inch(rpm13(3)),Ct1Scana_13inch(rpm13(4))]);
Ct2_off_13inches_RPM_2 = mean([Ct2Scana_13inch(rpm13(3)),Ct2Scana_13inch(rpm13(4))]);
Ct3_off_13inches_RPM_2 = mean([Ct3Scana_13inch(rpm13(3)),Ct3Scana_13inch(rpm13(4))]);
Ct4_off_13inches_RPM_2 = mean([Ct4Scana_13inch(rpm13(3)),Ct4Scana_13inch(rpm13(4))]);
Ct5_off_13inches_RPM_2 = mean([Ct5Scana_13inch(rpm13(3)),Ct5Scana_13inch(rpm13(4))]);
Ct6_off_13inches_RPM_2 = mean([Ct6Scana_13inch(rpm13(3)),Ct6Scana_13inch(rpm13(4))]);
Ct7_off_13inches_RPM_2 = mean([Ct7Scana_13inch(rpm13(3)),Ct7Scana_13inch(rpm13(4))]);
Ct8_off_13inches_RPM_2 = mean([Ct8Scana_13inch(rpm13(3)),Ct8Scana_13inch(rpm13(4))]);


Cm1_off_10inches_Fz_1 = mean([Cm1Scana_10inch(Fz10(1)),Cm1Scana_10inch(Fz10(2))]);
Cm2_off_10inches_Fz_1 = mean([Cm2Scana_10inch(Fz10(1)),Cm2Scana_10inch(Fz10(2))]);
Cm3_off_10inches_Fz_1 = mean([Cm3Scana_10inch(Fz10(1)),Cm3Scana_10inch(Fz10(2))]);
Cm4_off_10inches_Fz_1 = mean([Cm4Scana_10inch(Fz10(1)),Cm4Scana_10inch(Fz10(2))]);
Cm5_off_10inches_Fz_1 = mean([Cm5Scana_10inch(Fz10(1)),Cm5Scana_10inch(Fz10(2))]);
Cm6_off_10inches_Fz_1 = mean([Cm6Scana_10inch(Fz10(1)),Cm6Scana_10inch(Fz10(2))]);
Cm7_off_10inches_Fz_1 = mean([Cm7Scana_10inch(Fz10(1)),Cm7Scana_10inch(Fz10(2))]);
Cm8_off_10inches_Fz_1 = mean([Cm8Scana_10inch(Fz10(1)),Cm8Scana_10inch(Fz10(2))]);
Cm1_off_10inches_Fz_2 = mean([Cm1Scana_10inch(Fz10(3)),Cm1Scana_10inch(Fz10(4))]);
Cm2_off_10inches_Fz_2 = mean([Cm2Scana_10inch(Fz10(3)),Cm2Scana_10inch(Fz10(4))]);
Cm3_off_10inches_Fz_2 = mean([Cm3Scana_10inch(Fz10(3)),Cm3Scana_10inch(Fz10(4))]);
Cm4_off_10inches_Fz_2 = mean([Cm4Scana_10inch(Fz10(3)),Cm4Scana_10inch(Fz10(4))]);
Cm5_off_10inches_Fz_2 = mean([Cm5Scana_10inch(Fz10(3)),Cm5Scana_10inch(Fz10(4))]);
Cm6_off_10inches_Fz_2 = mean([Cm6Scana_10inch(Fz10(3)),Cm6Scana_10inch(Fz10(4))]);
Cm7_off_10inches_Fz_2 = mean([Cm7Scana_10inch(Fz10(3)),Cm7Scana_10inch(Fz10(4))]);
Cm8_off_10inches_Fz_2 = mean([Cm8Scana_10inch(Fz10(3)),Cm8Scana_10inch(Fz10(4))]);
Cm1_off_10inches_Fz_3 = mean([Cm1Scana_10inch(Fz10(5)),Cm1Scana_10inch(Fz10(6))]);
Cm2_off_10inches_Fz_3 = mean([Cm2Scana_10inch(Fz10(5)),Cm2Scana_10inch(Fz10(6))]);
Cm3_off_10inches_Fz_3 = mean([Cm3Scana_10inch(Fz10(5)),Cm3Scana_10inch(Fz10(6))]);
Cm4_off_10inches_Fz_3 = mean([Cm4Scana_10inch(Fz10(5)),Cm4Scana_10inch(Fz10(6))]);
Cm5_off_10inches_Fz_3 = mean([Cm5Scana_10inch(Fz10(5)),Cm5Scana_10inch(Fz10(6))]);
Cm6_off_10inches_Fz_3 = mean([Cm6Scana_10inch(Fz10(5)),Cm6Scana_10inch(Fz10(6))]);
Cm7_off_10inches_Fz_3 = mean([Cm7Scana_10inch(Fz10(5)),Cm7Scana_10inch(Fz10(6))]);
Cm8_off_10inches_Fz_3 = mean([Cm8Scana_10inch(Fz10(5)),Cm8Scana_10inch(Fz10(6))]);
Cm1_off_10inches_Fz_4 = mean([Cm1Scana_10inch(Fz10(7)),Cm1Scana_10inch(Fz10(8))]);
Cm2_off_10inches_Fz_4 = mean([Cm2Scana_10inch(Fz10(7)),Cm2Scana_10inch(Fz10(8))]);
Cm3_off_10inches_Fz_4 = mean([Cm3Scana_10inch(Fz10(7)),Cm3Scana_10inch(Fz10(8))]);
Cm4_off_10inches_Fz_4 = mean([Cm4Scana_10inch(Fz10(7)),Cm4Scana_10inch(Fz10(8))]);
Cm5_off_10inches_Fz_4 = mean([Cm5Scana_10inch(Fz10(7)),Cm5Scana_10inch(Fz10(8))]);
Cm6_off_10inches_Fz_4 = mean([Cm6Scana_10inch(Fz10(7)),Cm6Scana_10inch(Fz10(8))]);
Cm7_off_10inches_Fz_4 = mean([Cm7Scana_10inch(Fz10(7)),Cm7Scana_10inch(Fz10(8))]);
Cm8_off_10inches_Fz_4 = mean([Cm8Scana_10inch(Fz10(7)),Cm8Scana_10inch(Fz10(8))]);

Cm1_off_12inches_Fz_1 = mean([Cm1Scana_12inch(Fz12(1)),Cm1Scana_12inch(Fz12(2))]);
Cm2_off_12inches_Fz_1 = mean([Cm2Scana_12inch(Fz12(1)),Cm2Scana_12inch(Fz12(2))]);
Cm3_off_12inches_Fz_1 = mean([Cm3Scana_12inch(Fz12(1)),Cm3Scana_12inch(Fz12(2))]);
Cm4_off_12inches_Fz_1 = mean([Cm4Scana_12inch(Fz12(1)),Cm4Scana_12inch(Fz12(2))]);
Cm5_off_12inches_Fz_1 = mean([Cm5Scana_12inch(Fz12(1)),Cm5Scana_12inch(Fz12(2))]);
Cm6_off_12inches_Fz_1 = mean([Cm6Scana_12inch(Fz12(1)),Cm6Scana_12inch(Fz12(2))]);
Cm7_off_12inches_Fz_1 = mean([Cm7Scana_12inch(Fz12(1)),Cm7Scana_12inch(Fz12(2))]);
Cm8_off_12inches_Fz_1 = mean([Cm8Scana_12inch(Fz12(1)),Cm8Scana_12inch(Fz12(2))]);
Cm1_off_12inches_Fz_2 = mean([Cm1Scana_12inch(Fz12(3)),Cm1Scana_12inch(Fz12(4))]);
Cm2_off_12inches_Fz_2 = mean([Cm2Scana_12inch(Fz12(3)),Cm2Scana_12inch(Fz12(4))]);
Cm3_off_12inches_Fz_2 = mean([Cm3Scana_12inch(Fz12(3)),Cm3Scana_12inch(Fz12(4))]);
Cm4_off_12inches_Fz_2 = mean([Cm4Scana_12inch(Fz12(3)),Cm4Scana_12inch(Fz12(4))]);
Cm5_off_12inches_Fz_2 = mean([Cm5Scana_12inch(Fz12(3)),Cm5Scana_12inch(Fz12(4))]);
Cm6_off_12inches_Fz_2 = mean([Cm6Scana_12inch(Fz12(3)),Cm6Scana_12inch(Fz12(4))]);
Cm7_off_12inches_Fz_2 = mean([Cm7Scana_12inch(Fz12(3)),Cm7Scana_12inch(Fz12(4))]);
Cm8_off_12inches_Fz_2 = mean([Cm8Scana_12inch(Fz12(3)),Cm8Scana_12inch(Fz12(4))]);
Cm1_off_12inches_Fz_3 = mean([Cm1Scana_12inch(Fz12(5)),Cm1Scana_12inch(Fz12(6))]);
Cm2_off_12inches_Fz_3 = mean([Cm2Scana_12inch(Fz12(5)),Cm2Scana_12inch(Fz12(6))]);
Cm3_off_12inches_Fz_3 = mean([Cm3Scana_12inch(Fz12(5)),Cm3Scana_12inch(Fz12(6))]);
Cm4_off_12inches_Fz_3 = mean([Cm4Scana_12inch(Fz12(5)),Cm4Scana_12inch(Fz12(6))]);
Cm5_off_12inches_Fz_3 = mean([Cm5Scana_12inch(Fz12(5)),Cm5Scana_12inch(Fz12(6))]);
Cm6_off_12inches_Fz_3 = mean([Cm6Scana_12inch(Fz12(5)),Cm6Scana_12inch(Fz12(6))]);
Cm7_off_12inches_Fz_3 = mean([Cm7Scana_12inch(Fz12(5)),Cm7Scana_12inch(Fz12(6))]);
Cm8_off_12inches_Fz_3 = mean([Cm8Scana_12inch(Fz12(5)),Cm8Scana_12inch(Fz12(6))]);
Cm1_off_12inches_Fz_4 = mean([Cm1Scana_12inch(Fz12(7)),Cm1Scana_12inch(Fz12(8))]);
Cm2_off_12inches_Fz_4 = mean([Cm2Scana_12inch(Fz12(7)),Cm2Scana_12inch(Fz12(8))]);
Cm3_off_12inches_Fz_4 = mean([Cm3Scana_12inch(Fz12(7)),Cm3Scana_12inch(Fz12(8))]);
Cm4_off_12inches_Fz_4 = mean([Cm4Scana_12inch(Fz12(7)),Cm4Scana_12inch(Fz12(8))]);
Cm5_off_12inches_Fz_4 = mean([Cm5Scana_12inch(Fz12(7)),Cm5Scana_12inch(Fz12(8))]);
Cm6_off_12inches_Fz_4 = mean([Cm6Scana_12inch(Fz12(7)),Cm6Scana_12inch(Fz12(8))]);
Cm7_off_12inches_Fz_4 = mean([Cm7Scana_12inch(Fz12(7)),Cm7Scana_12inch(Fz12(8))]);
Cm8_off_12inches_Fz_4 = mean([Cm8Scana_12inch(Fz12(7)),Cm8Scana_12inch(Fz12(8))]);


Cm1_off_13inches_Fz_1 = mean([Cm1Scana_13inch(Fz13(1)),Cm1Scana_13inch(Fz13(2))]);
Cm2_off_13inches_Fz_1 = mean([Cm2Scana_13inch(Fz13(1)),Cm2Scana_13inch(Fz13(2))]);
Cm3_off_13inches_Fz_1 = mean([Cm3Scana_13inch(Fz13(1)),Cm3Scana_13inch(Fz13(2))]);
Cm4_off_13inches_Fz_1 = mean([Cm4Scana_13inch(Fz13(1)),Cm4Scana_13inch(Fz13(2))]);
Cm5_off_13inches_Fz_1 = mean([Cm5Scana_13inch(Fz13(1)),Cm5Scana_13inch(Fz13(2))]);
Cm6_off_13inches_Fz_1 = mean([Cm6Scana_13inch(Fz13(1)),Cm6Scana_13inch(Fz13(2))]);
Cm7_off_13inches_Fz_1 = mean([Cm7Scana_13inch(Fz13(1)),Cm7Scana_13inch(Fz13(2))]);
Cm8_off_13inches_Fz_1 = mean([Cm8Scana_13inch(Fz13(1)),Cm8Scana_13inch(Fz13(2))]);
Cm1_off_13inches_Fz_2 = mean([Cm1Scana_13inch(Fz13(3)),Cm1Scana_13inch(Fz13(4))]);
Cm2_off_13inches_Fz_2 = mean([Cm2Scana_13inch(Fz13(3)),Cm2Scana_13inch(Fz13(4))]);
Cm3_off_13inches_Fz_2 = mean([Cm3Scana_13inch(Fz13(3)),Cm3Scana_13inch(Fz13(4))]);
Cm4_off_13inches_Fz_2 = mean([Cm4Scana_13inch(Fz13(3)),Cm4Scana_13inch(Fz13(4))]);
Cm5_off_13inches_Fz_2 = mean([Cm5Scana_13inch(Fz13(3)),Cm5Scana_13inch(Fz13(4))]);
Cm6_off_13inches_Fz_2 = mean([Cm6Scana_13inch(Fz13(3)),Cm6Scana_13inch(Fz13(4))]);
Cm7_off_13inches_Fz_2 = mean([Cm7Scana_13inch(Fz13(3)),Cm7Scana_13inch(Fz13(4))]);
Cm8_off_13inches_Fz_2 = mean([Cm8Scana_13inch(Fz13(3)),Cm8Scana_13inch(Fz13(4))]);
Cm1_off_13inches_Fz_3 = mean([Cm1Scana_13inch(Fz13(5)),Cm1Scana_13inch(Fz13(6))]);
Cm2_off_13inches_Fz_3 = mean([Cm2Scana_13inch(Fz13(5)),Cm2Scana_13inch(Fz13(6))]);
Cm3_off_13inches_Fz_3 = mean([Cm3Scana_13inch(Fz13(5)),Cm3Scana_13inch(Fz13(6))]);
Cm4_off_13inches_Fz_3 = mean([Cm4Scana_13inch(Fz13(5)),Cm4Scana_13inch(Fz13(6))]);
Cm5_off_13inches_Fz_3 = mean([Cm5Scana_13inch(Fz13(5)),Cm5Scana_13inch(Fz13(6))]);
Cm6_off_13inches_Fz_3 = mean([Cm6Scana_13inch(Fz13(5)),Cm6Scana_13inch(Fz13(6))]);
Cm7_off_13inches_Fz_3 = mean([Cm7Scana_13inch(Fz13(5)),Cm7Scana_13inch(Fz13(6))]);
Cm8_off_13inches_Fz_3 = mean([Cm8Scana_13inch(Fz13(5)),Cm8Scana_13inch(Fz13(6))]);
Cm1_off_13inches_Fz_4 = mean([Cm1Scana_13inch(Fz13(7)),Cm1Scana_13inch(Fz13(8))]);
Cm2_off_13inches_Fz_4 = mean([Cm2Scana_13inch(Fz13(7)),Cm2Scana_13inch(Fz13(8))]);
Cm3_off_13inches_Fz_4 = mean([Cm3Scana_13inch(Fz13(7)),Cm3Scana_13inch(Fz13(8))]);
Cm4_off_13inches_Fz_4 = mean([Cm4Scana_13inch(Fz13(7)),Cm4Scana_13inch(Fz13(8))]);
Cm5_off_13inches_Fz_4 = mean([Cm5Scana_13inch(Fz13(7)),Cm5Scana_13inch(Fz13(8))]);
Cm6_off_13inches_Fz_4 = mean([Cm6Scana_13inch(Fz13(7)),Cm6Scana_13inch(Fz13(8))]);
Cm7_off_13inches_Fz_4 = mean([Cm7Scana_13inch(Fz13(7)),Cm7Scana_13inch(Fz13(8))]);
Cm8_off_13inches_Fz_4 = mean([Cm8Scana_13inch(Fz13(7)),Cm8Scana_13inch(Fz13(8))]);

Cf1_off_10inches_Fz_1 = mean([Cf1Scana_10inch(Fz10(1)),Cf1Scana_10inch(Fz10(2))]);
Cf2_off_10inches_Fz_1 = mean([Cf2Scana_10inch(Fz10(1)),Cf2Scana_10inch(Fz10(2))]);
Cf3_off_10inches_Fz_1 = mean([Cf3Scana_10inch(Fz10(1)),Cf3Scana_10inch(Fz10(2))]);
Cf4_off_10inches_Fz_1 = mean([Cf4Scana_10inch(Fz10(1)),Cf4Scana_10inch(Fz10(2))]);
Cf5_off_10inches_Fz_1 = mean([Cf5Scana_10inch(Fz10(1)),Cf5Scana_10inch(Fz10(2))]);
Cf6_off_10inches_Fz_1 = mean([Cf6Scana_10inch(Fz10(1)),Cf6Scana_10inch(Fz10(2))]);
Cf7_off_10inches_Fz_1 = mean([Cf7Scana_10inch(Fz10(1)),Cf7Scana_10inch(Fz10(2))]);
Cf8_off_10inches_Fz_1 = mean([Cf8Scana_10inch(Fz10(1)),Cf8Scana_10inch(Fz10(2))]);
Cf1_off_10inches_Fz_2 = mean([Cf1Scana_10inch(Fz10(3)),Cf1Scana_10inch(Fz10(4))]);
Cf2_off_10inches_Fz_2 = mean([Cf2Scana_10inch(Fz10(3)),Cf2Scana_10inch(Fz10(4))]);
Cf3_off_10inches_Fz_2 = mean([Cf3Scana_10inch(Fz10(3)),Cf3Scana_10inch(Fz10(4))]);
Cf4_off_10inches_Fz_2 = mean([Cf4Scana_10inch(Fz10(3)),Cf4Scana_10inch(Fz10(4))]);
Cf5_off_10inches_Fz_2 = mean([Cf5Scana_10inch(Fz10(3)),Cf5Scana_10inch(Fz10(4))]);
Cf6_off_10inches_Fz_2 = mean([Cf6Scana_10inch(Fz10(3)),Cf6Scana_10inch(Fz10(4))]);
Cf7_off_10inches_Fz_2 = mean([Cf7Scana_10inch(Fz10(3)),Cf7Scana_10inch(Fz10(4))]);
Cf8_off_10inches_Fz_2 = mean([Cf8Scana_10inch(Fz10(3)),Cf8Scana_10inch(Fz10(4))]);
Cf1_off_10inches_Fz_3 = mean([Cf1Scana_10inch(Fz10(5)),Cf1Scana_10inch(Fz10(6))]);
Cf2_off_10inches_Fz_3 = mean([Cf2Scana_10inch(Fz10(5)),Cf2Scana_10inch(Fz10(6))]);
Cf3_off_10inches_Fz_3 = mean([Cf3Scana_10inch(Fz10(5)),Cf3Scana_10inch(Fz10(6))]);
Cf4_off_10inches_Fz_3 = mean([Cf4Scana_10inch(Fz10(5)),Cf4Scana_10inch(Fz10(6))]);
Cf5_off_10inches_Fz_3 = mean([Cf5Scana_10inch(Fz10(5)),Cf5Scana_10inch(Fz10(6))]);
Cf6_off_10inches_Fz_3 = mean([Cf6Scana_10inch(Fz10(5)),Cf6Scana_10inch(Fz10(6))]);
Cf7_off_10inches_Fz_3 = mean([Cf7Scana_10inch(Fz10(5)),Cf7Scana_10inch(Fz10(6))]);
Cf8_off_10inches_Fz_3 = mean([Cf8Scana_10inch(Fz10(5)),Cf8Scana_10inch(Fz10(6))]);
Cf1_off_10inches_Fz_4 = mean([Cf1Scana_10inch(Fz10(7)),Cf1Scana_10inch(Fz10(8))]);
Cf2_off_10inches_Fz_4 = mean([Cf2Scana_10inch(Fz10(7)),Cf2Scana_10inch(Fz10(8))]);
Cf3_off_10inches_Fz_4 = mean([Cf3Scana_10inch(Fz10(7)),Cf3Scana_10inch(Fz10(8))]);
Cf4_off_10inches_Fz_4 = mean([Cf4Scana_10inch(Fz10(7)),Cf4Scana_10inch(Fz10(8))]);
Cf5_off_10inches_Fz_4 = mean([Cf5Scana_10inch(Fz10(7)),Cf5Scana_10inch(Fz10(8))]);
Cf6_off_10inches_Fz_4 = mean([Cf6Scana_10inch(Fz10(7)),Cf6Scana_10inch(Fz10(8))]);
Cf7_off_10inches_Fz_4 = mean([Cf7Scana_10inch(Fz10(7)),Cf7Scana_10inch(Fz10(8))]);
Cf8_off_10inches_Fz_4 = mean([Cf8Scana_10inch(Fz10(7)),Cf8Scana_10inch(Fz10(8))]);
Cf1_off_12inches_Fz_1 = mean([Cf1Scana_12inch(Fz12(1)),Cf1Scana_12inch(Fz12(2))]);
Cf2_off_12inches_Fz_1 = mean([Cf2Scana_12inch(Fz12(1)),Cf2Scana_12inch(Fz12(2))]);
Cf3_off_12inches_Fz_1 = mean([Cf3Scana_12inch(Fz12(1)),Cf3Scana_12inch(Fz12(2))]);
Cf4_off_12inches_Fz_1 = mean([Cf4Scana_12inch(Fz12(1)),Cf4Scana_12inch(Fz12(2))]);
Cf5_off_12inches_Fz_1 = mean([Cf5Scana_12inch(Fz12(1)),Cf5Scana_12inch(Fz12(2))]);
Cf6_off_12inches_Fz_1 = mean([Cf6Scana_12inch(Fz12(1)),Cf6Scana_12inch(Fz12(2))]);
Cf7_off_12inches_Fz_1 = mean([Cf7Scana_12inch(Fz12(1)),Cf7Scana_12inch(Fz12(2))]);
Cf8_off_12inches_Fz_1 = mean([Cf8Scana_12inch(Fz12(1)),Cf8Scana_12inch(Fz12(2))]);
Cf1_off_12inches_Fz_2 = mean([Cf1Scana_12inch(Fz12(3)),Cf1Scana_12inch(Fz12(4))]);
Cf2_off_12inches_Fz_2 = mean([Cf2Scana_12inch(Fz12(3)),Cf2Scana_12inch(Fz12(4))]);
Cf3_off_12inches_Fz_2 = mean([Cf3Scana_12inch(Fz12(3)),Cf3Scana_12inch(Fz12(4))]);
Cf4_off_12inches_Fz_2 = mean([Cf4Scana_12inch(Fz12(3)),Cf4Scana_12inch(Fz12(4))]);
Cf5_off_12inches_Fz_2 = mean([Cf5Scana_12inch(Fz12(3)),Cf5Scana_12inch(Fz12(4))]);
Cf6_off_12inches_Fz_2 = mean([Cf6Scana_12inch(Fz12(3)),Cf6Scana_12inch(Fz12(4))]);
Cf7_off_12inches_Fz_2 = mean([Cf7Scana_12inch(Fz12(3)),Cf7Scana_12inch(Fz12(4))]);
Cf8_off_12inches_Fz_2 = mean([Cf8Scana_12inch(Fz12(3)),Cf8Scana_12inch(Fz12(4))]);
Cf1_off_12inches_Fz_3 = mean([Cf1Scana_12inch(Fz12(5)),Cf1Scana_12inch(Fz12(6))]);
Cf2_off_12inches_Fz_3 = mean([Cf2Scana_12inch(Fz12(5)),Cf2Scana_12inch(Fz12(6))]);
Cf3_off_12inches_Fz_3 = mean([Cf3Scana_12inch(Fz12(5)),Cf3Scana_12inch(Fz12(6))]);
Cf4_off_12inches_Fz_3 = mean([Cf4Scana_12inch(Fz12(5)),Cf4Scana_12inch(Fz12(6))]);
Cf5_off_12inches_Fz_3 = mean([Cf5Scana_12inch(Fz12(5)),Cf5Scana_12inch(Fz12(6))]);
Cf6_off_12inches_Fz_3 = mean([Cf6Scana_12inch(Fz12(5)),Cf6Scana_12inch(Fz12(6))]);
Cf7_off_12inches_Fz_3 = mean([Cf7Scana_12inch(Fz12(5)),Cf7Scana_12inch(Fz12(6))]);
Cf8_off_12inches_Fz_3 = mean([Cf8Scana_12inch(Fz12(5)),Cf8Scana_12inch(Fz12(6))]);
Cf1_off_12inches_Fz_4 = mean([Cf1Scana_12inch(Fz12(7)),Cf1Scana_12inch(Fz12(8))]);
Cf2_off_12inches_Fz_4 = mean([Cf2Scana_12inch(Fz12(7)),Cf2Scana_12inch(Fz12(8))]);
Cf3_off_12inches_Fz_4 = mean([Cf3Scana_12inch(Fz12(7)),Cf3Scana_12inch(Fz12(8))]);
Cf4_off_12inches_Fz_4 = mean([Cf4Scana_12inch(Fz12(7)),Cf4Scana_12inch(Fz12(8))]);
Cf5_off_12inches_Fz_4 = mean([Cf5Scana_12inch(Fz12(7)),Cf5Scana_12inch(Fz12(8))]);
Cf6_off_12inches_Fz_4 = mean([Cf6Scana_12inch(Fz12(7)),Cf6Scana_12inch(Fz12(8))]);
Cf7_off_12inches_Fz_4 = mean([Cf7Scana_12inch(Fz12(7)),Cf7Scana_12inch(Fz12(8))]);
Cf8_off_12inches_Fz_4 = mean([Cf8Scana_12inch(Fz12(7)),Cf8Scana_12inch(Fz12(8))]);
Cf1_off_13inches_Fz_1 = mean([Cf1Scana_13inch(Fz13(1)),Cf1Scana_13inch(Fz13(2))]);
Cf2_off_13inches_Fz_1 = mean([Cf2Scana_13inch(Fz13(1)),Cf2Scana_13inch(Fz13(2))]);
Cf3_off_13inches_Fz_1 = mean([Cf3Scana_13inch(Fz13(1)),Cf3Scana_13inch(Fz13(2))]);
Cf4_off_13inches_Fz_1 = mean([Cf4Scana_13inch(Fz13(1)),Cf4Scana_13inch(Fz13(2))]);
Cf5_off_13inches_Fz_1 = mean([Cf5Scana_13inch(Fz13(1)),Cf5Scana_13inch(Fz13(2))]);
Cf6_off_13inches_Fz_1 = mean([Cf6Scana_13inch(Fz13(1)),Cf6Scana_13inch(Fz13(2))]);
Cf7_off_13inches_Fz_1 = mean([Cf7Scana_13inch(Fz13(1)),Cf7Scana_13inch(Fz13(2))]);
Cf8_off_13inches_Fz_1 = mean([Cf8Scana_13inch(Fz13(1)),Cf8Scana_13inch(Fz13(2))]);
Cf1_off_13inches_Fz_2 = mean([Cf1Scana_13inch(Fz13(3)),Cf1Scana_13inch(Fz13(4))]);
Cf2_off_13inches_Fz_2 = mean([Cf2Scana_13inch(Fz13(3)),Cf2Scana_13inch(Fz13(4))]);
Cf3_off_13inches_Fz_2 = mean([Cf3Scana_13inch(Fz13(3)),Cf3Scana_13inch(Fz13(4))]);
Cf4_off_13inches_Fz_2 = mean([Cf4Scana_13inch(Fz13(3)),Cf4Scana_13inch(Fz13(4))]);
Cf5_off_13inches_Fz_2 = mean([Cf5Scana_13inch(Fz13(3)),Cf5Scana_13inch(Fz13(4))]);
Cf6_off_13inches_Fz_2 = mean([Cf6Scana_13inch(Fz13(3)),Cf6Scana_13inch(Fz13(4))]);
Cf7_off_13inches_Fz_2 = mean([Cf7Scana_13inch(Fz13(3)),Cf7Scana_13inch(Fz13(4))]);
Cf8_off_13inches_Fz_2 = mean([Cf8Scana_13inch(Fz13(3)),Cf8Scana_13inch(Fz13(4))]);
Cf1_off_13inches_Fz_3 = mean([Cf1Scana_13inch(Fz13(5)),Cf1Scana_13inch(Fz13(6))]);
Cf2_off_13inches_Fz_3 = mean([Cf2Scana_13inch(Fz13(5)),Cf2Scana_13inch(Fz13(6))]);
Cf3_off_13inches_Fz_3 = mean([Cf3Scana_13inch(Fz13(5)),Cf3Scana_13inch(Fz13(6))]);
Cf4_off_13inches_Fz_3 = mean([Cf4Scana_13inch(Fz13(5)),Cf4Scana_13inch(Fz13(6))]);
Cf5_off_13inches_Fz_3 = mean([Cf5Scana_13inch(Fz13(5)),Cf5Scana_13inch(Fz13(6))]);
Cf6_off_13inches_Fz_3 = mean([Cf6Scana_13inch(Fz13(5)),Cf6Scana_13inch(Fz13(6))]);
Cf7_off_13inches_Fz_3 = mean([Cf7Scana_13inch(Fz13(5)),Cf7Scana_13inch(Fz13(6))]);
Cf8_off_13inches_Fz_3 = mean([Cf8Scana_13inch(Fz13(5)),Cf8Scana_13inch(Fz13(6))]);
Cf1_off_13inches_Fz_4 = mean([Cf1Scana_13inch(Fz13(7)),Cf1Scana_13inch(Fz13(8))]);
Cf2_off_13inches_Fz_4 = mean([Cf2Scana_13inch(Fz13(7)),Cf2Scana_13inch(Fz13(8))]);
Cf3_off_13inches_Fz_4 = mean([Cf3Scana_13inch(Fz13(7)),Cf3Scana_13inch(Fz13(8))]);
Cf4_off_13inches_Fz_4 = mean([Cf4Scana_13inch(Fz13(7)),Cf4Scana_13inch(Fz13(8))]);
Cf5_off_13inches_Fz_4 = mean([Cf5Scana_13inch(Fz13(7)),Cf5Scana_13inch(Fz13(8))]);
Cf6_off_13inches_Fz_4 = mean([Cf6Scana_13inch(Fz13(7)),Cf6Scana_13inch(Fz13(8))]);
Cf7_off_13inches_Fz_4 = mean([Cf7Scana_13inch(Fz13(7)),Cf7Scana_13inch(Fz13(8))]);
Cf8_off_13inches_Fz_4 = mean([Cf8Scana_13inch(Fz13(7)),Cf8Scana_13inch(Fz13(8))]);

Ct1_off_10inches_Fz_1 = mean([Ct1Scana_10inch(Fz10(1)),Ct1Scana_10inch(Fz10(2))]);
Ct2_off_10inches_Fz_1 = mean([Ct2Scana_10inch(Fz10(1)),Ct2Scana_10inch(Fz10(2))]);
Ct3_off_10inches_Fz_1 = mean([Ct3Scana_10inch(Fz10(1)),Ct3Scana_10inch(Fz10(2))]);
Ct4_off_10inches_Fz_1 = mean([Ct4Scana_10inch(Fz10(1)),Ct4Scana_10inch(Fz10(2))]);
Ct5_off_10inches_Fz_1 = mean([Ct5Scana_10inch(Fz10(1)),Ct5Scana_10inch(Fz10(2))]);
Ct6_off_10inches_Fz_1 = mean([Ct6Scana_10inch(Fz10(1)),Ct6Scana_10inch(Fz10(2))]);
Ct7_off_10inches_Fz_1 = mean([Ct7Scana_10inch(Fz10(1)),Ct7Scana_10inch(Fz10(2))]);
Ct8_off_10inches_Fz_1 = mean([Ct8Scana_10inch(Fz10(1)),Ct8Scana_10inch(Fz10(2))]);
Ct1_off_10inches_Fz_2 = mean([Ct1Scana_10inch(Fz10(3)),Ct1Scana_10inch(Fz10(4))]);
Ct2_off_10inches_Fz_2 = mean([Ct2Scana_10inch(Fz10(3)),Ct2Scana_10inch(Fz10(4))]);
Ct3_off_10inches_Fz_2 = mean([Ct3Scana_10inch(Fz10(3)),Ct3Scana_10inch(Fz10(4))]);
Ct4_off_10inches_Fz_2 = mean([Ct4Scana_10inch(Fz10(3)),Ct4Scana_10inch(Fz10(4))]);
Ct5_off_10inches_Fz_2 = mean([Ct5Scana_10inch(Fz10(3)),Ct5Scana_10inch(Fz10(4))]);
Ct6_off_10inches_Fz_2 = mean([Ct6Scana_10inch(Fz10(3)),Ct6Scana_10inch(Fz10(4))]);
Ct7_off_10inches_Fz_2 = mean([Ct7Scana_10inch(Fz10(3)),Ct7Scana_10inch(Fz10(4))]);
Ct8_off_10inches_Fz_2 = mean([Ct8Scana_10inch(Fz10(3)),Ct8Scana_10inch(Fz10(4))]);
Ct1_off_10inches_Fz_3 = mean([Ct1Scana_10inch(Fz10(5)),Ct1Scana_10inch(Fz10(6))]);
Ct2_off_10inches_Fz_3 = mean([Ct2Scana_10inch(Fz10(5)),Ct2Scana_10inch(Fz10(6))]);
Ct3_off_10inches_Fz_3 = mean([Ct3Scana_10inch(Fz10(5)),Ct3Scana_10inch(Fz10(6))]);
Ct4_off_10inches_Fz_3 = mean([Ct4Scana_10inch(Fz10(5)),Ct4Scana_10inch(Fz10(6))]);
Ct5_off_10inches_Fz_3 = mean([Ct5Scana_10inch(Fz10(5)),Ct5Scana_10inch(Fz10(6))]);
Ct6_off_10inches_Fz_3 = mean([Ct6Scana_10inch(Fz10(5)),Ct6Scana_10inch(Fz10(6))]);
Ct7_off_10inches_Fz_3 = mean([Ct7Scana_10inch(Fz10(5)),Ct7Scana_10inch(Fz10(6))]);
Ct8_off_10inches_Fz_3 = mean([Ct8Scana_10inch(Fz10(5)),Ct8Scana_10inch(Fz10(6))]);
Ct1_off_10inches_Fz_4 = mean([Ct1Scana_10inch(Fz10(7)),Ct1Scana_10inch(Fz10(8))]);
Ct2_off_10inches_Fz_4 = mean([Ct2Scana_10inch(Fz10(7)),Ct2Scana_10inch(Fz10(8))]);
Ct3_off_10inches_Fz_4 = mean([Ct3Scana_10inch(Fz10(7)),Ct3Scana_10inch(Fz10(8))]);
Ct4_off_10inches_Fz_4 = mean([Ct4Scana_10inch(Fz10(7)),Ct4Scana_10inch(Fz10(8))]);
Ct5_off_10inches_Fz_4 = mean([Ct5Scana_10inch(Fz10(7)),Ct5Scana_10inch(Fz10(8))]);
Ct6_off_10inches_Fz_4 = mean([Ct6Scana_10inch(Fz10(7)),Ct6Scana_10inch(Fz10(8))]);
Ct7_off_10inches_Fz_4 = mean([Ct7Scana_10inch(Fz10(7)),Ct7Scana_10inch(Fz10(8))]);
Ct8_off_10inches_Fz_4 = mean([Ct8Scana_10inch(Fz10(7)),Ct8Scana_10inch(Fz10(8))]);
Ct1_off_12inches_Fz_1 = mean([Ct1Scana_12inch(Fz12(1)),Ct1Scana_12inch(Fz12(2))]);
Ct2_off_12inches_Fz_1 = mean([Ct2Scana_12inch(Fz12(1)),Ct2Scana_12inch(Fz12(2))]);
Ct3_off_12inches_Fz_1 = mean([Ct3Scana_12inch(Fz12(1)),Ct3Scana_12inch(Fz12(2))]);
Ct4_off_12inches_Fz_1 = mean([Ct4Scana_12inch(Fz12(1)),Ct4Scana_12inch(Fz12(2))]);
Ct5_off_12inches_Fz_1 = mean([Ct5Scana_12inch(Fz12(1)),Ct5Scana_12inch(Fz12(2))]);
Ct6_off_12inches_Fz_1 = mean([Ct6Scana_12inch(Fz12(1)),Ct6Scana_12inch(Fz12(2))]);
Ct7_off_12inches_Fz_1 = mean([Ct7Scana_12inch(Fz12(1)),Ct7Scana_12inch(Fz12(2))]);
Ct8_off_12inches_Fz_1 = mean([Ct8Scana_12inch(Fz12(1)),Ct8Scana_12inch(Fz12(2))]);
Ct1_off_12inches_Fz_2 = mean([Ct1Scana_12inch(Fz12(3)),Ct1Scana_12inch(Fz12(4))]);
Ct2_off_12inches_Fz_2 = mean([Ct2Scana_12inch(Fz12(3)),Ct2Scana_12inch(Fz12(4))]);
Ct3_off_12inches_Fz_2 = mean([Ct3Scana_12inch(Fz12(3)),Ct3Scana_12inch(Fz12(4))]);
Ct4_off_12inches_Fz_2 = mean([Ct4Scana_12inch(Fz12(3)),Ct4Scana_12inch(Fz12(4))]);
Ct5_off_12inches_Fz_2 = mean([Ct5Scana_12inch(Fz12(3)),Ct5Scana_12inch(Fz12(4))]);
Ct6_off_12inches_Fz_2 = mean([Ct6Scana_12inch(Fz12(3)),Ct6Scana_12inch(Fz12(4))]);
Ct7_off_12inches_Fz_2 = mean([Ct7Scana_12inch(Fz12(3)),Ct7Scana_12inch(Fz12(4))]);
Ct8_off_12inches_Fz_2 = mean([Ct8Scana_12inch(Fz12(3)),Ct8Scana_12inch(Fz12(4))]);
Ct1_off_12inches_Fz_3 = mean([Ct1Scana_12inch(Fz12(5)),Ct1Scana_12inch(Fz12(6))]);
Ct2_off_12inches_Fz_3 = mean([Ct2Scana_12inch(Fz12(5)),Ct2Scana_12inch(Fz12(6))]);
Ct3_off_12inches_Fz_3 = mean([Ct3Scana_12inch(Fz12(5)),Ct3Scana_12inch(Fz12(6))]);
Ct4_off_12inches_Fz_3 = mean([Ct4Scana_12inch(Fz12(5)),Ct4Scana_12inch(Fz12(6))]);
Ct5_off_12inches_Fz_3 = mean([Ct5Scana_12inch(Fz12(5)),Ct5Scana_12inch(Fz12(6))]);
Ct6_off_12inches_Fz_3 = mean([Ct6Scana_12inch(Fz12(5)),Ct6Scana_12inch(Fz12(6))]);
Ct7_off_12inches_Fz_3 = mean([Ct7Scana_12inch(Fz12(5)),Ct7Scana_12inch(Fz12(6))]);
Ct8_off_12inches_Fz_3 = mean([Ct8Scana_12inch(Fz12(5)),Ct8Scana_12inch(Fz12(6))]);
Ct1_off_12inches_Fz_4 = mean([Ct1Scana_12inch(Fz12(7)),Ct1Scana_12inch(Fz12(8))]);
Ct2_off_12inches_Fz_4 = mean([Ct2Scana_12inch(Fz12(7)),Ct2Scana_12inch(Fz12(8))]);
Ct3_off_12inches_Fz_4 = mean([Ct3Scana_12inch(Fz12(7)),Ct3Scana_12inch(Fz12(8))]);
Ct4_off_12inches_Fz_4 = mean([Ct4Scana_12inch(Fz12(7)),Ct4Scana_12inch(Fz12(8))]);
Ct5_off_12inches_Fz_4 = mean([Ct5Scana_12inch(Fz12(7)),Ct5Scana_12inch(Fz12(8))]);
Ct6_off_12inches_Fz_4 = mean([Ct6Scana_12inch(Fz12(7)),Ct6Scana_12inch(Fz12(8))]);
Ct7_off_12inches_Fz_4 = mean([Ct7Scana_12inch(Fz12(7)),Ct7Scana_12inch(Fz12(8))]);
Ct8_off_12inches_Fz_4 = mean([Ct8Scana_12inch(Fz12(7)),Ct8Scana_12inch(Fz12(8))]);
Ct1_off_13inches_Fz_1 = mean([Ct1Scana_13inch(Fz13(1)),Ct1Scana_13inch(Fz13(2))]);
Ct2_off_13inches_Fz_1 = mean([Ct2Scana_13inch(Fz13(1)),Ct2Scana_13inch(Fz13(2))]);
Ct3_off_13inches_Fz_1 = mean([Ct3Scana_13inch(Fz13(1)),Ct3Scana_13inch(Fz13(2))]);
Ct4_off_13inches_Fz_1 = mean([Ct4Scana_13inch(Fz13(1)),Ct4Scana_13inch(Fz13(2))]);
Ct5_off_13inches_Fz_1 = mean([Ct5Scana_13inch(Fz13(1)),Ct5Scana_13inch(Fz13(2))]);
Ct6_off_13inches_Fz_1 = mean([Ct6Scana_13inch(Fz13(1)),Ct6Scana_13inch(Fz13(2))]);
Ct7_off_13inches_Fz_1 = mean([Ct7Scana_13inch(Fz13(1)),Ct7Scana_13inch(Fz13(2))]);
Ct8_off_13inches_Fz_1 = mean([Ct8Scana_13inch(Fz13(1)),Ct8Scana_13inch(Fz13(2))]);
Ct1_off_13inches_Fz_2 = mean([Ct1Scana_13inch(Fz13(3)),Ct1Scana_13inch(Fz13(4))]);
Ct2_off_13inches_Fz_2 = mean([Ct2Scana_13inch(Fz13(3)),Ct2Scana_13inch(Fz13(4))]);
Ct3_off_13inches_Fz_2 = mean([Ct3Scana_13inch(Fz13(3)),Ct3Scana_13inch(Fz13(4))]);
Ct4_off_13inches_Fz_2 = mean([Ct4Scana_13inch(Fz13(3)),Ct4Scana_13inch(Fz13(4))]);
Ct5_off_13inches_Fz_2 = mean([Ct5Scana_13inch(Fz13(3)),Ct5Scana_13inch(Fz13(4))]);
Ct6_off_13inches_Fz_2 = mean([Ct6Scana_13inch(Fz13(3)),Ct6Scana_13inch(Fz13(4))]);
Ct7_off_13inches_Fz_2 = mean([Ct7Scana_13inch(Fz13(3)),Ct7Scana_13inch(Fz13(4))]);
Ct8_off_13inches_Fz_2 = mean([Ct8Scana_13inch(Fz13(3)),Ct8Scana_13inch(Fz13(4))]);
Ct1_off_13inches_Fz_3 = mean([Ct1Scana_13inch(Fz13(5)),Ct1Scana_13inch(Fz13(6))]);
Ct2_off_13inches_Fz_3 = mean([Ct2Scana_13inch(Fz13(5)),Ct2Scana_13inch(Fz13(6))]);
Ct3_off_13inches_Fz_3 = mean([Ct3Scana_13inch(Fz13(5)),Ct3Scana_13inch(Fz13(6))]);
Ct4_off_13inches_Fz_3 = mean([Ct4Scana_13inch(Fz13(5)),Ct4Scana_13inch(Fz13(6))]);
Ct5_off_13inches_Fz_3 = mean([Ct5Scana_13inch(Fz13(5)),Ct5Scana_13inch(Fz13(6))]);
Ct6_off_13inches_Fz_3 = mean([Ct6Scana_13inch(Fz13(5)),Ct6Scana_13inch(Fz13(6))]);
Ct7_off_13inches_Fz_3 = mean([Ct7Scana_13inch(Fz13(5)),Ct7Scana_13inch(Fz13(6))]);
Ct8_off_13inches_Fz_3 = mean([Ct8Scana_13inch(Fz13(5)),Ct8Scana_13inch(Fz13(6))]);
Ct1_off_13inches_Fz_4 = mean([Ct1Scana_13inch(Fz13(7)),Ct1Scana_13inch(Fz13(8))]);
Ct2_off_13inches_Fz_4 = mean([Ct2Scana_13inch(Fz13(7)),Ct2Scana_13inch(Fz13(8))]);
Ct3_off_13inches_Fz_4 = mean([Ct3Scana_13inch(Fz13(7)),Ct3Scana_13inch(Fz13(8))]);
Ct4_off_13inches_Fz_4 = mean([Ct4Scana_13inch(Fz13(7)),Ct4Scana_13inch(Fz13(8))]);
Ct5_off_13inches_Fz_4 = mean([Ct5Scana_13inch(Fz13(7)),Ct5Scana_13inch(Fz13(8))]);
Ct6_off_13inches_Fz_4 = mean([Ct6Scana_13inch(Fz13(7)),Ct6Scana_13inch(Fz13(8))]);
Ct7_off_13inches_Fz_4 = mean([Ct7Scana_13inch(Fz13(7)),Ct7Scana_13inch(Fz13(8))]);
Ct8_off_13inches_Fz_4 = mean([Ct8Scana_13inch(Fz13(7)),Ct8Scana_13inch(Fz13(8))]);

%{

figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
% plot(distances(1), Cm1_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(2), Cm2_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(3), Cm3_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(4), Cm4_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(5), Cm5_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(6), Cm6_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(7), Cm7_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(8), Cm8_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_RPM_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_RPM_1,'o','color','b','markersize',7,'lineWidth',2);
% plot(distances(1), Cf1_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(2), Cf2_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(3), Cf3_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(4), Cf4_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(5), Cf5_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(6), Cf6_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(7), Cf7_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(8), Cf8_off_13inches_RPM_1,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 3000 RPM','','','','','','','','12"x6" 3000 RPM','','','','','','','','13"x6.5" 3000 RPM')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')


figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
% plot(distances(1), Cm1_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(2), Cm2_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(3), Cm3_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(4), Cm4_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(5), Cm5_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(6), Cm6_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(7), Cm7_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(8), Cm8_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_Q$ [-]')
ylim([0,0.03])
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_RPM_2,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_RPM_2,'o','color','b','markersize',7,'lineWidth',2);
% plot(distances(1), Cf1_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(2), Cf2_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(3), Cf3_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(4), Cf4_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(5), Cf5_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(6), Cf6_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(7), Cf7_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(8), Cf8_off_13inches_RPM_2,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
ylim([0,0.03])
legend('10"x4.5" 4000 RPM','','','','','','','','12"x6" 4000 RPM','','','','','','','','13"x6.5" 4000 RPM')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_F$ [-]')


figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 8 N','','','','','','','','10"x4.5" 10 N','','','','','','','','10"x4.5" 12 N','','','','','','','','10"x4.5" 14 N')
ylabel('C$_Q$ [-]')
ylim([0,0.03])
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_1,'x','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_3,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_4,'x','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
ylim([0,0.03])
% legend('10"x4.5" 8 RPM','','','','','','','','12"x6" 4000 RPM','','','','','','','','13"x6.5" 4000 RPM')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_F$ [-]')



figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), mean([Cm1_off_10inches_Fz_1,Cm1_off_10inches_Fz_2,Cm1_off_10inches_Fz_3,Cm1_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cm2_off_10inches_Fz_1,Cm2_off_10inches_Fz_2,Cm2_off_10inches_Fz_3,Cm2_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cm3_off_10inches_Fz_1,Cm3_off_10inches_Fz_2,Cm3_off_10inches_Fz_3,Cm3_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cm4_off_10inches_Fz_1,Cm4_off_10inches_Fz_2,Cm4_off_10inches_Fz_3,Cm4_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cm5_off_10inches_Fz_1,Cm5_off_10inches_Fz_2,Cm5_off_10inches_Fz_3,Cm5_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cm6_off_10inches_Fz_1,Cm6_off_10inches_Fz_2,Cm6_off_10inches_Fz_3,Cm6_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cm7_off_10inches_Fz_1,Cm7_off_10inches_Fz_2,Cm7_off_10inches_Fz_3,Cm7_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cm8_off_10inches_Fz_1,Cm8_off_10inches_Fz_2,Cm8_off_10inches_Fz_3,Cm8_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), mean([Cm1_off_12inches_Fz_1,Cm1_off_12inches_Fz_2,Cm1_off_12inches_Fz_3,Cm1_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cm2_off_12inches_Fz_1,Cm2_off_12inches_Fz_2,Cm2_off_12inches_Fz_3,Cm2_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cm3_off_12inches_Fz_1,Cm3_off_12inches_Fz_2,Cm3_off_12inches_Fz_3,Cm3_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cm4_off_12inches_Fz_1,Cm4_off_12inches_Fz_2,Cm4_off_12inches_Fz_3,Cm4_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cm5_off_12inches_Fz_1,Cm5_off_12inches_Fz_2,Cm5_off_12inches_Fz_3,Cm5_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cm6_off_12inches_Fz_1,Cm6_off_12inches_Fz_2,Cm6_off_12inches_Fz_3,Cm6_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cm7_off_12inches_Fz_1,Cm7_off_12inches_Fz_2,Cm7_off_12inches_Fz_3,Cm7_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cm8_off_12inches_Fz_1,Cm8_off_12inches_Fz_2,Cm8_off_12inches_Fz_3,Cm8_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
% plot(distances(1), mean([Cm1_off_13inches_Fz_1,Cm1_off_13inches_Fz_2,Cm1_off_13inches_Fz_3,Cm1_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(2), mean([Cm2_off_13inches_Fz_1,Cm2_off_13inches_Fz_2,Cm2_off_13inches_Fz_3,Cm2_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(3), mean([Cm3_off_13inches_Fz_1,Cm3_off_13inches_Fz_2,Cm3_off_13inches_Fz_3,Cm3_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(4), mean([Cm4_off_13inches_Fz_1,Cm4_off_13inches_Fz_2,Cm4_off_13inches_Fz_3,Cm4_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(5), mean([Cm5_off_13inches_Fz_1,Cm5_off_13inches_Fz_2,Cm5_off_13inches_Fz_3,Cm5_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(6), mean([Cm6_off_13inches_Fz_1,Cm6_off_13inches_Fz_2,Cm6_off_13inches_Fz_3,Cm6_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(7), mean([Cm7_off_13inches_Fz_1,Cm7_off_13inches_Fz_2,Cm7_off_13inches_Fz_3,Cm7_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(8), mean([Cm8_off_13inches_Fz_1,Cm8_off_13inches_Fz_2,Cm8_off_13inches_Fz_3,Cm8_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylim([0,0.03])
ylabel('C$_Q$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), mean([Cf1_off_10inches_Fz_1,Cf1_off_10inches_Fz_2,Cf1_off_10inches_Fz_3,Cf1_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cf2_off_10inches_Fz_1,Cf2_off_10inches_Fz_2,Cf2_off_10inches_Fz_3,Cf2_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cf3_off_10inches_Fz_1,Cf3_off_10inches_Fz_2,Cf3_off_10inches_Fz_3,Cf3_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cf4_off_10inches_Fz_1,Cf4_off_10inches_Fz_2,Cf4_off_10inches_Fz_3,Cf4_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cf5_off_10inches_Fz_1,Cf5_off_10inches_Fz_2,Cf5_off_10inches_Fz_3,Cf5_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cf6_off_10inches_Fz_1,Cf6_off_10inches_Fz_2,Cf6_off_10inches_Fz_3,Cf6_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cf7_off_10inches_Fz_1,Cf7_off_10inches_Fz_2,Cf7_off_10inches_Fz_3,Cf7_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cf8_off_10inches_Fz_1,Cf8_off_10inches_Fz_2,Cf8_off_10inches_Fz_3,Cf8_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), mean([Cf1_off_12inches_Fz_1,Cf1_off_12inches_Fz_2,Cf1_off_12inches_Fz_3,Cf1_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cf2_off_12inches_Fz_1,Cf2_off_12inches_Fz_2,Cf2_off_12inches_Fz_3,Cf2_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cf3_off_12inches_Fz_1,Cf3_off_12inches_Fz_2,Cf3_off_12inches_Fz_3,Cf3_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cf4_off_12inches_Fz_1,Cf4_off_12inches_Fz_2,Cf4_off_12inches_Fz_3,Cf4_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cf5_off_12inches_Fz_1,Cf5_off_12inches_Fz_2,Cf5_off_12inches_Fz_3,Cf5_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cf6_off_12inches_Fz_1,Cf6_off_12inches_Fz_2,Cf6_off_12inches_Fz_3,Cf6_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cf7_off_12inches_Fz_1,Cf7_off_12inches_Fz_2,Cf7_off_12inches_Fz_3,Cf7_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cf8_off_12inches_Fz_1,Cf8_off_12inches_Fz_2,Cf8_off_12inches_Fz_3,Cf8_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
% plot(distances(1), mean([Cf1_off_13inches_Fz_1,Cf1_off_13inches_Fz_2,Cf1_off_13inches_Fz_3,Cf1_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(2), mean([Cf2_off_13inches_Fz_1,Cf2_off_13inches_Fz_2,Cf2_off_13inches_Fz_3,Cf2_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(3), mean([Cf3_off_13inches_Fz_1,Cf3_off_13inches_Fz_2,Cf3_off_13inches_Fz_3,Cf3_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(4), mean([Cf4_off_13inches_Fz_1,Cf4_off_13inches_Fz_2,Cf4_off_13inches_Fz_3,Cf4_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(5), mean([Cf5_off_13inches_Fz_1,Cf5_off_13inches_Fz_2,Cf5_off_13inches_Fz_3,Cf5_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(6), mean([Cf6_off_13inches_Fz_1,Cf6_off_13inches_Fz_2,Cf6_off_13inches_Fz_3,Cf6_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(7), mean([Cf7_off_13inches_Fz_1,Cf7_off_13inches_Fz_2,Cf7_off_13inches_Fz_3,Cf7_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% plot(distances(8), mean([Cf8_off_13inches_Fz_1,Cf8_off_13inches_Fz_2,Cf8_off_13inches_Fz_3,Cf8_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('12"x6"')
xlabel('D/R [-]')
ylim([0,0.03])
legend('10"x4.5" avg','','','','','','','','12"x6" avg','','','','','','','','13"x6.5" avg')
ylabel('C$_F$ [-]')


figure()
hold on; grid on;
plot(distances(1), mean([Ct1_off_10inches_Fz_1,Ct1_off_10inches_Fz_2,Ct1_off_10inches_Fz_3,Ct1_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Ct2_off_10inches_Fz_1,Ct2_off_10inches_Fz_2,Ct2_off_10inches_Fz_3,Ct2_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Ct3_off_10inches_Fz_1,Ct3_off_10inches_Fz_2,Ct3_off_10inches_Fz_3,Ct3_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Ct4_off_10inches_Fz_1,Ct4_off_10inches_Fz_2,Ct4_off_10inches_Fz_3,Ct4_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Ct5_off_10inches_Fz_1,Ct5_off_10inches_Fz_2,Ct5_off_10inches_Fz_3,Ct5_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Ct6_off_10inches_Fz_1,Ct6_off_10inches_Fz_2,Ct6_off_10inches_Fz_3,Ct6_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Ct7_off_10inches_Fz_1,Ct7_off_10inches_Fz_2,Ct7_off_10inches_Fz_3,Ct7_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Ct8_off_10inches_Fz_1,Ct8_off_10inches_Fz_2,Ct8_off_10inches_Fz_3,Ct8_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), mean([Ct1_off_12inches_Fz_1,Ct1_off_12inches_Fz_2,Ct1_off_12inches_Fz_3,Ct1_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), mean([Ct2_off_12inches_Fz_1,Ct2_off_12inches_Fz_2,Ct2_off_12inches_Fz_3,Ct2_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), mean([Ct3_off_12inches_Fz_1,Ct3_off_12inches_Fz_2,Ct3_off_12inches_Fz_3,Ct3_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), mean([Ct4_off_12inches_Fz_1,Ct4_off_12inches_Fz_2,Ct4_off_12inches_Fz_3,Ct4_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), mean([Ct5_off_12inches_Fz_1,Ct5_off_12inches_Fz_2,Ct5_off_12inches_Fz_3,Ct5_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), mean([Ct6_off_12inches_Fz_1,Ct6_off_12inches_Fz_2,Ct6_off_12inches_Fz_3,Ct6_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), mean([Ct7_off_12inches_Fz_1,Ct7_off_12inches_Fz_2,Ct7_off_12inches_Fz_3,Ct7_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), mean([Ct8_off_12inches_Fz_1,Ct8_off_12inches_Fz_2,Ct8_off_12inches_Fz_3,Ct8_off_12inches_Fz_4]),'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), mean([Ct1_off_13inches_Fz_1,Ct1_off_13inches_Fz_2,Ct1_off_13inches_Fz_3,Ct1_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), mean([Ct2_off_13inches_Fz_1,Ct2_off_13inches_Fz_2,Ct2_off_13inches_Fz_3,Ct2_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), mean([Ct3_off_13inches_Fz_1,Ct3_off_13inches_Fz_2,Ct3_off_13inches_Fz_3,Ct3_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), mean([Ct4_off_13inches_Fz_1,Ct4_off_13inches_Fz_2,Ct4_off_13inches_Fz_3,Ct4_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), mean([Ct5_off_13inches_Fz_1,Ct5_off_13inches_Fz_2,Ct5_off_13inches_Fz_3,Ct5_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), mean([Ct6_off_13inches_Fz_1,Ct6_off_13inches_Fz_2,Ct6_off_13inches_Fz_3,Ct6_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), mean([Ct7_off_13inches_Fz_1,Ct7_off_13inches_Fz_2,Ct7_off_13inches_Fz_3,Ct7_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), mean([Ct8_off_13inches_Fz_1,Ct8_off_13inches_Fz_2,Ct8_off_13inches_Fz_3,Ct8_off_13inches_Fz_4]),'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('12"x6"')
xlabel('D/R [-]')
% ylim([0,0.03])
legend('10"x4.5" avg','','','','','','','','12"x6" avg','','','','','','','','13"x6.5" avg')
ylabel('C$_T$ [-]')

figure()
hold on; grid on;
plot(distances(1), Ct1_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Ct2_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Ct3_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Ct4_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Ct5_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Ct6_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Ct7_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Ct8_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Ct1_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Ct2_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Ct3_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Ct4_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Ct5_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Ct6_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Ct7_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Ct8_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Ct1_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Ct2_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Ct3_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Ct4_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Ct5_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Ct6_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Ct7_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Ct8_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances_txc(1), Ct_txc1_10inch_RPM2,'x','color','k','markersize',7,'lineWidth',2);
plot(distances_txc(2), Ct_txc2_10inch_RPM2,'x','color','k','markersize',7,'lineWidth',2);
plot(distances_txc(3), Ct_txc3_10inch_RPM2,'x','color','k','markersize',7,'lineWidth',2);
plot(distances_txc(4), Ct_txc4_10inch_RPM2,'x','color','k','markersize',7,'lineWidth',2);
plot(distances_txc(5), Ct_txc5_10inch_RPM2,'x','color','k','markersize',7,'lineWidth',2);
plot(distances_txc(6), Ct_txc6_10inch_RPM2,'x','color','k','markersize',7,'lineWidth',2);
plot(distances_txc(1), Ct_txc1_12inch_RPM2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances_txc(2), Ct_txc2_12inch_RPM2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances_txc(3), Ct_txc3_12inch_RPM2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances_txc(4), Ct_txc4_12inch_RPM2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances_txc(5), Ct_txc5_12inch_RPM2,'x','color','b','markersize',7,'lineWidth',2);
plot(distances_txc(6), Ct_txc6_12inch_RPM2,'x','color','b','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('12"x6"')
xlabel('D/R [-]')
% ylim([0,0.03])
legend('10"x4.5" DU','','','','','','','','12"x6" DU','','','','','','','','13"x6.5" DU','','','','','','','','10"x4.7" txc','','','','','','12"x6" txc')
ylabel('C$_T$ @ 4000 RPM [-]')

%}

%% Surface plots

temps_10inch_txc = [Temp1_10inch_txc,Temp2_10inch_txc,Temp3_10inch_txc,Temp4_10inch_txc,Temp5_10inch_txc,Temp6_10inch_txc].*ones(4,6);
press_10inch_txc = [Pres1_10inch_txc,Pres2_10inch_txc,Pres3_10inch_txc,Pres4_10inch_txc,Pres5_10inch_txc,Pres6_10inch_txc].*ones(4,6);
rho_10inch_txc = [rho1_10inch_txc,rho2_10inch_txc,rho3_10inch_txc,rho4_10inch_txc,rho5_10inch_txc,rho6_10inch_txc].*ones(4,6);

temps_12inch_txc = [Temp1_12inch_txc,Temp2_12inch_txc,Temp3_12inch_txc,Temp4_12inch_txc,Temp5_12inch_txc,Temp6_12inch_txc].*ones(4,6);
press_12inch_txc = [Pres1_12inch_txc,Pres2_12inch_txc,Pres3_12inch_txc,Pres4_12inch_txc,Pres5_12inch_txc,Pres6_12inch_txc].*ones(4,6);
rho_12inch_txc = [rho1_12inch_txc,rho2_12inch_txc,rho3_12inch_txc,rho4_12inch_txc,rho5_12inch_txc,rho6_12inch_txc].*ones(4,6);

coefs_10inch_txc =      [Ct_txc1_10inch_Fz1,Ct_txc2_10inch_Fz1,Ct_txc3_10inch_Fz1,Ct_txc4_10inch_Fz1,Ct_txc5_10inch_Fz1,Ct_txc6_10inch_Fz1;
                         Ct_txc1_10inch_Fz2,Ct_txc2_10inch_Fz2,Ct_txc3_10inch_Fz2,Ct_txc4_10inch_Fz2,Ct_txc5_10inch_Fz2,Ct_txc6_10inch_Fz2;
                         Ct_txc1_10inch_RPM1,Ct_txc2_10inch_RPM1,Ct_txc3_10inch_RPM1,Ct_txc4_10inch_RPM1,Ct_txc5_10inch_RPM1,Ct_txc6_10inch_RPM1;
                         Ct_txc1_10inch_RPM2,Ct_txc2_10inch_RPM2,Ct_txc3_10inch_RPM2,Ct_txc4_10inch_RPM2,Ct_txc5_10inch_RPM2,Ct_txc6_10inch_RPM2];                       
coefs_12inch_txc =      [Ct_txc1_12inch_Fz1,Ct_txc2_12inch_Fz1,Ct_txc3_12inch_Fz1,Ct_txc4_12inch_Fz1,Ct_txc5_12inch_Fz1,Ct_txc6_12inch_Fz1;
                         Ct_txc1_12inch_Fz2,Ct_txc2_12inch_Fz2,Ct_txc3_12inch_Fz2,Ct_txc4_12inch_Fz2,Ct_txc5_12inch_Fz2,Ct_txc6_12inch_Fz2;
                         Ct_txc1_12inch_RPM1,Ct_txc2_12inch_RPM1,Ct_txc3_12inch_RPM1,Ct_txc4_12inch_RPM1,Ct_txc5_12inch_RPM1,Ct_txc6_12inch_RPM1;
                         Ct_txc1_12inch_RPM2,Ct_txc2_12inch_RPM2,Ct_txc3_12inch_RPM2,Ct_txc4_12inch_RPM2,Ct_txc5_12inch_RPM2,Ct_txc6_12inch_RPM2];  

temps_10inch_du = [Temp1_10inch,Temp2_10inch,Temp3_10inch,Temp4_10inch,Temp5_10inch,Temp6_10inch,Temp7_10inch,Temp8_10inch].*ones(5,8);
press_10inch_du = [Pres1_10inch,Pres2_10inch,Pres3_10inch,Pres4_10inch,Pres5_10inch,Pres6_10inch,Pres7_10inch,Pres8_10inch].*ones(5,8);
rho_10inch_du = [rho1_10inch,rho2_10inch,rho3_10inch,rho4_10inch,rho5_10inch,rho6_10inch,rho7_10inch,rho8_10inch].*ones(5,8);


temps_12inch_du = [Temp1_12inch,Temp2_12inch,Temp3_12inch,Temp4_12inch,Temp5_12inch,Temp6_12inch,Temp7_12inch,Temp8_12inch].*ones(5,8);
press_12inch_du = [Pres1_12inch,Pres2_12inch,Pres3_12inch,Pres4_12inch,Pres5_12inch,Pres6_12inch,Pres7_12inch,Pres8_12inch].*ones(5,8);
rho_12inch_du = [rho1_12inch,rho2_12inch,rho3_12inch,rho4_12inch,rho5_12inch,rho6_12inch,rho7_12inch,rho8_12inch].*ones(5,8);

temps_13inch_du = [Temp1_13inch,Temp2_13inch,Temp3_13inch,Temp4_13inch,Temp5_13inch,Temp6_13inch,Temp7_13inch,Temp8_13inch].*ones(5,8);
press_13inch_du = [Pres1_13inch,Pres2_13inch,Pres3_13inch,Pres4_13inch,Pres5_13inch,Pres6_13inch,Pres7_13inch,Pres8_13inch].*ones(5,8);
rho_13inch_du = [rho1_13inch,rho2_13inch,rho3_13inch,rho4_13inch,rho5_13inch,rho6_13inch,rho7_13inch,rho8_13inch].*ones(5,8);

coefs_10inch_du =      [Ct1_off_10inches_Fz_1,Ct2_off_10inches_Fz_1,Ct3_off_10inches_Fz_1,Ct4_off_10inches_Fz_1,Ct5_off_10inches_Fz_1,Ct6_off_10inches_Fz_1,Ct7_off_10inches_Fz_1,Ct8_off_10inches_Fz_1;
                         Ct1_off_10inches_Fz_2,Ct2_off_10inches_Fz_2,Ct3_off_10inches_Fz_2,Ct4_off_10inches_Fz_2,Ct5_off_10inches_Fz_2,Ct6_off_10inches_Fz_2,Ct7_off_10inches_Fz_2,Ct8_off_10inches_Fz_2;
                         Ct1_off_10inches_Fz_3,Ct2_off_10inches_Fz_3,Ct3_off_10inches_Fz_3,Ct4_off_10inches_Fz_3,Ct5_off_10inches_Fz_3,Ct6_off_10inches_Fz_3,Ct7_off_10inches_Fz_3,Ct8_off_10inches_Fz_3;
                         Ct1_off_10inches_Fz_4,Ct2_off_10inches_Fz_4,Ct3_off_10inches_Fz_4,Ct4_off_10inches_Fz_4,Ct5_off_10inches_Fz_4,Ct6_off_10inches_Fz_4,Ct7_off_10inches_Fz_4,Ct8_off_10inches_Fz_4;
                         Ct1_off_10inches_RPM_1,Ct2_off_10inches_RPM_1,Ct3_off_10inches_RPM_1,Ct4_off_10inches_RPM_1,Ct5_off_10inches_RPM_1,Ct6_off_10inches_RPM_1,Ct7_off_10inches_RPM_1,Ct8_off_10inches_RPM_1];
coefs_12inch_du =      [Ct1_off_12inches_Fz_1,Ct2_off_12inches_Fz_1,Ct3_off_12inches_Fz_1,Ct4_off_12inches_Fz_1,Ct5_off_12inches_Fz_1,Ct6_off_12inches_Fz_1,Ct7_off_12inches_Fz_1,Ct8_off_12inches_Fz_1;
                         Ct1_off_12inches_Fz_2,Ct2_off_12inches_Fz_2,Ct3_off_12inches_Fz_2,Ct4_off_12inches_Fz_2,Ct5_off_12inches_Fz_2,Ct6_off_12inches_Fz_2,Ct7_off_12inches_Fz_2,Ct8_off_12inches_Fz_2;
                         Ct1_off_12inches_Fz_3,Ct2_off_12inches_Fz_3,Ct3_off_12inches_Fz_3,Ct4_off_12inches_Fz_3,Ct5_off_12inches_Fz_3,Ct6_off_12inches_Fz_3,Ct7_off_12inches_Fz_3,Ct8_off_12inches_Fz_3;
                         Ct1_off_12inches_Fz_4,Ct2_off_12inches_Fz_4,Ct3_off_12inches_Fz_4,Ct4_off_12inches_Fz_4,Ct5_off_12inches_Fz_4,Ct6_off_12inches_Fz_4,Ct7_off_12inches_Fz_4,Ct8_off_12inches_Fz_4;
                         Ct1_off_12inches_RPM_1,Ct2_off_12inches_RPM_1,Ct3_off_12inches_RPM_1,Ct4_off_12inches_RPM_1,Ct5_off_12inches_RPM_1,Ct6_off_12inches_RPM_1,Ct7_off_12inches_RPM_1,Ct8_off_12inches_RPM_1];
coefs_13inch_du =       [Ct1_off_13inches_Fz_1,Ct2_off_13inches_Fz_1,Ct3_off_13inches_Fz_1,Ct4_off_13inches_Fz_1,Ct5_off_13inches_Fz_1,Ct6_off_13inches_Fz_1,Ct7_off_13inches_Fz_1,Ct8_off_13inches_Fz_1;
                         Ct1_off_13inches_Fz_2,Ct2_off_13inches_Fz_2,Ct3_off_13inches_Fz_2,Ct4_off_13inches_Fz_2,Ct5_off_13inches_Fz_2,Ct6_off_13inches_Fz_2,Ct7_off_13inches_Fz_2,Ct8_off_13inches_Fz_2;
                         Ct1_off_13inches_Fz_3,Ct2_off_13inches_Fz_3,Ct3_off_13inches_Fz_3,Ct4_off_13inches_Fz_3,Ct5_off_13inches_Fz_3,Ct6_off_13inches_Fz_3,Ct7_off_13inches_Fz_3,Ct8_off_13inches_Fz_3;
                         Ct1_off_13inches_Fz_4,Ct2_off_13inches_Fz_4,Ct3_off_13inches_Fz_4,Ct4_off_13inches_Fz_4,Ct5_off_13inches_Fz_4,Ct6_off_13inches_Fz_4,Ct7_off_13inches_Fz_4,Ct8_off_13inches_Fz_4;
                         Ct1_off_13inches_RPM_1,Ct2_off_13inches_RPM_1,Ct3_off_13inches_RPM_1,Ct4_off_13inches_RPM_1,Ct5_off_13inches_RPM_1,Ct6_off_13inches_RPM_1,Ct7_off_13inches_RPM_1,Ct8_off_13inches_RPM_1];

figure()
hold on;grid on;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot3(temps_10inch_txc,rho_10inch_txc.*coefs_10inch_txc,press_10inch_txc,'x','color','k','markersize',7,'lineWidth',2)
plot3(temps_12inch_txc,rho_12inch_txc.*coefs_12inch_txc,press_12inch_txc,'x','color','b','markersize',7,'lineWidth',2)
plot3(temps_10inch_du,rho_10inch_du.*coefs_10inch_du,press_10inch_du,'o','color','k','markersize',7,'lineWidth',2)
plot3(temps_12inch_du,rho_12inch_du.*coefs_12inch_du,press_12inch_du,'o','color','b','markersize',7,'lineWidth',2)
plot3(temps_13inch_du,rho_13inch_du.*coefs_13inch_du,press_13inch_du,'o','color','r','markersize',7,'lineWidth',2)
surf(temps_10inch_txc,rho_10inch_txc.*coefs_10inch_txc,press_10inch_txc)
surf(temps_12inch_txc,rho_12inch_txc.*coefs_12inch_txc,press_12inch_txc)
surf(temps_10inch_du,rho_10inch_du.*coefs_10inch_du,press_10inch_du)
surf(temps_12inch_du,rho_12inch_du.*coefs_12inch_du,press_12inch_du)
surf(temps_13inch_du,rho_13inch_du.*coefs_13inch_du,press_13inch_du)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
zlabel('Pressure [mbar]')
xlabel('Temperature [\circ C]')
ylabel('C$_T\cdot\rho$ [-]')
% legend('10"x4.5 DU"')

figure()
hold on;grid on;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc,coefs_10inch_txc,'x','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_txc,coefs_12inch_txc,'x','color','b','markersize',7,'lineWidth',2)
plot(rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',7,'lineWidth',2)
plot(rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
xlabel('$\rho$ [kg/m$^3$]')
% ylabel('Temperature [\circ C]')
ylabel('C$_T$ [-]')
% legend('10"x4.5 DU"')

figure()
hold on;grid on;
t = tiledlayout(1,1);
ax1 = axes(t);
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
ax1.YAxisLocation = 'right';
ax1.FontSize = 12;
ax1.FontWeight = 'bold';
ax1.XColor = 'k';
ax1.YColor = '#D95319';
ylabel('C$_T$ [-] @ 4000 RPM','FontSize',15)
xlim([0.90, 1.2])
ylim([0.4, 1.4])
ax2 = axes(t);
plot(ax2,rho_10inch_txc,rho_10inch_txc.*coefs_10inch_txc,'x','color','k','markersize',7,'lineWidth',2)
hold on
plot(ax2,rho_12inch_txc,rho_12inch_txc.*coefs_12inch_txc,'x','color','b','markersize',7,'lineWidth',2)
plot(ax2,rho_10inch_du,rho_10inch_du.*coefs_10inch_du,'o','color','k','markersize',7,'lineWidth',2)
plot(ax2,rho_12inch_du,rho_12inch_du.*coefs_12inch_du,'o','color','b','markersize',7,'lineWidth',2)
plot(ax2,rho_13inch_du,rho_13inch_du.*coefs_13inch_du,'o','color','r','markersize',7,'lineWidth',2) 
plot(ax2,rho_10inch_txc,coefs_10inch_txc,'x','color',"#D95319",'markersize',5,'lineWidth',1)
plot(ax2,rho_12inch_txc,coefs_12inch_txc,'x','color',"#D95319",'markersize',5,'lineWidth',1)
plot(ax2,rho_10inch_du,coefs_10inch_du,'o','color',"#D95319",'markersize',5,'lineWidth',1)
plot(ax2,rho_12inch_du,coefs_12inch_du,'o','color',"#D95319",'markersize',5,'lineWidth',1)
plot(ax2,rho_13inch_du,coefs_13inch_du,'o','color',"#D95319",'markersize',5,'lineWidth',1)
legend('10"x4.7"', '', '', '' ,'' ,'' ,'12"x5"', '', '', '' ,'' ,'' ,'10"x4.5"', '', '', '' ,'' ,'' ,'','','12"x6"', '', '', '' ,'' ,'' ,'','','13"x6.5"','Location','best','fontsize',13)
grid on;
ax2.XAxisLocation = 'bottom';
ax2.YAxisLocation = 'left';
ax2.FontSize = 12;
ax2.FontWeigth = 'bold';
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
ylim([0.4, 1.4])
ylabel('C$_T \cdot\rho$ [kg/m$^3$] @ 4000 RPM','FontSize',15)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% ylabel('Temperature [\circ C]')
xlim([0.90, 1.2])
xlabel('$\rho$ [kg/m$^3$]','FontSize',15)
% ylim([0, 1.4])



figure()
hold on;grid on;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,'x','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,'x','color','b','markersize',7,'lineWidth',2)
plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',7,'lineWidth',2)
plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
xlabel('$\rho$ [kg/m$^3$]','FontSize',15)
% ylabel('Temperature [\circ C]')
ylabel('c$_T$ [-]','FontSize',15)
legend('10"x4.7"', '', '', '' ,'' ,'' ,'12"x5"', '', '', '' ,'' ,'' ,'10"x4.5"', '', '', '' ,'' ,'' ,'','','12"x6"', '', '', '' ,'' ,'' ,'','','13"x6.5"','Location','best','fontsize',13)
xlim([0.9,1.3])

figure()
hold on;grid on;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,'x','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,'x','color','b','markersize',7,'lineWidth',2)
plot(mean(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)),mean(mean(coefs_10inch_txc)),'*','color','m','markersize',7,'lineWidth',2)
plot(mean(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)),mean(mean(coefs_12inch_txc)),'*','color','m','markersize',7,'lineWidth',2)
plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',7,'lineWidth',2)
plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',7,'lineWidth',2)
plot(mean(rho_10inch_du(1,:)./rho_10inch_du(1,:)),mean(mean(coefs_10inch_du)),'*','color','m','markersize',7,'lineWidth',2)
plot(mean(rho_12inch_du(1,:)./rho_12inch_du(1,:)),mean(mean(coefs_12inch_du)),'*','color','m','markersize',7,'lineWidth',2)
plot(mean(rho_13inch_du(1,:)./rho_13inch_du(1,:)),mean(mean(coefs_13inch_du)),'*','color','m','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
xlabel('$\rho/\rho_{DU}$ [-]','FontSize',15)
% ylabel('Temperature [\circ C]')
ylabel('c$_T$ [-]','FontSize',15)
legend('10"x4.7" tXc', '', '', '' ,'' ,'' ,'12"x5" tXc', '', '', '' ,'' ,'' ,'','','10"x4.5" DU', '', '', '' ,'' ,'' ,'','','12"x6" DU', '', '', '' ,'' ,'' ,'','','13"x6.5" DU', '', '', '' ,'' ,'' ,'','','Average','Location','best','fontsize',13)
xlim([0.9,1.3])
ylim([0.5,1.3])

htmlGray = [128 128 128]/255;

figure()
hold on;grid on;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc.*(rho_10inch_txc./rho_10inch_du(1:4,1:6)),'x','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc.*(rho_12inch_txc./rho_12inch_du(1:4,1:6)),'x','color','b','markersize',7,'lineWidth',2)
plot(mean(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)),mean(mean(coefs_10inch_txc.*(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)))),'*','color','m','markersize',7,'lineWidth',2)
plot(mean(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)),mean(mean(coefs_12inch_txc.*(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)))),'*','color','m','markersize',7,'lineWidth',2)
% plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,'x','color',htmlGray,'markersize',7,'lineWidth',2)
% plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,'x','color','c','markersize',7,'lineWidth',2)
plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',7,'lineWidth',2)
plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',7,'lineWidth',2)
plot(mean(rho_10inch_du(1,:)./rho_10inch_du(1,:)),mean(mean(coefs_10inch_du)),'*','color','m','markersize',7,'lineWidth',2)
plot(mean(rho_12inch_du(1,:)./rho_12inch_du(1,:)),mean(mean(coefs_12inch_du)),'*','color','m','markersize',7,'lineWidth',2)
plot(mean(rho_13inch_du(1,:)./rho_13inch_du(1,:)),mean(mean(coefs_13inch_du)),'*','color','m','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
xlabel('$\rho/\rho_{DU}$ [-]','FontSize',15)
% ylabel('Temperature [\circ C]')
ylabel('c$_T\cdot\frac{\rho}{\rho_{DU}}$ @ 4000 RPM [-]','FontSize',15)
legend('10"x4.7" tXc', '', '', '' ,'' ,'' ,'12"x5" tXc', '', '', '' ,'' ,'' , '', '','10"x4.5" DU', '', '', '' ,'' ,'' ,'','','12"x6" DU', '', '', '' ,'' ,'' ,'','','13"x6.5" DU', '', '', '' ,'' ,'' ,'','', 'Average','Location','best','fontsize',13)
xlim([0.9,1.3])

figure()
hold on;grid on;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc.*(rho_10inch_txc./rho_10inch_du(1:4,1:6)),'x','color','k','markersize',7,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc.*(rho_12inch_txc./rho_12inch_du(1:4,1:6)),'x','color','b','markersize',7,'lineWidth',2)
plot(mean(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)),mean(mean(coefs_10inch_txc.*(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)))),'*','color','m','markersize',7,'lineWidth',2)
plot(mean(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)),mean(mean(coefs_12inch_txc.*(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)))),'*','color','m','markersize',7,'lineWidth',2)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,'o','color',htmlGray,'markersize',7,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,'o','color','c','markersize',7,'lineWidth',2)
% plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',7,'lineWidth',2)
% plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',7,'lineWidth',2)
% plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',7,'lineWidth',2)
% plot(mean(rho_10inch_du(1,:)./rho_10inch_du(1,:)),mean(mean(coefs_10inch_du)),'*','color','m','markersize',7,'lineWidth',2)
% plot(mean(rho_12inch_du(1,:)./rho_12inch_du(1,:)),mean(mean(coefs_12inch_du)),'*','color','m','markersize',7,'lineWidth',2)
% plot(mean(rho_13inch_du(1,:)./rho_13inch_du(1,:)),mean(mean(coefs_13inch_du)),'*','color','m','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',7,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',7,'lineWidth',2)
xlabel('$\rho/\rho_{DU}$ [-]','FontSize',15)
% ylabel('Temperature [\circ C]')
ylabel('c$_T\cdot\frac{\rho}{\rho_{DU}}$ @ 4000 RPM [-]','FontSize',15)
legend('10"x4.7" tXc', '', '', '' ,'' ,'' ,'12"x5" tXc', '', '', '' ,'' ,'' , '', '','10"x4.5" DU', '', '', '' ,'' ,'' ,'','','12"x6" DU', '', '', '' ,'' ,'' ,'','','13"x6.5" DU', '', '', '' ,'' ,'' ,'','', 'Average','Location','best','fontsize',13)
xlim([0.9,1.3])


%{
figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_1,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_1,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 8 N','','','','','','','','12"x6" 8 N','','','','','','','','13"x6.5" 8 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')




figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_3,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_3,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 12 N','','','','','','','','12"x6" 12 N','','','','','','','','13"x6.5" 12 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')


figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 8 N','','','','','','','','10"x4.5" 10 N','','','','','','','','10"x4.5" 12 N','','','','','','','','10"x4.5" 14 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')

figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('12"x6" 8 N','','','','','','','','12"x6" 10 N','','','','','','','','12"x6" 12 N','','','','','','','','12"x6" 14 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')



figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), Cm1_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), Cf1_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_1,'o','color','k','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_2,'o','color','b','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_3,'o','color','r','markersize',7,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_4,'o','color','m','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('13"x6.5" 8 N','','','','','','','',' 10 N','','','','','','','','12 N','','','','','','','','14 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')


figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), mean([Cm1_off_10inches_Fz_1,Cm1_off_10inches_Fz_2,Cm1_off_10inches_Fz_3,Cm1_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cm2_off_10inches_Fz_1,Cm2_off_10inches_Fz_2,Cm2_off_10inches_Fz_3,Cm2_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cm3_off_10inches_Fz_1,Cm3_off_10inches_Fz_2,Cm3_off_10inches_Fz_3,Cm3_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cm4_off_10inches_Fz_1,Cm4_off_10inches_Fz_2,Cm4_off_10inches_Fz_3,Cm4_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cm5_off_10inches_Fz_1,Cm5_off_10inches_Fz_2,Cm5_off_10inches_Fz_3,Cm5_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cm6_off_10inches_Fz_1,Cm6_off_10inches_Fz_2,Cm6_off_10inches_Fz_3,Cm6_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cm7_off_10inches_Fz_1,Cm7_off_10inches_Fz_2,Cm7_off_10inches_Fz_3,Cm7_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cm8_off_10inches_Fz_1,Cm8_off_10inches_Fz_2,Cm8_off_10inches_Fz_3,Cm8_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), mean([Cf1_off_10inches_Fz_1,Cf1_off_10inches_Fz_2,Cf1_off_10inches_Fz_3,Cf1_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cf2_off_10inches_Fz_1,Cf2_off_10inches_Fz_2,Cf2_off_10inches_Fz_3,Cf2_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cf3_off_10inches_Fz_1,Cf3_off_10inches_Fz_2,Cf3_off_10inches_Fz_3,Cf3_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cf4_off_10inches_Fz_1,Cf4_off_10inches_Fz_2,Cf4_off_10inches_Fz_3,Cf4_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cf5_off_10inches_Fz_1,Cf5_off_10inches_Fz_2,Cf5_off_10inches_Fz_3,Cf5_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cf6_off_10inches_Fz_1,Cf6_off_10inches_Fz_2,Cf6_off_10inches_Fz_3,Cf6_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cf7_off_10inches_Fz_1,Cf7_off_10inches_Fz_2,Cf7_off_10inches_Fz_3,Cf7_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cf8_off_10inches_Fz_1,Cf8_off_10inches_Fz_2,Cf8_off_10inches_Fz_3,Cf8_off_10inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')


figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), mean([Cm1_off_12inches_Fz_1,Cm1_off_12inches_Fz_2,Cm1_off_12inches_Fz_3,Cm1_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cm2_off_12inches_Fz_1,Cm2_off_12inches_Fz_2,Cm2_off_12inches_Fz_3,Cm2_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cm3_off_12inches_Fz_1,Cm3_off_12inches_Fz_2,Cm3_off_12inches_Fz_3,Cm3_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cm4_off_12inches_Fz_1,Cm4_off_12inches_Fz_2,Cm4_off_12inches_Fz_3,Cm4_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cm5_off_12inches_Fz_1,Cm5_off_12inches_Fz_2,Cm5_off_12inches_Fz_3,Cm5_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cm6_off_12inches_Fz_1,Cm6_off_12inches_Fz_2,Cm6_off_12inches_Fz_3,Cm6_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cm7_off_12inches_Fz_1,Cm7_off_12inches_Fz_2,Cm7_off_12inches_Fz_3,Cm7_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cm8_off_12inches_Fz_1,Cm8_off_12inches_Fz_2,Cm8_off_12inches_Fz_3,Cm8_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), mean([Cf1_off_12inches_Fz_1,Cf1_off_12inches_Fz_2,Cf1_off_12inches_Fz_3,Cf1_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cf2_off_12inches_Fz_1,Cf2_off_12inches_Fz_2,Cf2_off_12inches_Fz_3,Cf2_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cf3_off_12inches_Fz_1,Cf3_off_12inches_Fz_2,Cf3_off_12inches_Fz_3,Cf3_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cf4_off_12inches_Fz_1,Cf4_off_12inches_Fz_2,Cf4_off_12inches_Fz_3,Cf4_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cf5_off_12inches_Fz_1,Cf5_off_12inches_Fz_2,Cf5_off_12inches_Fz_3,Cf5_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cf6_off_12inches_Fz_1,Cf6_off_12inches_Fz_2,Cf6_off_12inches_Fz_3,Cf6_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cf7_off_12inches_Fz_1,Cf7_off_12inches_Fz_2,Cf7_off_12inches_Fz_3,Cf7_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cf8_off_12inches_Fz_1,Cf8_off_12inches_Fz_2,Cf8_off_12inches_Fz_3,Cf8_off_12inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('12"x6"')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')







figure()
subplot(2,1,1)
hold on; grid on;
plot(distances(1), mean([Cm1_off_13inches_Fz_1,Cm1_off_13inches_Fz_2,Cm1_off_13inches_Fz_3,Cm1_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cm2_off_13inches_Fz_1,Cm2_off_13inches_Fz_2,Cm2_off_13inches_Fz_3,Cm2_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cm3_off_13inches_Fz_1,Cm3_off_13inches_Fz_2,Cm3_off_13inches_Fz_3,Cm3_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cm4_off_13inches_Fz_1,Cm4_off_13inches_Fz_2,Cm4_off_13inches_Fz_3,Cm4_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cm5_off_13inches_Fz_1,Cm5_off_13inches_Fz_2,Cm5_off_13inches_Fz_3,Cm5_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cm6_off_13inches_Fz_1,Cm6_off_13inches_Fz_2,Cm6_off_13inches_Fz_3,Cm6_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cm7_off_13inches_Fz_1,Cm7_off_13inches_Fz_2,Cm7_off_13inches_Fz_3,Cm7_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cm8_off_13inches_Fz_1,Cm8_off_13inches_Fz_2,Cm8_off_13inches_Fz_3,Cm8_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid on;
plot(distances(1), mean([Cf1_off_13inches_Fz_1,Cf1_off_13inches_Fz_2,Cf1_off_13inches_Fz_3,Cf1_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(2), mean([Cf2_off_13inches_Fz_1,Cf2_off_13inches_Fz_2,Cf2_off_13inches_Fz_3,Cf2_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(3), mean([Cf3_off_13inches_Fz_1,Cf3_off_13inches_Fz_2,Cf3_off_13inches_Fz_3,Cf3_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(4), mean([Cf4_off_13inches_Fz_1,Cf4_off_13inches_Fz_2,Cf4_off_13inches_Fz_3,Cf4_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(5), mean([Cf5_off_13inches_Fz_1,Cf5_off_13inches_Fz_2,Cf5_off_13inches_Fz_3,Cf5_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(6), mean([Cf6_off_13inches_Fz_1,Cf6_off_13inches_Fz_2,Cf6_off_13inches_Fz_3,Cf6_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(7), mean([Cf7_off_13inches_Fz_1,Cf7_off_13inches_Fz_2,Cf7_off_13inches_Fz_3,Cf7_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
plot(distances(8), mean([Cf8_off_13inches_Fz_1,Cf8_off_13inches_Fz_2,Cf8_off_13inches_Fz_3,Cf8_off_13inches_Fz_4]),'o','color','k','markersize',7,'lineWidth',2);
% xlabel('Segment [-]')
legend('13"x6.5"')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')

%}