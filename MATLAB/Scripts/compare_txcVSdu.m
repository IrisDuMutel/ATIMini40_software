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
mxlim = 0.15;
mylim = 0.1;
point_to_see = 12;
point_to_see_10 = 5;
point_to_see_12 = 5;
point_to_see_13 = 2;
flag =0;
distances_vec = [10,1,1.25,1.5,1.75,2,2.5,3];
steps_per_stair = 6;

rpm10 = [3,9,4,10];  %%% Levels to be taken for equal RPM comparison
rpm12 = [3,9,5,11];  %%% Levels to be taken for equal RPM comparison
rpm13 = [6,12,5,11];  %%% Levels to be taken for equal RPM comparison
Fz10  = [4,10,5,11,6,12,7,13]; %%% Levels to be taken for equal Fz comparison
Fz12  = [4,10,5,11,6,12,7,13]; %%% Levels to be taken for equal Fz comparison
Fz13  = [3,6,4,10,5,11,7,13]; %%% Levels to be taken for equal Fz comparison

%% JINT Uncertainty of the forces and torques
r_factor_F = 1;
r_factor_M = 1;
r_factor_c = 1;
u_resol_Fz = 0.045/sqrt(12);
u_resol_Fxy = 0.022/sqrt(12);
u_resol_M   = 0.0006/sqrt(12);
u_Fz_datasheet = 3.34/2;
u_Fy_datasheet = 1.11/2;
u_Mx_datasheet = 0.056/2;

%10inches
% Std uncertainty (type A)      declared uncertainty (type B)
delta10_F1 = 2*sqrt((file1_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_F2 = 2*sqrt((file2_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_F3 = 2*sqrt((file3_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_F4 = 2*sqrt((file4_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_F5 = 2*sqrt((file5_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_F6 = 2*sqrt((file6_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_F7 = 2*sqrt((file7_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_F8 = 2*sqrt((file8_10.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M1 = 2*sqrt((file1_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M2 = 2*sqrt((file2_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M3 = 2*sqrt((file3_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M4 = 2*sqrt((file4_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M5 = 2*sqrt((file5_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M6 = 2*sqrt((file6_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M7 = 2*sqrt((file7_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_M8 = 2*sqrt((file8_10.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T1 = 2*sqrt((file1_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T2 = 2*sqrt((file2_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T3 = 2*sqrt((file3_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T4 = 2*sqrt((file4_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T5 = 2*sqrt((file5_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T6 = 2*sqrt((file6_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T7 = 2*sqrt((file7_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta10_T8 = 2*sqrt((file8_10.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal



%12inches
% Std uncertainty (type A)      declared uncertainty (type B)
delta12_F1 = 2*sqrt((file1_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_F2 = 2*sqrt((file2_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_F3 = 2*sqrt((file3_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_F4 = 2*sqrt((file4_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_F5 = 2*sqrt((file5_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_F6 = 2*sqrt((file6_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_F7 = 2*sqrt((file7_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_F8 = 2*sqrt((file8_12.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M1 = 2*sqrt((file1_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M2 = 2*sqrt((file2_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M3 = 2*sqrt((file3_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M4 = 2*sqrt((file4_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M5 = 2*sqrt((file5_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M6 = 2*sqrt((file6_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M7 = 2*sqrt((file7_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_M8 = 2*sqrt((file8_12.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T1 = 2*sqrt((file1_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T2 = 2*sqrt((file2_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T3 = 2*sqrt((file3_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T4 = 2*sqrt((file4_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T5 = 2*sqrt((file5_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T6 = 2*sqrt((file6_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T7 = 2*sqrt((file7_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta12_T8 = 2*sqrt((file8_12.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal

%13inches
% Std uncertainty (type A)      declared uncertainty (type B)
delta13_F1 = 2*sqrt((file1_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_F2 = 2*sqrt((file2_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_F3 = 2*sqrt((file3_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_F4 = 2*sqrt((file4_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_F5 = 2*sqrt((file5_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_F6 = 2*sqrt((file6_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_F7 = 2*sqrt((file7_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_F8 = 2*sqrt((file8_13.result.u_Fy).^2 + u_Fy_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M1 = 2*sqrt((file1_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M2 = 2*sqrt((file2_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M3 = 2*sqrt((file3_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M4 = 2*sqrt((file4_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M5 = 2*sqrt((file5_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M6 = 2*sqrt((file6_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M7 = 2*sqrt((file7_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_M8 = 2*sqrt((file8_13.result.u_Mx).^2 + u_Mx_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T1 = 2*sqrt((file1_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T2 = 2*sqrt((file2_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T3 = 2*sqrt((file3_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T4 = 2*sqrt((file4_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T5 = 2*sqrt((file5_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T6 = 2*sqrt((file6_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T7 = 2*sqrt((file7_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal
delta13_T8 = 2*sqrt((file8_13.result.u_Fz).^2 + u_Fz_datasheet^2);% + ; %N this is an extended uncertainty multiplied by 2 because of offset removal

%  We may also want to see what the average between the two stairs are

for i = 13:-1:8
    delta_Fy_points1_10(14-i) = sqrt(1/4*delta10_F1(i)^2+1/4*delta10_F1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F1(i)*delta10_F1(i-steps_per_stair));
    delta_Fy_points2_10(14-i) = sqrt(1/4*delta10_F2(i)^2+1/4*delta10_F2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F2(i)*delta10_F2(i-steps_per_stair));
    delta_Fy_points3_10(14-i) = sqrt(1/4*delta10_F3(i)^2+1/4*delta10_F3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F3(i)*delta10_F3(i-steps_per_stair));
    delta_Fy_points4_10(14-i) = sqrt(1/4*delta10_F4(i)^2+1/4*delta10_F4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F4(i)*delta10_F4(i-steps_per_stair));
    delta_Fy_points5_10(14-i) = sqrt(1/4*delta10_F5(i)^2+1/4*delta10_F5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F5(i)*delta10_F5(i-steps_per_stair));
    delta_Fy_points6_10(14-i) = sqrt(1/4*delta10_F6(i)^2+1/4*delta10_F6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F6(i)*delta10_F6(i-steps_per_stair));
    delta_Fy_points7_10(14-i) = sqrt(1/4*delta10_F7(i)^2+1/4*delta10_F7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F7(i)*delta10_F7(i-steps_per_stair));
    delta_Fy_points8_10(14-i) = sqrt(1/4*delta10_F8(i)^2+1/4*delta10_F8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_F8(i)*delta10_F8(i-steps_per_stair));
    delta_Fz_points1_10(14-i) = sqrt(1/4*delta10_T1(i)^2+1/4*delta10_T1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T1(i)*delta10_T1(i-steps_per_stair));
    delta_Fz_points2_10(14-i) = sqrt(1/4*delta10_T2(i)^2+1/4*delta10_T2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T2(i)*delta10_T2(i-steps_per_stair));
    delta_Fz_points3_10(14-i) = sqrt(1/4*delta10_T3(i)^2+1/4*delta10_T3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T3(i)*delta10_T3(i-steps_per_stair));
    delta_Fz_points4_10(14-i) = sqrt(1/4*delta10_T4(i)^2+1/4*delta10_T4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T4(i)*delta10_T4(i-steps_per_stair));
    delta_Fz_points5_10(14-i) = sqrt(1/4*delta10_T5(i)^2+1/4*delta10_T5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T5(i)*delta10_T5(i-steps_per_stair));
    delta_Fz_points6_10(14-i) = sqrt(1/4*delta10_T6(i)^2+1/4*delta10_T6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T6(i)*delta10_T6(i-steps_per_stair));
    delta_Fz_points7_10(14-i) = sqrt(1/4*delta10_T7(i)^2+1/4*delta10_T7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T7(i)*delta10_T7(i-steps_per_stair));
    delta_Fz_points8_10(14-i) = sqrt(1/4*delta10_T8(i)^2+1/4*delta10_T8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_T8(i)*delta10_T8(i-steps_per_stair));
    delta_Mx_points1_10(14-i) = sqrt(1/4*delta10_M1(i)^2+1/4*delta10_M1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M1(i)*delta10_M1(i-steps_per_stair));
    delta_Mx_points2_10(14-i) = sqrt(1/4*delta10_M2(i)^2+1/4*delta10_M2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M2(i)*delta10_M2(i-steps_per_stair));
    delta_Mx_points3_10(14-i) = sqrt(1/4*delta10_M3(i)^2+1/4*delta10_M3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M3(i)*delta10_M3(i-steps_per_stair));
    delta_Mx_points4_10(14-i) = sqrt(1/4*delta10_M4(i)^2+1/4*delta10_M4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M4(i)*delta10_M4(i-steps_per_stair));
    delta_Mx_points5_10(14-i) = sqrt(1/4*delta10_M5(i)^2+1/4*delta10_M5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M5(i)*delta10_M5(i-steps_per_stair));
    delta_Mx_points6_10(14-i) = sqrt(1/4*delta10_M6(i)^2+1/4*delta10_M6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M6(i)*delta10_M6(i-steps_per_stair));
    delta_Mx_points7_10(14-i) = sqrt(1/4*delta10_M7(i)^2+1/4*delta10_M7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M7(i)*delta10_M7(i-steps_per_stair));
    delta_Mx_points8_10(14-i) = sqrt(1/4*delta10_M8(i)^2+1/4*delta10_M8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M8(i)*delta10_M8(i-steps_per_stair));
    delta_Mz_points8_10(14-i) = sqrt(1/4*delta10_M8(i)^2+1/4*delta10_M8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta10_M8(i)*delta10_M8(i-steps_per_stair));
    delta_Fy_points1_12(14-i) = sqrt(1/4*delta12_F1(i)^2+1/4*delta12_F1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F1(i)*delta12_F1(i-steps_per_stair));
    delta_Fy_points2_12(14-i) = sqrt(1/4*delta12_F2(i)^2+1/4*delta12_F2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F2(i)*delta12_F2(i-steps_per_stair));
    delta_Fy_points3_12(14-i) = sqrt(1/4*delta12_F3(i)^2+1/4*delta12_F3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F3(i)*delta12_F3(i-steps_per_stair));
    delta_Fy_points4_12(14-i) = sqrt(1/4*delta12_F4(i)^2+1/4*delta12_F4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F4(i)*delta12_F4(i-steps_per_stair));
    delta_Fy_points5_12(14-i) = sqrt(1/4*delta12_F5(i)^2+1/4*delta12_F5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F5(i)*delta12_F5(i-steps_per_stair));
    delta_Fy_points6_12(14-i) = sqrt(1/4*delta12_F6(i)^2+1/4*delta12_F6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F6(i)*delta12_F6(i-steps_per_stair));
    delta_Fy_points7_12(14-i) = sqrt(1/4*delta12_F7(i)^2+1/4*delta12_F7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F7(i)*delta12_F7(i-steps_per_stair));
    delta_Fy_points8_12(14-i) = sqrt(1/4*delta12_F8(i)^2+1/4*delta12_F8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_F8(i)*delta12_F8(i-steps_per_stair));
    delta_Fz_points1_12(14-i) = sqrt(1/4*delta12_T1(i)^2+1/4*delta12_T1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T1(i)*delta12_T1(i-steps_per_stair));
    delta_Fz_points2_12(14-i) = sqrt(1/4*delta12_T2(i)^2+1/4*delta12_T2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T2(i)*delta12_T2(i-steps_per_stair));
    delta_Fz_points3_12(14-i) = sqrt(1/4*delta12_T3(i)^2+1/4*delta12_T3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T3(i)*delta12_T3(i-steps_per_stair));
    delta_Fz_points4_12(14-i) = sqrt(1/4*delta12_T4(i)^2+1/4*delta12_T4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T4(i)*delta12_T4(i-steps_per_stair));
    delta_Fz_points5_12(14-i) = sqrt(1/4*delta12_T5(i)^2+1/4*delta12_T5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T5(i)*delta12_T5(i-steps_per_stair));
    delta_Fz_points6_12(14-i) = sqrt(1/4*delta12_T6(i)^2+1/4*delta12_T6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T6(i)*delta12_T6(i-steps_per_stair));
    delta_Fz_points7_12(14-i) = sqrt(1/4*delta12_T7(i)^2+1/4*delta12_T7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T7(i)*delta12_T7(i-steps_per_stair));
    delta_Fz_points8_12(14-i) = sqrt(1/4*delta12_T8(i)^2+1/4*delta12_T8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_T8(i)*delta12_T8(i-steps_per_stair));
    delta_Mx_points1_12(14-i) = sqrt(1/4*delta12_M1(i)^2+1/4*delta12_M1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M1(i)*delta12_M1(i-steps_per_stair));
    delta_Mx_points2_12(14-i) = sqrt(1/4*delta12_M2(i)^2+1/4*delta12_M2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M2(i)*delta12_M2(i-steps_per_stair));
    delta_Mx_points3_12(14-i) = sqrt(1/4*delta12_M3(i)^2+1/4*delta12_M3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M3(i)*delta12_M3(i-steps_per_stair));
    delta_Mx_points4_12(14-i) = sqrt(1/4*delta12_M4(i)^2+1/4*delta12_M4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M4(i)*delta12_M4(i-steps_per_stair));
    delta_Mx_points5_12(14-i) = sqrt(1/4*delta12_M5(i)^2+1/4*delta12_M5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M5(i)*delta12_M5(i-steps_per_stair));
    delta_Mx_points6_12(14-i) = sqrt(1/4*delta12_M6(i)^2+1/4*delta12_M6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M6(i)*delta12_M6(i-steps_per_stair));
    delta_Mx_points7_12(14-i) = sqrt(1/4*delta12_M7(i)^2+1/4*delta12_M7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M7(i)*delta12_M7(i-steps_per_stair));
    delta_Mx_points8_12(14-i) = sqrt(1/4*delta12_M8(i)^2+1/4*delta12_M8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta12_M8(i)*delta12_M8(i-steps_per_stair));
    delta_Fy_points1_13(14-i) = sqrt(1/4*delta13_F1(i)^2+1/4*delta13_F1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F1(i)*delta13_F1(i-steps_per_stair));
    delta_Fy_points2_13(14-i) = sqrt(1/4*delta13_F2(i)^2+1/4*delta13_F2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F2(i)*delta13_F2(i-steps_per_stair));
    delta_Fy_points3_13(14-i) = sqrt(1/4*delta13_F3(i)^2+1/4*delta13_F3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F3(i)*delta13_F3(i-steps_per_stair));
    delta_Fy_points4_13(14-i) = sqrt(1/4*delta13_F4(i)^2+1/4*delta13_F4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F4(i)*delta13_F4(i-steps_per_stair));
    delta_Fy_points5_13(14-i) = sqrt(1/4*delta13_F5(i)^2+1/4*delta13_F5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F5(i)*delta13_F5(i-steps_per_stair));
    delta_Fy_points6_13(14-i) = sqrt(1/4*delta13_F6(i)^2+1/4*delta13_F6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F6(i)*delta13_F6(i-steps_per_stair));
    delta_Fy_points7_13(14-i) = sqrt(1/4*delta13_F7(i)^2+1/4*delta13_F7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F7(i)*delta13_F7(i-steps_per_stair));
    delta_Fy_points8_13(14-i) = sqrt(1/4*delta13_F8(i)^2+1/4*delta13_F8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_F8(i)*delta13_F8(i-steps_per_stair));
    delta_Fz_points1_13(14-i) = sqrt(1/4*delta13_T1(i)^2+1/4*delta13_T1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T1(i)*delta13_T1(i-steps_per_stair));
    delta_Fz_points2_13(14-i) = sqrt(1/4*delta13_T2(i)^2+1/4*delta13_T2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T2(i)*delta13_T2(i-steps_per_stair));
    delta_Fz_points3_13(14-i) = sqrt(1/4*delta13_T3(i)^2+1/4*delta13_T3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T3(i)*delta13_T3(i-steps_per_stair));
    delta_Fz_points4_13(14-i) = sqrt(1/4*delta13_T4(i)^2+1/4*delta13_T4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T4(i)*delta13_T4(i-steps_per_stair));
    delta_Fz_points5_13(14-i) = sqrt(1/4*delta13_T5(i)^2+1/4*delta13_T5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T5(i)*delta13_T5(i-steps_per_stair));
    delta_Fz_points6_13(14-i) = sqrt(1/4*delta13_T6(i)^2+1/4*delta13_T6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T6(i)*delta13_T6(i-steps_per_stair));
    delta_Fz_points7_13(14-i) = sqrt(1/4*delta13_T7(i)^2+1/4*delta13_T7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T7(i)*delta13_T7(i-steps_per_stair));
    delta_Fz_points8_13(14-i) = sqrt(1/4*delta13_T8(i)^2+1/4*delta13_T8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_T8(i)*delta13_T8(i-steps_per_stair));
    delta_Mx_points1_13(14-i) = sqrt(1/4*delta13_M1(i)^2+1/4*delta13_M1(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M1(i)*delta13_M1(i-steps_per_stair));
    delta_Mx_points2_13(14-i) = sqrt(1/4*delta13_M2(i)^2+1/4*delta13_M2(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M2(i)*delta13_M2(i-steps_per_stair));
    delta_Mx_points3_13(14-i) = sqrt(1/4*delta13_M3(i)^2+1/4*delta13_M3(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M3(i)*delta13_M3(i-steps_per_stair));
    delta_Mx_points4_13(14-i) = sqrt(1/4*delta13_M4(i)^2+1/4*delta13_M4(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M4(i)*delta13_M4(i-steps_per_stair));
    delta_Mx_points5_13(14-i) = sqrt(1/4*delta13_M5(i)^2+1/4*delta13_M5(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M5(i)*delta13_M5(i-steps_per_stair));
    delta_Mx_points6_13(14-i) = sqrt(1/4*delta13_M6(i)^2+1/4*delta13_M6(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M6(i)*delta13_M6(i-steps_per_stair));
    delta_Mx_points7_13(14-i) = sqrt(1/4*delta13_M7(i)^2+1/4*delta13_M7(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M7(i)*delta13_M7(i-steps_per_stair));
    delta_Mx_points8_13(14-i) = sqrt(1/4*delta13_M8(i)^2+1/4*delta13_M8(i-steps_per_stair)^2+2*0.5*0.5*r_factor_c*delta13_M8(i)*delta13_M8(i-steps_per_stair));
    
end

%{
figure()
title('Raw data')
subplot(3,1,1)
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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


%{
figure()
subplot(3,1,1)
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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

%% JINT Extension


figure()
subplot(3,1,1)
hold on;grid minor;
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

figure()
subplot(2,1,1)
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
plot(distances_vec(1),Mx_points1_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(4),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(4),'x','color','k','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_10(4),delta_Mx_points1_10(4),'x','color','k');
errorbar(distances_vec(2),Mx_points2_10(4),delta_Mx_points2_10(4),'x','color','k');
errorbar(distances_vec(3),Mx_points3_10(4),delta_Mx_points3_10(4),'x','color','k');
errorbar(distances_vec(4),Mx_points4_10(4),delta_Mx_points4_10(4),'x','color','k');
errorbar(distances_vec(5),Mx_points5_10(4),delta_Mx_points5_10(4),'x','color','k');
errorbar(distances_vec(6),Mx_points6_10(4),delta_Mx_points6_10(4),'x','color','k');
errorbar(distances_vec(7),Mx_points7_10(4),delta_Mx_points7_10(4),'x','color','k');
errorbar(distances_vec(8),Mx_points8_10(4),delta_Mx_points8_10(4),'x','color','k');
plot(distances_vec(1),Mx_points1_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(4),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(4),'x','color','b','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_12(4),delta_Mx_points1_12(4),'x','color','b');
errorbar(distances_vec(2),Mx_points2_12(4),delta_Mx_points2_12(4),'x','color','b');
errorbar(distances_vec(3),Mx_points3_12(4),delta_Mx_points3_12(4),'x','color','b');
errorbar(distances_vec(4),Mx_points4_12(4),delta_Mx_points4_12(4),'x','color','b');
errorbar(distances_vec(5),Mx_points5_12(4),delta_Mx_points5_12(4),'x','color','b');
errorbar(distances_vec(6),Mx_points6_12(4),delta_Mx_points6_12(4),'x','color','b');
errorbar(distances_vec(7),Mx_points7_12(4),delta_Mx_points7_12(4),'x','color','b');
errorbar(distances_vec(8),Mx_points8_12(4),delta_Mx_points8_12(4),'x','color','b');
plot(distances_vec(1),Mx_points1_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(5),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(5),'x','color','r','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_13(5),delta_Mx_points1_13(5),'x','color','r');
errorbar(distances_vec(2),Mx_points2_13(5),delta_Mx_points2_13(5),'x','color','r');
errorbar(distances_vec(3),Mx_points3_13(5),delta_Mx_points3_13(5),'x','color','r');
errorbar(distances_vec(4),Mx_points4_13(5),delta_Mx_points4_13(5),'x','color','r');
errorbar(distances_vec(5),Mx_points5_13(5),delta_Mx_points5_13(5),'x','color','r');
errorbar(distances_vec(6),Mx_points6_13(5),delta_Mx_points6_13(5),'x','color','r');
errorbar(distances_vec(7),Mx_points7_13(5),delta_Mx_points7_13(5),'x','color','r');
errorbar(distances_vec(8),Mx_points8_13(5),delta_Mx_points8_13(5),'x','color','r');
% xlim([1 3.5])
ylim([-0.5*mxlim mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 8 N','','','','','','','','','','','','','','','','12"x6" F$_z$ = 8 N','','','','','','','','','','','','','','','','13"x6.5" F$_z$ = 8 N','fontsize',12)
subplot(4,1,2)
hold on;grid minor;
plot(distances_vec(1),Mx_points1_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(3),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(3),'x','color','k','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_10(3),delta_Mx_points1_10(3),'x','color','k');
errorbar(distances_vec(2),Mx_points2_10(3),delta_Mx_points2_10(3),'x','color','k');
errorbar(distances_vec(3),Mx_points3_10(3),delta_Mx_points3_10(3),'x','color','k');
errorbar(distances_vec(4),Mx_points4_10(3),delta_Mx_points4_10(3),'x','color','k');
errorbar(distances_vec(5),Mx_points5_10(3),delta_Mx_points5_10(3),'x','color','k');
errorbar(distances_vec(6),Mx_points6_10(3),delta_Mx_points6_10(3),'x','color','k');
errorbar(distances_vec(7),Mx_points7_10(3),delta_Mx_points7_10(3),'x','color','k');
errorbar(distances_vec(8),Mx_points8_10(3),delta_Mx_points8_10(3),'x','color','k');
plot(distances_vec(1),Mx_points1_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(3),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(3),'x','color','b','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_12(3),delta_Mx_points1_12(3),'x','color','b');
errorbar(distances_vec(2),Mx_points2_12(3),delta_Mx_points2_12(3),'x','color','b');
errorbar(distances_vec(3),Mx_points3_12(3),delta_Mx_points3_12(3),'x','color','b');
errorbar(distances_vec(4),Mx_points4_12(3),delta_Mx_points4_12(3),'x','color','b');
errorbar(distances_vec(5),Mx_points5_12(3),delta_Mx_points5_12(3),'x','color','b');
errorbar(distances_vec(6),Mx_points6_12(3),delta_Mx_points6_12(3),'x','color','b');
errorbar(distances_vec(7),Mx_points7_12(3),delta_Mx_points7_12(3),'x','color','b');
errorbar(distances_vec(8),Mx_points8_12(3),delta_Mx_points8_12(3),'x','color','b');
plot(distances_vec(1),Mx_points1_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(4),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(4),'x','color','r','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_13(4),delta_Mx_points1_13(4),'x','color','r');
errorbar(distances_vec(2),Mx_points2_13(4),delta_Mx_points2_13(4),'x','color','r');
errorbar(distances_vec(3),Mx_points3_13(4),delta_Mx_points3_13(4),'x','color','r');
errorbar(distances_vec(4),Mx_points4_13(4),delta_Mx_points4_13(4),'x','color','r');
errorbar(distances_vec(5),Mx_points5_13(4),delta_Mx_points5_13(4),'x','color','r');
errorbar(distances_vec(6),Mx_points6_13(4),delta_Mx_points6_13(4),'x','color','r');
errorbar(distances_vec(7),Mx_points7_13(4),delta_Mx_points7_13(4),'x','color','r');
errorbar(distances_vec(8),Mx_points8_13(4),delta_Mx_points8_13(4),'x','color','r');
% xlim([1 3.5])
ylim([-0.5*mxlim mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 10 N','','','','','','','','','','','','','','','','12"x6" F$_z$ = 10 N','','','','','','','','','','','','','','','','13"x6.5" F$_z$ = 10 N','fontsize',12)
subplot(4,1,3)
hold on;grid minor;
plot(distances_vec(1),Mx_points1_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(2),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(2),'x','color','k','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_10(2),delta_Mx_points1_10(2),'x','color','k');
errorbar(distances_vec(2),Mx_points2_10(2),delta_Mx_points2_10(2),'x','color','k');
errorbar(distances_vec(3),Mx_points3_10(2),delta_Mx_points3_10(2),'x','color','k');
errorbar(distances_vec(4),Mx_points4_10(2),delta_Mx_points4_10(2),'x','color','k');
errorbar(distances_vec(5),Mx_points5_10(2),delta_Mx_points5_10(2),'x','color','k');
errorbar(distances_vec(6),Mx_points6_10(2),delta_Mx_points6_10(2),'x','color','k');
errorbar(distances_vec(7),Mx_points7_10(2),delta_Mx_points7_10(2),'x','color','k');
errorbar(distances_vec(8),Mx_points8_10(2),delta_Mx_points8_10(2),'x','color','k');
plot(distances_vec(1),Mx_points1_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(2),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(2),'x','color','b','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_12(2),delta_Mx_points1_12(2),'x','color','b');
errorbar(distances_vec(2),Mx_points2_12(2),delta_Mx_points2_12(2),'x','color','b');
errorbar(distances_vec(3),Mx_points3_12(2),delta_Mx_points3_12(2),'x','color','b');
errorbar(distances_vec(4),Mx_points4_12(2),delta_Mx_points4_12(2),'x','color','b');
errorbar(distances_vec(5),Mx_points5_12(2),delta_Mx_points5_12(2),'x','color','b');
errorbar(distances_vec(6),Mx_points6_12(2),delta_Mx_points6_12(2),'x','color','b');
errorbar(distances_vec(7),Mx_points7_12(2),delta_Mx_points7_12(2),'x','color','b');
errorbar(distances_vec(8),Mx_points8_12(2),delta_Mx_points8_12(2),'x','color','b');
plot(distances_vec(1),Mx_points1_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(3),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(3),'x','color','r','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_13(3),delta_Mx_points1_13(3),'x','color','r');
errorbar(distances_vec(2),Mx_points2_13(3),delta_Mx_points2_13(3),'x','color','r');
errorbar(distances_vec(3),Mx_points3_13(3),delta_Mx_points3_13(3),'x','color','r');
errorbar(distances_vec(4),Mx_points4_13(3),delta_Mx_points4_13(3),'x','color','r');
errorbar(distances_vec(5),Mx_points5_13(3),delta_Mx_points5_13(3),'x','color','r');
errorbar(distances_vec(6),Mx_points6_13(3),delta_Mx_points6_13(3),'x','color','r');
errorbar(distances_vec(7),Mx_points7_13(3),delta_Mx_points7_13(3),'x','color','r');
errorbar(distances_vec(8),Mx_points8_13(3),delta_Mx_points8_13(3),'x','color','r');
% xlim([1 3.5])
ylim([-0.5*mxlim mxlim])
ylabel('M$_{Wall}$ [N]','fontsize',15)
legend('10"x4.5" F$_z$ = 12 N','','','','','','','','','','','','','','','','12"x6" F$_z$ = 12 N','','','','','','','','','','','','','','','','13"x6.5" F$_z$ = 12 N','fontsize',12)
subplot(4,1,4)
hold on;grid minor;
plot(distances_vec(1),Mx_points1_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_10(1),'x','color','k','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_10(1),'x','color','k','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_10(1),delta_Mx_points1_10(1),'x','color','k');
errorbar(distances_vec(2),Mx_points2_10(1),delta_Mx_points2_10(1),'x','color','k');
errorbar(distances_vec(3),Mx_points3_10(1),delta_Mx_points3_10(1),'x','color','k');
errorbar(distances_vec(4),Mx_points4_10(1),delta_Mx_points4_10(1),'x','color','k');
errorbar(distances_vec(5),Mx_points5_10(1),delta_Mx_points5_10(1),'x','color','k');
errorbar(distances_vec(6),Mx_points6_10(1),delta_Mx_points6_10(1),'x','color','k');
errorbar(distances_vec(7),Mx_points7_10(1),delta_Mx_points7_10(1),'x','color','k');
errorbar(distances_vec(8),Mx_points8_10(1),delta_Mx_points8_10(1),'x','color','k');
plot(distances_vec(1),Mx_points1_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_12(1),'x','color','b','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_12(1),'x','color','b','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_12(1),delta_Mx_points1_12(1),'x','color','b');
errorbar(distances_vec(2),Mx_points2_12(1),delta_Mx_points2_12(1),'x','color','b');
errorbar(distances_vec(3),Mx_points3_12(1),delta_Mx_points3_12(1),'x','color','b');
errorbar(distances_vec(4),Mx_points4_12(1),delta_Mx_points4_12(1),'x','color','b');
errorbar(distances_vec(5),Mx_points5_12(1),delta_Mx_points5_12(1),'x','color','b');
errorbar(distances_vec(6),Mx_points6_12(1),delta_Mx_points6_12(1),'x','color','b');
errorbar(distances_vec(7),Mx_points7_12(1),delta_Mx_points7_12(1),'x','color','b');
errorbar(distances_vec(8),Mx_points8_12(1),delta_Mx_points8_12(1),'x','color','b');
plot(distances_vec(1),Mx_points1_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(2),Mx_points2_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(3),Mx_points3_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(4),Mx_points4_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(5),Mx_points5_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(6),Mx_points6_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(7),Mx_points7_13(1),'x','color','r','linewidth',2)%,'markersize',8)
plot(distances_vec(8),Mx_points8_13(1),'x','color','r','linewidth',2)%,'markersize',8)
errorbar(distances_vec(1),Mx_points1_13(1),delta_Mx_points1_13(1),'x','color','r');
errorbar(distances_vec(2),Mx_points2_13(1),delta_Mx_points2_13(1),'x','color','r');
errorbar(distances_vec(3),Mx_points3_13(1),delta_Mx_points3_13(1),'x','color','r');
errorbar(distances_vec(4),Mx_points4_13(1),delta_Mx_points4_13(1),'x','color','r');
errorbar(distances_vec(5),Mx_points5_13(1),delta_Mx_points5_13(1),'x','color','r');
errorbar(distances_vec(6),Mx_points6_13(1),delta_Mx_points6_13(1),'x','color','r');
errorbar(distances_vec(7),Mx_points7_13(1),delta_Mx_points7_13(1),'x','color','r');
errorbar(distances_vec(8),Mx_points8_13(1),delta_Mx_points8_13(1),'x','color','r');
ylabel('M$_{Wall}$ [N$\cdot $m]','fontsize',15)
legend('10"x4.5" F$_z$ = 14 N','','','','','','','','','','','','','','','','12"x6" F$_z$ = 14 N','','','','','','','','','','','','','','','','13"x6.5" F$_z$ = 14 N','fontsize',12)
% xlim([1 3.5])
ylim([-0.5*mxlim mxlim])
xlabel('D/R [-]','fontsize',15)


%{
figure()
subplot(4,1,1)
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
hold on;grid minor;
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
%}

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

uncert_Ct_txc1_10inch_Fz1  = file11.txcWall10.U_Ct1{1};
uncert_Ct_txc1_10inch_Fz2  = file11.txcWall10.U_Ct1{2};
uncert_Ct_txc1_10inch_RPM1 = file11.txcWall10.U_Ct1{3};
uncert_Ct_txc1_10inch_RPM2 = file11.txcWall10.U_Ct1{4};
uncert_Ct_txc2_10inch_Fz1  = file11.txcWall10.U_Ct2{1};
uncert_Ct_txc2_10inch_Fz2  = file11.txcWall10.U_Ct2{2};
uncert_Ct_txc2_10inch_RPM1 = file11.txcWall10.U_Ct2{3};
uncert_Ct_txc2_10inch_RPM2 = file11.txcWall10.U_Ct2{4};
uncert_Ct_txc3_10inch_Fz1  = file11.txcWall10.U_Ct3{1};
uncert_Ct_txc3_10inch_Fz2  = file11.txcWall10.U_Ct3{2};
uncert_Ct_txc3_10inch_RPM1 = file11.txcWall10.U_Ct3{3};
uncert_Ct_txc3_10inch_RPM2 = file11.txcWall10.U_Ct3{4};
uncert_Ct_txc4_10inch_Fz1  = file11.txcWall10.U_Ct4{1};
uncert_Ct_txc4_10inch_Fz2  = file11.txcWall10.U_Ct4{2};
uncert_Ct_txc4_10inch_RPM1 = file11.txcWall10.U_Ct4{3};
uncert_Ct_txc4_10inch_RPM2 = file11.txcWall10.U_Ct4{4};
uncert_Ct_txc5_10inch_Fz1  = file11.txcWall10.U_Ct5{1};
uncert_Ct_txc5_10inch_Fz2  = file11.txcWall10.U_Ct5{2};
uncert_Ct_txc5_10inch_RPM1 = file11.txcWall10.U_Ct5{3};
uncert_Ct_txc5_10inch_RPM2 = file11.txcWall10.U_Ct5{4};
uncert_Ct_txc6_10inch_Fz1  = file11.txcWall10.U_Ct6{1};
uncert_Ct_txc6_10inch_Fz2  = file11.txcWall10.U_Ct6{2};
uncert_Ct_txc6_10inch_RPM1 = file11.txcWall10.U_Ct6{3};

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

uncert_Ct_txc6_10inch_RPM2 = file11.txcWall10.U_Ct6{4};
uncert_Ct_txc1_12inch_Fz1  = file11.txcWall12.U_Ct1{1};
uncert_Ct_txc1_12inch_Fz2  = file11.txcWall12.U_Ct1{2};
uncert_Ct_txc1_12inch_RPM1 = file11.txcWall12.U_Ct1{3};
uncert_Ct_txc1_12inch_RPM2 = file11.txcWall12.U_Ct1{4};
uncert_Ct_txc2_12inch_Fz1  = file11.txcWall12.U_Ct2{1};
uncert_Ct_txc2_12inch_Fz2  = file11.txcWall12.U_Ct2{2};
uncert_Ct_txc2_12inch_RPM1 = file11.txcWall12.U_Ct2{3};
uncert_Ct_txc2_12inch_RPM2 = file11.txcWall12.U_Ct2{4};
uncert_Ct_txc3_12inch_Fz1  = file11.txcWall12.U_Ct3{1};
uncert_Ct_txc3_12inch_Fz2  = file11.txcWall12.U_Ct3{2};
uncert_Ct_txc3_12inch_RPM1 = file11.txcWall12.U_Ct3{3};
uncert_Ct_txc3_12inch_RPM2 = file11.txcWall12.U_Ct3{4};
uncert_Ct_txc4_12inch_Fz1  = file11.txcWall12.U_Ct4{1};
uncert_Ct_txc4_12inch_Fz2  = file11.txcWall12.U_Ct4{2};
uncert_Ct_txc4_12inch_RPM1 = file11.txcWall12.U_Ct4{3};
uncert_Ct_txc4_12inch_RPM2 = file11.txcWall12.U_Ct4{4};
uncert_Ct_txc5_12inch_Fz1  = file11.txcWall12.U_Ct5{1};
uncert_Ct_txc5_12inch_Fz2  = file11.txcWall12.U_Ct5{2};
uncert_Ct_txc5_12inch_RPM1 = file11.txcWall12.U_Ct5{3};
uncert_Ct_txc5_12inch_RPM2 = file11.txcWall12.U_Ct5{4};
uncert_Ct_txc6_12inch_Fz1  = file11.txcWall12.U_Ct6{1};
uncert_Ct_txc6_12inch_Fz2  = file11.txcWall12.U_Ct6{2};
uncert_Ct_txc6_12inch_RPM1 = file11.txcWall12.U_Ct6{3};
uncert_Ct_txc6_12inch_RPM2 = file11.txcWall12.U_Ct6{4};

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



M_htal1_off_10inches = abs(file1_10.result.Mx_points);
M_htal2_off_10inches = abs(file2_10.result.Mx_points);
M_htal3_off_10inches = abs(file3_10.result.Mx_points);
M_htal4_off_10inches = abs(file4_10.result.Mx_points);
M_htal5_off_10inches = abs(file5_10.result.Mx_points);
M_htal6_off_10inches = abs(file6_10.result.Mx_points);
M_htal7_off_10inches = abs(file7_10.result.Mx_points);
M_htal8_off_10inches = abs(file8_10.result.Mx_points);
M_htal1_off_12inches = abs(file1_12.result.Mx_points);
M_htal2_off_12inches = abs(file2_12.result.Mx_points);
M_htal3_off_12inches = abs(file3_12.result.Mx_points);
M_htal4_off_12inches = abs(file4_12.result.Mx_points);
M_htal5_off_12inches = abs(file5_12.result.Mx_points);
M_htal6_off_12inches = abs(file6_12.result.Mx_points);
M_htal7_off_12inches = abs(file7_12.result.Mx_points);
M_htal8_off_12inches = abs(file8_12.result.Mx_points);
M_htal1_off_13inches = abs(file1_13.result.Mx_points);
M_htal2_off_13inches = abs(file2_13.result.Mx_points);
M_htal3_off_13inches = abs(file3_13.result.Mx_points);
M_htal4_off_13inches = abs(file4_13.result.Mx_points);
M_htal5_off_13inches = abs(file5_13.result.Mx_points);
M_htal6_off_13inches = abs(file6_13.result.Mx_points);
M_htal7_off_13inches = abs(file7_13.result.Mx_points);
M_htal8_off_13inches = abs(file8_13.result.Mx_points);
F_htal1_off_10inches = abs(file1_10.result.Fy_points);
F_htal2_off_10inches = abs(file2_10.result.Fy_points);
F_htal3_off_10inches = abs(file3_10.result.Fy_points);
F_htal4_off_10inches = abs(file4_10.result.Fy_points);
F_htal5_off_10inches = abs(file5_10.result.Fy_points);
F_htal6_off_10inches = abs(file6_10.result.Fy_points);
F_htal7_off_10inches = abs(file7_10.result.Fy_points);
F_htal8_off_10inches = abs(file8_10.result.Fy_points);
F_htal1_off_12inches = abs(file1_12.result.Fy_points);
F_htal2_off_12inches = abs(file2_12.result.Fy_points);
F_htal3_off_12inches = abs(file3_12.result.Fy_points);
F_htal4_off_12inches = abs(file4_12.result.Fy_points);
F_htal5_off_12inches = abs(file5_12.result.Fy_points);
F_htal6_off_12inches = abs(file6_12.result.Fy_points);
F_htal7_off_12inches = abs(file7_12.result.Fy_points);
F_htal8_off_12inches = abs(file8_12.result.Fy_points);
F_htal1_off_13inches = abs(file1_13.result.Fy_points);
F_htal2_off_13inches = abs(file2_13.result.Fy_points);
F_htal3_off_13inches = abs(file3_13.result.Fy_points);
F_htal4_off_13inches = abs(file4_13.result.Fy_points);
F_htal5_off_13inches = abs(file5_13.result.Fy_points);
F_htal6_off_13inches = abs(file6_13.result.Fy_points);
F_htal7_off_13inches = abs(file7_13.result.Fy_points);
F_htal8_off_13inches = abs(file8_13.result.Fy_points);


F_z1_off_10inches = file1_10.result.Fz_points;
F_z2_off_10inches = file2_10.result.Fz_points;
F_z3_off_10inches = file3_10.result.Fz_points;
F_z4_off_10inches = file4_10.result.Fz_points;
F_z5_off_10inches = file5_10.result.Fz_points;
F_z6_off_10inches = file6_10.result.Fz_points;
F_z7_off_10inches = file7_10.result.Fz_points;
F_z8_off_10inches = file8_10.result.Fz_points;
F_z1_off_12inches = file1_12.result.Fz_points;
F_z2_off_12inches = file2_12.result.Fz_points;
F_z3_off_12inches = file3_12.result.Fz_points;
F_z4_off_12inches = file4_12.result.Fz_points;
F_z5_off_12inches = file5_12.result.Fz_points;
F_z6_off_12inches = file6_12.result.Fz_points;
F_z7_off_12inches = file7_12.result.Fz_points;
F_z8_off_12inches = file8_12.result.Fz_points;
F_z1_off_13inches = file1_13.result.Fz_points;
F_z2_off_13inches = file2_13.result.Fz_points;
F_z3_off_13inches = file3_13.result.Fz_points;
F_z4_off_13inches = file4_13.result.Fz_points;
F_z5_off_13inches = file5_13.result.Fz_points;
F_z6_off_13inches = file6_13.result.Fz_points;
F_z7_off_13inches = file7_13.result.Fz_points;
F_z8_off_13inches = file8_13.result.Fz_points;

%% JINT Uncertainty of the coefficients
delta_w_fix = 9;     % rev/min
delta_w_var = 0.004;  % of rev/min
delta_w_resol = 60; % rev/min
deltaP = 1/(2*sqrt(3)); % Pa, from resolution stated in BMP085 datasheet
deltaT = 0.1/(2*sqrt(3)); % ºC, from resolution stated in BMP085 datasheet

syms rho_whole Pressure Temperature  Cm_equation Cf_equation  Rad Forc Torq rpm


rho = Pressure/(R_constant*Temperature);
partial_rho_wrt_P = diff(rho,Pressure);
partial_rho_wrt_T = diff(rho,Temperature);

Cm_equation = Torq./(0.5*rho_whole*(rpm').^2*(Rad*2)^5);
Cf_equation = Forc./(0.5*rho_whole*(rpm').^2*(Rad*2)^4);

partial10_rho1_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp1_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial10_rho2_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp2_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial10_rho3_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp3_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial10_rho4_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp4_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial10_rho5_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp5_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial10_rho6_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp6_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial10_rho7_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp7_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial10_rho8_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp8_10inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho1_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp1_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho2_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp2_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho3_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp3_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho4_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp4_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho5_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp5_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho6_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp6_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho7_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp7_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial12_rho8_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp8_12inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho1_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp1_13inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho2_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp2_13inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho3_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp3_13inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho4_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp4_13inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho5_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp5_13inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho6_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp6_13inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho7_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp7_13inch+toKelvin)));  % rho partial10 w.r.t. P
partial13_rho8_1 = double(subs(partial_rho_wrt_P,Temperature,(Temp8_13inch+toKelvin)));  % rho partial10 w.r.t. P

partial10_rho1_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres1_10inch,(Temp1_10inch+toKelvin)]));
partial10_rho2_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres2_10inch,(Temp2_10inch+toKelvin)]));
partial10_rho3_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres3_10inch,(Temp3_10inch+toKelvin)]));
partial10_rho4_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres4_10inch,(Temp4_10inch+toKelvin)]));
partial10_rho5_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres5_10inch,(Temp5_10inch+toKelvin)]));
partial10_rho6_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres6_10inch,(Temp6_10inch+toKelvin)]));
partial10_rho7_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres7_10inch,(Temp7_10inch+toKelvin)]));
partial10_rho8_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres8_10inch,(Temp8_10inch+toKelvin)]));
partial12_rho1_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres1_12inch,(Temp1_12inch+toKelvin)]));
partial12_rho2_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres2_12inch,(Temp2_12inch+toKelvin)]));
partial12_rho3_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres3_12inch,(Temp3_12inch+toKelvin)]));
partial12_rho4_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres4_12inch,(Temp4_12inch+toKelvin)]));
partial12_rho5_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres5_12inch,(Temp5_12inch+toKelvin)]));
partial12_rho6_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres6_12inch,(Temp6_12inch+toKelvin)]));
partial12_rho7_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres7_12inch,(Temp7_12inch+toKelvin)]));
partial12_rho8_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres8_12inch,(Temp8_12inch+toKelvin)]));
partial13_rho1_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres1_13inch,(Temp1_13inch+toKelvin)]));
partial13_rho2_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres2_13inch,(Temp2_13inch+toKelvin)]));
partial13_rho3_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres3_13inch,(Temp3_13inch+toKelvin)]));
partial13_rho4_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres4_13inch,(Temp4_13inch+toKelvin)]));
partial13_rho5_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres5_13inch,(Temp5_13inch+toKelvin)]));
partial13_rho6_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres6_13inch,(Temp6_13inch+toKelvin)]));
partial13_rho7_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres7_13inch,(Temp7_13inch+toKelvin)]));
partial13_rho8_2 = double(subs(partial_rho_wrt_T,[Pressure,Temperature],[Pres8_13inch,(Temp8_13inch+toKelvin)]));

delta_rho_10 = [sqrt((partial10_rho1_1*deltaP)^2 + (partial10_rho1_2*deltaT)^2);
    sqrt((partial10_rho2_1*deltaP)^2 + (partial10_rho2_2*deltaT)^2);
    sqrt((partial10_rho3_1*deltaP)^2 + (partial10_rho3_2*deltaT)^2);
    sqrt((partial10_rho4_1*deltaP)^2 + (partial10_rho4_2*deltaT)^2);
    sqrt((partial10_rho5_1*deltaP)^2 + (partial10_rho5_2*deltaT)^2);
    sqrt((partial10_rho6_1*deltaP)^2 + (partial10_rho6_2*deltaT)^2);
    sqrt((partial10_rho7_1*deltaP)^2 + (partial10_rho7_2*deltaT)^2);
    sqrt((partial10_rho8_1*deltaP)^2 + (partial10_rho8_2*deltaT)^2);];
delta_rho_12 = [sqrt((partial12_rho1_1*deltaP)^2 + (partial12_rho1_2*deltaT)^2);
    sqrt((partial12_rho2_1*deltaP)^2 + (partial12_rho2_2*deltaT)^2);
    sqrt((partial12_rho3_1*deltaP)^2 + (partial12_rho3_2*deltaT)^2);
    sqrt((partial12_rho4_1*deltaP)^2 + (partial12_rho4_2*deltaT)^2);
    sqrt((partial12_rho5_1*deltaP)^2 + (partial12_rho5_2*deltaT)^2);
    sqrt((partial12_rho6_1*deltaP)^2 + (partial12_rho6_2*deltaT)^2);
    sqrt((partial12_rho7_1*deltaP)^2 + (partial12_rho7_2*deltaT)^2);
    sqrt((partial12_rho8_1*deltaP)^2 + (partial12_rho8_2*deltaT)^2);];
delta_rho_13 = [sqrt((partial13_rho1_1*deltaP)^2 + (partial13_rho1_2*deltaT)^2);
                sqrt((partial13_rho2_1*deltaP)^2 + (partial13_rho2_2*deltaT)^2);
                sqrt((partial13_rho3_1*deltaP)^2 + (partial13_rho3_2*deltaT)^2);
                sqrt((partial13_rho4_1*deltaP)^2 + (partial13_rho4_2*deltaT)^2);
                sqrt((partial13_rho5_1*deltaP)^2 + (partial13_rho5_2*deltaT)^2);
                sqrt((partial13_rho6_1*deltaP)^2 + (partial13_rho6_2*deltaT)^2);
                sqrt((partial13_rho7_1*deltaP)^2 + (partial13_rho7_2*deltaT)^2);
                sqrt((partial13_rho8_1*deltaP)^2 + (partial13_rho8_2*deltaT)^2);];

% First order derivatives
partial_cf_wrt_F   = diff(Cf_equation,Forc);
partial_cf_wrt_rho = diff(Cf_equation,rho_whole);
partial_cf_wrt_rpm = diff(Cf_equation,rpm);
partial_cm_wrt_T   = diff(Cm_equation,Torq);
partial_cm_wrt_rho = diff(Cm_equation,rho_whole);
partial_cm_wrt_rpm = diff(Cm_equation,rpm);
partial_cf_wrt_F_func   = matlabFunction(partial_cf_wrt_F);
partial_cf_wrt_rho_func = matlabFunction(partial_cf_wrt_rho);
partial_cf_wrt_rpm_func = matlabFunction(partial_cf_wrt_rpm);
partial_cm_wrt_T_func   = matlabFunction(partial_cm_wrt_T);
partial_cm_wrt_rho_func = matlabFunction(partial_cm_wrt_rho);
partial_cm_wrt_rpm_func = matlabFunction(partial_cm_wrt_rpm);

delta_w_1_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_1(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_2_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_2(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_3_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_3(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_4_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_4(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_5_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_5(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_6_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_6(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_7_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_7(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_8_1_10inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach10_8(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_1_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_1(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_2_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_2(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_3_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_3(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_4_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_4(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_5_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_5(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_6_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_6(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_7_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_7(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_8_1_12inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach12_8(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_1_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_1(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_2_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_2(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_3_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_3(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_4_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_4(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_5_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_5(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_6_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_6(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_7_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_7(end)+delta_w_fix)/2/60;  %  % of rev/min
delta_w_8_1_13inch = delta_w_resol/sqrt(12)/60;%(delta_w_var.*2*tach13_8(end)+delta_w_fix)/2/60;  %  % of rev/min
partial10_cf1_1  = partial_cf_wrt_F_func(R_10,rho1_10inch, tach10_1/60);
partial10_cf2_1  = partial_cf_wrt_F_func(R_10,rho2_10inch, tach10_2/60);
partial10_cf3_1  = partial_cf_wrt_F_func(R_10,rho3_10inch, tach10_3/60);
partial10_cf4_1  = partial_cf_wrt_F_func(R_10,rho4_10inch, tach10_4/60);
partial10_cf5_1  = partial_cf_wrt_F_func(R_10,rho5_10inch, tach10_5/60);
partial10_cf6_1  = partial_cf_wrt_F_func(R_10,rho6_10inch, tach10_6/60);
partial10_cf7_1  = partial_cf_wrt_F_func(R_10,rho7_10inch, tach10_7/60);
partial10_cf8_1  = partial_cf_wrt_F_func(R_10,rho8_10inch, tach10_8/60);
partial12_cf1_1  = partial_cf_wrt_F_func(R_12,rho1_12inch, tach12_1/60);
partial12_cf2_1  = partial_cf_wrt_F_func(R_12,rho2_12inch, tach12_2/60);
partial12_cf3_1  = partial_cf_wrt_F_func(R_12,rho3_12inch, tach12_3/60);
partial12_cf4_1  = partial_cf_wrt_F_func(R_12,rho4_12inch, tach12_4/60);
partial12_cf5_1  = partial_cf_wrt_F_func(R_12,rho5_12inch, tach12_5/60);
partial12_cf6_1  = partial_cf_wrt_F_func(R_12,rho6_12inch, tach12_6/60);
partial12_cf7_1  = partial_cf_wrt_F_func(R_12,rho7_12inch, tach12_7/60);
partial12_cf8_1  = partial_cf_wrt_F_func(R_12,rho8_12inch, tach12_8/60);
partial13_cf1_1  = partial_cf_wrt_F_func(R_13,rho1_13inch, tach13_1/60);
partial13_cf2_1  = partial_cf_wrt_F_func(R_13,rho2_13inch, tach13_2/60);
partial13_cf3_1  = partial_cf_wrt_F_func(R_13,rho3_13inch, tach13_3/60);
partial13_cf4_1  = partial_cf_wrt_F_func(R_13,rho4_13inch, tach13_4/60);
partial13_cf5_1  = partial_cf_wrt_F_func(R_13,rho5_13inch, tach13_5/60);
partial13_cf6_1  = partial_cf_wrt_F_func(R_13,rho6_13inch, tach13_6/60);
partial13_cf7_1  = partial_cf_wrt_F_func(R_13,rho7_13inch, tach13_7/60);
partial13_cf8_1  = partial_cf_wrt_F_func(R_13,rho8_13inch, tach13_8/60);
partial10_cf1_2  = partial_cf_wrt_rho_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);
partial10_cf2_2  = partial_cf_wrt_rho_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t rho
partial10_cf3_2  = partial_cf_wrt_rho_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t rho
partial10_cf4_2  = partial_cf_wrt_rho_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t rho
partial10_cf5_2  = partial_cf_wrt_rho_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t rho
partial10_cf6_2  = partial_cf_wrt_rho_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t rho
partial10_cf7_2  = partial_cf_wrt_rho_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t rho
partial10_cf8_2  = partial_cf_wrt_rho_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t rho
partial12_cf1_2  = partial_cf_wrt_rho_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t rho
partial12_cf2_2  = partial_cf_wrt_rho_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t rho
partial12_cf3_2  = partial_cf_wrt_rho_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t rho
partial12_cf4_2  = partial_cf_wrt_rho_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t rho
partial12_cf5_2  = partial_cf_wrt_rho_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t rho
partial12_cf6_2  = partial_cf_wrt_rho_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t rho
partial12_cf7_2  = partial_cf_wrt_rho_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t rho
partial12_cf8_2  = partial_cf_wrt_rho_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t rho
partial13_cf1_2  = partial_cf_wrt_rho_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t rho
partial13_cf2_2  = partial_cf_wrt_rho_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t rho
partial13_cf3_2  = partial_cf_wrt_rho_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t rho
partial13_cf4_2  = partial_cf_wrt_rho_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t rho
partial13_cf5_2  = partial_cf_wrt_rho_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t rho
partial13_cf6_2  = partial_cf_wrt_rho_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t rho
partial13_cf7_2  = partial_cf_wrt_rho_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t rho
partial13_cf8_2  = partial_cf_wrt_rho_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t rho
partial10_cf1_4  = partial_cf_wrt_rpm_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_cf2_4  = partial_cf_wrt_rpm_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_cf3_4  = partial_cf_wrt_rpm_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_cf4_4  = partial_cf_wrt_rpm_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_cf5_4  = partial_cf_wrt_rpm_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_cf6_4  = partial_cf_wrt_rpm_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_cf7_4  = partial_cf_wrt_rpm_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_cf8_4  = partial_cf_wrt_rpm_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_cf1_4  = partial_cf_wrt_rpm_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_cf2_4  = partial_cf_wrt_rpm_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_cf3_4  = partial_cf_wrt_rpm_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_cf4_4  = partial_cf_wrt_rpm_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_cf5_4  = partial_cf_wrt_rpm_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_cf6_4  = partial_cf_wrt_rpm_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_cf7_4  = partial_cf_wrt_rpm_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_cf8_4  = partial_cf_wrt_rpm_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_cf1_4  = partial_cf_wrt_rpm_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_cf2_4  = partial_cf_wrt_rpm_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_cf3_4  = partial_cf_wrt_rpm_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_cf4_4  = partial_cf_wrt_rpm_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_cf5_4  = partial_cf_wrt_rpm_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_cf6_4  = partial_cf_wrt_rpm_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_cf7_4  = partial_cf_wrt_rpm_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_cf8_4  = partial_cf_wrt_rpm_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_cm1_1  = partial_cm_wrt_T_func(R_10,rho1_10inch, tach10_1/60);
partial10_cm2_1  = partial_cm_wrt_T_func(R_10,rho2_10inch, tach10_2/60);
partial10_cm3_1  = partial_cm_wrt_T_func(R_10,rho3_10inch, tach10_3/60);
partial10_cm4_1  = partial_cm_wrt_T_func(R_10,rho4_10inch, tach10_4/60);
partial10_cm5_1  = partial_cm_wrt_T_func(R_10,rho5_10inch, tach10_5/60);
partial10_cm6_1  = partial_cm_wrt_T_func(R_10,rho6_10inch, tach10_6/60);
partial10_cm7_1  = partial_cm_wrt_T_func(R_10,rho7_10inch, tach10_7/60);
partial10_cm8_1  = partial_cm_wrt_T_func(R_10,rho8_10inch, tach10_8/60);
partial12_cm1_1  = partial_cm_wrt_T_func(R_12,rho1_12inch, tach12_1/60);
partial12_cm2_1  = partial_cm_wrt_T_func(R_12,rho2_12inch, tach12_2/60);
partial12_cm3_1  = partial_cm_wrt_T_func(R_12,rho3_12inch, tach12_3/60);
partial12_cm4_1  = partial_cm_wrt_T_func(R_12,rho4_12inch, tach12_4/60);
partial12_cm5_1  = partial_cm_wrt_T_func(R_12,rho5_12inch, tach12_5/60);
partial12_cm6_1  = partial_cm_wrt_T_func(R_12,rho6_12inch, tach12_6/60);
partial12_cm7_1  = partial_cm_wrt_T_func(R_12,rho7_12inch, tach12_7/60);
partial12_cm8_1  = partial_cm_wrt_T_func(R_12,rho8_12inch, tach12_8/60);
partial13_cm1_1  = partial_cm_wrt_T_func(R_13,rho1_13inch, tach13_1/60);
partial13_cm2_1  = partial_cm_wrt_T_func(R_13,rho2_13inch, tach13_2/60);
partial13_cm3_1  = partial_cm_wrt_T_func(R_13,rho3_13inch, tach13_3/60);
partial13_cm4_1  = partial_cm_wrt_T_func(R_13,rho4_13inch, tach13_4/60);
partial13_cm5_1  = partial_cm_wrt_T_func(R_13,rho5_13inch, tach13_5/60);
partial13_cm6_1  = partial_cm_wrt_T_func(R_13,rho6_13inch, tach13_6/60);
partial13_cm7_1  = partial_cm_wrt_T_func(R_13,rho7_13inch, tach13_7/60);
partial13_cm8_1  = partial_cm_wrt_T_func(R_13,rho8_13inch, tach13_8/60);
partial10_cm1_2  = partial_cm_wrt_rho_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);   % partial10 w.r.t rho
partial10_cm2_2  = partial_cm_wrt_rho_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);   % partial10 w.r.t rho
partial10_cm3_2  = partial_cm_wrt_rho_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);   % partial10 w.r.t rho
partial10_cm4_2  = partial_cm_wrt_rho_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);   % partial10 w.r.t rho
partial10_cm5_2  = partial_cm_wrt_rho_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);   % partial10 w.r.t rho
partial10_cm6_2  = partial_cm_wrt_rho_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);   % partial10 w.r.t rho
partial10_cm7_2  = partial_cm_wrt_rho_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);   % partial10 w.r.t rho
partial10_cm8_2  = partial_cm_wrt_rho_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);   % partial10 w.r.t rho
partial12_cm1_2  = partial_cm_wrt_rho_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);   % partial10 w.r.t rho
partial12_cm2_2  = partial_cm_wrt_rho_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);   % partial10 w.r.t rho
partial12_cm3_2  = partial_cm_wrt_rho_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);   % partial10 w.r.t rho
partial12_cm4_2  = partial_cm_wrt_rho_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);   % partial10 w.r.t rho
partial12_cm5_2  = partial_cm_wrt_rho_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);   % partial10 w.r.t rho
partial12_cm6_2  = partial_cm_wrt_rho_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);   % partial10 w.r.t rho
partial12_cm7_2  = partial_cm_wrt_rho_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);   % partial10 w.r.t rho
partial12_cm8_2  = partial_cm_wrt_rho_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);   % partial10 w.r.t rho
partial13_cm1_2  = partial_cm_wrt_rho_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);   % partial10 w.r.t rho
partial13_cm2_2  = partial_cm_wrt_rho_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);   % partial10 w.r.t rho
partial13_cm3_2  = partial_cm_wrt_rho_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);   % partial10 w.r.t rho
partial13_cm4_2  = partial_cm_wrt_rho_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);   % partial10 w.r.t rho
partial13_cm5_2  = partial_cm_wrt_rho_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);   % partial10 w.r.t rho
partial13_cm6_2  = partial_cm_wrt_rho_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);   % partial10 w.r.t rho
partial13_cm7_2  = partial_cm_wrt_rho_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);   % partial10 w.r.t rho
partial13_cm8_2  = partial_cm_wrt_rho_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);   % partial10 w.r.t rho
partial10_cm1_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_cm2_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_cm3_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_cm4_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_cm5_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_cm6_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_cm7_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_cm8_4  = partial_cm_wrt_rpm_func(R_10,M_htal1_off_10inches,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_cm1_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_cm2_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_cm3_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_cm4_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_cm5_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_cm6_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_cm7_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_cm8_4  = partial_cm_wrt_rpm_func(R_12,M_htal1_off_12inches,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_cm1_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_cm2_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_cm3_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_cm4_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_cm5_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_cm6_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_cm7_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_cm8_4  = partial_cm_wrt_rpm_func(R_13,M_htal1_off_13inches,rho8_13inch, tach13_8/60);   % partial10 w.r.t w

partial10_ct1_1  = partial_cf_wrt_F_func(R_10,rho1_10inch, tach10_1/60);
partial10_ct2_1  = partial_cf_wrt_F_func(R_10,rho2_10inch, tach10_2/60);
partial10_ct3_1  = partial_cf_wrt_F_func(R_10,rho3_10inch, tach10_3/60);
partial10_ct4_1  = partial_cf_wrt_F_func(R_10,rho4_10inch, tach10_4/60);
partial10_ct5_1  = partial_cf_wrt_F_func(R_10,rho5_10inch, tach10_5/60);
partial10_ct6_1  = partial_cf_wrt_F_func(R_10,rho6_10inch, tach10_6/60);
partial10_ct7_1  = partial_cf_wrt_F_func(R_10,rho7_10inch, tach10_7/60);
partial10_ct8_1  = partial_cf_wrt_F_func(R_10,rho8_10inch, tach10_8/60);
partial12_ct1_1  = partial_cf_wrt_F_func(R_12,rho1_12inch, tach12_1/60);
partial12_ct2_1  = partial_cf_wrt_F_func(R_12,rho2_12inch, tach12_2/60);
partial12_ct3_1  = partial_cf_wrt_F_func(R_12,rho3_12inch, tach12_3/60);
partial12_ct4_1  = partial_cf_wrt_F_func(R_12,rho4_12inch, tach12_4/60);
partial12_ct5_1  = partial_cf_wrt_F_func(R_12,rho5_12inch, tach12_5/60);
partial12_ct6_1  = partial_cf_wrt_F_func(R_12,rho6_12inch, tach12_6/60);
partial12_ct7_1  = partial_cf_wrt_F_func(R_12,rho7_12inch, tach12_7/60);
partial12_ct8_1  = partial_cf_wrt_F_func(R_12,rho8_12inch, tach12_8/60);
partial13_ct1_1  = partial_cf_wrt_F_func(R_13,rho1_13inch, tach13_1/60);
partial13_ct2_1  = partial_cf_wrt_F_func(R_13,rho2_13inch, tach13_2/60);
partial13_ct3_1  = partial_cf_wrt_F_func(R_13,rho3_13inch, tach13_3/60);
partial13_ct4_1  = partial_cf_wrt_F_func(R_13,rho4_13inch, tach13_4/60);
partial13_ct5_1  = partial_cf_wrt_F_func(R_13,rho5_13inch, tach13_5/60);
partial13_ct6_1  = partial_cf_wrt_F_func(R_13,rho6_13inch, tach13_6/60);
partial13_ct7_1  = partial_cf_wrt_F_func(R_13,rho7_13inch, tach13_7/60);
partial13_ct8_1  = partial_cf_wrt_F_func(R_13,rho8_13inch, tach13_8/60);
partial10_ct1_2  = partial_cf_wrt_rho_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60);
partial10_ct2_2  = partial_cf_wrt_rho_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t rho
partial10_ct3_2  = partial_cf_wrt_rho_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t rho
partial10_ct4_2  = partial_cf_wrt_rho_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t rho
partial10_ct5_2  = partial_cf_wrt_rho_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t rho
partial10_ct6_2  = partial_cf_wrt_rho_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t rho
partial10_ct7_2  = partial_cf_wrt_rho_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t rho
partial10_ct8_2  = partial_cf_wrt_rho_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t rho
partial12_ct1_2  = partial_cf_wrt_rho_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t rho
partial12_ct2_2  = partial_cf_wrt_rho_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t rho
partial12_ct3_2  = partial_cf_wrt_rho_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t rho
partial12_ct4_2  = partial_cf_wrt_rho_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t rho
partial12_ct5_2  = partial_cf_wrt_rho_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t rho
partial12_ct6_2  = partial_cf_wrt_rho_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t rho
partial12_ct7_2  = partial_cf_wrt_rho_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t rho
partial12_ct8_2  = partial_cf_wrt_rho_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t rho
partial13_ct1_2  = partial_cf_wrt_rho_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t rho
partial13_ct2_2  = partial_cf_wrt_rho_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t rho
partial13_ct3_2  = partial_cf_wrt_rho_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t rho
partial13_ct4_2  = partial_cf_wrt_rho_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t rho
partial13_ct5_2  = partial_cf_wrt_rho_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t rho
partial13_ct6_2  = partial_cf_wrt_rho_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t rho
partial13_ct7_2  = partial_cf_wrt_rho_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t rho
partial13_ct8_2  = partial_cf_wrt_rho_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t rho
partial10_ct1_4  = partial_cf_wrt_rpm_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_ct2_4  = partial_cf_wrt_rpm_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_ct3_4  = partial_cf_wrt_rpm_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_ct4_4  = partial_cf_wrt_rpm_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_ct5_4  = partial_cf_wrt_rpm_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_ct6_4  = partial_cf_wrt_rpm_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_ct7_4  = partial_cf_wrt_rpm_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_ct8_4  = partial_cf_wrt_rpm_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_ct1_4  = partial_cf_wrt_rpm_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_ct2_4  = partial_cf_wrt_rpm_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_ct3_4  = partial_cf_wrt_rpm_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_ct4_4  = partial_cf_wrt_rpm_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_ct5_4  = partial_cf_wrt_rpm_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_ct6_4  = partial_cf_wrt_rpm_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_ct7_4  = partial_cf_wrt_rpm_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_ct8_4  = partial_cf_wrt_rpm_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_ct1_4  = partial_cf_wrt_rpm_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_ct2_4  = partial_cf_wrt_rpm_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_ct3_4  = partial_cf_wrt_rpm_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_ct4_4  = partial_cf_wrt_rpm_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_ct5_4  = partial_cf_wrt_rpm_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_ct6_4  = partial_cf_wrt_rpm_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_ct7_4  = partial_cf_wrt_rpm_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_ct8_4  = partial_cf_wrt_rpm_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t w

% Second order derivatives
partial_cf_wrt_F_rho   = diff(partial_cf_wrt_F,rho_whole); % 1_2
partial_cf_wrt_F_rpm   = diff(partial_cf_wrt_F,rpm);       % 1_4
partial_cf_wrt_rho_rho = diff(partial_cf_wrt_rho,rho_whole);% 2_2
partial_cf_wrt_rho_rpm = diff(partial_cf_wrt_rho,rpm);     % 2_4
partial_cf_wrt_rpm_rpm = diff(partial_cf_wrt_rpm,rpm);     % 4_4
partial_cm_wrt_T_rho   = diff(partial_cm_wrt_T,rho_whole); % 1_2
partial_cm_wrt_T_rpm   = diff(partial_cm_wrt_T,rpm);       % 1_4
partial_cm_wrt_rho_rho = diff(partial_cm_wrt_rho,rho_whole);% 2_2
partial_cm_wrt_rho_rpm = diff(partial_cm_wrt_rho,rpm);     % 2_4
partial_cm_wrt_rpm_rpm = diff(partial_cm_wrt_rpm,rpm);     % 4_4

partial_cf_wrt_F_rho_func   = matlabFunction(partial_cf_wrt_F_rho);
partial_cf_wrt_F_rpm_func   = matlabFunction(partial_cf_wrt_F_rpm);
partial_cf_wrt_rho_rho_func = matlabFunction(partial_cf_wrt_rho_rho);
partial_cf_wrt_rho_rpm_func = matlabFunction(partial_cf_wrt_rho_rpm);
partial_cf_wrt_rpm_rpm_func = matlabFunction(partial_cf_wrt_rpm_rpm);
partial_cm_wrt_T_rho_func   = matlabFunction(partial_cm_wrt_T_rho);
partial_cm_wrt_T_rpm_func   = matlabFunction(partial_cm_wrt_T_rpm);
partial_cm_wrt_rho_rho_func = matlabFunction(partial_cm_wrt_rho_rho);
partial_cm_wrt_rho_rpm_func = matlabFunction(partial_cm_wrt_rho_rpm);
partial_cm_wrt_rpm_rpm_func = matlabFunction(partial_cm_wrt_rpm_rpm);

partial10_cf1_1_2 = partial_cf_wrt_F_rho_func(R_10,rho1_10inch, tach10_1/60);
partial10_cf2_1_2 = partial_cf_wrt_F_rho_func(R_10,rho2_10inch, tach10_2/60);
partial10_cf3_1_2 = partial_cf_wrt_F_rho_func(R_10,rho3_10inch, tach10_3/60);
partial10_cf4_1_2 = partial_cf_wrt_F_rho_func(R_10,rho4_10inch, tach10_4/60);
partial10_cf5_1_2 = partial_cf_wrt_F_rho_func(R_10,rho5_10inch, tach10_5/60);
partial10_cf6_1_2 = partial_cf_wrt_F_rho_func(R_10,rho6_10inch, tach10_6/60);
partial10_cf7_1_2 = partial_cf_wrt_F_rho_func(R_10,rho7_10inch, tach10_7/60);
partial10_cf8_1_2 = partial_cf_wrt_F_rho_func(R_10,rho8_10inch, tach10_8/60);
partial12_cf1_1_2 = partial_cf_wrt_F_rho_func(R_12,rho1_12inch, tach12_1/60);
partial12_cf2_1_2 = partial_cf_wrt_F_rho_func(R_12,rho2_12inch, tach12_2/60);
partial12_cf3_1_2 = partial_cf_wrt_F_rho_func(R_12,rho3_12inch, tach12_3/60);
partial12_cf4_1_2 = partial_cf_wrt_F_rho_func(R_12,rho4_12inch, tach12_4/60);
partial12_cf5_1_2 = partial_cf_wrt_F_rho_func(R_12,rho5_12inch, tach12_5/60);
partial12_cf6_1_2 = partial_cf_wrt_F_rho_func(R_12,rho6_12inch, tach12_6/60);
partial12_cf7_1_2 = partial_cf_wrt_F_rho_func(R_12,rho7_12inch, tach12_7/60);
partial12_cf8_1_2 = partial_cf_wrt_F_rho_func(R_12,rho8_12inch, tach12_8/60);
partial13_cf1_1_2 = partial_cf_wrt_F_rho_func(R_13,rho1_13inch, tach13_1/60);
partial13_cf2_1_2 = partial_cf_wrt_F_rho_func(R_13,rho2_13inch, tach13_2/60);
partial13_cf3_1_2 = partial_cf_wrt_F_rho_func(R_13,rho3_13inch, tach13_3/60);
partial13_cf4_1_2 = partial_cf_wrt_F_rho_func(R_13,rho4_13inch, tach13_4/60);
partial13_cf5_1_2 = partial_cf_wrt_F_rho_func(R_13,rho5_13inch, tach13_5/60);
partial13_cf6_1_2 = partial_cf_wrt_F_rho_func(R_13,rho6_13inch, tach13_6/60);
partial13_cf7_1_2 = partial_cf_wrt_F_rho_func(R_13,rho7_13inch, tach13_7/60);
partial13_cf8_1_2 = partial_cf_wrt_F_rho_func(R_13,rho8_13inch, tach13_8/60);
partial10_cf1_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho1_10inch, tach10_1/60);
partial10_cf2_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho2_10inch, tach10_2/60);
partial10_cf3_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho3_10inch, tach10_3/60);
partial10_cf4_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho4_10inch, tach10_4/60);
partial10_cf5_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho5_10inch, tach10_5/60);
partial10_cf6_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho6_10inch, tach10_6/60);
partial10_cf7_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho7_10inch, tach10_7/60);
partial10_cf8_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho8_10inch, tach10_8/60);
partial12_cf1_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho1_12inch, tach12_1/60);
partial12_cf2_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho2_12inch, tach12_2/60);
partial12_cf3_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho3_12inch, tach12_3/60);
partial12_cf4_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho4_12inch, tach12_4/60);
partial12_cf5_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho5_12inch, tach12_5/60);
partial12_cf6_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho6_12inch, tach12_6/60);
partial12_cf7_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho7_12inch, tach12_7/60);
partial12_cf8_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho8_12inch, tach12_8/60);
partial13_cf1_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho1_13inch, tach13_1/60);
partial13_cf2_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho2_13inch, tach13_2/60);
partial13_cf3_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho3_13inch, tach13_3/60);
partial13_cf4_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho4_13inch, tach13_4/60);
partial13_cf5_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho5_13inch, tach13_5/60);
partial13_cf6_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho6_13inch, tach13_6/60);
partial13_cf7_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho7_13inch, tach13_7/60);
partial13_cf8_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho8_13inch, tach13_8/60);
partial10_cf1_2_2 = partial_cf_wrt_rho_rho_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);
partial10_cf2_2_2 = partial_cf_wrt_rho_rho_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t rho
partial10_cf3_2_2 = partial_cf_wrt_rho_rho_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t rho
partial10_cf4_2_2 = partial_cf_wrt_rho_rho_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t rho
partial10_cf5_2_2 = partial_cf_wrt_rho_rho_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t rho
partial10_cf6_2_2 = partial_cf_wrt_rho_rho_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t rho
partial10_cf7_2_2 = partial_cf_wrt_rho_rho_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t rho
partial10_cf8_2_2 = partial_cf_wrt_rho_rho_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t rho
partial12_cf1_2_2 = partial_cf_wrt_rho_rho_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t rho
partial12_cf2_2_2 = partial_cf_wrt_rho_rho_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t rho
partial12_cf3_2_2 = partial_cf_wrt_rho_rho_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t rho
partial12_cf4_2_2 = partial_cf_wrt_rho_rho_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t rho
partial12_cf5_2_2 = partial_cf_wrt_rho_rho_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t rho
partial12_cf6_2_2 = partial_cf_wrt_rho_rho_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t rho
partial12_cf7_2_2 = partial_cf_wrt_rho_rho_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t rho
partial12_cf8_2_2 = partial_cf_wrt_rho_rho_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t rho
partial13_cf1_2_2 = partial_cf_wrt_rho_rho_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t rho
partial13_cf2_2_2 = partial_cf_wrt_rho_rho_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t rho
partial13_cf3_2_2 = partial_cf_wrt_rho_rho_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t rho
partial13_cf4_2_2 = partial_cf_wrt_rho_rho_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t rho
partial13_cf5_2_2 = partial_cf_wrt_rho_rho_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t rho
partial13_cf6_2_2 = partial_cf_wrt_rho_rho_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t rho
partial13_cf7_2_2 = partial_cf_wrt_rho_rho_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t rho
partial13_cf8_2_2 = partial_cf_wrt_rho_rho_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t rho
partial10_cf1_2_4 = partial_cf_wrt_rho_rpm_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);
partial10_cf2_2_4 = partial_cf_wrt_rho_rpm_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t rho
partial10_cf3_2_4 = partial_cf_wrt_rho_rpm_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t rho
partial10_cf4_2_4 = partial_cf_wrt_rho_rpm_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t rho
partial10_cf5_2_4 = partial_cf_wrt_rho_rpm_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t rho
partial10_cf6_2_4 = partial_cf_wrt_rho_rpm_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t rho
partial10_cf7_2_4 = partial_cf_wrt_rho_rpm_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t rho
partial10_cf8_2_4 = partial_cf_wrt_rho_rpm_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t rho
partial12_cf1_2_4 = partial_cf_wrt_rho_rpm_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t rho
partial12_cf2_2_4 = partial_cf_wrt_rho_rpm_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t rho
partial12_cf3_2_4 = partial_cf_wrt_rho_rpm_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t rho
partial12_cf4_2_4 = partial_cf_wrt_rho_rpm_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t rho
partial12_cf5_2_4 = partial_cf_wrt_rho_rpm_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t rho
partial12_cf6_2_4 = partial_cf_wrt_rho_rpm_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t rho
partial12_cf7_2_4 = partial_cf_wrt_rho_rpm_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t rho
partial12_cf8_2_4 = partial_cf_wrt_rho_rpm_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t rho
partial13_cf1_2_4 = partial_cf_wrt_rho_rpm_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t rho
partial13_cf2_2_4 = partial_cf_wrt_rho_rpm_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t rho
partial13_cf3_2_4 = partial_cf_wrt_rho_rpm_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t rho
partial13_cf4_2_4 = partial_cf_wrt_rho_rpm_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t rho
partial13_cf5_2_4 = partial_cf_wrt_rho_rpm_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t rho
partial13_cf6_2_4 = partial_cf_wrt_rho_rpm_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t rho
partial13_cf7_2_4 = partial_cf_wrt_rho_rpm_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t rho
partial13_cf8_2_4 = partial_cf_wrt_rho_rpm_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t rho
partial10_cf1_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);
partial10_cf2_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t rho
partial10_cf3_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t rho
partial10_cf4_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t rho
partial10_cf5_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t rho
partial10_cf6_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t rho
partial10_cf7_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t rho
partial10_cf8_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t rho
partial12_cf1_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t rho
partial12_cf2_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t rho
partial12_cf3_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t rho
partial12_cf4_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t rho
partial12_cf5_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t rho
partial12_cf6_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t rho
partial12_cf7_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t rho
partial12_cf8_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t rho
partial13_cf1_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t rho
partial13_cf2_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t rho
partial13_cf3_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t rho
partial13_cf4_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t rho
partial13_cf5_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t rho
partial13_cf6_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t rho
partial13_cf7_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t rho
partial13_cf8_4_4 = partial_cf_wrt_rpm_rpm_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t rho
partial10_cm1_1_2  = partial_cm_wrt_T_rho_func(R_10,rho1_10inch, tach10_1/60);
partial10_cm2_1_2  = partial_cm_wrt_T_rho_func(R_10,rho2_10inch, tach10_2/60);
partial10_cm3_1_2  = partial_cm_wrt_T_rho_func(R_10,rho3_10inch, tach10_3/60);
partial10_cm4_1_2  = partial_cm_wrt_T_rho_func(R_10,rho4_10inch, tach10_4/60);
partial10_cm5_1_2  = partial_cm_wrt_T_rho_func(R_10,rho5_10inch, tach10_5/60);
partial10_cm6_1_2  = partial_cm_wrt_T_rho_func(R_10,rho6_10inch, tach10_6/60);
partial10_cm7_1_2  = partial_cm_wrt_T_rho_func(R_10,rho7_10inch, tach10_7/60);
partial10_cm8_1_2  = partial_cm_wrt_T_rho_func(R_10,rho8_10inch, tach10_8/60);
partial12_cm1_1_2  = partial_cm_wrt_T_rho_func(R_12,rho1_12inch, tach12_1/60);
partial12_cm2_1_2  = partial_cm_wrt_T_rho_func(R_12,rho2_12inch, tach12_2/60);
partial12_cm3_1_2  = partial_cm_wrt_T_rho_func(R_12,rho3_12inch, tach12_3/60);
partial12_cm4_1_2  = partial_cm_wrt_T_rho_func(R_12,rho4_12inch, tach12_4/60);
partial12_cm5_1_2  = partial_cm_wrt_T_rho_func(R_12,rho5_12inch, tach12_5/60);
partial12_cm6_1_2  = partial_cm_wrt_T_rho_func(R_12,rho6_12inch, tach12_6/60);
partial12_cm7_1_2  = partial_cm_wrt_T_rho_func(R_12,rho7_12inch, tach12_7/60);
partial12_cm8_1_2  = partial_cm_wrt_T_rho_func(R_12,rho8_12inch, tach12_8/60);
partial13_cm1_1_2  = partial_cm_wrt_T_rho_func(R_13,rho1_13inch, tach13_1/60);
partial13_cm2_1_2  = partial_cm_wrt_T_rho_func(R_13,rho2_13inch, tach13_2/60);
partial13_cm3_1_2  = partial_cm_wrt_T_rho_func(R_13,rho3_13inch, tach13_3/60);
partial13_cm4_1_2  = partial_cm_wrt_T_rho_func(R_13,rho4_13inch, tach13_4/60);
partial13_cm5_1_2  = partial_cm_wrt_T_rho_func(R_13,rho5_13inch, tach13_5/60);
partial13_cm6_1_2  = partial_cm_wrt_T_rho_func(R_13,rho6_13inch, tach13_6/60);
partial13_cm7_1_2  = partial_cm_wrt_T_rho_func(R_13,rho7_13inch, tach13_7/60);
partial13_cm8_1_2  = partial_cm_wrt_T_rho_func(R_13,rho8_13inch, tach13_8/60);
partial10_cm1_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho1_10inch, tach10_1/60);
partial10_cm2_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho2_10inch, tach10_2/60);
partial10_cm3_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho3_10inch, tach10_3/60);
partial10_cm4_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho4_10inch, tach10_4/60);
partial10_cm5_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho5_10inch, tach10_5/60);
partial10_cm6_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho6_10inch, tach10_6/60);
partial10_cm7_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho7_10inch, tach10_7/60);
partial10_cm8_1_4  = partial_cm_wrt_T_rpm_func(R_10,rho8_10inch, tach10_8/60);
partial12_cm1_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho1_12inch, tach12_1/60);
partial12_cm2_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho2_12inch, tach12_2/60);
partial12_cm3_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho3_12inch, tach12_3/60);
partial12_cm4_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho4_12inch, tach12_4/60);
partial12_cm5_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho5_12inch, tach12_5/60);
partial12_cm6_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho6_12inch, tach12_6/60);
partial12_cm7_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho7_12inch, tach12_7/60);
partial12_cm8_1_4  = partial_cm_wrt_T_rpm_func(R_12,rho8_12inch, tach12_8/60);
partial13_cm1_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho1_13inch, tach13_1/60);
partial13_cm2_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho2_13inch, tach13_2/60);
partial13_cm3_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho3_13inch, tach13_3/60);
partial13_cm4_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho4_13inch, tach13_4/60);
partial13_cm5_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho5_13inch, tach13_5/60);
partial13_cm6_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho6_13inch, tach13_6/60);
partial13_cm7_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho7_13inch, tach13_7/60);
partial13_cm8_1_4  = partial_cm_wrt_T_rpm_func(R_13,rho8_13inch, tach13_8/60);
partial10_cm1_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_cm2_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_cm3_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_cm4_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_cm5_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_cm6_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_cm7_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_cm8_2_2 = partial_cm_wrt_rho_rho_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_cm1_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_cm2_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_cm3_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_cm4_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_cm5_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_cm6_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_cm7_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_cm8_2_2 = partial_cm_wrt_rho_rho_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_cm1_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_cm2_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_cm3_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_cm4_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_cm5_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_cm6_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_cm7_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_cm8_2_2 = partial_cm_wrt_rho_rho_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_cm1_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);  % partial10 w.r.t w
partial10_cm2_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);  % partial10 w.r.t w
partial10_cm3_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);  % partial10 w.r.t w
partial10_cm4_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);  % partial10 w.r.t w
partial10_cm5_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);  % partial10 w.r.t w
partial10_cm6_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);  % partial10 w.r.t w
partial10_cm7_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);  % partial10 w.r.t w
partial10_cm8_2_4 = partial_cm_wrt_rho_rpm_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);  % partial10 w.r.t w
partial12_cm1_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);  % partial10 w.r.t w
partial12_cm2_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);  % partial10 w.r.t w
partial12_cm3_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);  % partial10 w.r.t w
partial12_cm4_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);  % partial10 w.r.t w
partial12_cm5_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);  % partial10 w.r.t w
partial12_cm6_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);  % partial10 w.r.t w
partial12_cm7_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);  % partial10 w.r.t w
partial12_cm8_2_4 = partial_cm_wrt_rho_rpm_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);  % partial10 w.r.t w
partial13_cm1_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);  % partial10 w.r.t w
partial13_cm2_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);  % partial10 w.r.t w
partial13_cm3_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);  % partial10 w.r.t w
partial13_cm4_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);  % partial10 w.r.t w
partial13_cm5_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);  % partial10 w.r.t w
partial13_cm6_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);  % partial10 w.r.t w
partial13_cm7_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);  % partial10 w.r.t w
partial13_cm8_2_4 = partial_cm_wrt_rho_rpm_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);  % partial10 w.r.t w
partial10_cm1_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_cm2_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_cm3_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_cm4_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_cm5_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_cm6_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_cm7_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_cm8_4_4 = partial_cm_wrt_rpm_rpm_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_cm1_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_cm2_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_cm3_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_cm4_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_cm5_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_cm6_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_cm7_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_cm8_4_4 = partial_cm_wrt_rpm_rpm_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_cm1_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_cm2_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_cm3_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_cm4_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_cm5_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_cm6_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_cm7_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_cm8_4_4 = partial_cm_wrt_rpm_rpm_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_ct1_1_2 = partial_cf_wrt_F_rho_func(R_10,rho1_10inch, tach10_1/60);
partial10_ct2_1_2 = partial_cf_wrt_F_rho_func(R_10,rho2_10inch, tach10_2/60);
partial10_ct3_1_2 = partial_cf_wrt_F_rho_func(R_10,rho3_10inch, tach10_3/60);
partial10_ct4_1_2 = partial_cf_wrt_F_rho_func(R_10,rho4_10inch, tach10_4/60);
partial10_ct5_1_2 = partial_cf_wrt_F_rho_func(R_10,rho5_10inch, tach10_5/60);
partial10_ct6_1_2 = partial_cf_wrt_F_rho_func(R_10,rho6_10inch, tach10_6/60);
partial10_ct7_1_2 = partial_cf_wrt_F_rho_func(R_10,rho7_10inch, tach10_7/60);
partial10_ct8_1_2 = partial_cf_wrt_F_rho_func(R_10,rho8_10inch, tach10_8/60);
partial12_ct1_1_2 = partial_cf_wrt_F_rho_func(R_12,rho1_12inch, tach12_1/60);
partial12_ct2_1_2 = partial_cf_wrt_F_rho_func(R_12,rho2_12inch, tach12_2/60);
partial12_ct3_1_2 = partial_cf_wrt_F_rho_func(R_12,rho3_12inch, tach12_3/60);
partial12_ct4_1_2 = partial_cf_wrt_F_rho_func(R_12,rho4_12inch, tach12_4/60);
partial12_ct5_1_2 = partial_cf_wrt_F_rho_func(R_12,rho5_12inch, tach12_5/60);
partial12_ct6_1_2 = partial_cf_wrt_F_rho_func(R_12,rho6_12inch, tach12_6/60);
partial12_ct7_1_2 = partial_cf_wrt_F_rho_func(R_12,rho7_12inch, tach12_7/60);
partial12_ct8_1_2 = partial_cf_wrt_F_rho_func(R_12,rho8_12inch, tach12_8/60);
partial13_ct1_1_2 = partial_cf_wrt_F_rho_func(R_13,rho1_13inch, tach13_1/60);
partial13_ct2_1_2 = partial_cf_wrt_F_rho_func(R_13,rho2_13inch, tach13_2/60);
partial13_ct3_1_2 = partial_cf_wrt_F_rho_func(R_13,rho3_13inch, tach13_3/60);
partial13_ct4_1_2 = partial_cf_wrt_F_rho_func(R_13,rho4_13inch, tach13_4/60);
partial13_ct5_1_2 = partial_cf_wrt_F_rho_func(R_13,rho5_13inch, tach13_5/60);
partial13_ct6_1_2 = partial_cf_wrt_F_rho_func(R_13,rho6_13inch, tach13_6/60);
partial13_ct7_1_2 = partial_cf_wrt_F_rho_func(R_13,rho7_13inch, tach13_7/60);
partial13_ct8_1_2 = partial_cf_wrt_F_rho_func(R_13,rho8_13inch, tach13_8/60);
partial10_ct1_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho1_10inch, tach10_1/60);
partial10_ct2_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho2_10inch, tach10_2/60);
partial10_ct3_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho3_10inch, tach10_3/60);
partial10_ct4_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho4_10inch, tach10_4/60);
partial10_ct5_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho5_10inch, tach10_5/60);
partial10_ct6_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho6_10inch, tach10_6/60);
partial10_ct7_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho7_10inch, tach10_7/60);
partial10_ct8_1_4 = partial_cf_wrt_F_rpm_func(R_10,rho8_10inch, tach10_8/60);
partial12_ct1_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho1_12inch, tach12_1/60);
partial12_ct2_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho2_12inch, tach12_2/60);
partial12_ct3_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho3_12inch, tach12_3/60);
partial12_ct4_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho4_12inch, tach12_4/60);
partial12_ct5_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho5_12inch, tach12_5/60);
partial12_ct6_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho6_12inch, tach12_6/60);
partial12_ct7_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho7_12inch, tach12_7/60);
partial12_ct8_1_4 = partial_cf_wrt_F_rpm_func(R_12,rho8_12inch, tach12_8/60);
partial13_ct1_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho1_13inch, tach13_1/60);
partial13_ct2_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho2_13inch, tach13_2/60);
partial13_ct3_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho3_13inch, tach13_3/60);
partial13_ct4_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho4_13inch, tach13_4/60);
partial13_ct5_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho5_13inch, tach13_5/60);
partial13_ct6_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho6_13inch, tach13_6/60);
partial13_ct7_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho7_13inch, tach13_7/60);
partial13_ct8_1_4 = partial_cf_wrt_F_rpm_func(R_13,rho8_13inch, tach13_8/60);
partial10_ct1_2_2 = partial_cf_wrt_rho_rho_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60); % partial10 w.r.t w
partial10_ct2_2_2 = partial_cf_wrt_rho_rho_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60); % partial10 w.r.t w
partial10_ct3_2_2 = partial_cf_wrt_rho_rho_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60); % partial10 w.r.t w
partial10_ct4_2_2 = partial_cf_wrt_rho_rho_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60); % partial10 w.r.t w
partial10_ct5_2_2 = partial_cf_wrt_rho_rho_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60); % partial10 w.r.t w
partial10_ct6_2_2 = partial_cf_wrt_rho_rho_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60); % partial10 w.r.t w
partial10_ct7_2_2 = partial_cf_wrt_rho_rho_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60); % partial10 w.r.t w
partial10_ct8_2_2 = partial_cf_wrt_rho_rho_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60); % partial10 w.r.t w
partial12_ct1_2_2 = partial_cf_wrt_rho_rho_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60); % partial10 w.r.t w
partial12_ct2_2_2 = partial_cf_wrt_rho_rho_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60); % partial10 w.r.t w
partial12_ct3_2_2 = partial_cf_wrt_rho_rho_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60); % partial10 w.r.t w
partial12_ct4_2_2 = partial_cf_wrt_rho_rho_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60); % partial10 w.r.t w
partial12_ct5_2_2 = partial_cf_wrt_rho_rho_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60); % partial10 w.r.t w
partial12_ct6_2_2 = partial_cf_wrt_rho_rho_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60); % partial10 w.r.t w
partial12_ct7_2_2 = partial_cf_wrt_rho_rho_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60); % partial10 w.r.t w
partial12_ct8_2_2 = partial_cf_wrt_rho_rho_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60); % partial10 w.r.t w
partial13_ct1_2_2 = partial_cf_wrt_rho_rho_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60); % partial10 w.r.t w
partial13_ct2_2_2 = partial_cf_wrt_rho_rho_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60); % partial10 w.r.t w
partial13_ct3_2_2 = partial_cf_wrt_rho_rho_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60); % partial10 w.r.t w
partial13_ct4_2_2 = partial_cf_wrt_rho_rho_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60); % partial10 w.r.t w
partial13_ct5_2_2 = partial_cf_wrt_rho_rho_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60); % partial10 w.r.t w
partial13_ct6_2_2 = partial_cf_wrt_rho_rho_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60); % partial10 w.r.t w
partial13_ct7_2_2 = partial_cf_wrt_rho_rho_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60); % partial10 w.r.t w
partial13_ct8_2_2 = partial_cf_wrt_rho_rho_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60); % partial10 w.r.t w
partial10_ct1_2_4 = partial_cf_wrt_rho_rpm_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60); % partial10 w.r.t w
partial10_ct2_2_4 = partial_cf_wrt_rho_rpm_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60); % partial10 w.r.t w
partial10_ct3_2_4 = partial_cf_wrt_rho_rpm_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60); % partial10 w.r.t w
partial10_ct4_2_4 = partial_cf_wrt_rho_rpm_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60); % partial10 w.r.t w
partial10_ct5_2_4 = partial_cf_wrt_rho_rpm_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60); % partial10 w.r.t w
partial10_ct6_2_4 = partial_cf_wrt_rho_rpm_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60); % partial10 w.r.t w
partial10_ct7_2_4 = partial_cf_wrt_rho_rpm_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60); % partial10 w.r.t w
partial10_ct8_2_4 = partial_cf_wrt_rho_rpm_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60); % partial10 w.r.t w
partial12_ct1_2_4 = partial_cf_wrt_rho_rpm_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60); % partial10 w.r.t w
partial12_ct2_2_4 = partial_cf_wrt_rho_rpm_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60); % partial10 w.r.t w
partial12_ct3_2_4 = partial_cf_wrt_rho_rpm_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60); % partial10 w.r.t w
partial12_ct4_2_4 = partial_cf_wrt_rho_rpm_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60); % partial10 w.r.t w
partial12_ct5_2_4 = partial_cf_wrt_rho_rpm_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60); % partial10 w.r.t w
partial12_ct6_2_4 = partial_cf_wrt_rho_rpm_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60); % partial10 w.r.t w
partial12_ct7_2_4 = partial_cf_wrt_rho_rpm_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60); % partial10 w.r.t w
partial12_ct8_2_4 = partial_cf_wrt_rho_rpm_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60); % partial10 w.r.t w
partial13_ct1_2_4 = partial_cf_wrt_rho_rpm_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60); % partial10 w.r.t w
partial13_ct2_2_4 = partial_cf_wrt_rho_rpm_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60); % partial10 w.r.t w
partial13_ct3_2_4 = partial_cf_wrt_rho_rpm_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60); % partial10 w.r.t w
partial13_ct4_2_4 = partial_cf_wrt_rho_rpm_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60); % partial10 w.r.t w
partial13_ct5_2_4 = partial_cf_wrt_rho_rpm_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60); % partial10 w.r.t w
partial13_ct6_2_4 = partial_cf_wrt_rho_rpm_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60); % partial10 w.r.t w
partial13_ct7_2_4 = partial_cf_wrt_rho_rpm_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60); % partial10 w.r.t w
partial13_ct8_2_4 = partial_cf_wrt_rho_rpm_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60); % partial10 w.r.t w
partial10_ct1_4_4 = partial_cf_wrt_rpm_rpm_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60);  % partial10 w.r.t w
partial10_ct2_4_4 = partial_cf_wrt_rpm_rpm_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60);  % partial10 w.r.t w
partial10_ct3_4_4 = partial_cf_wrt_rpm_rpm_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60);  % partial10 w.r.t w
partial10_ct4_4_4 = partial_cf_wrt_rpm_rpm_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60);  % partial10 w.r.t w
partial10_ct5_4_4 = partial_cf_wrt_rpm_rpm_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60);  % partial10 w.r.t w
partial10_ct6_4_4 = partial_cf_wrt_rpm_rpm_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60);  % partial10 w.r.t w
partial10_ct7_4_4 = partial_cf_wrt_rpm_rpm_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60);  % partial10 w.r.t w
partial10_ct8_4_4 = partial_cf_wrt_rpm_rpm_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60);  % partial10 w.r.t w
partial12_ct1_4_4 = partial_cf_wrt_rpm_rpm_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60);  % partial10 w.r.t w
partial12_ct2_4_4 = partial_cf_wrt_rpm_rpm_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60);  % partial10 w.r.t w
partial12_ct3_4_4 = partial_cf_wrt_rpm_rpm_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60);  % partial10 w.r.t w
partial12_ct4_4_4 = partial_cf_wrt_rpm_rpm_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60);  % partial10 w.r.t w
partial12_ct5_4_4 = partial_cf_wrt_rpm_rpm_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60);  % partial10 w.r.t w
partial12_ct6_4_4 = partial_cf_wrt_rpm_rpm_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60);  % partial10 w.r.t w
partial12_ct7_4_4 = partial_cf_wrt_rpm_rpm_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60);  % partial10 w.r.t w
partial12_ct8_4_4 = partial_cf_wrt_rpm_rpm_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60);  % partial10 w.r.t w
partial13_ct1_4_4 = partial_cf_wrt_rpm_rpm_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60);  % partial10 w.r.t w
partial13_ct2_4_4 = partial_cf_wrt_rpm_rpm_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60);  % partial10 w.r.t w
partial13_ct3_4_4 = partial_cf_wrt_rpm_rpm_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60);  % partial10 w.r.t w
partial13_ct4_4_4 = partial_cf_wrt_rpm_rpm_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60);  % partial10 w.r.t w
partial13_ct5_4_4 = partial_cf_wrt_rpm_rpm_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60);  % partial10 w.r.t w
partial13_ct6_4_4 = partial_cf_wrt_rpm_rpm_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60);  % partial10 w.r.t w
partial13_ct7_4_4 = partial_cf_wrt_rpm_rpm_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60);  % partial10 w.r.t w
partial13_ct8_4_4 = partial_cf_wrt_rpm_rpm_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60);  % partial10 w.r.t w

% Third order derivatives
partial_cf_wrt_F_rho_rho    = diff(partial_cf_wrt_F_rho,rho_whole); % 1_2_2
partial_cf_wrt_F_rpm_rpm    = diff(partial_cf_wrt_F_rpm,rpm);       % 1_4_4
partial_cf_wrt_rho_rho_rho  = diff(partial_cf_wrt_rho_rho,rho_whole);% 2_2_2
partial_cf_wrt_rho_rho_rpm  = diff(partial_cf_wrt_rho_rho,rpm);     % 2_2_4
partial_cf_wrt_rho_rpm_rpm  = diff(partial_cf_wrt_rho_rpm,rpm);     % 2_4_4
partial_cf_wrt_rpm_rpm_rpm  = diff(partial_cf_wrt_rpm_rpm,rpm);     % 4_4_4
partial_cm_wrt_T_rho_rho    = diff(partial_cm_wrt_T_rho,rho_whole); % 1_2_2
partial_cm_wrt_T_rpm_rpm    = diff(partial_cm_wrt_T_rpm,rpm);       % 1_4_4
partial_cm_wrt_rho_rho_rho  = diff(partial_cm_wrt_rho_rho,rho_whole);% 2_2_2
partial_cm_wrt_rho_rho_rpm  = diff(partial_cm_wrt_rho_rho,rpm);     % 2_2_4
partial_cm_wrt_rho_rpm_rpm  = diff(partial_cm_wrt_rho_rpm,rpm);     % 2_4_4
partial_cm_wrt_rpm_rpm_rpm  = diff(partial_cm_wrt_rpm_rpm,rpm);     % 4_4_4

partial_cf_wrt_F_rho_rho_func   = matlabFunction(partial_cf_wrt_F_rho_rho);
partial_cf_wrt_F_rpm_rpm_func   = matlabFunction(partial_cf_wrt_F_rpm_rpm);
partial_cf_wrt_rho_rho_rho_func = matlabFunction(partial_cf_wrt_rho_rho_rho);
partial_cf_wrt_rho_rho_rpm_func = matlabFunction(partial_cf_wrt_rho_rho_rpm);
partial_cf_wrt_rho_rpm_rpm_func = matlabFunction(partial_cf_wrt_rho_rpm_rpm);
partial_cf_wrt_rpm_rpm_rpm_func = matlabFunction(partial_cf_wrt_rpm_rpm_rpm);
partial_cm_wrt_T_rho_rho_func   = matlabFunction(partial_cm_wrt_T_rho_rho);
partial_cm_wrt_T_rpm_rpm_func   = matlabFunction(partial_cm_wrt_T_rpm_rpm);
partial_cm_wrt_rho_rho_rho_func = matlabFunction(partial_cm_wrt_rho_rho_rho);
partial_cm_wrt_rho_rho_rpm_func = matlabFunction(partial_cm_wrt_rho_rho_rpm);
partial_cm_wrt_rho_rpm_rpm_func = matlabFunction(partial_cm_wrt_rho_rpm_rpm);
partial_cm_wrt_rpm_rpm_rpm_func = matlabFunction(partial_cm_wrt_rpm_rpm_rpm);

partial10_cf1_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho1_10inch, tach10_1/60);
partial10_cf2_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho2_10inch, tach10_2/60);
partial10_cf3_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho3_10inch, tach10_3/60);
partial10_cf4_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho4_10inch, tach10_4/60);
partial10_cf5_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho5_10inch, tach10_5/60);
partial10_cf6_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho6_10inch, tach10_6/60);
partial10_cf7_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho7_10inch, tach10_7/60);
partial10_cf8_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho8_10inch, tach10_8/60);
partial12_cf1_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho1_12inch, tach12_1/60);
partial12_cf2_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho2_12inch, tach12_2/60);
partial12_cf3_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho3_12inch, tach12_3/60);
partial12_cf4_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho4_12inch, tach12_4/60);
partial12_cf5_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho5_12inch, tach12_5/60);
partial12_cf6_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho6_12inch, tach12_6/60);
partial12_cf7_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho7_12inch, tach12_7/60);
partial12_cf8_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho8_12inch, tach12_8/60);
partial13_cf1_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho1_13inch, tach13_1/60);
partial13_cf2_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho2_13inch, tach13_2/60);
partial13_cf3_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho3_13inch, tach13_3/60);
partial13_cf4_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho4_13inch, tach13_4/60);
partial13_cf5_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho5_13inch, tach13_5/60);
partial13_cf6_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho6_13inch, tach13_6/60);
partial13_cf7_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho7_13inch, tach13_7/60);
partial13_cf8_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho8_13inch, tach13_8/60);
partial10_cf1_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho1_10inch, tach10_1/60);
partial10_cf2_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho2_10inch, tach10_2/60);
partial10_cf3_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho3_10inch, tach10_3/60);
partial10_cf4_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho4_10inch, tach10_4/60);
partial10_cf5_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho5_10inch, tach10_5/60);
partial10_cf6_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho6_10inch, tach10_6/60);
partial10_cf7_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho7_10inch, tach10_7/60);
partial10_cf8_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho8_10inch, tach10_8/60);
partial12_cf1_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho1_12inch, tach12_1/60);
partial12_cf2_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho2_12inch, tach12_2/60);
partial12_cf3_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho3_12inch, tach12_3/60);
partial12_cf4_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho4_12inch, tach12_4/60);
partial12_cf5_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho5_12inch, tach12_5/60); 
partial12_cf6_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho6_12inch, tach12_6/60); 
partial12_cf7_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho7_12inch, tach12_7/60); 
partial12_cf8_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho8_12inch, tach12_8/60); 
partial13_cf1_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho1_13inch, tach13_1/60);
partial13_cf2_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho2_13inch, tach13_2/60);
partial13_cf3_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho3_13inch, tach13_3/60);
partial13_cf4_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho4_13inch, tach13_4/60);
partial13_cf5_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho5_13inch, tach13_5/60); 
partial13_cf6_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho6_13inch, tach13_6/60); 
partial13_cf7_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho7_13inch, tach13_7/60); 
partial13_cf8_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho8_13inch, tach13_8/60); 
partial10_cf1_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_cf2_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_cf3_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_cf4_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_cf5_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_cf6_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_cf7_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_cf8_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_cf1_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_cf2_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_cf3_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_cf4_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_cf5_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_cf6_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_cf7_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_cf8_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_cf1_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_cf2_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_cf3_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_cf4_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_cf5_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_cf6_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_cf7_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_cf8_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_cf1_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_cf2_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_cf3_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_cf4_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_cf5_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_cf6_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_cf7_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_cf8_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_cf1_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_cf2_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_cf3_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_cf4_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_cf5_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_cf6_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_cf7_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_cf8_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_cf1_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_cf2_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_cf3_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_cf4_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_cf5_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_cf6_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_cf7_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_cf8_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_cf1_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);  % partial10 w.r.t w
partial10_cf2_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);  % partial10 w.r.t w
partial10_cf3_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);  % partial10 w.r.t w
partial10_cf4_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);  % partial10 w.r.t w
partial10_cf5_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);  % partial10 w.r.t w
partial10_cf6_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);  % partial10 w.r.t w
partial10_cf7_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);  % partial10 w.r.t w
partial10_cf8_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);  % partial10 w.r.t w
partial12_cf1_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);  % partial10 w.r.t w
partial12_cf2_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);  % partial10 w.r.t w
partial12_cf3_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);  % partial10 w.r.t w
partial12_cf4_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);  % partial10 w.r.t w
partial12_cf5_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);  % partial10 w.r.t w
partial12_cf6_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);  % partial10 w.r.t w
partial12_cf7_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);  % partial10 w.r.t w
partial12_cf8_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);  % partial10 w.r.t w
partial13_cf1_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);  % partial10 w.r.t w
partial13_cf2_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);  % partial10 w.r.t w
partial13_cf3_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);  % partial10 w.r.t w
partial13_cf4_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);  % partial10 w.r.t w
partial13_cf5_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);  % partial10 w.r.t w
partial13_cf6_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);  % partial10 w.r.t w
partial13_cf7_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);  % partial10 w.r.t w
partial13_cf8_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);  % partial10 w.r.t w
partial10_cf1_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal1_off_10inches, R_10,rho1_10inch, tach10_1/60);  % partial10 w.r.t w
partial10_cf2_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal2_off_10inches, R_10,rho2_10inch, tach10_2/60);  % partial10 w.r.t w
partial10_cf3_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal3_off_10inches, R_10,rho3_10inch, tach10_3/60);  % partial10 w.r.t w
partial10_cf4_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal4_off_10inches, R_10,rho4_10inch, tach10_4/60);  % partial10 w.r.t w
partial10_cf5_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal5_off_10inches, R_10,rho5_10inch, tach10_5/60);  % partial10 w.r.t w
partial10_cf6_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal6_off_10inches, R_10,rho6_10inch, tach10_6/60);  % partial10 w.r.t w
partial10_cf7_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal7_off_10inches, R_10,rho7_10inch, tach10_7/60);  % partial10 w.r.t w
partial10_cf8_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal8_off_10inches, R_10,rho8_10inch, tach10_8/60);  % partial10 w.r.t w
partial12_cf1_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal1_off_12inches, R_12,rho1_12inch, tach12_1/60);  % partial10 w.r.t w
partial12_cf2_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal2_off_12inches, R_12,rho2_12inch, tach12_2/60);  % partial10 w.r.t w
partial12_cf3_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal3_off_12inches, R_12,rho3_12inch, tach12_3/60);  % partial10 w.r.t w
partial12_cf4_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal4_off_12inches, R_12,rho4_12inch, tach12_4/60);  % partial10 w.r.t w
partial12_cf5_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal5_off_12inches, R_12,rho5_12inch, tach12_5/60);  % partial10 w.r.t w
partial12_cf6_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal6_off_12inches, R_12,rho6_12inch, tach12_6/60);  % partial10 w.r.t w
partial12_cf7_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal7_off_12inches, R_12,rho7_12inch, tach12_7/60);  % partial10 w.r.t w
partial12_cf8_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal8_off_12inches, R_12,rho8_12inch, tach12_8/60);  % partial10 w.r.t w
partial13_cf1_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal1_off_13inches, R_13,rho1_13inch, tach13_1/60);  % partial10 w.r.t w
partial13_cf2_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal2_off_13inches, R_13,rho2_13inch, tach13_2/60);  % partial10 w.r.t w
partial13_cf3_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal3_off_13inches, R_13,rho3_13inch, tach13_3/60);  % partial10 w.r.t w
partial13_cf4_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal4_off_13inches, R_13,rho4_13inch, tach13_4/60);  % partial10 w.r.t w
partial13_cf5_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal5_off_13inches, R_13,rho5_13inch, tach13_5/60);  % partial10 w.r.t w
partial13_cf6_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal6_off_13inches, R_13,rho6_13inch, tach13_6/60);  % partial10 w.r.t w
partial13_cf7_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal7_off_13inches, R_13,rho7_13inch, tach13_7/60);  % partial10 w.r.t w
partial13_cf8_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_htal8_off_13inches, R_13,rho8_13inch, tach13_8/60);  % partial10 w.r.t w
partial10_cm1_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho1_10inch, tach10_1/60);
partial10_cm2_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho2_10inch, tach10_2/60);
partial10_cm3_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho3_10inch, tach10_3/60);
partial10_cm4_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho4_10inch, tach10_4/60);
partial10_cm5_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho5_10inch, tach10_5/60);
partial10_cm6_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho6_10inch, tach10_6/60);
partial10_cm7_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho7_10inch, tach10_7/60);
partial10_cm8_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_10,rho8_10inch, tach10_8/60);
partial12_cm1_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho1_12inch, tach12_1/60);
partial12_cm2_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho2_12inch, tach12_2/60);
partial12_cm3_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho3_12inch, tach12_3/60);
partial12_cm4_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho4_12inch, tach12_4/60);
partial12_cm5_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho5_12inch, tach12_5/60);
partial12_cm6_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho6_12inch, tach12_6/60);
partial12_cm7_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho7_12inch, tach12_7/60);
partial12_cm8_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_12,rho8_12inch, tach12_8/60);
partial13_cm1_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho1_13inch, tach13_1/60);
partial13_cm2_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho2_13inch, tach13_2/60);
partial13_cm3_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho3_13inch, tach13_3/60);
partial13_cm4_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho4_13inch, tach13_4/60);
partial13_cm5_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho5_13inch, tach13_5/60);
partial13_cm6_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho6_13inch, tach13_6/60);
partial13_cm7_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho7_13inch, tach13_7/60);
partial13_cm8_1_2_2  = partial_cm_wrt_T_rho_rho_func(R_13,rho8_13inch, tach13_8/60);
partial10_cm1_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho1_10inch, tach10_1/60);
partial10_cm2_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho2_10inch, tach10_2/60);
partial10_cm3_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho3_10inch, tach10_3/60);
partial10_cm4_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho4_10inch, tach10_4/60);
partial10_cm5_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho5_10inch, tach10_5/60);
partial10_cm6_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho6_10inch, tach10_6/60);
partial10_cm7_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho7_10inch, tach10_7/60);
partial10_cm8_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_10,rho8_10inch, tach10_8/60);
partial12_cm1_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho1_12inch, tach12_1/60);
partial12_cm2_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho2_12inch, tach12_2/60);
partial12_cm3_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho3_12inch, tach12_3/60);
partial12_cm4_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho4_12inch, tach12_4/60);
partial12_cm5_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho5_12inch, tach12_5/60);
partial12_cm6_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho6_12inch, tach12_6/60);
partial12_cm7_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho7_12inch, tach12_7/60);
partial12_cm8_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_12,rho8_12inch, tach12_8/60);
partial13_cm1_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho1_13inch, tach13_1/60);
partial13_cm2_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho2_13inch, tach13_2/60);
partial13_cm3_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho3_13inch, tach13_3/60);
partial13_cm4_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho4_13inch, tach13_4/60);
partial13_cm5_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho5_13inch, tach13_5/60);
partial13_cm6_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho6_13inch, tach13_6/60);
partial13_cm7_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho7_13inch, tach13_7/60);
partial13_cm8_1_4_4  = partial_cm_wrt_T_rpm_rpm_func(R_13,rho8_13inch, tach13_8/60);
partial10_cm1_2_2_2 =  partial_cm_wrt_rho_rho_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_cm2_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_cm3_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_cm4_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_cm5_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_cm6_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_cm7_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_cm8_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_cm1_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_cm2_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_cm3_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_cm4_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_cm5_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_cm6_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_cm7_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_cm8_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_cm1_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_cm2_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_cm3_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_cm4_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_cm5_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_cm6_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_cm7_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_cm8_2_2_2 =  partial_cm_wrt_rho_rho_rho_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_cm1_2_2_4 =  partial_cm_wrt_rho_rho_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);    % partial10 w.r.t w
partial10_cm2_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);    % partial10 w.r.t w
partial10_cm3_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);    % partial10 w.r.t w
partial10_cm4_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);    % partial10 w.r.t w
partial10_cm5_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);    % partial10 w.r.t w
partial10_cm6_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);    % partial10 w.r.t w
partial10_cm7_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);    % partial10 w.r.t w
partial10_cm8_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);    % partial10 w.r.t w
partial12_cm1_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);    % partial10 w.r.t w
partial12_cm2_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);    % partial10 w.r.t w
partial12_cm3_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);    % partial10 w.r.t w
partial12_cm4_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);    % partial10 w.r.t w
partial12_cm5_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);    % partial10 w.r.t w
partial12_cm6_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);    % partial10 w.r.t w
partial12_cm7_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);    % partial10 w.r.t w
partial12_cm8_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);    % partial10 w.r.t w
partial13_cm1_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);    % partial10 w.r.t w
partial13_cm2_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);    % partial10 w.r.t w
partial13_cm3_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);    % partial10 w.r.t w
partial13_cm4_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);    % partial10 w.r.t w
partial13_cm5_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);    % partial10 w.r.t w
partial13_cm6_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);    % partial10 w.r.t w
partial13_cm7_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);    % partial10 w.r.t w
partial13_cm8_2_2_4 =  partial_cm_wrt_rho_rho_rpm_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);    % partial10 w.r.t w
partial10_cm1_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);    % partial10 w.r.t w
partial10_cm2_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);    % partial10 w.r.t w
partial10_cm3_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);    % partial10 w.r.t w
partial10_cm4_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);    % partial10 w.r.t w
partial10_cm5_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);    % partial10 w.r.t w
partial10_cm6_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);    % partial10 w.r.t w
partial10_cm7_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);    % partial10 w.r.t w
partial10_cm8_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);    % partial10 w.r.t w
partial12_cm1_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);    % partial10 w.r.t w
partial12_cm2_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);    % partial10 w.r.t w
partial12_cm3_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);    % partial10 w.r.t w
partial12_cm4_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);    % partial10 w.r.t w
partial12_cm5_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);    % partial10 w.r.t w
partial12_cm6_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);    % partial10 w.r.t w
partial12_cm7_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);    % partial10 w.r.t w
partial12_cm8_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);    % partial10 w.r.t w
partial13_cm1_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);    % partial10 w.r.t w
partial13_cm2_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);    % partial10 w.r.t w
partial13_cm3_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);    % partial10 w.r.t w
partial13_cm4_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);    % partial10 w.r.t w
partial13_cm5_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);    % partial10 w.r.t w
partial13_cm6_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);    % partial10 w.r.t w
partial13_cm7_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);    % partial10 w.r.t w
partial13_cm8_2_4_4 =  partial_cm_wrt_rho_rpm_rpm_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);    % partial10 w.r.t w
partial10_cm1_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal1_off_10inches,rho1_10inch, tach10_1/60);    % partial10 w.r.t w
partial10_cm2_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal2_off_10inches,rho2_10inch, tach10_2/60);    % partial10 w.r.t w
partial10_cm3_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal3_off_10inches,rho3_10inch, tach10_3/60);    % partial10 w.r.t w
partial10_cm4_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal4_off_10inches,rho4_10inch, tach10_4/60);    % partial10 w.r.t w
partial10_cm5_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal5_off_10inches,rho5_10inch, tach10_5/60);    % partial10 w.r.t w
partial10_cm6_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal6_off_10inches,rho6_10inch, tach10_6/60);    % partial10 w.r.t w
partial10_cm7_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal7_off_10inches,rho7_10inch, tach10_7/60);    % partial10 w.r.t w
partial10_cm8_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_10,M_htal8_off_10inches,rho8_10inch, tach10_8/60);    % partial10 w.r.t w
partial12_cm1_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal1_off_12inches,rho1_12inch, tach12_1/60);    % partial10 w.r.t w
partial12_cm2_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal2_off_12inches,rho2_12inch, tach12_2/60);    % partial10 w.r.t w
partial12_cm3_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal3_off_12inches,rho3_12inch, tach12_3/60);    % partial10 w.r.t w
partial12_cm4_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal4_off_12inches,rho4_12inch, tach12_4/60);    % partial10 w.r.t w
partial12_cm5_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal5_off_12inches,rho5_12inch, tach12_5/60);    % partial10 w.r.t w
partial12_cm6_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal6_off_12inches,rho6_12inch, tach12_6/60);    % partial10 w.r.t w
partial12_cm7_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal7_off_12inches,rho7_12inch, tach12_7/60);    % partial10 w.r.t w
partial12_cm8_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_12,M_htal8_off_12inches,rho8_12inch, tach12_8/60);    % partial10 w.r.t w
partial13_cm1_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal1_off_13inches,rho1_13inch, tach13_1/60);    % partial10 w.r.t w
partial13_cm2_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal2_off_13inches,rho2_13inch, tach13_2/60);    % partial10 w.r.t w
partial13_cm3_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal3_off_13inches,rho3_13inch, tach13_3/60);    % partial10 w.r.t w
partial13_cm4_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal4_off_13inches,rho4_13inch, tach13_4/60);    % partial10 w.r.t w
partial13_cm5_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal5_off_13inches,rho5_13inch, tach13_5/60);    % partial10 w.r.t w
partial13_cm6_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal6_off_13inches,rho6_13inch, tach13_6/60);    % partial10 w.r.t w
partial13_cm7_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal7_off_13inches,rho7_13inch, tach13_7/60);    % partial10 w.r.t w
partial13_cm8_4_4_4 =  partial_cm_wrt_rpm_rpm_rpm_func(R_13,M_htal8_off_13inches,rho8_13inch, tach13_8/60);    % partial10 w.r.t w

partial10_ct1_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho1_10inch, tach10_1/60);
partial10_ct2_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho2_10inch, tach10_2/60);
partial10_ct3_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho3_10inch, tach10_3/60);
partial10_ct4_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho4_10inch, tach10_4/60);
partial10_ct5_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho5_10inch, tach10_5/60);
partial10_ct6_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho6_10inch, tach10_6/60);
partial10_ct7_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho7_10inch, tach10_7/60);
partial10_ct8_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_10,rho8_10inch, tach10_8/60);
partial12_ct1_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho1_12inch, tach12_1/60);
partial12_ct2_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho2_12inch, tach12_2/60);
partial12_ct3_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho3_12inch, tach12_3/60);
partial12_ct4_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho4_12inch, tach12_4/60);
partial12_ct5_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho5_12inch, tach12_5/60);
partial12_ct6_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho6_12inch, tach12_6/60);
partial12_ct7_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho7_12inch, tach12_7/60);
partial12_ct8_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_12,rho8_12inch, tach12_8/60);
partial13_ct1_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho1_13inch, tach13_1/60);
partial13_ct2_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho2_13inch, tach13_2/60);
partial13_ct3_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho3_13inch, tach13_3/60);
partial13_ct4_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho4_13inch, tach13_4/60);
partial13_ct5_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho5_13inch, tach13_5/60);
partial13_ct6_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho6_13inch, tach13_6/60);
partial13_ct7_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho7_13inch, tach13_7/60);
partial13_ct8_1_2_2 = partial_cf_wrt_F_rho_rho_func(R_13,rho8_13inch, tach13_8/60);
partial10_ct1_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho1_10inch, tach10_1/60);
partial10_ct2_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho2_10inch, tach10_2/60);
partial10_ct3_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho3_10inch, tach10_3/60);
partial10_ct4_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho4_10inch, tach10_4/60);
partial10_ct5_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho5_10inch, tach10_5/60);
partial10_ct6_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho6_10inch, tach10_6/60);
partial10_ct7_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho7_10inch, tach10_7/60);
partial10_ct8_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_10,rho8_10inch, tach10_8/60);
partial12_ct1_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho1_12inch, tach12_1/60);
partial12_ct2_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho2_12inch, tach12_2/60);
partial12_ct3_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho3_12inch, tach12_3/60);
partial12_ct4_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho4_12inch, tach12_4/60);
partial12_ct5_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho5_12inch, tach12_5/60); 
partial12_ct6_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho6_12inch, tach12_6/60); 
partial12_ct7_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho7_12inch, tach12_7/60); 
partial12_ct8_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_12,rho8_12inch, tach12_8/60); 
partial13_ct1_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho1_13inch, tach13_1/60);
partial13_ct2_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho2_13inch, tach13_2/60);
partial13_ct3_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho3_13inch, tach13_3/60);
partial13_ct4_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho4_13inch, tach13_4/60);
partial13_ct5_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho5_13inch, tach13_5/60); 
partial13_ct6_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho6_13inch, tach13_6/60); 
partial13_ct7_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho7_13inch, tach13_7/60); 
partial13_ct8_1_4_4 = partial_cf_wrt_F_rpm_rpm_func(R_13,rho8_13inch, tach13_8/60); 
partial10_ct1_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60);   %   % partial10 w.r.t w
partial10_ct2_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_ct3_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_ct4_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_ct5_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_ct6_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_ct7_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_ct8_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_ct1_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_ct2_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_ct3_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_ct4_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_ct5_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_ct6_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_ct7_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_ct8_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_ct1_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_ct2_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_ct3_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_ct4_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_ct5_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_ct6_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_ct7_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_ct8_2_2_2 = partial_cf_wrt_rho_rho_rho_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_ct1_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60);  % partial10 w.r.t w
partial10_ct2_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60);  % partial10 w.r.t w
partial10_ct3_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60);  % partial10 w.r.t w
partial10_ct4_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60);  % partial10 w.r.t w
partial10_ct5_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60);  % partial10 w.r.t w
partial10_ct6_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60);  % partial10 w.r.t w
partial10_ct7_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60);  % partial10 w.r.t w
partial10_ct8_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60);  % partial10 w.r.t w
partial12_ct1_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60);  % partial10 w.r.t w
partial12_ct2_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60);  % partial10 w.r.t w
partial12_ct3_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60);  % partial10 w.r.t w
partial12_ct4_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60);  % partial10 w.r.t w
partial12_ct5_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60);  % partial10 w.r.t w
partial12_ct6_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60);  % partial10 w.r.t w
partial12_ct7_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60);  % partial10 w.r.t w
partial12_ct8_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60);  % partial10 w.r.t w
partial13_ct1_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60);  % partial10 w.r.t w
partial13_ct2_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60);  % partial10 w.r.t w
partial13_ct3_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60);  % partial10 w.r.t w
partial13_ct4_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60);  % partial10 w.r.t w
partial13_ct5_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60);  % partial10 w.r.t w
partial13_ct6_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60);  % partial10 w.r.t w
partial13_ct7_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60);  % partial10 w.r.t w
partial13_ct8_2_2_4 = partial_cf_wrt_rho_rho_rpm_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60);  % partial10 w.r.t w
partial10_ct1_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_ct2_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_ct3_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_ct4_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_ct5_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_ct6_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_ct7_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_ct8_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_ct1_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_ct2_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_ct3_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_ct4_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_ct5_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_ct6_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_ct7_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_ct8_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_ct1_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_ct2_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_ct3_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_ct4_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_ct5_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_ct6_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_ct7_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_ct8_2_4_4 = partial_cf_wrt_rho_rpm_rpm_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t w
partial10_ct1_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z1_off_10inches, R_10,rho1_10inch, tach10_1/60);   % partial10 w.r.t w
partial10_ct2_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z2_off_10inches, R_10,rho2_10inch, tach10_2/60);   % partial10 w.r.t w
partial10_ct3_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z3_off_10inches, R_10,rho3_10inch, tach10_3/60);   % partial10 w.r.t w
partial10_ct4_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z4_off_10inches, R_10,rho4_10inch, tach10_4/60);   % partial10 w.r.t w
partial10_ct5_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z5_off_10inches, R_10,rho5_10inch, tach10_5/60);   % partial10 w.r.t w
partial10_ct6_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z6_off_10inches, R_10,rho6_10inch, tach10_6/60);   % partial10 w.r.t w
partial10_ct7_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z7_off_10inches, R_10,rho7_10inch, tach10_7/60);   % partial10 w.r.t w
partial10_ct8_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z8_off_10inches, R_10,rho8_10inch, tach10_8/60);   % partial10 w.r.t w
partial12_ct1_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z1_off_12inches, R_12,rho1_12inch, tach12_1/60);   % partial10 w.r.t w
partial12_ct2_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z2_off_12inches, R_12,rho2_12inch, tach12_2/60);   % partial10 w.r.t w
partial12_ct3_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z3_off_12inches, R_12,rho3_12inch, tach12_3/60);   % partial10 w.r.t w
partial12_ct4_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z4_off_12inches, R_12,rho4_12inch, tach12_4/60);   % partial10 w.r.t w
partial12_ct5_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z5_off_12inches, R_12,rho5_12inch, tach12_5/60);   % partial10 w.r.t w
partial12_ct6_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z6_off_12inches, R_12,rho6_12inch, tach12_6/60);   % partial10 w.r.t w
partial12_ct7_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z7_off_12inches, R_12,rho7_12inch, tach12_7/60);   % partial10 w.r.t w
partial12_ct8_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z8_off_12inches, R_12,rho8_12inch, tach12_8/60);   % partial10 w.r.t w
partial13_ct1_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z1_off_13inches, R_13,rho1_13inch, tach13_1/60);   % partial10 w.r.t w
partial13_ct2_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z2_off_13inches, R_13,rho2_13inch, tach13_2/60);   % partial10 w.r.t w
partial13_ct3_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z3_off_13inches, R_13,rho3_13inch, tach13_3/60);   % partial10 w.r.t w
partial13_ct4_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z4_off_13inches, R_13,rho4_13inch, tach13_4/60);   % partial10 w.r.t w
partial13_ct5_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z5_off_13inches, R_13,rho5_13inch, tach13_5/60);   % partial10 w.r.t w
partial13_ct6_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z6_off_13inches, R_13,rho6_13inch, tach13_6/60);   % partial10 w.r.t w
partial13_ct7_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z7_off_13inches, R_13,rho7_13inch, tach13_7/60);   % partial10 w.r.t w
partial13_ct8_4_4_4 = partial_cf_wrt_rpm_rpm_rpm_func(F_z8_off_13inches, R_13,rho8_13inch, tach13_8/60);   % partial10 w.r.t w


% Higher order components
high_10_cf1 = (partial10_cf1_1_2.^2+partial10_cf1_1.*partial10_cf1_1_2_2).*delta10_F1'/2*delta_rho_10(1)+(partial10_cf1_1_4.^2+partial10_cf1_1.*partial10_cf1_1_4_4).*delta10_F1'/2*delta_w_1_1_10inch+(0.5*partial10_cf1_2_2.^2+partial10_cf1_2.*partial10_cf1_2_2_2)*delta_rho_10(1)*delta_rho_10(1)+(partial10_cf1_2_4.^2+partial10_cf1_2.*partial10_cf1_2_4_4+partial10_cf1_4.*partial10_cf1_2_2_4)*delta_rho_10(1).*delta_w_1_1_10inch+(0.5*partial10_cf1_4_4.^2+partial10_cf1_4.*partial10_cf1_4_4_4).*delta_w_1_1_10inch.*delta_w_1_1_10inch;
high_10_cf2 = (partial10_cf2_1_2.^2+partial10_cf2_1.*partial10_cf2_1_2_2).*delta10_F2'/2*delta_rho_10(2)+(partial10_cf2_1_4.^2+partial10_cf2_1.*partial10_cf2_1_4_4).*delta10_F2'/2*delta_w_2_1_10inch+(0.5*partial10_cf2_2_2.^2+partial10_cf2_2.*partial10_cf2_2_2_2)*delta_rho_10(2)*delta_rho_10(2)+(partial10_cf2_2_4.^2+partial10_cf2_2.*partial10_cf2_2_4_4+partial10_cf2_4.*partial10_cf2_2_2_4)*delta_rho_10(2)*delta_w_2_1_10inch+(0.5*partial10_cf2_4_4.^2+partial10_cf2_4.*partial10_cf2_4_4_4)*delta_w_2_1_10inch*delta_w_2_1_10inch;
high_10_cf3 = (partial10_cf3_1_2.^2+partial10_cf3_1.*partial10_cf3_1_2_2).*delta10_F3'/2*delta_rho_10(3)+(partial10_cf3_1_4.^2+partial10_cf3_1.*partial10_cf3_1_4_4).*delta10_F3'/2*delta_w_3_1_10inch+(0.5*partial10_cf3_2_2.^2+partial10_cf3_2.*partial10_cf3_2_2_2)*delta_rho_10(3)*delta_rho_10(3)+(partial10_cf3_2_4.^2+partial10_cf3_2.*partial10_cf3_2_4_4+partial10_cf3_4.*partial10_cf3_2_2_4)*delta_rho_10(3)*delta_w_3_1_10inch+(0.5*partial10_cf3_4_4.^2+partial10_cf3_4.*partial10_cf3_4_4_4)*delta_w_3_1_10inch*delta_w_3_1_10inch;
high_10_cf4 = (partial10_cf4_1_2.^2+partial10_cf4_1.*partial10_cf4_1_2_2).*delta10_F4'/2*delta_rho_10(4)+(partial10_cf4_1_4.^2+partial10_cf4_1.*partial10_cf4_1_4_4).*delta10_F4'/2*delta_w_4_1_10inch+(0.5*partial10_cf4_2_2.^2+partial10_cf4_2.*partial10_cf4_2_2_2)*delta_rho_10(4)*delta_rho_10(4)+(partial10_cf4_2_4.^2+partial10_cf4_2.*partial10_cf4_2_4_4+partial10_cf4_4.*partial10_cf4_2_2_4)*delta_rho_10(4)*delta_w_4_1_10inch+(0.5*partial10_cf4_4_4.^2+partial10_cf4_4.*partial10_cf4_4_4_4)*delta_w_4_1_10inch*delta_w_4_1_10inch;
high_10_cf5 = (partial10_cf5_1_2.^2+partial10_cf5_1.*partial10_cf5_1_2_2).*delta10_F5'/2*delta_rho_10(5)+(partial10_cf5_1_4.^2+partial10_cf5_1.*partial10_cf5_1_4_4).*delta10_F5'/2*delta_w_5_1_10inch+(0.5*partial10_cf5_2_2.^2+partial10_cf5_2.*partial10_cf5_2_2_2)*delta_rho_10(5)*delta_rho_10(5)+(partial10_cf5_2_4.^2+partial10_cf5_2.*partial10_cf5_2_4_4+partial10_cf5_4.*partial10_cf5_2_2_4)*delta_rho_10(5)*delta_w_5_1_10inch+(0.5*partial10_cf5_4_4.^2+partial10_cf5_4.*partial10_cf5_4_4_4)*delta_w_5_1_10inch*delta_w_5_1_10inch;
high_10_cf6 = (partial10_cf6_1_2.^2+partial10_cf6_1.*partial10_cf6_1_2_2).*delta10_F6'/2*delta_rho_10(6)+(partial10_cf6_1_4.^2+partial10_cf6_1.*partial10_cf6_1_4_4).*delta10_F6'/2*delta_w_6_1_10inch+(0.5*partial10_cf6_2_2.^2+partial10_cf6_2.*partial10_cf6_2_2_2)*delta_rho_10(6)*delta_rho_10(6)+(partial10_cf6_2_4.^2+partial10_cf6_2.*partial10_cf6_2_4_4+partial10_cf6_4.*partial10_cf6_2_2_4)*delta_rho_10(6)*delta_w_6_1_10inch+(0.5*partial10_cf6_4_4.^2+partial10_cf6_4.*partial10_cf6_4_4_4)*delta_w_6_1_10inch*delta_w_6_1_10inch;
high_10_cf7 = (partial10_cf7_1_2.^2+partial10_cf7_1.*partial10_cf7_1_2_2).*delta10_F7'/2*delta_rho_10(7)+(partial10_cf7_1_4.^2+partial10_cf7_1.*partial10_cf7_1_4_4).*delta10_F7'/2*delta_w_7_1_10inch+(0.5*partial10_cf7_2_2.^2+partial10_cf7_2.*partial10_cf7_2_2_2)*delta_rho_10(7)*delta_rho_10(7)+(partial10_cf7_2_4.^2+partial10_cf7_2.*partial10_cf7_2_4_4+partial10_cf7_4.*partial10_cf7_2_2_4)*delta_rho_10(7)*delta_w_7_1_10inch+(0.5*partial10_cf7_4_4.^2+partial10_cf7_4.*partial10_cf7_4_4_4)*delta_w_7_1_10inch*delta_w_7_1_10inch;
high_10_cf8 = (partial10_cf8_1_2.^2+partial10_cf8_1.*partial10_cf8_1_2_2).*delta10_F8'/2*delta_rho_10(8)+(partial10_cf8_1_4.^2+partial10_cf8_1.*partial10_cf8_1_4_4).*delta10_F8'/2*delta_w_8_1_10inch+(0.5*partial10_cf8_2_2.^2+partial10_cf8_2.*partial10_cf8_2_2_2)*delta_rho_10(8)*delta_rho_10(8)+(partial10_cf8_2_4.^2+partial10_cf8_2.*partial10_cf8_2_4_4+partial10_cf8_4.*partial10_cf8_2_2_4)*delta_rho_10(8)*delta_w_8_1_10inch+(0.5*partial10_cf8_4_4.^2+partial10_cf8_4.*partial10_cf8_4_4_4)*delta_w_8_1_10inch*delta_w_8_1_10inch;
high_12_cf1 = (partial12_cf1_1_2.^2+partial12_cf1_1.*partial12_cf1_1_2_2).*delta12_F1'/2*delta_rho_12(1)+(partial12_cf1_1_4.^2+partial12_cf1_1.*partial12_cf1_1_4_4).*delta12_F1'/2*delta_w_1_1_12inch+(0.5*partial12_cf1_2_2.^2+partial12_cf1_2.*partial12_cf1_2_2_2)*delta_rho_12(1)*delta_rho_12(1)+(partial12_cf1_2_4.^2+partial12_cf1_2.*partial12_cf1_2_4_4+partial12_cf1_4.*partial12_cf1_2_2_4)*delta_rho_12(1)*delta_w_1_1_12inch+(0.5*partial12_cf1_4_4.^2+partial12_cf1_4.*partial12_cf1_4_4_4)*delta_w_1_1_12inch*delta_w_1_1_12inch;
high_12_cf2 = (partial12_cf2_1_2.^2+partial12_cf2_1.*partial12_cf2_1_2_2).*delta12_F2'/2*delta_rho_12(2)+(partial12_cf2_1_4.^2+partial12_cf2_1.*partial12_cf2_1_4_4).*delta12_F2'/2*delta_w_2_1_12inch+(0.5*partial12_cf2_2_2.^2+partial12_cf2_2.*partial12_cf2_2_2_2)*delta_rho_12(2)*delta_rho_12(2)+(partial12_cf2_2_4.^2+partial12_cf2_2.*partial12_cf2_2_4_4+partial12_cf2_4.*partial12_cf2_2_2_4)*delta_rho_12(2)*delta_w_2_1_12inch+(0.5*partial12_cf2_4_4.^2+partial12_cf2_4.*partial12_cf2_4_4_4)*delta_w_2_1_12inch*delta_w_2_1_12inch;
high_12_cf3 = (partial12_cf3_1_2.^2+partial12_cf3_1.*partial12_cf3_1_2_2).*delta12_F3'/2*delta_rho_12(3)+(partial12_cf3_1_4.^2+partial12_cf3_1.*partial12_cf3_1_4_4).*delta12_F3'/2*delta_w_3_1_12inch+(0.5*partial12_cf3_2_2.^2+partial12_cf3_2.*partial12_cf3_2_2_2)*delta_rho_12(3)*delta_rho_12(3)+(partial12_cf3_2_4.^2+partial12_cf3_2.*partial12_cf3_2_4_4+partial12_cf3_4.*partial12_cf3_2_2_4)*delta_rho_12(3)*delta_w_3_1_12inch+(0.5*partial12_cf3_4_4.^2+partial12_cf3_4.*partial12_cf3_4_4_4)*delta_w_3_1_12inch*delta_w_3_1_12inch;
high_12_cf4 = (partial12_cf4_1_2.^2+partial12_cf4_1.*partial12_cf4_1_2_2).*delta12_F4'/2*delta_rho_12(4)+(partial12_cf4_1_4.^2+partial12_cf4_1.*partial12_cf4_1_4_4).*delta12_F4'/2*delta_w_4_1_12inch+(0.5*partial12_cf4_2_2.^2+partial12_cf4_2.*partial12_cf4_2_2_2)*delta_rho_12(4)*delta_rho_12(4)+(partial12_cf4_2_4.^2+partial12_cf4_2.*partial12_cf4_2_4_4+partial12_cf4_4.*partial12_cf4_2_2_4)*delta_rho_12(4)*delta_w_4_1_12inch+(0.5*partial12_cf4_4_4.^2+partial12_cf4_4.*partial12_cf4_4_4_4)*delta_w_4_1_12inch*delta_w_4_1_12inch;
high_12_cf5 = (partial12_cf5_1_2.^2+partial12_cf5_1.*partial12_cf5_1_2_2).*delta12_F5'/2*delta_rho_12(5)+(partial12_cf5_1_4.^2+partial12_cf5_1.*partial12_cf5_1_4_4).*delta12_F5'/2*delta_w_5_1_12inch+(0.5*partial12_cf5_2_2.^2+partial12_cf5_2.*partial12_cf5_2_2_2)*delta_rho_12(5)*delta_rho_12(5)+(partial12_cf5_2_4.^2+partial12_cf5_2.*partial12_cf5_2_4_4+partial12_cf5_4.*partial12_cf5_2_2_4)*delta_rho_12(5)*delta_w_5_1_12inch+(0.5*partial12_cf5_4_4.^2+partial12_cf5_4.*partial12_cf5_4_4_4)*delta_w_5_1_12inch*delta_w_5_1_12inch;
high_12_cf6 = (partial12_cf6_1_2.^2+partial12_cf6_1.*partial12_cf6_1_2_2).*delta12_F6'/2*delta_rho_12(6)+(partial12_cf6_1_4.^2+partial12_cf6_1.*partial12_cf6_1_4_4).*delta12_F6'/2*delta_w_6_1_12inch+(0.5*partial12_cf6_2_2.^2+partial12_cf6_2.*partial12_cf6_2_2_2)*delta_rho_12(6)*delta_rho_12(6)+(partial12_cf6_2_4.^2+partial12_cf6_2.*partial12_cf6_2_4_4+partial12_cf6_4.*partial12_cf6_2_2_4)*delta_rho_12(6)*delta_w_6_1_12inch+(0.5*partial12_cf6_4_4.^2+partial12_cf6_4.*partial12_cf6_4_4_4)*delta_w_6_1_12inch*delta_w_6_1_12inch;
high_12_cf7 = (partial12_cf7_1_2.^2+partial12_cf7_1.*partial12_cf7_1_2_2).*delta12_F7'/2*delta_rho_12(7)+(partial12_cf7_1_4.^2+partial12_cf7_1.*partial12_cf7_1_4_4).*delta12_F7'/2*delta_w_7_1_12inch+(0.5*partial12_cf7_2_2.^2+partial12_cf7_2.*partial12_cf7_2_2_2)*delta_rho_12(7)*delta_rho_12(7)+(partial12_cf7_2_4.^2+partial12_cf7_2.*partial12_cf7_2_4_4+partial12_cf7_4.*partial12_cf7_2_2_4)*delta_rho_12(7)*delta_w_7_1_12inch+(0.5*partial12_cf7_4_4.^2+partial12_cf7_4.*partial12_cf7_4_4_4)*delta_w_7_1_12inch*delta_w_7_1_12inch;
high_12_cf8 = (partial12_cf8_1_2.^2+partial12_cf8_1.*partial12_cf8_1_2_2).*delta12_F8'/2*delta_rho_12(8)+(partial12_cf8_1_4.^2+partial12_cf8_1.*partial12_cf8_1_4_4).*delta12_F8'/2*delta_w_8_1_12inch+(0.5*partial12_cf8_2_2.^2+partial12_cf8_2.*partial12_cf8_2_2_2)*delta_rho_12(8)*delta_rho_12(8)+(partial12_cf8_2_4.^2+partial12_cf8_2.*partial12_cf8_2_4_4+partial12_cf8_4.*partial12_cf8_2_2_4)*delta_rho_12(8)*delta_w_8_1_12inch+(0.5*partial12_cf8_4_4.^2+partial12_cf8_4.*partial12_cf8_4_4_4)*delta_w_8_1_12inch*delta_w_8_1_12inch;
high_13_cf1 = (partial13_cf1_1_2.^2+partial13_cf1_1.*partial13_cf1_1_2_2).*delta13_F1'/2*delta_rho_13(1)+(partial13_cf1_1_4.^2+partial13_cf1_1.*partial13_cf1_1_4_4).*delta13_F1'/2*delta_w_1_1_13inch+(0.5*partial13_cf1_2_2.^2+partial13_cf1_2.*partial13_cf1_2_2_2)*delta_rho_13(1)*delta_rho_13(1)+(partial13_cf1_2_4.^2+partial13_cf1_2.*partial13_cf1_2_4_4+partial13_cf1_4.*partial13_cf1_2_2_4)*delta_rho_13(1)*delta_w_1_1_13inch+(0.5*partial13_cf1_4_4.^2+partial13_cf1_4.*partial13_cf1_4_4_4)*delta_w_1_1_13inch*delta_w_1_1_13inch;
high_13_cf2 = (partial13_cf2_1_2.^2+partial13_cf2_1.*partial13_cf2_1_2_2).*delta13_F2'/2*delta_rho_13(2)+(partial13_cf2_1_4.^2+partial13_cf2_1.*partial13_cf2_1_4_4).*delta13_F2'/2*delta_w_2_1_13inch+(0.5*partial13_cf2_2_2.^2+partial13_cf2_2.*partial13_cf2_2_2_2)*delta_rho_13(2)*delta_rho_13(2)+(partial13_cf2_2_4.^2+partial13_cf2_2.*partial13_cf2_2_4_4+partial13_cf2_4.*partial13_cf2_2_2_4)*delta_rho_13(2)*delta_w_2_1_13inch+(0.5*partial13_cf2_4_4.^2+partial13_cf2_4.*partial13_cf2_4_4_4)*delta_w_2_1_13inch*delta_w_2_1_13inch;
high_13_cf3 = (partial13_cf3_1_2.^2+partial13_cf3_1.*partial13_cf3_1_2_2).*delta13_F3'/2*delta_rho_13(3)+(partial13_cf3_1_4.^2+partial13_cf3_1.*partial13_cf3_1_4_4).*delta13_F3'/2*delta_w_3_1_13inch+(0.5*partial13_cf3_2_2.^2+partial13_cf3_2.*partial13_cf3_2_2_2)*delta_rho_13(3)*delta_rho_13(3)+(partial13_cf3_2_4.^2+partial13_cf3_2.*partial13_cf3_2_4_4+partial13_cf3_4.*partial13_cf3_2_2_4)*delta_rho_13(3)*delta_w_3_1_13inch+(0.5*partial13_cf3_4_4.^2+partial13_cf3_4.*partial13_cf3_4_4_4)*delta_w_3_1_13inch*delta_w_3_1_13inch;
high_13_cf4 = (partial13_cf4_1_2.^2+partial13_cf4_1.*partial13_cf4_1_2_2).*delta13_F4'/2*delta_rho_13(4)+(partial13_cf4_1_4.^2+partial13_cf4_1.*partial13_cf4_1_4_4).*delta13_F4'/2*delta_w_4_1_13inch+(0.5*partial13_cf4_2_2.^2+partial13_cf4_2.*partial13_cf4_2_2_2)*delta_rho_13(4)*delta_rho_13(4)+(partial13_cf4_2_4.^2+partial13_cf4_2.*partial13_cf4_2_4_4+partial13_cf4_4.*partial13_cf4_2_2_4)*delta_rho_13(4)*delta_w_4_1_13inch+(0.5*partial13_cf4_4_4.^2+partial13_cf4_4.*partial13_cf4_4_4_4)*delta_w_4_1_13inch*delta_w_4_1_13inch;
high_13_cf5 = (partial13_cf5_1_2.^2+partial13_cf5_1.*partial13_cf5_1_2_2).*delta13_F5'/2*delta_rho_13(5)+(partial13_cf5_1_4.^2+partial13_cf5_1.*partial13_cf5_1_4_4).*delta13_F5'/2*delta_w_5_1_13inch+(0.5*partial13_cf5_2_2.^2+partial13_cf5_2.*partial13_cf5_2_2_2)*delta_rho_13(5)*delta_rho_13(5)+(partial13_cf5_2_4.^2+partial13_cf5_2.*partial13_cf5_2_4_4+partial13_cf5_4.*partial13_cf5_2_2_4)*delta_rho_13(5)*delta_w_5_1_13inch+(0.5*partial13_cf5_4_4.^2+partial13_cf5_4.*partial13_cf5_4_4_4)*delta_w_5_1_13inch*delta_w_5_1_13inch;
high_13_cf6 = (partial13_cf6_1_2.^2+partial13_cf6_1.*partial13_cf6_1_2_2).*delta13_F6'/2*delta_rho_13(6)+(partial13_cf6_1_4.^2+partial13_cf6_1.*partial13_cf6_1_4_4).*delta13_F6'/2*delta_w_6_1_13inch+(0.5*partial13_cf6_2_2.^2+partial13_cf6_2.*partial13_cf6_2_2_2)*delta_rho_13(6)*delta_rho_13(6)+(partial13_cf6_2_4.^2+partial13_cf6_2.*partial13_cf6_2_4_4+partial13_cf6_4.*partial13_cf6_2_2_4)*delta_rho_13(6)*delta_w_6_1_13inch+(0.5*partial13_cf6_4_4.^2+partial13_cf6_4.*partial13_cf6_4_4_4)*delta_w_6_1_13inch*delta_w_6_1_13inch;
high_13_cf7 = (partial13_cf7_1_2.^2+partial13_cf7_1.*partial13_cf7_1_2_2).*delta13_F7'/2*delta_rho_13(7)+(partial13_cf7_1_4.^2+partial13_cf7_1.*partial13_cf7_1_4_4).*delta13_F7'/2*delta_w_7_1_13inch+(0.5*partial13_cf7_2_2.^2+partial13_cf7_2.*partial13_cf7_2_2_2)*delta_rho_13(7)*delta_rho_13(7)+(partial13_cf7_2_4.^2+partial13_cf7_2.*partial13_cf7_2_4_4+partial13_cf7_4.*partial13_cf7_2_2_4)*delta_rho_13(7)*delta_w_7_1_13inch+(0.5*partial13_cf7_4_4.^2+partial13_cf7_4.*partial13_cf7_4_4_4)*delta_w_7_1_13inch*delta_w_7_1_13inch;
high_13_cf8 = (partial13_cf8_1_2.^2+partial13_cf8_1.*partial13_cf8_1_2_2).*delta13_F8'/2*delta_rho_13(8)+(partial13_cf8_1_4.^2+partial13_cf8_1.*partial13_cf8_1_4_4).*delta13_F8'/2*delta_w_8_1_13inch+(0.5*partial13_cf8_2_2.^2+partial13_cf8_2.*partial13_cf8_2_2_2)*delta_rho_13(8)*delta_rho_13(8)+(partial13_cf8_2_4.^2+partial13_cf8_2.*partial13_cf8_2_4_4+partial13_cf8_4.*partial13_cf8_2_2_4)*delta_rho_13(8)*delta_w_8_1_13inch+(0.5*partial13_cf8_4_4.^2+partial13_cf8_4.*partial13_cf8_4_4_4)*delta_w_8_1_13inch*delta_w_8_1_13inch;

high_10_cm1 = (partial10_cm1_1_2.^2+partial10_cm1_1.*partial10_cm1_1_2_2).*delta10_M1'/2*delta_rho_10(1)+(partial10_cm1_1_4.^2+partial10_cm1_1.*partial10_cm1_1_4_4).*delta10_M1'/2*delta_w_1_1_10inch+(0.5*partial10_cm1_2_2.^2+partial10_cm1_2.*partial10_cm1_2_2_2)*delta_rho_10(1)*delta_rho_10(1)+(partial10_cm1_2_4.^2+partial10_cm1_2.*partial10_cm1_2_4_4+partial10_cm1_4.*partial10_cm1_2_2_4)*delta_rho_10(1)*delta_w_1_1_10inch+(0.5*partial10_cm1_4_4.^2+partial10_cm1_4.*partial10_cm1_4_4_4)*delta_w_1_1_10inch*delta_w_1_1_10inch;
high_10_cm2 = (partial10_cm2_1_2.^2+partial10_cm2_1.*partial10_cm2_1_2_2).*delta10_M2'/2*delta_rho_10(2)+(partial10_cm2_1_4.^2+partial10_cm2_1.*partial10_cm2_1_4_4).*delta10_M2'/2*delta_w_2_1_10inch+(0.5*partial10_cm2_2_2.^2+partial10_cm2_2.*partial10_cm2_2_2_2)*delta_rho_10(2)*delta_rho_10(2)+(partial10_cm2_2_4.^2+partial10_cm2_2.*partial10_cm2_2_4_4+partial10_cm2_4.*partial10_cm2_2_2_4)*delta_rho_10(2)*delta_w_2_1_10inch+(0.5*partial10_cm2_4_4.^2+partial10_cm2_4.*partial10_cm2_4_4_4)*delta_w_2_1_10inch*delta_w_2_1_10inch;
high_10_cm3 = (partial10_cm3_1_2.^2+partial10_cm3_1.*partial10_cm3_1_2_2).*delta10_M3'/2*delta_rho_10(3)+(partial10_cm3_1_4.^2+partial10_cm3_1.*partial10_cm3_1_4_4).*delta10_M3'/2*delta_w_3_1_10inch+(0.5*partial10_cm3_2_2.^2+partial10_cm3_2.*partial10_cm3_2_2_2)*delta_rho_10(3)*delta_rho_10(3)+(partial10_cm3_2_4.^2+partial10_cm3_2.*partial10_cm3_2_4_4+partial10_cm3_4.*partial10_cm3_2_2_4)*delta_rho_10(3)*delta_w_3_1_10inch+(0.5*partial10_cm3_4_4.^2+partial10_cm3_4.*partial10_cm3_4_4_4)*delta_w_3_1_10inch*delta_w_3_1_10inch;
high_10_cm4 = (partial10_cm4_1_2.^2+partial10_cm4_1.*partial10_cm4_1_2_2).*delta10_M4'/2*delta_rho_10(4)+(partial10_cm4_1_4.^2+partial10_cm4_1.*partial10_cm4_1_4_4).*delta10_M4'/2*delta_w_4_1_10inch+(0.5*partial10_cm4_2_2.^2+partial10_cm4_2.*partial10_cm4_2_2_2)*delta_rho_10(4)*delta_rho_10(4)+(partial10_cm4_2_4.^2+partial10_cm4_2.*partial10_cm4_2_4_4+partial10_cm4_4.*partial10_cm4_2_2_4)*delta_rho_10(4)*delta_w_4_1_10inch+(0.5*partial10_cm4_4_4.^2+partial10_cm4_4.*partial10_cm4_4_4_4)*delta_w_4_1_10inch*delta_w_4_1_10inch;
high_10_cm5 = (partial10_cm5_1_2.^2+partial10_cm5_1.*partial10_cm5_1_2_2).*delta10_M5'/2*delta_rho_10(5)+(partial10_cm5_1_4.^2+partial10_cm5_1.*partial10_cm5_1_4_4).*delta10_M5'/2*delta_w_5_1_10inch+(0.5*partial10_cm5_2_2.^2+partial10_cm5_2.*partial10_cm5_2_2_2)*delta_rho_10(5)*delta_rho_10(5)+(partial10_cm5_2_4.^2+partial10_cm5_2.*partial10_cm5_2_4_4+partial10_cm5_4.*partial10_cm5_2_2_4)*delta_rho_10(5)*delta_w_5_1_10inch+(0.5*partial10_cm5_4_4.^2+partial10_cm5_4.*partial10_cm5_4_4_4)*delta_w_5_1_10inch*delta_w_5_1_10inch;
high_10_cm6 = (partial10_cm6_1_2.^2+partial10_cm6_1.*partial10_cm6_1_2_2).*delta10_M6'/2*delta_rho_10(6)+(partial10_cm6_1_4.^2+partial10_cm6_1.*partial10_cm6_1_4_4).*delta10_M6'/2*delta_w_6_1_10inch+(0.5*partial10_cm6_2_2.^2+partial10_cm6_2.*partial10_cm6_2_2_2)*delta_rho_10(6)*delta_rho_10(6)+(partial10_cm6_2_4.^2+partial10_cm6_2.*partial10_cm6_2_4_4+partial10_cm6_4.*partial10_cm6_2_2_4)*delta_rho_10(6)*delta_w_6_1_10inch+(0.5*partial10_cm6_4_4.^2+partial10_cm6_4.*partial10_cm6_4_4_4)*delta_w_6_1_10inch*delta_w_6_1_10inch;
high_10_cm7 = (partial10_cm7_1_2.^2+partial10_cm7_1.*partial10_cm7_1_2_2).*delta10_M7'/2*delta_rho_10(7)+(partial10_cm7_1_4.^2+partial10_cm7_1.*partial10_cm7_1_4_4).*delta10_M7'/2*delta_w_7_1_10inch+(0.5*partial10_cm7_2_2.^2+partial10_cm7_2.*partial10_cm7_2_2_2)*delta_rho_10(7)*delta_rho_10(7)+(partial10_cm7_2_4.^2+partial10_cm7_2.*partial10_cm7_2_4_4+partial10_cm7_4.*partial10_cm7_2_2_4)*delta_rho_10(7)*delta_w_7_1_10inch+(0.5*partial10_cm7_4_4.^2+partial10_cm7_4.*partial10_cm7_4_4_4)*delta_w_7_1_10inch*delta_w_7_1_10inch;
high_10_cm8 = (partial10_cm8_1_2.^2+partial10_cm8_1.*partial10_cm8_1_2_2).*delta10_M8'/2*delta_rho_10(8)+(partial10_cm8_1_4.^2+partial10_cm8_1.*partial10_cm8_1_4_4).*delta10_M8'/2*delta_w_8_1_10inch+(0.5*partial10_cm8_2_2.^2+partial10_cm8_2.*partial10_cm8_2_2_2)*delta_rho_10(8)*delta_rho_10(8)+(partial10_cm8_2_4.^2+partial10_cm8_2.*partial10_cm8_2_4_4+partial10_cm8_4.*partial10_cm8_2_2_4)*delta_rho_10(8)*delta_w_8_1_10inch+(0.5*partial10_cm8_4_4.^2+partial10_cm8_4.*partial10_cm8_4_4_4)*delta_w_8_1_10inch*delta_w_8_1_10inch;
high_12_cm1 = (partial12_cm1_1_2.^2+partial12_cm1_1.*partial12_cm1_1_2_2).*delta12_M1'/2*delta_rho_12(1)+(partial12_cm1_1_4.^2+partial12_cm1_1.*partial12_cm1_1_4_4).*delta12_M1'/2*delta_w_1_1_12inch+(0.5*partial12_cm1_2_2.^2+partial12_cm1_2.*partial12_cm1_2_2_2)*delta_rho_12(1)*delta_rho_12(1)+(partial12_cm1_2_4.^2+partial12_cm1_2.*partial12_cm1_2_4_4+partial12_cm1_4.*partial12_cm1_2_2_4)*delta_rho_12(1)*delta_w_1_1_12inch+(0.5*partial12_cm1_4_4.^2+partial12_cm1_4.*partial12_cm1_4_4_4)*delta_w_1_1_12inch*delta_w_1_1_12inch;
high_12_cm2 = (partial12_cm2_1_2.^2+partial12_cm2_1.*partial12_cm2_1_2_2).*delta12_M2'/2*delta_rho_12(2)+(partial12_cm2_1_4.^2+partial12_cm2_1.*partial12_cm2_1_4_4).*delta12_M2'/2*delta_w_2_1_12inch+(0.5*partial12_cm2_2_2.^2+partial12_cm2_2.*partial12_cm2_2_2_2)*delta_rho_12(2)*delta_rho_12(2)+(partial12_cm2_2_4.^2+partial12_cm2_2.*partial12_cm2_2_4_4+partial12_cm2_4.*partial12_cm2_2_2_4)*delta_rho_12(2)*delta_w_2_1_12inch+(0.5*partial12_cm2_4_4.^2+partial12_cm2_4.*partial12_cm2_4_4_4)*delta_w_2_1_12inch*delta_w_2_1_12inch;
high_12_cm3 = (partial12_cm3_1_2.^2+partial12_cm3_1.*partial12_cm3_1_2_2).*delta12_M3'/2*delta_rho_12(3)+(partial12_cm3_1_4.^2+partial12_cm3_1.*partial12_cm3_1_4_4).*delta12_M3'/2*delta_w_3_1_12inch+(0.5*partial12_cm3_2_2.^2+partial12_cm3_2.*partial12_cm3_2_2_2)*delta_rho_12(3)*delta_rho_12(3)+(partial12_cm3_2_4.^2+partial12_cm3_2.*partial12_cm3_2_4_4+partial12_cm3_4.*partial12_cm3_2_2_4)*delta_rho_12(3)*delta_w_3_1_12inch+(0.5*partial12_cm3_4_4.^2+partial12_cm3_4.*partial12_cm3_4_4_4)*delta_w_3_1_12inch*delta_w_3_1_12inch;
high_12_cm4 = (partial12_cm4_1_2.^2+partial12_cm4_1.*partial12_cm4_1_2_2).*delta12_M4'/2*delta_rho_12(4)+(partial12_cm4_1_4.^2+partial12_cm4_1.*partial12_cm4_1_4_4).*delta12_M4'/2*delta_w_4_1_12inch+(0.5*partial12_cm4_2_2.^2+partial12_cm4_2.*partial12_cm4_2_2_2)*delta_rho_12(4)*delta_rho_12(4)+(partial12_cm4_2_4.^2+partial12_cm4_2.*partial12_cm4_2_4_4+partial12_cm4_4.*partial12_cm4_2_2_4)*delta_rho_12(4)*delta_w_4_1_12inch+(0.5*partial12_cm4_4_4.^2+partial12_cm4_4.*partial12_cm4_4_4_4)*delta_w_4_1_12inch*delta_w_4_1_12inch;
high_12_cm5 = (partial12_cm5_1_2.^2+partial12_cm5_1.*partial12_cm5_1_2_2).*delta12_M5'/2*delta_rho_12(5)+(partial12_cm5_1_4.^2+partial12_cm5_1.*partial12_cm5_1_4_4).*delta12_M5'/2*delta_w_5_1_12inch+(0.5*partial12_cm5_2_2.^2+partial12_cm5_2.*partial12_cm5_2_2_2)*delta_rho_12(5)*delta_rho_12(5)+(partial12_cm5_2_4.^2+partial12_cm5_2.*partial12_cm5_2_4_4+partial12_cm5_4.*partial12_cm5_2_2_4)*delta_rho_12(5)*delta_w_5_1_12inch+(0.5*partial12_cm5_4_4.^2+partial12_cm5_4.*partial12_cm5_4_4_4)*delta_w_5_1_12inch*delta_w_5_1_12inch;
high_12_cm6 = (partial12_cm6_1_2.^2+partial12_cm6_1.*partial12_cm6_1_2_2).*delta12_M6'/2*delta_rho_12(6)+(partial12_cm6_1_4.^2+partial12_cm6_1.*partial12_cm6_1_4_4).*delta12_M6'/2*delta_w_6_1_12inch+(0.5*partial12_cm6_2_2.^2+partial12_cm6_2.*partial12_cm6_2_2_2)*delta_rho_12(6)*delta_rho_12(6)+(partial12_cm6_2_4.^2+partial12_cm6_2.*partial12_cm6_2_4_4+partial12_cm6_4.*partial12_cm6_2_2_4)*delta_rho_12(6)*delta_w_6_1_12inch+(0.5*partial12_cm6_4_4.^2+partial12_cm6_4.*partial12_cm6_4_4_4)*delta_w_6_1_12inch*delta_w_6_1_12inch;
high_12_cm7 = (partial12_cm7_1_2.^2+partial12_cm7_1.*partial12_cm7_1_2_2).*delta12_M7'/2*delta_rho_12(7)+(partial12_cm7_1_4.^2+partial12_cm7_1.*partial12_cm7_1_4_4).*delta12_M7'/2*delta_w_7_1_12inch+(0.5*partial12_cm7_2_2.^2+partial12_cm7_2.*partial12_cm7_2_2_2)*delta_rho_12(7)*delta_rho_12(7)+(partial12_cm7_2_4.^2+partial12_cm7_2.*partial12_cm7_2_4_4+partial12_cm7_4.*partial12_cm7_2_2_4)*delta_rho_12(7)*delta_w_7_1_12inch+(0.5*partial12_cm7_4_4.^2+partial12_cm7_4.*partial12_cm7_4_4_4)*delta_w_7_1_12inch*delta_w_7_1_12inch;
high_12_cm8 = (partial12_cm8_1_2.^2+partial12_cm8_1.*partial12_cm8_1_2_2).*delta12_M8'/2*delta_rho_12(8)+(partial12_cm8_1_4.^2+partial12_cm8_1.*partial12_cm8_1_4_4).*delta12_M8'/2*delta_w_8_1_12inch+(0.5*partial12_cm8_2_2.^2+partial12_cm8_2.*partial12_cm8_2_2_2)*delta_rho_12(8)*delta_rho_12(8)+(partial12_cm8_2_4.^2+partial12_cm8_2.*partial12_cm8_2_4_4+partial12_cm8_4.*partial12_cm8_2_2_4)*delta_rho_12(8)*delta_w_8_1_12inch+(0.5*partial12_cm8_4_4.^2+partial12_cm8_4.*partial12_cm8_4_4_4)*delta_w_8_1_12inch*delta_w_8_1_12inch;
high_13_cm1 = (partial13_cm1_1_2.^2+partial13_cm1_1.*partial13_cm1_1_2_2).*delta13_M1'/2*delta_rho_13(1)+(partial13_cm1_1_4.^2+partial13_cm1_1.*partial13_cm1_1_4_4).*delta13_M1'/2*delta_w_1_1_13inch+(0.5*partial13_cm1_2_2.^2+partial13_cm1_2.*partial13_cm1_2_2_2)*delta_rho_13(1)*delta_rho_13(1)+(partial13_cm1_2_4.^2+partial13_cm1_2.*partial13_cm1_2_4_4+partial13_cm1_4.*partial13_cm1_2_2_4)*delta_rho_13(1)*delta_w_1_1_13inch+(0.5*partial13_cm1_4_4.^2+partial13_cm1_4.*partial13_cm1_4_4_4)*delta_w_1_1_13inch*delta_w_1_1_13inch;
high_13_cm2 = (partial13_cm2_1_2.^2+partial13_cm2_1.*partial13_cm2_1_2_2).*delta13_M2'/2*delta_rho_13(2)+(partial13_cm2_1_4.^2+partial13_cm2_1.*partial13_cm2_1_4_4).*delta13_M2'/2*delta_w_2_1_13inch+(0.5*partial13_cm2_2_2.^2+partial13_cm2_2.*partial13_cm2_2_2_2)*delta_rho_13(2)*delta_rho_13(2)+(partial13_cm2_2_4.^2+partial13_cm2_2.*partial13_cm2_2_4_4+partial13_cm2_4.*partial13_cm2_2_2_4)*delta_rho_13(2)*delta_w_2_1_13inch+(0.5*partial13_cm2_4_4.^2+partial13_cm2_4.*partial13_cm2_4_4_4)*delta_w_2_1_13inch*delta_w_2_1_13inch;
high_13_cm3 = (partial13_cm3_1_2.^2+partial13_cm3_1.*partial13_cm3_1_2_2).*delta13_M3'/2*delta_rho_13(3)+(partial13_cm3_1_4.^2+partial13_cm3_1.*partial13_cm3_1_4_4).*delta13_M3'/2*delta_w_3_1_13inch+(0.5*partial13_cm3_2_2.^2+partial13_cm3_2.*partial13_cm3_2_2_2)*delta_rho_13(3)*delta_rho_13(3)+(partial13_cm3_2_4.^2+partial13_cm3_2.*partial13_cm3_2_4_4+partial13_cm3_4.*partial13_cm3_2_2_4)*delta_rho_13(3)*delta_w_3_1_13inch+(0.5*partial13_cm3_4_4.^2+partial13_cm3_4.*partial13_cm3_4_4_4)*delta_w_3_1_13inch*delta_w_3_1_13inch;
high_13_cm4 = (partial13_cm4_1_2.^2+partial13_cm4_1.*partial13_cm4_1_2_2).*delta13_M4'/2*delta_rho_13(4)+(partial13_cm4_1_4.^2+partial13_cm4_1.*partial13_cm4_1_4_4).*delta13_M4'/2*delta_w_4_1_13inch+(0.5*partial13_cm4_2_2.^2+partial13_cm4_2.*partial13_cm4_2_2_2)*delta_rho_13(4)*delta_rho_13(4)+(partial13_cm4_2_4.^2+partial13_cm4_2.*partial13_cm4_2_4_4+partial13_cm4_4.*partial13_cm4_2_2_4)*delta_rho_13(4)*delta_w_4_1_13inch+(0.5*partial13_cm4_4_4.^2+partial13_cm4_4.*partial13_cm4_4_4_4)*delta_w_4_1_13inch*delta_w_4_1_13inch;
high_13_cm5 = (partial13_cm5_1_2.^2+partial13_cm5_1.*partial13_cm5_1_2_2).*delta13_M5'/2*delta_rho_13(5)+(partial13_cm5_1_4.^2+partial13_cm5_1.*partial13_cm5_1_4_4).*delta13_M5'/2*delta_w_5_1_13inch+(0.5*partial13_cm5_2_2.^2+partial13_cm5_2.*partial13_cm5_2_2_2)*delta_rho_13(5)*delta_rho_13(5)+(partial13_cm5_2_4.^2+partial13_cm5_2.*partial13_cm5_2_4_4+partial13_cm5_4.*partial13_cm5_2_2_4)*delta_rho_13(5)*delta_w_5_1_13inch+(0.5*partial13_cm5_4_4.^2+partial13_cm5_4.*partial13_cm5_4_4_4)*delta_w_5_1_13inch*delta_w_5_1_13inch;
high_13_cm6 = (partial13_cm6_1_2.^2+partial13_cm6_1.*partial13_cm6_1_2_2).*delta13_M6'/2*delta_rho_13(6)+(partial13_cm6_1_4.^2+partial13_cm6_1.*partial13_cm6_1_4_4).*delta13_M6'/2*delta_w_6_1_13inch+(0.5*partial13_cm6_2_2.^2+partial13_cm6_2.*partial13_cm6_2_2_2)*delta_rho_13(6)*delta_rho_13(6)+(partial13_cm6_2_4.^2+partial13_cm6_2.*partial13_cm6_2_4_4+partial13_cm6_4.*partial13_cm6_2_2_4)*delta_rho_13(6)*delta_w_6_1_13inch+(0.5*partial13_cm6_4_4.^2+partial13_cm6_4.*partial13_cm6_4_4_4)*delta_w_6_1_13inch*delta_w_6_1_13inch;
high_13_cm7 = (partial13_cm7_1_2.^2+partial13_cm7_1.*partial13_cm7_1_2_2).*delta13_M7'/2*delta_rho_13(7)+(partial13_cm7_1_4.^2+partial13_cm7_1.*partial13_cm7_1_4_4).*delta13_M7'/2*delta_w_7_1_13inch+(0.5*partial13_cm7_2_2.^2+partial13_cm7_2.*partial13_cm7_2_2_2)*delta_rho_13(7)*delta_rho_13(7)+(partial13_cm7_2_4.^2+partial13_cm7_2.*partial13_cm7_2_4_4+partial13_cm7_4.*partial13_cm7_2_2_4)*delta_rho_13(7)*delta_w_7_1_13inch+(0.5*partial13_cm7_4_4.^2+partial13_cm7_4.*partial13_cm7_4_4_4)*delta_w_7_1_13inch*delta_w_7_1_13inch;
high_13_cm8 = (partial13_cm8_1_2.^2+partial13_cm8_1.*partial13_cm8_1_2_2).*delta13_M8'/2*delta_rho_13(8)+(partial13_cm8_1_4.^2+partial13_cm8_1.*partial13_cm8_1_4_4).*delta13_M8'/2*delta_w_8_1_13inch+(0.5*partial13_cm8_2_2.^2+partial13_cm8_2.*partial13_cm8_2_2_2)*delta_rho_13(8)*delta_rho_13(8)+(partial13_cm8_2_4.^2+partial13_cm8_2.*partial13_cm8_2_4_4+partial13_cm8_4.*partial13_cm8_2_2_4)*delta_rho_13(8)*delta_w_8_1_13inch+(0.5*partial13_cm8_4_4.^2+partial13_cm8_4.*partial13_cm8_4_4_4)*delta_w_8_1_13inch*delta_w_8_1_13inch;

high_10_ct1 = (partial10_ct1_1_2.^2+partial10_ct1_1.*partial10_ct1_1_2_2).*delta10_T1'/2*delta_rho_10(1)+(partial10_ct1_1_4.^2+partial10_ct1_1.*partial10_ct1_1_4_4).*delta10_T1'/2*delta_w_1_1_10inch+(0.5*partial10_ct1_2_2.^2+partial10_ct1_2.*partial10_ct1_2_2_2)*delta_rho_10(1)*delta_rho_10(1)+(partial10_ct1_2_4.^2+partial10_ct1_2.*partial10_ct1_2_4_4+partial10_ct1_4.*partial10_ct1_2_2_4)*delta_rho_10(1)*delta_w_1_1_10inch+(0.5*partial10_ct1_4_4.^2+partial10_ct1_4.*partial10_ct1_4_4_4)*delta_w_1_1_10inch*delta_w_1_1_10inch;
high_10_ct2 = (partial10_ct2_1_2.^2+partial10_ct2_1.*partial10_ct2_1_2_2).*delta10_T2'/2*delta_rho_10(2)+(partial10_ct2_1_4.^2+partial10_ct2_1.*partial10_ct2_1_4_4).*delta10_T2'/2*delta_w_2_1_10inch+(0.5*partial10_ct2_2_2.^2+partial10_ct2_2.*partial10_ct2_2_2_2)*delta_rho_10(2)*delta_rho_10(2)+(partial10_ct2_2_4.^2+partial10_ct2_2.*partial10_ct2_2_4_4+partial10_ct2_4.*partial10_ct2_2_2_4)*delta_rho_10(2)*delta_w_2_1_10inch+(0.5*partial10_ct2_4_4.^2+partial10_ct2_4.*partial10_ct2_4_4_4)*delta_w_2_1_10inch*delta_w_2_1_10inch;
high_10_ct3 = (partial10_ct3_1_2.^2+partial10_ct3_1.*partial10_ct3_1_2_2).*delta10_T3'/2*delta_rho_10(3)+(partial10_ct3_1_4.^2+partial10_ct3_1.*partial10_ct3_1_4_4).*delta10_T3'/2*delta_w_3_1_10inch+(0.5*partial10_ct3_2_2.^2+partial10_ct3_2.*partial10_ct3_2_2_2)*delta_rho_10(3)*delta_rho_10(3)+(partial10_ct3_2_4.^2+partial10_ct3_2.*partial10_ct3_2_4_4+partial10_ct3_4.*partial10_ct3_2_2_4)*delta_rho_10(3)*delta_w_3_1_10inch+(0.5*partial10_ct3_4_4.^2+partial10_ct3_4.*partial10_ct3_4_4_4)*delta_w_3_1_10inch*delta_w_3_1_10inch;
high_10_ct4 = (partial10_ct4_1_2.^2+partial10_ct4_1.*partial10_ct4_1_2_2).*delta10_T4'/2*delta_rho_10(4)+(partial10_ct4_1_4.^2+partial10_ct4_1.*partial10_ct4_1_4_4).*delta10_T4'/2*delta_w_4_1_10inch+(0.5*partial10_ct4_2_2.^2+partial10_ct4_2.*partial10_ct4_2_2_2)*delta_rho_10(4)*delta_rho_10(4)+(partial10_ct4_2_4.^2+partial10_ct4_2.*partial10_ct4_2_4_4+partial10_ct4_4.*partial10_ct4_2_2_4)*delta_rho_10(4)*delta_w_4_1_10inch+(0.5*partial10_ct4_4_4.^2+partial10_ct4_4.*partial10_ct4_4_4_4)*delta_w_4_1_10inch*delta_w_4_1_10inch;
high_10_ct5 = (partial10_ct5_1_2.^2+partial10_ct5_1.*partial10_ct5_1_2_2).*delta10_T5'/2*delta_rho_10(5)+(partial10_ct5_1_4.^2+partial10_ct5_1.*partial10_ct5_1_4_4).*delta10_T5'/2*delta_w_5_1_10inch+(0.5*partial10_ct5_2_2.^2+partial10_ct5_2.*partial10_ct5_2_2_2)*delta_rho_10(5)*delta_rho_10(5)+(partial10_ct5_2_4.^2+partial10_ct5_2.*partial10_ct5_2_4_4+partial10_ct5_4.*partial10_ct5_2_2_4)*delta_rho_10(5)*delta_w_5_1_10inch+(0.5*partial10_ct5_4_4.^2+partial10_ct5_4.*partial10_ct5_4_4_4)*delta_w_5_1_10inch*delta_w_5_1_10inch;
high_10_ct6 = (partial10_ct6_1_2.^2+partial10_ct6_1.*partial10_ct6_1_2_2).*delta10_T6'/2*delta_rho_10(6)+(partial10_ct6_1_4.^2+partial10_ct6_1.*partial10_ct6_1_4_4).*delta10_T6'/2*delta_w_6_1_10inch+(0.5*partial10_ct6_2_2.^2+partial10_ct6_2.*partial10_ct6_2_2_2)*delta_rho_10(6)*delta_rho_10(6)+(partial10_ct6_2_4.^2+partial10_ct6_2.*partial10_ct6_2_4_4+partial10_ct6_4.*partial10_ct6_2_2_4)*delta_rho_10(6)*delta_w_6_1_10inch+(0.5*partial10_ct6_4_4.^2+partial10_ct6_4.*partial10_ct6_4_4_4)*delta_w_6_1_10inch*delta_w_6_1_10inch;
high_10_ct7 = (partial10_ct7_1_2.^2+partial10_ct7_1.*partial10_ct7_1_2_2).*delta10_T7'/2*delta_rho_10(7)+(partial10_ct7_1_4.^2+partial10_ct7_1.*partial10_ct7_1_4_4).*delta10_T7'/2*delta_w_7_1_10inch+(0.5*partial10_ct7_2_2.^2+partial10_ct7_2.*partial10_ct7_2_2_2)*delta_rho_10(7)*delta_rho_10(7)+(partial10_ct7_2_4.^2+partial10_ct7_2.*partial10_ct7_2_4_4+partial10_ct7_4.*partial10_ct7_2_2_4)*delta_rho_10(7)*delta_w_7_1_10inch+(0.5*partial10_ct7_4_4.^2+partial10_ct7_4.*partial10_ct7_4_4_4)*delta_w_7_1_10inch*delta_w_7_1_10inch;
high_10_ct8 = (partial10_ct8_1_2.^2+partial10_ct8_1.*partial10_ct8_1_2_2).*delta10_T8'/2*delta_rho_10(8)+(partial10_ct8_1_4.^2+partial10_ct8_1.*partial10_ct8_1_4_4).*delta10_T8'/2*delta_w_8_1_10inch+(0.5*partial10_ct8_2_2.^2+partial10_ct8_2.*partial10_ct8_2_2_2)*delta_rho_10(8)*delta_rho_10(8)+(partial10_ct8_2_4.^2+partial10_ct8_2.*partial10_ct8_2_4_4+partial10_ct8_4.*partial10_ct8_2_2_4)*delta_rho_10(8)*delta_w_8_1_10inch+(0.5*partial10_ct8_4_4.^2+partial10_ct8_4.*partial10_ct8_4_4_4)*delta_w_8_1_10inch*delta_w_8_1_10inch;
high_12_ct1 = (partial12_ct1_1_2.^2+partial12_ct1_1.*partial12_ct1_1_2_2).*delta12_T1'/2*delta_rho_12(1)+(partial12_ct1_1_4.^2+partial12_ct1_1.*partial12_ct1_1_4_4).*delta12_T1'/2*delta_w_1_1_12inch+(0.5*partial12_ct1_2_2.^2+partial12_ct1_2.*partial12_ct1_2_2_2)*delta_rho_12(1)*delta_rho_12(1)+(partial12_ct1_2_4.^2+partial12_ct1_2.*partial12_ct1_2_4_4+partial12_ct1_4.*partial12_ct1_2_2_4)*delta_rho_12(1)*delta_w_1_1_12inch+(0.5*partial12_ct1_4_4.^2+partial12_ct1_4.*partial12_ct1_4_4_4)*delta_w_1_1_12inch*delta_w_1_1_12inch;
high_12_ct2 = (partial12_ct2_1_2.^2+partial12_ct2_1.*partial12_ct2_1_2_2).*delta12_T2'/2*delta_rho_12(2)+(partial12_ct2_1_4.^2+partial12_ct2_1.*partial12_ct2_1_4_4).*delta12_T2'/2*delta_w_2_1_12inch+(0.5*partial12_ct2_2_2.^2+partial12_ct2_2.*partial12_ct2_2_2_2)*delta_rho_12(2)*delta_rho_12(2)+(partial12_ct2_2_4.^2+partial12_ct2_2.*partial12_ct2_2_4_4+partial12_ct2_4.*partial12_ct2_2_2_4)*delta_rho_12(2)*delta_w_2_1_12inch+(0.5*partial12_ct2_4_4.^2+partial12_ct2_4.*partial12_ct2_4_4_4)*delta_w_2_1_12inch*delta_w_2_1_12inch;
high_12_ct3 = (partial12_ct3_1_2.^2+partial12_ct3_1.*partial12_ct3_1_2_2).*delta12_T3'/2*delta_rho_12(3)+(partial12_ct3_1_4.^2+partial12_ct3_1.*partial12_ct3_1_4_4).*delta12_T3'/2*delta_w_3_1_12inch+(0.5*partial12_ct3_2_2.^2+partial12_ct3_2.*partial12_ct3_2_2_2)*delta_rho_12(3)*delta_rho_12(3)+(partial12_ct3_2_4.^2+partial12_ct3_2.*partial12_ct3_2_4_4+partial12_ct3_4.*partial12_ct3_2_2_4)*delta_rho_12(3)*delta_w_3_1_12inch+(0.5*partial12_ct3_4_4.^2+partial12_ct3_4.*partial12_ct3_4_4_4)*delta_w_3_1_12inch*delta_w_3_1_12inch;
high_12_ct4 = (partial12_ct4_1_2.^2+partial12_ct4_1.*partial12_ct4_1_2_2).*delta12_T4'/2*delta_rho_12(4)+(partial12_ct4_1_4.^2+partial12_ct4_1.*partial12_ct4_1_4_4).*delta12_T4'/2*delta_w_4_1_12inch+(0.5*partial12_ct4_2_2.^2+partial12_ct4_2.*partial12_ct4_2_2_2)*delta_rho_12(4)*delta_rho_12(4)+(partial12_ct4_2_4.^2+partial12_ct4_2.*partial12_ct4_2_4_4+partial12_ct4_4.*partial12_ct4_2_2_4)*delta_rho_12(4)*delta_w_4_1_12inch+(0.5*partial12_ct4_4_4.^2+partial12_ct4_4.*partial12_ct4_4_4_4)*delta_w_4_1_12inch*delta_w_4_1_12inch;
high_12_ct5 = (partial12_ct5_1_2.^2+partial12_ct5_1.*partial12_ct5_1_2_2).*delta12_T5'/2*delta_rho_12(5)+(partial12_ct5_1_4.^2+partial12_ct5_1.*partial12_ct5_1_4_4).*delta12_T5'/2*delta_w_5_1_12inch+(0.5*partial12_ct5_2_2.^2+partial12_ct5_2.*partial12_ct5_2_2_2)*delta_rho_12(5)*delta_rho_12(5)+(partial12_ct5_2_4.^2+partial12_ct5_2.*partial12_ct5_2_4_4+partial12_ct5_4.*partial12_ct5_2_2_4)*delta_rho_12(5)*delta_w_5_1_12inch+(0.5*partial12_ct5_4_4.^2+partial12_ct5_4.*partial12_ct5_4_4_4)*delta_w_5_1_12inch*delta_w_5_1_12inch;
high_12_ct6 = (partial12_ct6_1_2.^2+partial12_ct6_1.*partial12_ct6_1_2_2).*delta12_T6'/2*delta_rho_12(6)+(partial12_ct6_1_4.^2+partial12_ct6_1.*partial12_ct6_1_4_4).*delta12_T6'/2*delta_w_6_1_12inch+(0.5*partial12_ct6_2_2.^2+partial12_ct6_2.*partial12_ct6_2_2_2)*delta_rho_12(6)*delta_rho_12(6)+(partial12_ct6_2_4.^2+partial12_ct6_2.*partial12_ct6_2_4_4+partial12_ct6_4.*partial12_ct6_2_2_4)*delta_rho_12(6)*delta_w_6_1_12inch+(0.5*partial12_ct6_4_4.^2+partial12_ct6_4.*partial12_ct6_4_4_4)*delta_w_6_1_12inch*delta_w_6_1_12inch;
high_12_ct7 = (partial12_ct7_1_2.^2+partial12_ct7_1.*partial12_ct7_1_2_2).*delta12_T7'/2*delta_rho_12(7)+(partial12_ct7_1_4.^2+partial12_ct7_1.*partial12_ct7_1_4_4).*delta12_T7'/2*delta_w_7_1_12inch+(0.5*partial12_ct7_2_2.^2+partial12_ct7_2.*partial12_ct7_2_2_2)*delta_rho_12(7)*delta_rho_12(7)+(partial12_ct7_2_4.^2+partial12_ct7_2.*partial12_ct7_2_4_4+partial12_ct7_4.*partial12_ct7_2_2_4)*delta_rho_12(7)*delta_w_7_1_12inch+(0.5*partial12_ct7_4_4.^2+partial12_ct7_4.*partial12_ct7_4_4_4)*delta_w_7_1_12inch*delta_w_7_1_12inch;
high_12_ct8 = (partial12_ct8_1_2.^2+partial12_ct8_1.*partial12_ct8_1_2_2).*delta12_T8'/2*delta_rho_12(8)+(partial12_ct8_1_4.^2+partial12_ct8_1.*partial12_ct8_1_4_4).*delta12_T8'/2*delta_w_8_1_12inch+(0.5*partial12_ct8_2_2.^2+partial12_ct8_2.*partial12_ct8_2_2_2)*delta_rho_12(8)*delta_rho_12(8)+(partial12_ct8_2_4.^2+partial12_ct8_2.*partial12_ct8_2_4_4+partial12_ct8_4.*partial12_ct8_2_2_4)*delta_rho_12(8)*delta_w_8_1_12inch+(0.5*partial12_ct8_4_4.^2+partial12_ct8_4.*partial12_ct8_4_4_4)*delta_w_8_1_12inch*delta_w_8_1_12inch;
high_13_ct1 = (partial13_ct1_1_2.^2+partial13_ct1_1.*partial13_ct1_1_2_2).*delta13_T1'/2*delta_rho_13(1)+(partial13_ct1_1_4.^2+partial13_ct1_1.*partial13_ct1_1_4_4).*delta13_T1'/2*delta_w_1_1_13inch+(0.5*partial13_ct1_2_2.^2+partial13_ct1_2.*partial13_ct1_2_2_2)*delta_rho_13(1)*delta_rho_13(1)+(partial13_ct1_2_4.^2+partial13_ct1_2.*partial13_ct1_2_4_4+partial13_ct1_4.*partial13_ct1_2_2_4)*delta_rho_13(1)*delta_w_1_1_13inch+(0.5*partial13_ct1_4_4.^2+partial13_ct1_4.*partial13_ct1_4_4_4)*delta_w_1_1_13inch*delta_w_1_1_13inch;
high_13_ct2 = (partial13_ct2_1_2.^2+partial13_ct2_1.*partial13_ct2_1_2_2).*delta13_T2'/2*delta_rho_13(2)+(partial13_ct2_1_4.^2+partial13_ct2_1.*partial13_ct2_1_4_4).*delta13_T2'/2*delta_w_2_1_13inch+(0.5*partial13_ct2_2_2.^2+partial13_ct2_2.*partial13_ct2_2_2_2)*delta_rho_13(2)*delta_rho_13(2)+(partial13_ct2_2_4.^2+partial13_ct2_2.*partial13_ct2_2_4_4+partial13_ct2_4.*partial13_ct2_2_2_4)*delta_rho_13(2)*delta_w_2_1_13inch+(0.5*partial13_ct2_4_4.^2+partial13_ct2_4.*partial13_ct2_4_4_4)*delta_w_2_1_13inch*delta_w_2_1_13inch;
high_13_ct3 = (partial13_ct3_1_2.^2+partial13_ct3_1.*partial13_ct3_1_2_2).*delta13_T3'/2*delta_rho_13(3)+(partial13_ct3_1_4.^2+partial13_ct3_1.*partial13_ct3_1_4_4).*delta13_T3'/2*delta_w_3_1_13inch+(0.5*partial13_ct3_2_2.^2+partial13_ct3_2.*partial13_ct3_2_2_2)*delta_rho_13(3)*delta_rho_13(3)+(partial13_ct3_2_4.^2+partial13_ct3_2.*partial13_ct3_2_4_4+partial13_ct3_4.*partial13_ct3_2_2_4)*delta_rho_13(3)*delta_w_3_1_13inch+(0.5*partial13_ct3_4_4.^2+partial13_ct3_4.*partial13_ct3_4_4_4)*delta_w_3_1_13inch*delta_w_3_1_13inch;
high_13_ct4 = (partial13_ct4_1_2.^2+partial13_ct4_1.*partial13_ct4_1_2_2).*delta13_T4'/2*delta_rho_13(4)+(partial13_ct4_1_4.^2+partial13_ct4_1.*partial13_ct4_1_4_4).*delta13_T4'/2*delta_w_4_1_13inch+(0.5*partial13_ct4_2_2.^2+partial13_ct4_2.*partial13_ct4_2_2_2)*delta_rho_13(4)*delta_rho_13(4)+(partial13_ct4_2_4.^2+partial13_ct4_2.*partial13_ct4_2_4_4+partial13_ct4_4.*partial13_ct4_2_2_4)*delta_rho_13(4)*delta_w_4_1_13inch+(0.5*partial13_ct4_4_4.^2+partial13_ct4_4.*partial13_ct4_4_4_4)*delta_w_4_1_13inch*delta_w_4_1_13inch;
high_13_ct5 = (partial13_ct5_1_2.^2+partial13_ct5_1.*partial13_ct5_1_2_2).*delta13_T5'/2*delta_rho_13(5)+(partial13_ct5_1_4.^2+partial13_ct5_1.*partial13_ct5_1_4_4).*delta13_T5'/2*delta_w_5_1_13inch+(0.5*partial13_ct5_2_2.^2+partial13_ct5_2.*partial13_ct5_2_2_2)*delta_rho_13(5)*delta_rho_13(5)+(partial13_ct5_2_4.^2+partial13_ct5_2.*partial13_ct5_2_4_4+partial13_ct5_4.*partial13_ct5_2_2_4)*delta_rho_13(5)*delta_w_5_1_13inch+(0.5*partial13_ct5_4_4.^2+partial13_ct5_4.*partial13_ct5_4_4_4)*delta_w_5_1_13inch*delta_w_5_1_13inch;
high_13_ct6 = (partial13_ct6_1_2.^2+partial13_ct6_1.*partial13_ct6_1_2_2).*delta13_T6'/2*delta_rho_13(6)+(partial13_ct6_1_4.^2+partial13_ct6_1.*partial13_ct6_1_4_4).*delta13_T6'/2*delta_w_6_1_13inch+(0.5*partial13_ct6_2_2.^2+partial13_ct6_2.*partial13_ct6_2_2_2)*delta_rho_13(6)*delta_rho_13(6)+(partial13_ct6_2_4.^2+partial13_ct6_2.*partial13_ct6_2_4_4+partial13_ct6_4.*partial13_ct6_2_2_4)*delta_rho_13(6)*delta_w_6_1_13inch+(0.5*partial13_ct6_4_4.^2+partial13_ct6_4.*partial13_ct6_4_4_4)*delta_w_6_1_13inch*delta_w_6_1_13inch;
high_13_ct7 = (partial13_ct7_1_2.^2+partial13_ct7_1.*partial13_ct7_1_2_2).*delta13_T7'/2*delta_rho_13(7)+(partial13_ct7_1_4.^2+partial13_ct7_1.*partial13_ct7_1_4_4).*delta13_T7'/2*delta_w_7_1_13inch+(0.5*partial13_ct7_2_2.^2+partial13_ct7_2.*partial13_ct7_2_2_2)*delta_rho_13(7)*delta_rho_13(7)+(partial13_ct7_2_4.^2+partial13_ct7_2.*partial13_ct7_2_4_4+partial13_ct7_4.*partial13_ct7_2_2_4)*delta_rho_13(7)*delta_w_7_1_13inch+(0.5*partial13_ct7_4_4.^2+partial13_ct7_4.*partial13_ct7_4_4_4)*delta_w_7_1_13inch*delta_w_7_1_13inch;
high_13_ct8 = (partial13_ct8_1_2.^2+partial13_ct8_1.*partial13_ct8_1_2_2).*delta13_T8'/2*delta_rho_13(8)+(partial13_ct8_1_4.^2+partial13_ct8_1.*partial13_ct8_1_4_4).*delta13_T8'/2*delta_w_8_1_13inch+(0.5*partial13_ct8_2_2.^2+partial13_ct8_2.*partial13_ct8_2_2_2)*delta_rho_13(8)*delta_rho_13(8)+(partial13_ct8_2_4.^2+partial13_ct8_2.*partial13_ct8_2_4_4+partial13_ct8_4.*partial13_ct8_2_2_4)*delta_rho_13(8)*delta_w_8_1_13inch+(0.5*partial13_ct8_4_4.^2+partial13_ct8_4.*partial13_ct8_4_4_4)*delta_w_8_1_13inch*delta_w_8_1_13inch;

%%%% Extended combined uncertainty
uncert10_cf1 = 2*sqrt((partial10_cf1_1.*delta10_F1'/2).^2  + (partial10_cf1_4.*delta_w_1_1_10inch).^2 + (partial10_cf1_2*delta_rho_10(1)).^2 + high_10_cf1); % + (partial10_cf1_3*delta_R).^2
uncert10_cf2 = 2*sqrt((partial10_cf2_1.*delta10_F2'/2).^2  + (partial10_cf2_4.*delta_w_2_1_10inch).^2 + (partial10_cf2_2*delta_rho_10(2)).^2 + high_10_cf2); % + (partial10_cf2_3*delta_R).^2
uncert10_cf3 = 2*sqrt((partial10_cf3_1.*delta10_F3'/2).^2  + (partial10_cf3_4.*delta_w_3_1_10inch).^2 + (partial10_cf3_2*delta_rho_10(3)).^2 + high_10_cf3); % + (partial10_cf3_3*delta_R).^2
uncert10_cf4 = 2*sqrt((partial10_cf4_1.*delta10_F4'/2).^2  + (partial10_cf4_4.*delta_w_4_1_10inch).^2 + (partial10_cf4_2*delta_rho_10(4)).^2 + high_10_cf4); % + (partial10_cf4_3*delta_R).^2
uncert10_cf5 = 2*sqrt((partial10_cf5_1.*delta10_F5'/2).^2  + (partial10_cf5_4.*delta_w_5_1_10inch).^2 + (partial10_cf5_2*delta_rho_10(5)).^2 + high_10_cf5); % + (partial10_cf5_3*delta_R).^2
uncert10_cf6 = 2*sqrt((partial10_cf6_1.*delta10_F6'/2).^2  + (partial10_cf6_4.*delta_w_6_1_10inch).^2 + (partial10_cf6_2*delta_rho_10(6)).^2 + high_10_cf6); % + (partial10_cf5_3*delta_R).^2
uncert10_cf7 = 2*sqrt((partial10_cf7_1.*delta10_F7'/2).^2  + (partial10_cf7_4.*delta_w_7_1_10inch).^2 + (partial10_cf7_2*delta_rho_10(7)).^2 + high_10_cf7); % + (partial10_cf5_3*delta_R).^2
uncert10_cf8 = 2*sqrt((partial10_cf8_1.*delta10_F8'/2).^2  + (partial10_cf8_4.*delta_w_8_1_10inch).^2 + (partial10_cf8_2*delta_rho_10(8)).^2 + high_10_cf8); % + (partial10_cf5_3*delta_R).^2
uncert10_cm1 = 2*sqrt((partial10_cm1_1.*delta10_M1'/2).^2  + (partial10_cm1_4.*delta_w_1_1_10inch).^2 + (partial10_cm1_2*delta_rho_10(1)).^2 + high_10_cm1); % + (partial10_cf1_3*delta_R).^2
uncert10_cm2 = 2*sqrt((partial10_cm2_1.*delta10_M2'/2).^2  + (partial10_cm2_4.*delta_w_2_1_10inch).^2 + (partial10_cm2_2*delta_rho_10(2)).^2 + high_10_cm2); % + (partial10_cf2_3*delta_R).^2
uncert10_cm3 = 2*sqrt((partial10_cm3_1.*delta10_M3'/2).^2  + (partial10_cm3_4.*delta_w_3_1_10inch).^2 + (partial10_cm3_2*delta_rho_10(3)).^2 + high_10_cm3); % + (partial10_cf3_3*delta_R).^2
uncert10_cm4 = 2*sqrt((partial10_cm4_1.*delta10_M4'/2).^2  + (partial10_cm4_4.*delta_w_4_1_10inch).^2 + (partial10_cm4_2*delta_rho_10(4)).^2 + high_10_cm4); % + (partial10_cf4_3*delta_R).^2
uncert10_cm5 = 2*sqrt((partial10_cm5_1.*delta10_M5'/2).^2  + (partial10_cm5_4.*delta_w_5_1_10inch).^2 + (partial10_cm5_2*delta_rho_10(5)).^2 + high_10_cm5); % + (partial10_cf5_3*delta_R).^2
uncert10_cm6 = 2*sqrt((partial10_cm6_1.*delta10_M6'/2).^2  + (partial10_cm6_4.*delta_w_6_1_10inch).^2 + (partial10_cm6_2*delta_rho_10(6)).^2 + high_10_cm6); % + (partial10_cf5_3*delta_R).^2
uncert10_cm7 = 2*sqrt((partial10_cm7_1.*delta10_M7'/2).^2  + (partial10_cm7_4.*delta_w_7_1_10inch).^2 + (partial10_cm7_2*delta_rho_10(7)).^2 + high_10_cm7); % + (partial10_cf5_3*delta_R).^2
uncert10_cm8 = 2*sqrt((partial10_cm8_1.*delta10_M8'/2).^2  + (partial10_cm8_4.*delta_w_8_1_10inch).^2 + (partial10_cm8_2*delta_rho_10(8)).^2 + high_10_cm8); % + (partial10_cf5_3*delta_R).^2
uncert10_ct1 = 2*sqrt((partial10_ct1_1.*delta10_T1'/2).^2  + (partial10_ct1_4.*delta_w_1_1_10inch).^2 + (partial10_ct1_2*delta_rho_10(1)).^2 + high_10_ct1); % + (partial10_cf1_3*delta_R).^2
uncert10_ct2 = 2*sqrt((partial10_ct2_1.*delta10_T2'/2).^2  + (partial10_ct2_4.*delta_w_2_1_10inch).^2 + (partial10_ct2_2*delta_rho_10(2)).^2 + high_10_ct2); % + (partial10_cf2_3*delta_R).^2
uncert10_ct3 = 2*sqrt((partial10_ct3_1.*delta10_T3'/2).^2  + (partial10_ct3_4.*delta_w_3_1_10inch).^2 + (partial10_ct3_2*delta_rho_10(3)).^2 + high_10_ct3); % + (partial10_cf3_3*delta_R).^2
uncert10_ct4 = 2*sqrt((partial10_ct4_1.*delta10_T4'/2).^2  + (partial10_ct4_4.*delta_w_4_1_10inch).^2 + (partial10_ct4_2*delta_rho_10(4)).^2 + high_10_ct4); % + (partial10_cf4_3*delta_R).^2
uncert10_ct5 = 2*sqrt((partial10_ct5_1.*delta10_T5'/2).^2  + (partial10_ct5_4.*delta_w_5_1_10inch).^2 + (partial10_ct5_2*delta_rho_10(5)).^2 + high_10_ct5); % + (partial10_cf5_3*delta_R).^2
uncert10_ct6 = 2*sqrt((partial10_ct6_1.*delta10_T6'/2).^2  + (partial10_ct6_4.*delta_w_6_1_10inch).^2 + (partial10_ct6_2*delta_rho_10(6)).^2 + high_10_ct6); % + (partial10_cf5_3*delta_R).^2
uncert10_ct7 = 2*sqrt((partial10_ct7_1.*delta10_T7'/2).^2  + (partial10_ct7_4.*delta_w_7_1_10inch).^2 + (partial10_ct7_2*delta_rho_10(7)).^2 + high_10_ct7); % + (partial10_cf5_3*delta_R).^2
uncert10_ct8 = 2*sqrt((partial10_ct8_1.*delta10_T8'/2).^2  + (partial10_ct8_4.*delta_w_8_1_10inch).^2 + (partial10_ct8_2*delta_rho_10(8)).^2 + high_10_ct8); % + (partial10_cf5_3*delta_R).^2
uncert12_cm1 = 2*sqrt((partial12_cm1_1.*delta12_M1'/2).^2  + (partial12_cm1_4.*delta_w_1_1_12inch).^2 + (partial12_cm1_2*delta_rho_12(1)).^2 + high_12_cm1); % + (partial12_cf1_3*delta_R).^2
uncert12_cm2 = 2*sqrt((partial12_cm2_1.*delta12_M2'/2).^2  + (partial12_cm2_4.*delta_w_2_1_12inch).^2 + (partial12_cm2_2*delta_rho_12(2)).^2 + high_12_cm2); % + (partial12_cf2_3*delta_R).^2
uncert12_cm3 = 2*sqrt((partial12_cm3_1.*delta12_M3'/2).^2  + (partial12_cm3_4.*delta_w_3_1_12inch).^2 + (partial12_cm3_2*delta_rho_12(3)).^2 + high_12_cm3); % + (partial12_cf3_3*delta_R).^2
uncert12_cm4 = 2*sqrt((partial12_cm4_1.*delta12_M4'/2).^2  + (partial12_cm4_4.*delta_w_4_1_12inch).^2 + (partial12_cm4_2*delta_rho_12(4)).^2 + high_12_cm4); % + (partial12_cf4_3*delta_R).^2
uncert12_cm5 = 2*sqrt((partial12_cm5_1.*delta12_M5'/2).^2  + (partial12_cm5_4.*delta_w_5_1_12inch).^2 + (partial12_cm5_2*delta_rho_12(5)).^2 + high_12_cm5); % + (partial12_cf5_3*delta_R).^2
uncert12_cm6 = 2*sqrt((partial12_cm6_1.*delta12_M6'/2).^2  + (partial12_cm6_4.*delta_w_6_1_12inch).^2 + (partial12_cm6_2*delta_rho_12(6)).^2 + high_12_cm6); % + (partial12_cf5_3*delta_R).^2
uncert12_cm7 = 2*sqrt((partial12_cm7_1.*delta12_M7'/2).^2  + (partial12_cm7_4.*delta_w_7_1_12inch).^2 + (partial12_cm7_2*delta_rho_12(7)).^2 + high_12_cm7); % + (partial12_cf5_3*delta_R).^2
uncert12_cm8 = 2*sqrt((partial12_cm8_1.*delta12_M8'/2).^2  + (partial12_cm8_4.*delta_w_8_1_12inch).^2 + (partial12_cm8_2*delta_rho_12(8)).^2 + high_12_cm8); % + (partial12_cf5_3*delta_R).^2
uncert12_cf1 = 2*sqrt((partial12_cf1_1.*delta12_F1'/2).^2  + (partial12_cf1_4.*delta_w_1_1_12inch).^2 + (partial12_cf1_2*delta_rho_12(1)).^2 + high_12_cf1); % + (partial12_cf1_3*delta_R).^2
uncert12_cf2 = 2*sqrt((partial12_cf2_1.*delta12_F2'/2).^2  + (partial12_cf2_4.*delta_w_2_1_12inch).^2 + (partial12_cf2_2*delta_rho_12(2)).^2 + high_12_cf2); % + (partial12_cf2_3*delta_R).^2
uncert12_cf3 = 2*sqrt((partial12_cf3_1.*delta12_F3'/2).^2  + (partial12_cf3_4.*delta_w_3_1_12inch).^2 + (partial12_cf3_2*delta_rho_12(3)).^2 + high_12_cf3); % + (partial12_cf3_3*delta_R).^2
uncert12_cf4 = 2*sqrt((partial12_cf4_1.*delta12_F4'/2).^2  + (partial12_cf4_4.*delta_w_4_1_12inch).^2 + (partial12_cf4_2*delta_rho_12(4)).^2 + high_12_cf4); % + (partial12_cf4_3*delta_R).^2
uncert12_cf5 = 2*sqrt((partial12_cf5_1.*delta12_F5'/2).^2  + (partial12_cf5_4.*delta_w_5_1_12inch).^2 + (partial12_cf5_2*delta_rho_12(5)).^2 + high_12_cf5); % + (partial12_cf5_3*delta_R).^2
uncert12_cf6 = 2*sqrt((partial12_cf6_1.*delta12_F6'/2).^2  + (partial12_cf6_4.*delta_w_6_1_12inch).^2 + (partial12_cf6_2*delta_rho_12(6)).^2 + high_12_cf6); % + (partial12_cf5_3*delta_R).^2
uncert12_cf7 = 2*sqrt((partial12_cf7_1.*delta12_F7'/2).^2  + (partial12_cf7_4.*delta_w_7_1_12inch).^2 + (partial12_cf7_2*delta_rho_12(7)).^2 + high_12_cf7); % + (partial12_cf5_3*delta_R).^2
uncert12_cf8 = 2*sqrt((partial12_cf8_1.*delta12_F8'/2).^2  + (partial12_cf8_4.*delta_w_8_1_12inch).^2 + (partial12_cf8_2*delta_rho_12(8)).^2 + high_12_cf8); % + (partial12_cf5_3*delta_R).^2
uncert12_ct1 = 2*sqrt((partial12_ct1_1.*delta12_T1'/2).^2  + (partial12_ct1_4.*delta_w_1_1_12inch).^2 + (partial12_ct1_2*delta_rho_12(1)).^2 + high_12_ct1); % + (partial12_cf1_3*delta_R).^2
uncert12_ct2 = 2*sqrt((partial12_ct2_1.*delta12_T2'/2).^2  + (partial12_ct2_4.*delta_w_2_1_12inch).^2 + (partial12_ct2_2*delta_rho_12(2)).^2 + high_12_ct2); % + (partial12_cf2_3*delta_R).^2
uncert12_ct3 = 2*sqrt((partial12_ct3_1.*delta12_T3'/2).^2  + (partial12_ct3_4.*delta_w_3_1_12inch).^2 + (partial12_ct3_2*delta_rho_12(3)).^2 + high_12_ct3); % + (partial12_cf3_3*delta_R).^2
uncert12_ct4 = 2*sqrt((partial12_ct4_1.*delta12_T4'/2).^2  + (partial12_ct4_4.*delta_w_4_1_12inch).^2 + (partial12_ct4_2*delta_rho_12(4)).^2 + high_12_ct4); % + (partial12_cf4_3*delta_R).^2
uncert12_ct5 = 2*sqrt((partial12_ct5_1.*delta12_T5'/2).^2  + (partial12_ct5_4.*delta_w_5_1_12inch).^2 + (partial12_ct5_2*delta_rho_12(5)).^2 + high_12_ct5); % + (partial12_cf5_3*delta_R).^2
uncert12_ct6 = 2*sqrt((partial12_ct6_1.*delta12_T6'/2).^2  + (partial12_ct6_4.*delta_w_6_1_12inch).^2 + (partial12_ct6_2*delta_rho_12(6)).^2 + high_12_ct6); % + (partial12_cf5_3*delta_R).^2
uncert12_ct7 = 2*sqrt((partial12_ct7_1.*delta12_T7'/2).^2  + (partial12_ct7_4.*delta_w_7_1_12inch).^2 + (partial12_ct7_2*delta_rho_12(7)).^2 + high_12_ct7); % + (partial12_cf5_3*delta_R).^2
uncert12_ct8 = 2*sqrt((partial12_ct8_1.*delta12_T8'/2).^2  + (partial12_ct8_4.*delta_w_8_1_12inch).^2 + (partial12_ct8_2*delta_rho_12(8)).^2 + high_12_ct8); % + (partial12_cf5_3*delta_R).^2
uncert13_cm1 = 2*sqrt((partial13_cm1_1.*delta13_M1'/2).^2  + (partial13_cm1_4.*delta_w_1_1_13inch).^2 + (partial13_cm1_2*delta_rho_13(1)).^2 + high_13_cm1); % + (partial12_cf1_3*delta_R).^2
uncert13_cm2 = 2*sqrt((partial13_cm2_1.*delta13_M2'/2).^2  + (partial13_cm2_4.*delta_w_2_1_13inch).^2 + (partial13_cm2_2*delta_rho_13(2)).^2 + high_13_cm2); % + (partial12_cf2_3*delta_R).^2
uncert13_cm3 = 2*sqrt((partial13_cm3_1.*delta13_M3'/2).^2  + (partial13_cm3_4.*delta_w_3_1_13inch).^2 + (partial13_cm3_2*delta_rho_13(3)).^2 + high_13_cm3); % + (partial12_cf3_3*delta_R).^2
uncert13_cm4 = 2*sqrt((partial13_cm4_1.*delta13_M4'/2).^2  + (partial13_cm4_4.*delta_w_4_1_13inch).^2 + (partial13_cm4_2*delta_rho_13(4)).^2 + high_13_cm4); % + (partial12_cf4_3*delta_R).^2
uncert13_cm5 = 2*sqrt((partial13_cm5_1.*delta13_M5'/2).^2  + (partial13_cm5_4.*delta_w_5_1_13inch).^2 + (partial13_cm5_2*delta_rho_13(5)).^2 + high_13_cm5); % + (partial12_cf5_3*delta_R).^2
uncert13_cm6 = 2*sqrt((partial13_cm6_1.*delta13_M6'/2).^2  + (partial13_cm6_4.*delta_w_6_1_13inch).^2 + (partial13_cm6_2*delta_rho_13(6)).^2 + high_13_cm6); % + (partial12_cf5_3*delta_R).^2
uncert13_cm7 = 2*sqrt((partial13_cm7_1.*delta13_M7'/2).^2  + (partial13_cm7_4.*delta_w_7_1_13inch).^2 + (partial13_cm7_2*delta_rho_13(7)).^2 + high_13_cm7); % + (partial12_cf5_3*delta_R).^2
uncert13_cm8 = 2*sqrt((partial13_cm8_1.*delta13_M8'/2).^2  + (partial13_cm8_4.*delta_w_8_1_13inch).^2 + (partial13_cm8_2*delta_rho_13(8)).^2 + high_13_cm8); % + (partial12_cf5_3*delta_R).^2
uncert13_cf1 = 2*sqrt((partial13_cf1_1.*delta13_F1'/2).^2  + (partial13_cf1_4.*delta_w_1_1_13inch).^2 + (partial13_cf1_2*delta_rho_13(1)).^2 + high_13_cf1); % + (partial12_cf1_3*delta_R).^2
uncert13_cf2 = 2*sqrt((partial13_cf2_1.*delta13_F2'/2).^2  + (partial13_cf2_4.*delta_w_2_1_13inch).^2 + (partial13_cf2_2*delta_rho_13(2)).^2 + high_13_cf2); % + (partial12_cf2_3*delta_R).^2
uncert13_cf3 = 2*sqrt((partial13_cf3_1.*delta13_F3'/2).^2  + (partial13_cf3_4.*delta_w_3_1_13inch).^2 + (partial13_cf3_2*delta_rho_13(3)).^2 + high_13_cf3); % + (partial12_cf3_3*delta_R).^2
uncert13_cf4 = 2*sqrt((partial13_cf4_1.*delta13_F4'/2).^2  + (partial13_cf4_4.*delta_w_4_1_13inch).^2 + (partial13_cf4_2*delta_rho_13(4)).^2 + high_13_cf4); % + (partial12_cf4_3*delta_R).^2
uncert13_cf5 = 2*sqrt((partial13_cf5_1.*delta13_F5'/2).^2  + (partial13_cf5_4.*delta_w_5_1_13inch).^2 + (partial13_cf5_2*delta_rho_13(5)).^2 + high_13_cf5); % + (partial12_cf5_3*delta_R).^2
uncert13_cf6 = 2*sqrt((partial13_cf6_1.*delta13_F6'/2).^2  + (partial13_cf6_4.*delta_w_6_1_13inch).^2 + (partial13_cf6_2*delta_rho_13(6)).^2 + high_13_cf6); % + (partial12_cf5_3*delta_R).^2
uncert13_cf7 = 2*sqrt((partial13_cf7_1.*delta13_F7'/2).^2  + (partial13_cf7_4.*delta_w_7_1_13inch).^2 + (partial13_cf7_2*delta_rho_13(7)).^2 + high_13_cf7); % + (partial12_cf5_3*delta_R).^2
uncert13_cf8 = 2*sqrt((partial13_cf8_1.*delta13_F8'/2).^2  + (partial13_cf8_4.*delta_w_8_1_13inch).^2 + (partial13_cf8_2*delta_rho_13(8)).^2 + high_13_cf8); % + (partial12_cf5_3*delta_R).^2
uncert13_ct1 = 2*sqrt((partial13_ct1_1.*delta13_T1'/2).^2  + (partial13_ct1_4.*delta_w_1_1_13inch).^2 + (partial13_ct1_2*delta_rho_13(1)).^2 + high_13_ct1); % + (partial12_cf1_3*delta_R).^2
uncert13_ct2 = 2*sqrt((partial13_ct2_1.*delta13_T2'/2).^2  + (partial13_ct2_4.*delta_w_2_1_13inch).^2 + (partial13_ct2_2*delta_rho_13(2)).^2 + high_13_ct2); % + (partial12_cf2_3*delta_R).^2
uncert13_ct3 = 2*sqrt((partial13_ct3_1.*delta13_T3'/2).^2  + (partial13_ct3_4.*delta_w_3_1_13inch).^2 + (partial13_ct3_2*delta_rho_13(3)).^2 + high_13_ct3); % + (partial12_cf3_3*delta_R).^2
uncert13_ct4 = 2*sqrt((partial13_ct4_1.*delta13_T4'/2).^2  + (partial13_ct4_4.*delta_w_4_1_13inch).^2 + (partial13_ct4_2*delta_rho_13(4)).^2 + high_13_ct4); % + (partial12_cf4_3*delta_R).^2
uncert13_ct5 = 2*sqrt((partial13_ct5_1.*delta13_T5'/2).^2  + (partial13_ct5_4.*delta_w_5_1_13inch).^2 + (partial13_ct5_2*delta_rho_13(5)).^2 + high_13_ct5); % + (partial12_cf5_3*delta_R).^2
uncert13_ct6 = 2*sqrt((partial13_ct6_1.*delta13_T6'/2).^2  + (partial13_ct6_4.*delta_w_6_1_13inch).^2 + (partial13_ct6_2*delta_rho_13(6)).^2 + high_13_ct6); % + (partial12_cf5_3*delta_R).^2
uncert13_ct7 = 2*sqrt((partial13_ct7_1.*delta13_T7'/2).^2  + (partial13_ct7_4.*delta_w_7_1_13inch).^2 + (partial13_ct7_2*delta_rho_13(7)).^2 + high_13_ct7); % + (partial12_cf5_3*delta_R).^2
uncert13_ct8 = 2*sqrt((partial13_ct8_1.*delta13_T8'/2).^2  + (partial13_ct8_4.*delta_w_8_1_13inch).^2 + (partial13_ct8_2*delta_rho_13(8)).^2 + high_13_ct8); % + (partial12_cf5_3*delta_R).^2

uncert10_cm1_RPM_1 = sqrt(1/4*uncert10_cm1(rpm10(1))^2+1/4*uncert10_cm1(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm1(rpm10(1))*uncert10_cm1(rpm10(2)));
uncert10_cm2_RPM_1 = sqrt(1/4*uncert10_cm2(rpm10(1))^2+1/4*uncert10_cm2(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm2(rpm10(1))*uncert10_cm2(rpm10(2)));
uncert10_cm3_RPM_1 = sqrt(1/4*uncert10_cm3(rpm10(1))^2+1/4*uncert10_cm3(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm3(rpm10(1))*uncert10_cm3(rpm10(2)));
uncert10_cm4_RPM_1 = sqrt(1/4*uncert10_cm4(rpm10(1))^2+1/4*uncert10_cm4(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm4(rpm10(1))*uncert10_cm4(rpm10(2)));
uncert10_cm5_RPM_1 = sqrt(1/4*uncert10_cm5(rpm10(1))^2+1/4*uncert10_cm5(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm5(rpm10(1))*uncert10_cm5(rpm10(2)));
uncert10_cm6_RPM_1 = sqrt(1/4*uncert10_cm6(rpm10(1))^2+1/4*uncert10_cm6(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm6(rpm10(1))*uncert10_cm6(rpm10(2)));
uncert10_cm7_RPM_1 = sqrt(1/4*uncert10_cm7(rpm10(1))^2+1/4*uncert10_cm7(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm7(rpm10(1))*uncert10_cm7(rpm10(2)));
uncert10_cm8_RPM_1 = sqrt(1/4*uncert10_cm8(rpm10(1))^2+1/4*uncert10_cm8(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm8(rpm10(1))*uncert10_cm8(rpm10(2)));
uncert10_cf1_RPM_1 = sqrt(1/4*uncert10_cf1(rpm10(1))^2+1/4*uncert10_cf1(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf1(rpm10(1))*uncert10_cf1(rpm10(2)));
uncert10_cf2_RPM_1 = sqrt(1/4*uncert10_cf2(rpm10(1))^2+1/4*uncert10_cf2(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf2(rpm10(1))*uncert10_cf2(rpm10(2)));
uncert10_cf3_RPM_1 = sqrt(1/4*uncert10_cf3(rpm10(1))^2+1/4*uncert10_cf3(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf3(rpm10(1))*uncert10_cf3(rpm10(2)));
uncert10_cf4_RPM_1 = sqrt(1/4*uncert10_cf4(rpm10(1))^2+1/4*uncert10_cf4(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf4(rpm10(1))*uncert10_cf4(rpm10(2)));
uncert10_cf5_RPM_1 = sqrt(1/4*uncert10_cf5(rpm10(1))^2+1/4*uncert10_cf5(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf5(rpm10(1))*uncert10_cf5(rpm10(2)));
uncert10_cf6_RPM_1 = sqrt(1/4*uncert10_cf6(rpm10(1))^2+1/4*uncert10_cf6(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf6(rpm10(1))*uncert10_cf6(rpm10(2)));
uncert10_cf7_RPM_1 = sqrt(1/4*uncert10_cf7(rpm10(1))^2+1/4*uncert10_cf7(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf7(rpm10(1))*uncert10_cf7(rpm10(2)));
uncert10_cf8_RPM_1 = sqrt(1/4*uncert10_cf8(rpm10(1))^2+1/4*uncert10_cf8(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf8(rpm10(1))*uncert10_cf8(rpm10(2)));
uncert10_ct1_RPM_1 = sqrt(1/4*uncert10_ct1(rpm10(1))^2+1/4*uncert10_ct1(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct1(rpm10(1))*uncert10_ct1(rpm10(2)));
uncert10_ct2_RPM_1 = sqrt(1/4*uncert10_ct2(rpm10(1))^2+1/4*uncert10_ct2(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct2(rpm10(1))*uncert10_ct2(rpm10(2)));
uncert10_ct3_RPM_1 = sqrt(1/4*uncert10_ct3(rpm10(1))^2+1/4*uncert10_ct3(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct3(rpm10(1))*uncert10_ct3(rpm10(2)));
uncert10_ct4_RPM_1 = sqrt(1/4*uncert10_ct4(rpm10(1))^2+1/4*uncert10_ct4(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct4(rpm10(1))*uncert10_ct4(rpm10(2)));
uncert10_ct5_RPM_1 = sqrt(1/4*uncert10_ct5(rpm10(1))^2+1/4*uncert10_ct5(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct5(rpm10(1))*uncert10_ct5(rpm10(2)));
uncert10_ct6_RPM_1 = sqrt(1/4*uncert10_ct6(rpm10(1))^2+1/4*uncert10_ct6(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct6(rpm10(1))*uncert10_ct6(rpm10(2)));
uncert10_ct7_RPM_1 = sqrt(1/4*uncert10_ct7(rpm10(1))^2+1/4*uncert10_ct7(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct7(rpm10(1))*uncert10_ct7(rpm10(2)));
uncert10_ct8_RPM_1 = sqrt(1/4*uncert10_ct8(rpm10(1))^2+1/4*uncert10_ct8(rpm10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct8(rpm10(1))*uncert10_ct8(rpm10(2)));
uncert12_cm1_RPM_1 = sqrt(1/4*uncert12_cm1(rpm12(1))^2+1/4*uncert12_cm1(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm1(rpm12(1))*uncert12_cm1(rpm12(2)));
uncert12_cm2_RPM_1 = sqrt(1/4*uncert12_cm2(rpm12(1))^2+1/4*uncert12_cm2(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm2(rpm12(1))*uncert12_cm2(rpm12(2)));
uncert12_cm3_RPM_1 = sqrt(1/4*uncert12_cm3(rpm12(1))^2+1/4*uncert12_cm3(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm3(rpm12(1))*uncert12_cm3(rpm12(2)));
uncert12_cm4_RPM_1 = sqrt(1/4*uncert12_cm4(rpm12(1))^2+1/4*uncert12_cm4(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm4(rpm12(1))*uncert12_cm4(rpm12(2)));
uncert12_cm5_RPM_1 = sqrt(1/4*uncert12_cm5(rpm12(1))^2+1/4*uncert12_cm5(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm5(rpm12(1))*uncert12_cm5(rpm12(2)));
uncert12_cm6_RPM_1 = sqrt(1/4*uncert12_cm6(rpm12(1))^2+1/4*uncert12_cm6(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm6(rpm12(1))*uncert12_cm6(rpm12(2)));
uncert12_cm7_RPM_1 = sqrt(1/4*uncert12_cm7(rpm12(1))^2+1/4*uncert12_cm7(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm7(rpm12(1))*uncert12_cm7(rpm12(2)));
uncert12_cm8_RPM_1 = sqrt(1/4*uncert12_cm8(rpm12(1))^2+1/4*uncert12_cm8(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm8(rpm12(1))*uncert12_cm8(rpm12(2)));
uncert12_cf1_RPM_1 = sqrt(1/4*uncert12_cf1(rpm12(1))^2+1/4*uncert12_cf1(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf1(rpm12(1))*uncert12_cf1(rpm12(2)));
uncert12_cf2_RPM_1 = sqrt(1/4*uncert12_cf2(rpm12(1))^2+1/4*uncert12_cf2(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf2(rpm12(1))*uncert12_cf2(rpm12(2)));
uncert12_cf3_RPM_1 = sqrt(1/4*uncert12_cf3(rpm12(1))^2+1/4*uncert12_cf3(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf3(rpm12(1))*uncert12_cf3(rpm12(2)));
uncert12_cf4_RPM_1 = sqrt(1/4*uncert12_cf4(rpm12(1))^2+1/4*uncert12_cf4(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf4(rpm12(1))*uncert12_cf4(rpm12(2)));
uncert12_cf5_RPM_1 = sqrt(1/4*uncert12_cf5(rpm12(1))^2+1/4*uncert12_cf5(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf5(rpm12(1))*uncert12_cf5(rpm12(2)));
uncert12_cf6_RPM_1 = sqrt(1/4*uncert12_cf6(rpm12(1))^2+1/4*uncert12_cf6(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf6(rpm12(1))*uncert12_cf6(rpm12(2)));
uncert12_cf7_RPM_1 = sqrt(1/4*uncert12_cf7(rpm12(1))^2+1/4*uncert12_cf7(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf7(rpm12(1))*uncert12_cf7(rpm12(2)));
uncert12_cf8_RPM_1 = sqrt(1/4*uncert12_cf8(rpm12(1))^2+1/4*uncert12_cf8(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf8(rpm12(1))*uncert12_cf8(rpm12(2)));
uncert12_ct1_RPM_1 = sqrt(1/4*uncert12_ct1(rpm12(1))^2+1/4*uncert12_ct1(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct1(rpm12(1))*uncert12_ct1(rpm12(2)));
uncert12_ct2_RPM_1 = sqrt(1/4*uncert12_ct2(rpm12(1))^2+1/4*uncert12_ct2(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct2(rpm12(1))*uncert12_ct2(rpm12(2)));
uncert12_ct3_RPM_1 = sqrt(1/4*uncert12_ct3(rpm12(1))^2+1/4*uncert12_ct3(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct3(rpm12(1))*uncert12_ct3(rpm12(2)));
uncert12_ct4_RPM_1 = sqrt(1/4*uncert12_ct4(rpm12(1))^2+1/4*uncert12_ct4(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct4(rpm12(1))*uncert12_ct4(rpm12(2)));
uncert12_ct5_RPM_1 = sqrt(1/4*uncert12_ct5(rpm12(1))^2+1/4*uncert12_ct5(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct5(rpm12(1))*uncert12_ct5(rpm12(2)));
uncert12_ct6_RPM_1 = sqrt(1/4*uncert12_ct6(rpm12(1))^2+1/4*uncert12_ct6(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct6(rpm12(1))*uncert12_ct6(rpm12(2)));
uncert12_ct7_RPM_1 = sqrt(1/4*uncert12_ct7(rpm12(1))^2+1/4*uncert12_ct7(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct7(rpm12(1))*uncert12_ct7(rpm12(2)));
uncert12_ct8_RPM_1 = sqrt(1/4*uncert12_ct8(rpm12(1))^2+1/4*uncert12_ct8(rpm12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct8(rpm12(1))*uncert12_ct8(rpm12(2)));
uncert13_cm1_RPM_1 = sqrt(1/4*uncert13_cm1(rpm13(1))^2+1/4*uncert13_cm1(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm1(rpm13(1))*uncert13_cm1(rpm13(2)));
uncert13_cm2_RPM_1 = sqrt(1/4*uncert13_cm2(rpm13(1))^2+1/4*uncert13_cm2(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm2(rpm13(1))*uncert13_cm2(rpm13(2)));
uncert13_cm3_RPM_1 = sqrt(1/4*uncert13_cm3(rpm13(1))^2+1/4*uncert13_cm3(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm3(rpm13(1))*uncert13_cm3(rpm13(2)));
uncert13_cm4_RPM_1 = sqrt(1/4*uncert13_cm4(rpm13(1))^2+1/4*uncert13_cm4(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm4(rpm13(1))*uncert13_cm4(rpm13(2)));
uncert13_cm5_RPM_1 = sqrt(1/4*uncert13_cm5(rpm13(1))^2+1/4*uncert13_cm5(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm5(rpm13(1))*uncert13_cm5(rpm13(2)));
uncert13_cm6_RPM_1 = sqrt(1/4*uncert13_cm6(rpm13(1))^2+1/4*uncert13_cm6(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm6(rpm13(1))*uncert13_cm6(rpm13(2)));
uncert13_cm7_RPM_1 = sqrt(1/4*uncert13_cm7(rpm13(1))^2+1/4*uncert13_cm7(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm7(rpm13(1))*uncert13_cm7(rpm13(2)));
uncert13_cm8_RPM_1 = sqrt(1/4*uncert13_cm8(rpm13(1))^2+1/4*uncert13_cm8(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm8(rpm13(1))*uncert13_cm8(rpm13(2)));
uncert13_cf1_RPM_1 = sqrt(1/4*uncert13_cf1(rpm13(1))^2+1/4*uncert13_cf1(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf1(rpm13(1))*uncert13_cf1(rpm13(2)));
uncert13_cf2_RPM_1 = sqrt(1/4*uncert13_cf2(rpm13(1))^2+1/4*uncert13_cf2(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf2(rpm13(1))*uncert13_cf2(rpm13(2)));
uncert13_cf3_RPM_1 = sqrt(1/4*uncert13_cf3(rpm13(1))^2+1/4*uncert13_cf3(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf3(rpm13(1))*uncert13_cf3(rpm13(2)));
uncert13_cf4_RPM_1 = sqrt(1/4*uncert13_cf4(rpm13(1))^2+1/4*uncert13_cf4(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf4(rpm13(1))*uncert13_cf4(rpm13(2)));
uncert13_cf5_RPM_1 = sqrt(1/4*uncert13_cf5(rpm13(1))^2+1/4*uncert13_cf5(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf5(rpm13(1))*uncert13_cf5(rpm13(2)));
uncert13_cf6_RPM_1 = sqrt(1/4*uncert13_cf6(rpm13(1))^2+1/4*uncert13_cf6(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf6(rpm13(1))*uncert13_cf6(rpm13(2)));
uncert13_cf7_RPM_1 = sqrt(1/4*uncert13_cf7(rpm13(1))^2+1/4*uncert13_cf7(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf7(rpm13(1))*uncert13_cf7(rpm13(2)));
uncert13_cf8_RPM_1 = sqrt(1/4*uncert13_cf8(rpm13(1))^2+1/4*uncert13_cf8(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf8(rpm13(1))*uncert13_cf8(rpm13(2)));
uncert13_ct1_RPM_1 = sqrt(1/4*uncert13_ct1(rpm13(1))^2+1/4*uncert13_ct1(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct1(rpm13(1))*uncert13_ct1(rpm13(2)));
uncert13_ct2_RPM_1 = sqrt(1/4*uncert13_ct2(rpm13(1))^2+1/4*uncert13_ct2(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct2(rpm13(1))*uncert13_ct2(rpm13(2)));
uncert13_ct3_RPM_1 = sqrt(1/4*uncert13_ct3(rpm13(1))^2+1/4*uncert13_ct3(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct3(rpm13(1))*uncert13_ct3(rpm13(2)));
uncert13_ct4_RPM_1 = sqrt(1/4*uncert13_ct4(rpm13(1))^2+1/4*uncert13_ct4(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct4(rpm13(1))*uncert13_ct4(rpm13(2)));
uncert13_ct5_RPM_1 = sqrt(1/4*uncert13_ct5(rpm13(1))^2+1/4*uncert13_ct5(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct5(rpm13(1))*uncert13_ct5(rpm13(2)));
uncert13_ct6_RPM_1 = sqrt(1/4*uncert13_ct6(rpm13(1))^2+1/4*uncert13_ct6(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct6(rpm13(1))*uncert13_ct6(rpm13(2)));
uncert13_ct7_RPM_1 = sqrt(1/4*uncert13_ct7(rpm13(1))^2+1/4*uncert13_ct7(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct7(rpm13(1))*uncert13_ct7(rpm13(2)));
uncert13_ct8_RPM_1 = sqrt(1/4*uncert13_ct8(rpm13(1))^2+1/4*uncert13_ct8(rpm13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct8(rpm13(1))*uncert13_ct8(rpm13(2)));
uncert10_cm1_RPM_2 = sqrt(1/4*uncert10_cm1(rpm10(3))^2+1/4*uncert10_cm1(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm1(rpm10(3))*uncert10_cm1(rpm10(4)));
uncert10_cm2_RPM_2 = sqrt(1/4*uncert10_cm2(rpm10(3))^2+1/4*uncert10_cm2(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm2(rpm10(3))*uncert10_cm2(rpm10(4)));
uncert10_cm3_RPM_2 = sqrt(1/4*uncert10_cm3(rpm10(3))^2+1/4*uncert10_cm3(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm3(rpm10(3))*uncert10_cm3(rpm10(4)));
uncert10_cm4_RPM_2 = sqrt(1/4*uncert10_cm4(rpm10(3))^2+1/4*uncert10_cm4(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm4(rpm10(3))*uncert10_cm4(rpm10(4)));
uncert10_cm5_RPM_2 = sqrt(1/4*uncert10_cm5(rpm10(3))^2+1/4*uncert10_cm5(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm5(rpm10(3))*uncert10_cm5(rpm10(4)));
uncert10_cm6_RPM_2 = sqrt(1/4*uncert10_cm6(rpm10(3))^2+1/4*uncert10_cm6(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm6(rpm10(3))*uncert10_cm6(rpm10(4)));
uncert10_cm7_RPM_2 = sqrt(1/4*uncert10_cm7(rpm10(3))^2+1/4*uncert10_cm7(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm7(rpm10(3))*uncert10_cm7(rpm10(4)));
uncert10_cm8_RPM_2 = sqrt(1/4*uncert10_cm8(rpm10(3))^2+1/4*uncert10_cm8(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm8(rpm10(3))*uncert10_cm8(rpm10(4)));
uncert10_cf1_RPM_2 = sqrt(1/4*uncert10_cf1(rpm10(3))^2+1/4*uncert10_cf1(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf1(rpm10(3))*uncert10_cf1(rpm10(4)));
uncert10_cf2_RPM_2 = sqrt(1/4*uncert10_cf2(rpm10(3))^2+1/4*uncert10_cf2(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf2(rpm10(3))*uncert10_cf2(rpm10(4)));
uncert10_cf3_RPM_2 = sqrt(1/4*uncert10_cf3(rpm10(3))^2+1/4*uncert10_cf3(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf3(rpm10(3))*uncert10_cf3(rpm10(4)));
uncert10_cf4_RPM_2 = sqrt(1/4*uncert10_cf4(rpm10(3))^2+1/4*uncert10_cf4(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf4(rpm10(3))*uncert10_cf4(rpm10(4)));
uncert10_cf5_RPM_2 = sqrt(1/4*uncert10_cf5(rpm10(3))^2+1/4*uncert10_cf5(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf5(rpm10(3))*uncert10_cf5(rpm10(4)));
uncert10_cf6_RPM_2 = sqrt(1/4*uncert10_cf6(rpm10(3))^2+1/4*uncert10_cf6(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf6(rpm10(3))*uncert10_cf6(rpm10(4)));
uncert10_cf7_RPM_2 = sqrt(1/4*uncert10_cf7(rpm10(3))^2+1/4*uncert10_cf7(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf7(rpm10(3))*uncert10_cf7(rpm10(4)));
uncert10_cf8_RPM_2 = sqrt(1/4*uncert10_cf8(rpm10(3))^2+1/4*uncert10_cf8(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf8(rpm10(3))*uncert10_cf8(rpm10(4)));
uncert10_ct1_RPM_2 = sqrt(1/4*uncert10_ct1(rpm10(3))^2+1/4*uncert10_ct1(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct1(rpm10(3))*uncert10_ct1(rpm10(4)));
uncert10_ct2_RPM_2 = sqrt(1/4*uncert10_ct2(rpm10(3))^2+1/4*uncert10_ct2(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct2(rpm10(3))*uncert10_ct2(rpm10(4)));
uncert10_ct3_RPM_2 = sqrt(1/4*uncert10_ct3(rpm10(3))^2+1/4*uncert10_ct3(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct3(rpm10(3))*uncert10_ct3(rpm10(4)));
uncert10_ct4_RPM_2 = sqrt(1/4*uncert10_ct4(rpm10(3))^2+1/4*uncert10_ct4(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct4(rpm10(3))*uncert10_ct4(rpm10(4)));
uncert10_ct5_RPM_2 = sqrt(1/4*uncert10_ct5(rpm10(3))^2+1/4*uncert10_ct5(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct5(rpm10(3))*uncert10_ct5(rpm10(4)));
uncert10_ct6_RPM_2 = sqrt(1/4*uncert10_ct6(rpm10(3))^2+1/4*uncert10_ct6(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct6(rpm10(3))*uncert10_ct6(rpm10(4)));
uncert10_ct7_RPM_2 = sqrt(1/4*uncert10_ct7(rpm10(3))^2+1/4*uncert10_ct7(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct7(rpm10(3))*uncert10_ct7(rpm10(4)));
uncert10_ct8_RPM_2 = sqrt(1/4*uncert10_ct8(rpm10(3))^2+1/4*uncert10_ct8(rpm10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct8(rpm10(3))*uncert10_ct8(rpm10(4)));
uncert12_cm1_RPM_2 = sqrt(1/4*uncert12_cm1(rpm12(3))^2+1/4*uncert12_cm1(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm1(rpm12(3))*uncert12_cm1(rpm12(4)));
uncert12_cm2_RPM_2 = sqrt(1/4*uncert12_cm2(rpm12(3))^2+1/4*uncert12_cm2(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm2(rpm12(3))*uncert12_cm2(rpm12(4)));
uncert12_cm3_RPM_2 = sqrt(1/4*uncert12_cm3(rpm12(3))^2+1/4*uncert12_cm3(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm3(rpm12(3))*uncert12_cm3(rpm12(4)));
uncert12_cm4_RPM_2 = sqrt(1/4*uncert12_cm4(rpm12(3))^2+1/4*uncert12_cm4(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm4(rpm12(3))*uncert12_cm4(rpm12(4)));
uncert12_cm5_RPM_2 = sqrt(1/4*uncert12_cm5(rpm12(3))^2+1/4*uncert12_cm5(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm5(rpm12(3))*uncert12_cm5(rpm12(4)));
uncert12_cm6_RPM_2 = sqrt(1/4*uncert12_cm6(rpm12(3))^2+1/4*uncert12_cm6(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm6(rpm12(3))*uncert12_cm6(rpm12(4)));
uncert12_cm7_RPM_2 = sqrt(1/4*uncert12_cm7(rpm12(3))^2+1/4*uncert12_cm7(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm7(rpm12(3))*uncert12_cm7(rpm12(4)));
uncert12_cm8_RPM_2 = sqrt(1/4*uncert12_cm8(rpm12(3))^2+1/4*uncert12_cm8(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm8(rpm12(3))*uncert12_cm8(rpm12(4)));
uncert12_cf1_RPM_2 = sqrt(1/4*uncert12_cf1(rpm12(3))^2+1/4*uncert12_cf1(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf1(rpm12(3))*uncert12_cf1(rpm12(4)));
uncert12_cf2_RPM_2 = sqrt(1/4*uncert12_cf2(rpm12(3))^2+1/4*uncert12_cf2(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf2(rpm12(3))*uncert12_cf2(rpm12(4)));
uncert12_cf3_RPM_2 = sqrt(1/4*uncert12_cf3(rpm12(3))^2+1/4*uncert12_cf3(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf3(rpm12(3))*uncert12_cf3(rpm12(4)));
uncert12_cf4_RPM_2 = sqrt(1/4*uncert12_cf4(rpm12(3))^2+1/4*uncert12_cf4(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf4(rpm12(3))*uncert12_cf4(rpm12(4)));
uncert12_cf5_RPM_2 = sqrt(1/4*uncert12_cf5(rpm12(3))^2+1/4*uncert12_cf5(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf5(rpm12(3))*uncert12_cf5(rpm12(4)));
uncert12_cf6_RPM_2 = sqrt(1/4*uncert12_cf6(rpm12(3))^2+1/4*uncert12_cf6(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf6(rpm12(3))*uncert12_cf6(rpm12(4)));
uncert12_cf7_RPM_2 = sqrt(1/4*uncert12_cf7(rpm12(3))^2+1/4*uncert12_cf7(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf7(rpm12(3))*uncert12_cf7(rpm12(4)));
uncert12_cf8_RPM_2 = sqrt(1/4*uncert12_cf8(rpm12(3))^2+1/4*uncert12_cf8(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf8(rpm12(3))*uncert12_cf8(rpm12(4)));
uncert12_ct1_RPM_2 = sqrt(1/4*uncert12_ct1(rpm12(3))^2+1/4*uncert12_ct1(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct1(rpm12(3))*uncert12_ct1(rpm12(4)));
uncert12_ct2_RPM_2 = sqrt(1/4*uncert12_ct2(rpm12(3))^2+1/4*uncert12_ct2(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct2(rpm12(3))*uncert12_ct2(rpm12(4)));
uncert12_ct3_RPM_2 = sqrt(1/4*uncert12_ct3(rpm12(3))^2+1/4*uncert12_ct3(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct3(rpm12(3))*uncert12_ct3(rpm12(4)));
uncert12_ct4_RPM_2 = sqrt(1/4*uncert12_ct4(rpm12(3))^2+1/4*uncert12_ct4(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct4(rpm12(3))*uncert12_ct4(rpm12(4)));
uncert12_ct5_RPM_2 = sqrt(1/4*uncert12_ct5(rpm12(3))^2+1/4*uncert12_ct5(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct5(rpm12(3))*uncert12_ct5(rpm12(4)));
uncert12_ct6_RPM_2 = sqrt(1/4*uncert12_ct6(rpm12(3))^2+1/4*uncert12_ct6(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct6(rpm12(3))*uncert12_ct6(rpm12(4)));
uncert12_ct7_RPM_2 = sqrt(1/4*uncert12_ct7(rpm12(3))^2+1/4*uncert12_ct7(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct7(rpm12(3))*uncert12_ct7(rpm12(4)));
uncert12_ct8_RPM_2 = sqrt(1/4*uncert12_ct8(rpm12(3))^2+1/4*uncert12_ct8(rpm12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct8(rpm12(3))*uncert12_ct8(rpm12(4)));
uncert13_cm1_RPM_2 = sqrt(1/4*uncert13_cm1(rpm13(3))^2+1/4*uncert13_cm1(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm1(rpm13(3))*uncert13_cm1(rpm13(4)));
uncert13_cm2_RPM_2 = sqrt(1/4*uncert13_cm2(rpm13(3))^2+1/4*uncert13_cm2(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm2(rpm13(3))*uncert13_cm2(rpm13(4)));
uncert13_cm3_RPM_2 = sqrt(1/4*uncert13_cm3(rpm13(3))^2+1/4*uncert13_cm3(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm3(rpm13(3))*uncert13_cm3(rpm13(4)));
uncert13_cm4_RPM_2 = sqrt(1/4*uncert13_cm4(rpm13(3))^2+1/4*uncert13_cm4(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm4(rpm13(3))*uncert13_cm4(rpm13(4)));
uncert13_cm5_RPM_2 = sqrt(1/4*uncert13_cm5(rpm13(3))^2+1/4*uncert13_cm5(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm5(rpm13(3))*uncert13_cm5(rpm13(4)));
uncert13_cm6_RPM_2 = sqrt(1/4*uncert13_cm6(rpm13(3))^2+1/4*uncert13_cm6(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm6(rpm13(3))*uncert13_cm6(rpm13(4)));
uncert13_cm7_RPM_2 = sqrt(1/4*uncert13_cm7(rpm13(3))^2+1/4*uncert13_cm7(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm7(rpm13(3))*uncert13_cm7(rpm13(4)));
uncert13_cm8_RPM_2 = sqrt(1/4*uncert13_cm8(rpm13(3))^2+1/4*uncert13_cm8(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm8(rpm13(3))*uncert13_cm8(rpm13(4)));
uncert13_cf1_RPM_2 = sqrt(1/4*uncert13_cf1(rpm13(3))^2+1/4*uncert13_cf1(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf1(rpm13(3))*uncert13_cf1(rpm13(4)));
uncert13_cf2_RPM_2 = sqrt(1/4*uncert13_cf2(rpm13(3))^2+1/4*uncert13_cf2(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf2(rpm13(3))*uncert13_cf2(rpm13(4)));
uncert13_cf3_RPM_2 = sqrt(1/4*uncert13_cf3(rpm13(3))^2+1/4*uncert13_cf3(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf3(rpm13(3))*uncert13_cf3(rpm13(4)));
uncert13_cf4_RPM_2 = sqrt(1/4*uncert13_cf4(rpm13(3))^2+1/4*uncert13_cf4(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf4(rpm13(3))*uncert13_cf4(rpm13(4)));
uncert13_cf5_RPM_2 = sqrt(1/4*uncert13_cf5(rpm13(3))^2+1/4*uncert13_cf5(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf5(rpm13(3))*uncert13_cf5(rpm13(4)));
uncert13_cf6_RPM_2 = sqrt(1/4*uncert13_cf6(rpm13(3))^2+1/4*uncert13_cf6(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf6(rpm13(3))*uncert13_cf6(rpm13(4)));
uncert13_cf7_RPM_2 = sqrt(1/4*uncert13_cf7(rpm13(3))^2+1/4*uncert13_cf7(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf7(rpm13(3))*uncert13_cf7(rpm13(4)));
uncert13_cf8_RPM_2 = sqrt(1/4*uncert13_cf8(rpm13(3))^2+1/4*uncert13_cf8(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf8(rpm13(3))*uncert13_cf8(rpm13(4)));
uncert13_ct1_RPM_2 = sqrt(1/4*uncert13_ct1(rpm13(3))^2+1/4*uncert13_ct1(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct1(rpm13(3))*uncert13_ct1(rpm13(4)));
uncert13_ct2_RPM_2 = sqrt(1/4*uncert13_ct2(rpm13(3))^2+1/4*uncert13_ct2(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct2(rpm13(3))*uncert13_ct2(rpm13(4)));
uncert13_ct3_RPM_2 = sqrt(1/4*uncert13_ct3(rpm13(3))^2+1/4*uncert13_ct3(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct3(rpm13(3))*uncert13_ct3(rpm13(4)));
uncert13_ct4_RPM_2 = sqrt(1/4*uncert13_ct4(rpm13(3))^2+1/4*uncert13_ct4(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct4(rpm13(3))*uncert13_ct4(rpm13(4)));
uncert13_ct5_RPM_2 = sqrt(1/4*uncert13_ct5(rpm13(3))^2+1/4*uncert13_ct5(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct5(rpm13(3))*uncert13_ct5(rpm13(4)));
uncert13_ct6_RPM_2 = sqrt(1/4*uncert13_ct6(rpm13(3))^2+1/4*uncert13_ct6(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct6(rpm13(3))*uncert13_ct6(rpm13(4)));
uncert13_ct7_RPM_2 = sqrt(1/4*uncert13_ct7(rpm13(3))^2+1/4*uncert13_ct7(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct7(rpm13(3))*uncert13_ct7(rpm13(4)));
uncert13_ct8_RPM_2 = sqrt(1/4*uncert13_ct8(rpm13(3))^2+1/4*uncert13_ct8(rpm13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct8(rpm13(3))*uncert13_ct8(rpm13(4)));

uncert10_cm1_Fz_1 = sqrt(1/4*uncert10_cm1(Fz10(1))^2+1/4*uncert10_cm1(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm1(Fz10(1))*uncert10_cm1(Fz10(2)));
uncert10_cm2_Fz_1 = sqrt(1/4*uncert10_cm2(Fz10(1))^2+1/4*uncert10_cm2(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm2(Fz10(1))*uncert10_cm2(Fz10(2)));
uncert10_cm3_Fz_1 = sqrt(1/4*uncert10_cm3(Fz10(1))^2+1/4*uncert10_cm3(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm3(Fz10(1))*uncert10_cm3(Fz10(2)));
uncert10_cm4_Fz_1 = sqrt(1/4*uncert10_cm4(Fz10(1))^2+1/4*uncert10_cm4(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm4(Fz10(1))*uncert10_cm4(Fz10(2)));
uncert10_cm5_Fz_1 = sqrt(1/4*uncert10_cm5(Fz10(1))^2+1/4*uncert10_cm5(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm5(Fz10(1))*uncert10_cm5(Fz10(2)));
uncert10_cm6_Fz_1 = sqrt(1/4*uncert10_cm6(Fz10(1))^2+1/4*uncert10_cm6(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm6(Fz10(1))*uncert10_cm6(Fz10(2)));
uncert10_cm7_Fz_1 = sqrt(1/4*uncert10_cm7(Fz10(1))^2+1/4*uncert10_cm7(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm7(Fz10(1))*uncert10_cm7(Fz10(2)));
uncert10_cm8_Fz_1 = sqrt(1/4*uncert10_cm8(Fz10(1))^2+1/4*uncert10_cm8(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cm8(Fz10(1))*uncert10_cm8(Fz10(2)));
uncert10_cm1_Fz_2 = sqrt(1/4*uncert10_cm1(Fz10(3))^2+1/4*uncert10_cm1(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm1(Fz10(3))*uncert10_cm1(Fz10(4)));
uncert10_cm2_Fz_2 = sqrt(1/4*uncert10_cm2(Fz10(3))^2+1/4*uncert10_cm2(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm2(Fz10(3))*uncert10_cm2(Fz10(4)));
uncert10_cm3_Fz_2 = sqrt(1/4*uncert10_cm3(Fz10(3))^2+1/4*uncert10_cm3(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm3(Fz10(3))*uncert10_cm3(Fz10(4)));
uncert10_cm4_Fz_2 = sqrt(1/4*uncert10_cm4(Fz10(3))^2+1/4*uncert10_cm4(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm4(Fz10(3))*uncert10_cm4(Fz10(4)));
uncert10_cm5_Fz_2 = sqrt(1/4*uncert10_cm5(Fz10(3))^2+1/4*uncert10_cm5(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm5(Fz10(3))*uncert10_cm5(Fz10(4)));
uncert10_cm6_Fz_2 = sqrt(1/4*uncert10_cm6(Fz10(3))^2+1/4*uncert10_cm6(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm6(Fz10(3))*uncert10_cm6(Fz10(4)));
uncert10_cm7_Fz_2 = sqrt(1/4*uncert10_cm7(Fz10(3))^2+1/4*uncert10_cm7(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm7(Fz10(3))*uncert10_cm7(Fz10(4)));
uncert10_cm8_Fz_2 = sqrt(1/4*uncert10_cm8(Fz10(3))^2+1/4*uncert10_cm8(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cm8(Fz10(3))*uncert10_cm8(Fz10(4)));
uncert10_cm1_Fz_3 = sqrt(1/4*uncert10_cm1(Fz10(5))^2+1/4*uncert10_cm1(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm1(Fz10(5))*uncert10_cm1(Fz10(6)));
uncert10_cm2_Fz_3 = sqrt(1/4*uncert10_cm2(Fz10(5))^2+1/4*uncert10_cm2(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm2(Fz10(5))*uncert10_cm2(Fz10(6)));
uncert10_cm3_Fz_3 = sqrt(1/4*uncert10_cm3(Fz10(5))^2+1/4*uncert10_cm3(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm3(Fz10(5))*uncert10_cm3(Fz10(6)));
uncert10_cm4_Fz_3 = sqrt(1/4*uncert10_cm4(Fz10(5))^2+1/4*uncert10_cm4(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm4(Fz10(5))*uncert10_cm4(Fz10(6)));
uncert10_cm5_Fz_3 = sqrt(1/4*uncert10_cm5(Fz10(5))^2+1/4*uncert10_cm5(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm5(Fz10(5))*uncert10_cm5(Fz10(6)));
uncert10_cm6_Fz_3 = sqrt(1/4*uncert10_cm6(Fz10(5))^2+1/4*uncert10_cm6(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm6(Fz10(5))*uncert10_cm6(Fz10(6)));
uncert10_cm7_Fz_3 = sqrt(1/4*uncert10_cm7(Fz10(5))^2+1/4*uncert10_cm7(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm7(Fz10(5))*uncert10_cm7(Fz10(6)));
uncert10_cm8_Fz_3 = sqrt(1/4*uncert10_cm8(Fz10(5))^2+1/4*uncert10_cm8(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cm8(Fz10(5))*uncert10_cm8(Fz10(6)));
uncert10_cm1_Fz_4 = sqrt(1/4*uncert10_cm1(Fz10(7))^2+1/4*uncert10_cm1(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm1(Fz10(7))*uncert10_cm1(Fz10(8)));
uncert10_cm2_Fz_4 = sqrt(1/4*uncert10_cm2(Fz10(7))^2+1/4*uncert10_cm2(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm2(Fz10(7))*uncert10_cm2(Fz10(8)));
uncert10_cm3_Fz_4 = sqrt(1/4*uncert10_cm3(Fz10(7))^2+1/4*uncert10_cm3(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm3(Fz10(7))*uncert10_cm3(Fz10(8)));
uncert10_cm4_Fz_4 = sqrt(1/4*uncert10_cm4(Fz10(7))^2+1/4*uncert10_cm4(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm4(Fz10(7))*uncert10_cm4(Fz10(8)));
uncert10_cm5_Fz_4 = sqrt(1/4*uncert10_cm5(Fz10(7))^2+1/4*uncert10_cm5(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm5(Fz10(7))*uncert10_cm5(Fz10(8)));
uncert10_cm6_Fz_4 = sqrt(1/4*uncert10_cm6(Fz10(7))^2+1/4*uncert10_cm6(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm6(Fz10(7))*uncert10_cm6(Fz10(8)));
uncert10_cm7_Fz_4 = sqrt(1/4*uncert10_cm7(Fz10(7))^2+1/4*uncert10_cm7(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm7(Fz10(7))*uncert10_cm7(Fz10(8)));
uncert10_cm8_Fz_4 = sqrt(1/4*uncert10_cm8(Fz10(7))^2+1/4*uncert10_cm8(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cm8(Fz10(7))*uncert10_cm8(Fz10(8)));
uncert12_cm1_Fz_1 = sqrt(1/4*uncert12_cm1(Fz12(1))^2+1/4*uncert12_cm1(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm1(Fz12(1))*uncert12_cm1(Fz12(2)));
uncert12_cm2_Fz_1 = sqrt(1/4*uncert12_cm2(Fz12(1))^2+1/4*uncert12_cm2(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm2(Fz12(1))*uncert12_cm2(Fz12(2)));
uncert12_cm3_Fz_1 = sqrt(1/4*uncert12_cm3(Fz12(1))^2+1/4*uncert12_cm3(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm3(Fz12(1))*uncert12_cm3(Fz12(2)));
uncert12_cm4_Fz_1 = sqrt(1/4*uncert12_cm4(Fz12(1))^2+1/4*uncert12_cm4(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm4(Fz12(1))*uncert12_cm4(Fz12(2)));
uncert12_cm5_Fz_1 = sqrt(1/4*uncert12_cm5(Fz12(1))^2+1/4*uncert12_cm5(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm5(Fz12(1))*uncert12_cm5(Fz12(2)));
uncert12_cm6_Fz_1 = sqrt(1/4*uncert12_cm6(Fz12(1))^2+1/4*uncert12_cm6(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm6(Fz12(1))*uncert12_cm6(Fz12(2)));
uncert12_cm7_Fz_1 = sqrt(1/4*uncert12_cm7(Fz12(1))^2+1/4*uncert12_cm7(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm7(Fz12(1))*uncert12_cm7(Fz12(2)));
uncert12_cm8_Fz_1 = sqrt(1/4*uncert12_cm8(Fz12(1))^2+1/4*uncert12_cm8(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cm8(Fz12(1))*uncert12_cm8(Fz12(2)));
uncert12_cm1_Fz_2 = sqrt(1/4*uncert12_cm1(Fz12(3))^2+1/4*uncert12_cm1(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm1(Fz12(3))*uncert12_cm1(Fz12(4)));
uncert12_cm2_Fz_2 = sqrt(1/4*uncert12_cm2(Fz12(3))^2+1/4*uncert12_cm2(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm2(Fz12(3))*uncert12_cm2(Fz12(4)));
uncert12_cm3_Fz_2 = sqrt(1/4*uncert12_cm3(Fz12(3))^2+1/4*uncert12_cm3(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm3(Fz12(3))*uncert12_cm3(Fz12(4)));
uncert12_cm4_Fz_2 = sqrt(1/4*uncert12_cm4(Fz12(3))^2+1/4*uncert12_cm4(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm4(Fz12(3))*uncert12_cm4(Fz12(4)));
uncert12_cm5_Fz_2 = sqrt(1/4*uncert12_cm5(Fz12(3))^2+1/4*uncert12_cm5(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm5(Fz12(3))*uncert12_cm5(Fz12(4)));
uncert12_cm6_Fz_2 = sqrt(1/4*uncert12_cm6(Fz12(3))^2+1/4*uncert12_cm6(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm6(Fz12(3))*uncert12_cm6(Fz12(4)));
uncert12_cm7_Fz_2 = sqrt(1/4*uncert12_cm7(Fz12(3))^2+1/4*uncert12_cm7(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm7(Fz12(3))*uncert12_cm7(Fz12(4)));
uncert12_cm8_Fz_2 = sqrt(1/4*uncert12_cm8(Fz12(3))^2+1/4*uncert12_cm8(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cm8(Fz12(3))*uncert12_cm8(Fz12(4)));
uncert12_cm1_Fz_3 = sqrt(1/4*uncert12_cm1(Fz12(5))^2+1/4*uncert12_cm1(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm1(Fz12(5))*uncert12_cm1(Fz12(6)));
uncert12_cm2_Fz_3 = sqrt(1/4*uncert12_cm2(Fz12(5))^2+1/4*uncert12_cm2(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm2(Fz12(5))*uncert12_cm2(Fz12(6)));
uncert12_cm3_Fz_3 = sqrt(1/4*uncert12_cm3(Fz12(5))^2+1/4*uncert12_cm3(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm3(Fz12(5))*uncert12_cm3(Fz12(6)));
uncert12_cm4_Fz_3 = sqrt(1/4*uncert12_cm4(Fz12(5))^2+1/4*uncert12_cm4(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm4(Fz12(5))*uncert12_cm4(Fz12(6)));
uncert12_cm5_Fz_3 = sqrt(1/4*uncert12_cm5(Fz12(5))^2+1/4*uncert12_cm5(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm5(Fz12(5))*uncert12_cm5(Fz12(6)));
uncert12_cm6_Fz_3 = sqrt(1/4*uncert12_cm6(Fz12(5))^2+1/4*uncert12_cm6(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm6(Fz12(5))*uncert12_cm6(Fz12(6)));
uncert12_cm7_Fz_3 = sqrt(1/4*uncert12_cm7(Fz12(5))^2+1/4*uncert12_cm7(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm7(Fz12(5))*uncert12_cm7(Fz12(6)));
uncert12_cm8_Fz_3 = sqrt(1/4*uncert12_cm8(Fz12(5))^2+1/4*uncert12_cm8(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cm8(Fz12(5))*uncert12_cm8(Fz12(6)));
uncert12_cm1_Fz_4 = sqrt(1/4*uncert12_cm1(Fz12(7))^2+1/4*uncert12_cm1(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm1(Fz12(7))*uncert12_cm1(Fz12(8)));
uncert12_cm2_Fz_4 = sqrt(1/4*uncert12_cm2(Fz12(7))^2+1/4*uncert12_cm2(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm2(Fz12(7))*uncert12_cm2(Fz12(8)));
uncert12_cm3_Fz_4 = sqrt(1/4*uncert12_cm3(Fz12(7))^2+1/4*uncert12_cm3(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm3(Fz12(7))*uncert12_cm3(Fz12(8)));
uncert12_cm4_Fz_4 = sqrt(1/4*uncert12_cm4(Fz12(7))^2+1/4*uncert12_cm4(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm4(Fz12(7))*uncert12_cm4(Fz12(8)));
uncert12_cm5_Fz_4 = sqrt(1/4*uncert12_cm5(Fz12(7))^2+1/4*uncert12_cm5(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm5(Fz12(7))*uncert12_cm5(Fz12(8)));
uncert12_cm6_Fz_4 = sqrt(1/4*uncert12_cm6(Fz12(7))^2+1/4*uncert12_cm6(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm6(Fz12(7))*uncert12_cm6(Fz12(8)));
uncert12_cm7_Fz_4 = sqrt(1/4*uncert12_cm7(Fz12(7))^2+1/4*uncert12_cm7(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm7(Fz12(7))*uncert12_cm7(Fz12(8)));
uncert12_cm8_Fz_4 = sqrt(1/4*uncert12_cm8(Fz12(7))^2+1/4*uncert12_cm8(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cm8(Fz12(7))*uncert12_cm8(Fz12(8)));
uncert13_cm1_Fz_1 = sqrt(1/4*uncert13_cm1(Fz13(1))^2+1/4*uncert13_cm1(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm1(Fz13(1))*uncert13_cm1(Fz13(2)));
uncert13_cm2_Fz_1 = sqrt(1/4*uncert13_cm2(Fz13(1))^2+1/4*uncert13_cm2(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm2(Fz13(1))*uncert13_cm2(Fz13(2)));
uncert13_cm3_Fz_1 = sqrt(1/4*uncert13_cm3(Fz13(1))^2+1/4*uncert13_cm3(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm3(Fz13(1))*uncert13_cm3(Fz13(2)));
uncert13_cm4_Fz_1 = sqrt(1/4*uncert13_cm4(Fz13(1))^2+1/4*uncert13_cm4(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm4(Fz13(1))*uncert13_cm4(Fz13(2)));
uncert13_cm5_Fz_1 = sqrt(1/4*uncert13_cm5(Fz13(1))^2+1/4*uncert13_cm5(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm5(Fz13(1))*uncert13_cm5(Fz13(2)));
uncert13_cm6_Fz_1 = sqrt(1/4*uncert13_cm6(Fz13(1))^2+1/4*uncert13_cm6(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm6(Fz13(1))*uncert13_cm6(Fz13(2)));
uncert13_cm7_Fz_1 = sqrt(1/4*uncert13_cm7(Fz13(1))^2+1/4*uncert13_cm7(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm7(Fz13(1))*uncert13_cm7(Fz13(2)));
uncert13_cm8_Fz_1 = sqrt(1/4*uncert13_cm8(Fz13(1))^2+1/4*uncert13_cm8(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cm8(Fz13(1))*uncert13_cm8(Fz13(2)));
uncert13_cm1_Fz_2 = sqrt(1/4*uncert13_cm1(Fz13(3))^2+1/4*uncert13_cm1(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm1(Fz13(3))*uncert13_cm1(Fz13(4)));
uncert13_cm2_Fz_2 = sqrt(1/4*uncert13_cm2(Fz13(3))^2+1/4*uncert13_cm2(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm2(Fz13(3))*uncert13_cm2(Fz13(4)));
uncert13_cm3_Fz_2 = sqrt(1/4*uncert13_cm3(Fz13(3))^2+1/4*uncert13_cm3(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm3(Fz13(3))*uncert13_cm3(Fz13(4)));
uncert13_cm4_Fz_2 = sqrt(1/4*uncert13_cm4(Fz13(3))^2+1/4*uncert13_cm4(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm4(Fz13(3))*uncert13_cm4(Fz13(4)));
uncert13_cm5_Fz_2 = sqrt(1/4*uncert13_cm5(Fz13(3))^2+1/4*uncert13_cm5(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm5(Fz13(3))*uncert13_cm5(Fz13(4)));
uncert13_cm6_Fz_2 = sqrt(1/4*uncert13_cm6(Fz13(3))^2+1/4*uncert13_cm6(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm6(Fz13(3))*uncert13_cm6(Fz13(4)));
uncert13_cm7_Fz_2 = sqrt(1/4*uncert13_cm7(Fz13(3))^2+1/4*uncert13_cm7(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm7(Fz13(3))*uncert13_cm7(Fz13(4)));
uncert13_cm8_Fz_2 = sqrt(1/4*uncert13_cm8(Fz13(3))^2+1/4*uncert13_cm8(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cm8(Fz13(3))*uncert13_cm8(Fz13(4)));
uncert13_cm1_Fz_3 = sqrt(1/4*uncert13_cm1(Fz13(5))^2+1/4*uncert13_cm1(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm1(Fz13(5))*uncert13_cm1(Fz13(6)));
uncert13_cm2_Fz_3 = sqrt(1/4*uncert13_cm2(Fz13(5))^2+1/4*uncert13_cm2(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm2(Fz13(5))*uncert13_cm2(Fz13(6)));
uncert13_cm3_Fz_3 = sqrt(1/4*uncert13_cm3(Fz13(5))^2+1/4*uncert13_cm3(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm3(Fz13(5))*uncert13_cm3(Fz13(6)));
uncert13_cm4_Fz_3 = sqrt(1/4*uncert13_cm4(Fz13(5))^2+1/4*uncert13_cm4(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm4(Fz13(5))*uncert13_cm4(Fz13(6)));
uncert13_cm5_Fz_3 = sqrt(1/4*uncert13_cm5(Fz13(5))^2+1/4*uncert13_cm5(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm5(Fz13(5))*uncert13_cm5(Fz13(6)));
uncert13_cm6_Fz_3 = sqrt(1/4*uncert13_cm6(Fz13(5))^2+1/4*uncert13_cm6(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm6(Fz13(5))*uncert13_cm6(Fz13(6)));
uncert13_cm7_Fz_3 = sqrt(1/4*uncert13_cm7(Fz13(5))^2+1/4*uncert13_cm7(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm7(Fz13(5))*uncert13_cm7(Fz13(6)));
uncert13_cm8_Fz_3 = sqrt(1/4*uncert13_cm8(Fz13(5))^2+1/4*uncert13_cm8(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cm8(Fz13(5))*uncert13_cm8(Fz13(6)));
uncert13_cm1_Fz_4 = sqrt(1/4*uncert13_cm1(Fz13(7))^2+1/4*uncert13_cm1(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm1(Fz13(7))*uncert13_cm1(Fz13(8)));
uncert13_cm2_Fz_4 = sqrt(1/4*uncert13_cm2(Fz13(7))^2+1/4*uncert13_cm2(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm2(Fz13(7))*uncert13_cm2(Fz13(8)));
uncert13_cm3_Fz_4 = sqrt(1/4*uncert13_cm3(Fz13(7))^2+1/4*uncert13_cm3(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm3(Fz13(7))*uncert13_cm3(Fz13(8)));
uncert13_cm4_Fz_4 = sqrt(1/4*uncert13_cm4(Fz13(7))^2+1/4*uncert13_cm4(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm4(Fz13(7))*uncert13_cm4(Fz13(8)));
uncert13_cm5_Fz_4 = sqrt(1/4*uncert13_cm5(Fz13(7))^2+1/4*uncert13_cm5(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm5(Fz13(7))*uncert13_cm5(Fz13(8)));
uncert13_cm6_Fz_4 = sqrt(1/4*uncert13_cm6(Fz13(7))^2+1/4*uncert13_cm6(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm6(Fz13(7))*uncert13_cm6(Fz13(8)));
uncert13_cm7_Fz_4 = sqrt(1/4*uncert13_cm7(Fz13(7))^2+1/4*uncert13_cm7(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm7(Fz13(7))*uncert13_cm7(Fz13(8)));
uncert13_cm8_Fz_4 = sqrt(1/4*uncert13_cm8(Fz13(7))^2+1/4*uncert13_cm8(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cm8(Fz13(7))*uncert13_cm8(Fz13(8)));

uncert10_cf1_Fz_1 = sqrt(1/4*uncert10_cf1(Fz10(1))^2+1/4*uncert10_cf1(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf1(Fz10(1))*uncert10_cf1(Fz10(2)));
uncert10_cf2_Fz_1 = sqrt(1/4*uncert10_cf2(Fz10(1))^2+1/4*uncert10_cf2(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf2(Fz10(1))*uncert10_cf2(Fz10(2)));
uncert10_cf3_Fz_1 = sqrt(1/4*uncert10_cf3(Fz10(1))^2+1/4*uncert10_cf3(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf3(Fz10(1))*uncert10_cf3(Fz10(2)));
uncert10_cf4_Fz_1 = sqrt(1/4*uncert10_cf4(Fz10(1))^2+1/4*uncert10_cf4(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf4(Fz10(1))*uncert10_cf4(Fz10(2)));
uncert10_cf5_Fz_1 = sqrt(1/4*uncert10_cf5(Fz10(1))^2+1/4*uncert10_cf5(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf5(Fz10(1))*uncert10_cf5(Fz10(2)));
uncert10_cf6_Fz_1 = sqrt(1/4*uncert10_cf6(Fz10(1))^2+1/4*uncert10_cf6(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf6(Fz10(1))*uncert10_cf6(Fz10(2)));
uncert10_cf7_Fz_1 = sqrt(1/4*uncert10_cf7(Fz10(1))^2+1/4*uncert10_cf7(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf7(Fz10(1))*uncert10_cf7(Fz10(2)));
uncert10_cf8_Fz_1 = sqrt(1/4*uncert10_cf8(Fz10(1))^2+1/4*uncert10_cf8(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_cf8(Fz10(1))*uncert10_cf8(Fz10(2)));
uncert10_cf1_Fz_2 = sqrt(1/4*uncert10_cf1(Fz10(3))^2+1/4*uncert10_cf1(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf1(Fz10(3))*uncert10_cf1(Fz10(4)));
uncert10_cf2_Fz_2 = sqrt(1/4*uncert10_cf2(Fz10(3))^2+1/4*uncert10_cf2(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf2(Fz10(3))*uncert10_cf2(Fz10(4)));
uncert10_cf3_Fz_2 = sqrt(1/4*uncert10_cf3(Fz10(3))^2+1/4*uncert10_cf3(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf3(Fz10(3))*uncert10_cf3(Fz10(4)));
uncert10_cf4_Fz_2 = sqrt(1/4*uncert10_cf4(Fz10(3))^2+1/4*uncert10_cf4(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf4(Fz10(3))*uncert10_cf4(Fz10(4)));
uncert10_cf5_Fz_2 = sqrt(1/4*uncert10_cf5(Fz10(3))^2+1/4*uncert10_cf5(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf5(Fz10(3))*uncert10_cf5(Fz10(4)));
uncert10_cf6_Fz_2 = sqrt(1/4*uncert10_cf6(Fz10(3))^2+1/4*uncert10_cf6(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf6(Fz10(3))*uncert10_cf6(Fz10(4)));
uncert10_cf7_Fz_2 = sqrt(1/4*uncert10_cf7(Fz10(3))^2+1/4*uncert10_cf7(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf7(Fz10(3))*uncert10_cf7(Fz10(4)));
uncert10_cf8_Fz_2 = sqrt(1/4*uncert10_cf8(Fz10(3))^2+1/4*uncert10_cf8(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_cf8(Fz10(3))*uncert10_cf8(Fz10(4)));
uncert10_cf1_Fz_3 = sqrt(1/4*uncert10_cf1(Fz10(5))^2+1/4*uncert10_cf1(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf1(Fz10(5))*uncert10_cf1(Fz10(6)));
uncert10_cf2_Fz_3 = sqrt(1/4*uncert10_cf2(Fz10(5))^2+1/4*uncert10_cf2(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf2(Fz10(5))*uncert10_cf2(Fz10(6)));
uncert10_cf3_Fz_3 = sqrt(1/4*uncert10_cf3(Fz10(5))^2+1/4*uncert10_cf3(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf3(Fz10(5))*uncert10_cf3(Fz10(6)));
uncert10_cf4_Fz_3 = sqrt(1/4*uncert10_cf4(Fz10(5))^2+1/4*uncert10_cf4(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf4(Fz10(5))*uncert10_cf4(Fz10(6)));
uncert10_cf5_Fz_3 = sqrt(1/4*uncert10_cf5(Fz10(5))^2+1/4*uncert10_cf5(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf5(Fz10(5))*uncert10_cf5(Fz10(6)));
uncert10_cf6_Fz_3 = sqrt(1/4*uncert10_cf6(Fz10(5))^2+1/4*uncert10_cf6(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf6(Fz10(5))*uncert10_cf6(Fz10(6)));
uncert10_cf7_Fz_3 = sqrt(1/4*uncert10_cf7(Fz10(5))^2+1/4*uncert10_cf7(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf7(Fz10(5))*uncert10_cf7(Fz10(6)));
uncert10_cf8_Fz_3 = sqrt(1/4*uncert10_cf8(Fz10(5))^2+1/4*uncert10_cf8(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_cf8(Fz10(5))*uncert10_cf8(Fz10(6)));
uncert10_cf1_Fz_4 = sqrt(1/4*uncert10_cf1(Fz10(7))^2+1/4*uncert10_cf1(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf1(Fz10(7))*uncert10_cf1(Fz10(8)));
uncert10_cf2_Fz_4 = sqrt(1/4*uncert10_cf2(Fz10(7))^2+1/4*uncert10_cf2(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf2(Fz10(7))*uncert10_cf2(Fz10(8)));
uncert10_cf3_Fz_4 = sqrt(1/4*uncert10_cf3(Fz10(7))^2+1/4*uncert10_cf3(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf3(Fz10(7))*uncert10_cf3(Fz10(8)));
uncert10_cf4_Fz_4 = sqrt(1/4*uncert10_cf4(Fz10(7))^2+1/4*uncert10_cf4(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf4(Fz10(7))*uncert10_cf4(Fz10(8)));
uncert10_cf5_Fz_4 = sqrt(1/4*uncert10_cf5(Fz10(7))^2+1/4*uncert10_cf5(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf5(Fz10(7))*uncert10_cf5(Fz10(8)));
uncert10_cf6_Fz_4 = sqrt(1/4*uncert10_cf6(Fz10(7))^2+1/4*uncert10_cf6(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf6(Fz10(7))*uncert10_cf6(Fz10(8)));
uncert10_cf7_Fz_4 = sqrt(1/4*uncert10_cf7(Fz10(7))^2+1/4*uncert10_cf7(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf7(Fz10(7))*uncert10_cf7(Fz10(8)));
uncert10_cf8_Fz_4 = sqrt(1/4*uncert10_cf8(Fz10(7))^2+1/4*uncert10_cf8(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_cf8(Fz10(7))*uncert10_cf8(Fz10(8)));
uncert12_cf1_Fz_1 = sqrt(1/4*uncert12_cf1(Fz12(1))^2+1/4*uncert12_cf1(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf1(Fz12(1))*uncert12_cf1(Fz12(2)));
uncert12_cf2_Fz_1 = sqrt(1/4*uncert12_cf2(Fz12(1))^2+1/4*uncert12_cf2(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf2(Fz12(1))*uncert12_cf2(Fz12(2)));
uncert12_cf3_Fz_1 = sqrt(1/4*uncert12_cf3(Fz12(1))^2+1/4*uncert12_cf3(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf3(Fz12(1))*uncert12_cf3(Fz12(2)));
uncert12_cf4_Fz_1 = sqrt(1/4*uncert12_cf4(Fz12(1))^2+1/4*uncert12_cf4(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf4(Fz12(1))*uncert12_cf4(Fz12(2)));
uncert12_cf5_Fz_1 = sqrt(1/4*uncert12_cf5(Fz12(1))^2+1/4*uncert12_cf5(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf5(Fz12(1))*uncert12_cf5(Fz12(2)));
uncert12_cf6_Fz_1 = sqrt(1/4*uncert12_cf6(Fz12(1))^2+1/4*uncert12_cf6(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf6(Fz12(1))*uncert12_cf6(Fz12(2)));
uncert12_cf7_Fz_1 = sqrt(1/4*uncert12_cf7(Fz12(1))^2+1/4*uncert12_cf7(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf7(Fz12(1))*uncert12_cf7(Fz12(2)));
uncert12_cf8_Fz_1 = sqrt(1/4*uncert12_cf8(Fz12(1))^2+1/4*uncert12_cf8(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_cf8(Fz12(1))*uncert12_cf8(Fz12(2)));
uncert12_cf1_Fz_2 = sqrt(1/4*uncert12_cf1(Fz12(3))^2+1/4*uncert12_cf1(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf1(Fz12(3))*uncert12_cf1(Fz12(4)));
uncert12_cf2_Fz_2 = sqrt(1/4*uncert12_cf2(Fz12(3))^2+1/4*uncert12_cf2(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf2(Fz12(3))*uncert12_cf2(Fz12(4)));
uncert12_cf3_Fz_2 = sqrt(1/4*uncert12_cf3(Fz12(3))^2+1/4*uncert12_cf3(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf3(Fz12(3))*uncert12_cf3(Fz12(4)));
uncert12_cf4_Fz_2 = sqrt(1/4*uncert12_cf4(Fz12(3))^2+1/4*uncert12_cf4(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf4(Fz12(3))*uncert12_cf4(Fz12(4)));
uncert12_cf5_Fz_2 = sqrt(1/4*uncert12_cf5(Fz12(3))^2+1/4*uncert12_cf5(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf5(Fz12(3))*uncert12_cf5(Fz12(4)));
uncert12_cf6_Fz_2 = sqrt(1/4*uncert12_cf6(Fz12(3))^2+1/4*uncert12_cf6(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf6(Fz12(3))*uncert12_cf6(Fz12(4)));
uncert12_cf7_Fz_2 = sqrt(1/4*uncert12_cf7(Fz12(3))^2+1/4*uncert12_cf7(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf7(Fz12(3))*uncert12_cf7(Fz12(4)));
uncert12_cf8_Fz_2 = sqrt(1/4*uncert12_cf8(Fz12(3))^2+1/4*uncert12_cf8(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_cf8(Fz12(3))*uncert12_cf8(Fz12(4)));
uncert12_cf1_Fz_3 = sqrt(1/4*uncert12_cf1(Fz12(5))^2+1/4*uncert12_cf1(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf1(Fz12(5))*uncert12_cf1(Fz12(6)));
uncert12_cf2_Fz_3 = sqrt(1/4*uncert12_cf2(Fz12(5))^2+1/4*uncert12_cf2(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf2(Fz12(5))*uncert12_cf2(Fz12(6)));
uncert12_cf3_Fz_3 = sqrt(1/4*uncert12_cf3(Fz12(5))^2+1/4*uncert12_cf3(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf3(Fz12(5))*uncert12_cf3(Fz12(6)));
uncert12_cf4_Fz_3 = sqrt(1/4*uncert12_cf4(Fz12(5))^2+1/4*uncert12_cf4(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf4(Fz12(5))*uncert12_cf4(Fz12(6)));
uncert12_cf5_Fz_3 = sqrt(1/4*uncert12_cf5(Fz12(5))^2+1/4*uncert12_cf5(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf5(Fz12(5))*uncert12_cf5(Fz12(6)));
uncert12_cf6_Fz_3 = sqrt(1/4*uncert12_cf6(Fz12(5))^2+1/4*uncert12_cf6(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf6(Fz12(5))*uncert12_cf6(Fz12(6)));
uncert12_cf7_Fz_3 = sqrt(1/4*uncert12_cf7(Fz12(5))^2+1/4*uncert12_cf7(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf7(Fz12(5))*uncert12_cf7(Fz12(6)));
uncert12_cf8_Fz_3 = sqrt(1/4*uncert12_cf8(Fz12(5))^2+1/4*uncert12_cf8(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_cf8(Fz12(5))*uncert12_cf8(Fz12(6)));
uncert12_cf1_Fz_4 = sqrt(1/4*uncert12_cf1(Fz12(7))^2+1/4*uncert12_cf1(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf1(Fz12(7))*uncert12_cf1(Fz12(8)));
uncert12_cf2_Fz_4 = sqrt(1/4*uncert12_cf2(Fz12(7))^2+1/4*uncert12_cf2(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf2(Fz12(7))*uncert12_cf2(Fz12(8)));
uncert12_cf3_Fz_4 = sqrt(1/4*uncert12_cf3(Fz12(7))^2+1/4*uncert12_cf3(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf3(Fz12(7))*uncert12_cf3(Fz12(8)));
uncert12_cf4_Fz_4 = sqrt(1/4*uncert12_cf4(Fz12(7))^2+1/4*uncert12_cf4(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf4(Fz12(7))*uncert12_cf4(Fz12(8)));
uncert12_cf5_Fz_4 = sqrt(1/4*uncert12_cf5(Fz12(7))^2+1/4*uncert12_cf5(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf5(Fz12(7))*uncert12_cf5(Fz12(8)));
uncert12_cf6_Fz_4 = sqrt(1/4*uncert12_cf6(Fz12(7))^2+1/4*uncert12_cf6(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf6(Fz12(7))*uncert12_cf6(Fz12(8)));
uncert12_cf7_Fz_4 = sqrt(1/4*uncert12_cf7(Fz12(7))^2+1/4*uncert12_cf7(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf7(Fz12(7))*uncert12_cf7(Fz12(8)));
uncert12_cf8_Fz_4 = sqrt(1/4*uncert12_cf8(Fz12(7))^2+1/4*uncert12_cf8(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_cf8(Fz12(7))*uncert12_cf8(Fz12(8)));
uncert13_cf1_Fz_1 = sqrt(1/4*uncert13_cf1(Fz13(1))^2+1/4*uncert13_cf1(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf1(Fz13(1))*uncert13_cf1(Fz13(2)));
uncert13_cf2_Fz_1 = sqrt(1/4*uncert13_cf2(Fz13(1))^2+1/4*uncert13_cf2(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf2(Fz13(1))*uncert13_cf2(Fz13(2)));
uncert13_cf3_Fz_1 = sqrt(1/4*uncert13_cf3(Fz13(1))^2+1/4*uncert13_cf3(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf3(Fz13(1))*uncert13_cf3(Fz13(2)));
uncert13_cf4_Fz_1 = sqrt(1/4*uncert13_cf4(Fz13(1))^2+1/4*uncert13_cf4(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf4(Fz13(1))*uncert13_cf4(Fz13(2)));
uncert13_cf5_Fz_1 = sqrt(1/4*uncert13_cf5(Fz13(1))^2+1/4*uncert13_cf5(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf5(Fz13(1))*uncert13_cf5(Fz13(2)));
uncert13_cf6_Fz_1 = sqrt(1/4*uncert13_cf6(Fz13(1))^2+1/4*uncert13_cf6(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf6(Fz13(1))*uncert13_cf6(Fz13(2)));
uncert13_cf7_Fz_1 = sqrt(1/4*uncert13_cf7(Fz13(1))^2+1/4*uncert13_cf7(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf7(Fz13(1))*uncert13_cf7(Fz13(2)));
uncert13_cf8_Fz_1 = sqrt(1/4*uncert13_cf8(Fz13(1))^2+1/4*uncert13_cf8(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_cf8(Fz13(1))*uncert13_cf8(Fz13(2)));
uncert13_cf1_Fz_2 = sqrt(1/4*uncert13_cf1(Fz13(3))^2+1/4*uncert13_cf1(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf1(Fz13(3))*uncert13_cf1(Fz13(4)));
uncert13_cf2_Fz_2 = sqrt(1/4*uncert13_cf2(Fz13(3))^2+1/4*uncert13_cf2(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf2(Fz13(3))*uncert13_cf2(Fz13(4)));
uncert13_cf3_Fz_2 = sqrt(1/4*uncert13_cf3(Fz13(3))^2+1/4*uncert13_cf3(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf3(Fz13(3))*uncert13_cf3(Fz13(4)));
uncert13_cf4_Fz_2 = sqrt(1/4*uncert13_cf4(Fz13(3))^2+1/4*uncert13_cf4(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf4(Fz13(3))*uncert13_cf4(Fz13(4)));
uncert13_cf5_Fz_2 = sqrt(1/4*uncert13_cf5(Fz13(3))^2+1/4*uncert13_cf5(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf5(Fz13(3))*uncert13_cf5(Fz13(4)));
uncert13_cf6_Fz_2 = sqrt(1/4*uncert13_cf6(Fz13(3))^2+1/4*uncert13_cf6(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf6(Fz13(3))*uncert13_cf6(Fz13(4)));
uncert13_cf7_Fz_2 = sqrt(1/4*uncert13_cf7(Fz13(3))^2+1/4*uncert13_cf7(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf7(Fz13(3))*uncert13_cf7(Fz13(4)));
uncert13_cf8_Fz_2 = sqrt(1/4*uncert13_cf8(Fz13(3))^2+1/4*uncert13_cf8(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_cf8(Fz13(3))*uncert13_cf8(Fz13(4)));
uncert13_cf1_Fz_3 = sqrt(1/4*uncert13_cf1(Fz13(5))^2+1/4*uncert13_cf1(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf1(Fz13(5))*uncert13_cf1(Fz13(6)));
uncert13_cf2_Fz_3 = sqrt(1/4*uncert13_cf2(Fz13(5))^2+1/4*uncert13_cf2(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf2(Fz13(5))*uncert13_cf2(Fz13(6)));
uncert13_cf3_Fz_3 = sqrt(1/4*uncert13_cf3(Fz13(5))^2+1/4*uncert13_cf3(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf3(Fz13(5))*uncert13_cf3(Fz13(6)));
uncert13_cf4_Fz_3 = sqrt(1/4*uncert13_cf4(Fz13(5))^2+1/4*uncert13_cf4(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf4(Fz13(5))*uncert13_cf4(Fz13(6)));
uncert13_cf5_Fz_3 = sqrt(1/4*uncert13_cf5(Fz13(5))^2+1/4*uncert13_cf5(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf5(Fz13(5))*uncert13_cf5(Fz13(6)));
uncert13_cf6_Fz_3 = sqrt(1/4*uncert13_cf6(Fz13(5))^2+1/4*uncert13_cf6(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf6(Fz13(5))*uncert13_cf6(Fz13(6)));
uncert13_cf7_Fz_3 = sqrt(1/4*uncert13_cf7(Fz13(5))^2+1/4*uncert13_cf7(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf7(Fz13(5))*uncert13_cf7(Fz13(6)));
uncert13_cf8_Fz_3 = sqrt(1/4*uncert13_cf8(Fz13(5))^2+1/4*uncert13_cf8(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_cf8(Fz13(5))*uncert13_cf8(Fz13(6)));
uncert13_cf1_Fz_4 = sqrt(1/4*uncert13_cf1(Fz13(7))^2+1/4*uncert13_cf1(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf1(Fz13(7))*uncert13_cf1(Fz13(8)));
uncert13_cf2_Fz_4 = sqrt(1/4*uncert13_cf2(Fz13(7))^2+1/4*uncert13_cf2(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf2(Fz13(7))*uncert13_cf2(Fz13(8)));
uncert13_cf3_Fz_4 = sqrt(1/4*uncert13_cf3(Fz13(7))^2+1/4*uncert13_cf3(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf3(Fz13(7))*uncert13_cf3(Fz13(8)));
uncert13_cf4_Fz_4 = sqrt(1/4*uncert13_cf4(Fz13(7))^2+1/4*uncert13_cf4(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf4(Fz13(7))*uncert13_cf4(Fz13(8)));
uncert13_cf5_Fz_4 = sqrt(1/4*uncert13_cf5(Fz13(7))^2+1/4*uncert13_cf5(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf5(Fz13(7))*uncert13_cf5(Fz13(8)));
uncert13_cf6_Fz_4 = sqrt(1/4*uncert13_cf6(Fz13(7))^2+1/4*uncert13_cf6(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf6(Fz13(7))*uncert13_cf6(Fz13(8)));
uncert13_cf7_Fz_4 = sqrt(1/4*uncert13_cf7(Fz13(7))^2+1/4*uncert13_cf7(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf7(Fz13(7))*uncert13_cf7(Fz13(8)));
uncert13_cf8_Fz_4 = sqrt(1/4*uncert13_cf8(Fz13(7))^2+1/4*uncert13_cf8(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_cf8(Fz13(7))*uncert13_cf8(Fz13(8)));

uncert10_ct1_Fz_1 = sqrt(1/4*uncert10_ct1(Fz10(1))^2+1/4*uncert10_ct1(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct1(Fz10(1))*uncert10_ct1(Fz10(2)));
uncert10_ct2_Fz_1 = sqrt(1/4*uncert10_ct2(Fz10(1))^2+1/4*uncert10_ct2(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct2(Fz10(1))*uncert10_ct2(Fz10(2)));
uncert10_ct3_Fz_1 = sqrt(1/4*uncert10_ct3(Fz10(1))^2+1/4*uncert10_ct3(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct3(Fz10(1))*uncert10_ct3(Fz10(2)));
uncert10_ct4_Fz_1 = sqrt(1/4*uncert10_ct4(Fz10(1))^2+1/4*uncert10_ct4(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct4(Fz10(1))*uncert10_ct4(Fz10(2)));
uncert10_ct5_Fz_1 = sqrt(1/4*uncert10_ct5(Fz10(1))^2+1/4*uncert10_ct5(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct5(Fz10(1))*uncert10_ct5(Fz10(2)));
uncert10_ct6_Fz_1 = sqrt(1/4*uncert10_ct6(Fz10(1))^2+1/4*uncert10_ct6(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct6(Fz10(1))*uncert10_ct6(Fz10(2)));
uncert10_ct7_Fz_1 = sqrt(1/4*uncert10_ct7(Fz10(1))^2+1/4*uncert10_ct7(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct7(Fz10(1))*uncert10_ct7(Fz10(2)));
uncert10_ct8_Fz_1 = sqrt(1/4*uncert10_ct8(Fz10(1))^2+1/4*uncert10_ct8(Fz10(2))^2+2*0.5*0.5*r_factor_c*uncert10_ct8(Fz10(1))*uncert10_ct8(Fz10(2)));
uncert10_ct1_Fz_2 = sqrt(1/4*uncert10_ct1(Fz10(3))^2+1/4*uncert10_ct1(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct1(Fz10(3))*uncert10_ct1(Fz10(4)));
uncert10_ct2_Fz_2 = sqrt(1/4*uncert10_ct2(Fz10(3))^2+1/4*uncert10_ct2(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct2(Fz10(3))*uncert10_ct2(Fz10(4)));
uncert10_ct3_Fz_2 = sqrt(1/4*uncert10_ct3(Fz10(3))^2+1/4*uncert10_ct3(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct3(Fz10(3))*uncert10_ct3(Fz10(4)));
uncert10_ct4_Fz_2 = sqrt(1/4*uncert10_ct4(Fz10(3))^2+1/4*uncert10_ct4(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct4(Fz10(3))*uncert10_ct4(Fz10(4)));
uncert10_ct5_Fz_2 = sqrt(1/4*uncert10_ct5(Fz10(3))^2+1/4*uncert10_ct5(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct5(Fz10(3))*uncert10_ct5(Fz10(4)));
uncert10_ct6_Fz_2 = sqrt(1/4*uncert10_ct6(Fz10(3))^2+1/4*uncert10_ct6(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct6(Fz10(3))*uncert10_ct6(Fz10(4)));
uncert10_ct7_Fz_2 = sqrt(1/4*uncert10_ct7(Fz10(3))^2+1/4*uncert10_ct7(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct7(Fz10(3))*uncert10_ct7(Fz10(4)));
uncert10_ct8_Fz_2 = sqrt(1/4*uncert10_ct8(Fz10(3))^2+1/4*uncert10_ct8(Fz10(4))^2+2*0.5*0.5*r_factor_c*uncert10_ct8(Fz10(3))*uncert10_ct8(Fz10(4)));
uncert10_ct1_Fz_3 = sqrt(1/4*uncert10_ct1(Fz10(5))^2+1/4*uncert10_ct1(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct1(Fz10(5))*uncert10_ct1(Fz10(6)));
uncert10_ct2_Fz_3 = sqrt(1/4*uncert10_ct2(Fz10(5))^2+1/4*uncert10_ct2(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct2(Fz10(5))*uncert10_ct2(Fz10(6)));
uncert10_ct3_Fz_3 = sqrt(1/4*uncert10_ct3(Fz10(5))^2+1/4*uncert10_ct3(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct3(Fz10(5))*uncert10_ct3(Fz10(6)));
uncert10_ct4_Fz_3 = sqrt(1/4*uncert10_ct4(Fz10(5))^2+1/4*uncert10_ct4(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct4(Fz10(5))*uncert10_ct4(Fz10(6)));
uncert10_ct5_Fz_3 = sqrt(1/4*uncert10_ct5(Fz10(5))^2+1/4*uncert10_ct5(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct5(Fz10(5))*uncert10_ct5(Fz10(6)));
uncert10_ct6_Fz_3 = sqrt(1/4*uncert10_ct6(Fz10(5))^2+1/4*uncert10_ct6(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct6(Fz10(5))*uncert10_ct6(Fz10(6)));
uncert10_ct7_Fz_3 = sqrt(1/4*uncert10_ct7(Fz10(5))^2+1/4*uncert10_ct7(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct7(Fz10(5))*uncert10_ct7(Fz10(6)));
uncert10_ct8_Fz_3 = sqrt(1/4*uncert10_ct8(Fz10(5))^2+1/4*uncert10_ct8(Fz10(6))^2+2*0.5*0.5*r_factor_c*uncert10_ct8(Fz10(5))*uncert10_ct8(Fz10(6)));
uncert10_ct1_Fz_4 = sqrt(1/4*uncert10_ct1(Fz10(7))^2+1/4*uncert10_ct1(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct1(Fz10(7))*uncert10_ct1(Fz10(8)));
uncert10_ct2_Fz_4 = sqrt(1/4*uncert10_ct2(Fz10(7))^2+1/4*uncert10_ct2(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct2(Fz10(7))*uncert10_ct2(Fz10(8)));
uncert10_ct3_Fz_4 = sqrt(1/4*uncert10_ct3(Fz10(7))^2+1/4*uncert10_ct3(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct3(Fz10(7))*uncert10_ct3(Fz10(8)));
uncert10_ct4_Fz_4 = sqrt(1/4*uncert10_ct4(Fz10(7))^2+1/4*uncert10_ct4(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct4(Fz10(7))*uncert10_ct4(Fz10(8)));
uncert10_ct5_Fz_4 = sqrt(1/4*uncert10_ct5(Fz10(7))^2+1/4*uncert10_ct5(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct5(Fz10(7))*uncert10_ct5(Fz10(8)));
uncert10_ct6_Fz_4 = sqrt(1/4*uncert10_ct6(Fz10(7))^2+1/4*uncert10_ct6(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct6(Fz10(7))*uncert10_ct6(Fz10(8)));
uncert10_ct7_Fz_4 = sqrt(1/4*uncert10_ct7(Fz10(7))^2+1/4*uncert10_ct7(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct7(Fz10(7))*uncert10_ct7(Fz10(8)));
uncert10_ct8_Fz_4 = sqrt(1/4*uncert10_ct8(Fz10(7))^2+1/4*uncert10_ct8(Fz10(8))^2+2*0.5*0.5*r_factor_c*uncert10_ct8(Fz10(7))*uncert10_ct8(Fz10(8)));
uncert12_ct1_Fz_1 = sqrt(1/4*uncert12_ct1(Fz12(1))^2+1/4*uncert12_ct1(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct1(Fz12(1))*uncert12_ct1(Fz12(2)));
uncert12_ct2_Fz_1 = sqrt(1/4*uncert12_ct2(Fz12(1))^2+1/4*uncert12_ct2(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct2(Fz12(1))*uncert12_ct2(Fz12(2)));
uncert12_ct3_Fz_1 = sqrt(1/4*uncert12_ct3(Fz12(1))^2+1/4*uncert12_ct3(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct3(Fz12(1))*uncert12_ct3(Fz12(2)));
uncert12_ct4_Fz_1 = sqrt(1/4*uncert12_ct4(Fz12(1))^2+1/4*uncert12_ct4(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct4(Fz12(1))*uncert12_ct4(Fz12(2)));
uncert12_ct5_Fz_1 = sqrt(1/4*uncert12_ct5(Fz12(1))^2+1/4*uncert12_ct5(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct5(Fz12(1))*uncert12_ct5(Fz12(2)));
uncert12_ct6_Fz_1 = sqrt(1/4*uncert12_ct6(Fz12(1))^2+1/4*uncert12_ct6(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct6(Fz12(1))*uncert12_ct6(Fz12(2)));
uncert12_ct7_Fz_1 = sqrt(1/4*uncert12_ct7(Fz12(1))^2+1/4*uncert12_ct7(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct7(Fz12(1))*uncert12_ct7(Fz12(2)));
uncert12_ct8_Fz_1 = sqrt(1/4*uncert12_ct8(Fz12(1))^2+1/4*uncert12_ct8(Fz12(2))^2+2*0.5*0.5*r_factor_c*uncert12_ct8(Fz12(1))*uncert12_ct8(Fz12(2)));
uncert12_ct1_Fz_2 = sqrt(1/4*uncert12_ct1(Fz12(3))^2+1/4*uncert12_ct1(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct1(Fz12(3))*uncert12_ct1(Fz12(4)));
uncert12_ct2_Fz_2 = sqrt(1/4*uncert12_ct2(Fz12(3))^2+1/4*uncert12_ct2(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct2(Fz12(3))*uncert12_ct2(Fz12(4)));
uncert12_ct3_Fz_2 = sqrt(1/4*uncert12_ct3(Fz12(3))^2+1/4*uncert12_ct3(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct3(Fz12(3))*uncert12_ct3(Fz12(4)));
uncert12_ct4_Fz_2 = sqrt(1/4*uncert12_ct4(Fz12(3))^2+1/4*uncert12_ct4(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct4(Fz12(3))*uncert12_ct4(Fz12(4)));
uncert12_ct5_Fz_2 = sqrt(1/4*uncert12_ct5(Fz12(3))^2+1/4*uncert12_ct5(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct5(Fz12(3))*uncert12_ct5(Fz12(4)));
uncert12_ct6_Fz_2 = sqrt(1/4*uncert12_ct6(Fz12(3))^2+1/4*uncert12_ct6(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct6(Fz12(3))*uncert12_ct6(Fz12(4)));
uncert12_ct7_Fz_2 = sqrt(1/4*uncert12_ct7(Fz12(3))^2+1/4*uncert12_ct7(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct7(Fz12(3))*uncert12_ct7(Fz12(4)));
uncert12_ct8_Fz_2 = sqrt(1/4*uncert12_ct8(Fz12(3))^2+1/4*uncert12_ct8(Fz12(4))^2+2*0.5*0.5*r_factor_c*uncert12_ct8(Fz12(3))*uncert12_ct8(Fz12(4)));
uncert12_ct1_Fz_3 = sqrt(1/4*uncert12_ct1(Fz12(5))^2+1/4*uncert12_ct1(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct1(Fz12(5))*uncert12_ct1(Fz12(6)));
uncert12_ct2_Fz_3 = sqrt(1/4*uncert12_ct2(Fz12(5))^2+1/4*uncert12_ct2(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct2(Fz12(5))*uncert12_ct2(Fz12(6)));
uncert12_ct3_Fz_3 = sqrt(1/4*uncert12_ct3(Fz12(5))^2+1/4*uncert12_ct3(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct3(Fz12(5))*uncert12_ct3(Fz12(6)));
uncert12_ct4_Fz_3 = sqrt(1/4*uncert12_ct4(Fz12(5))^2+1/4*uncert12_ct4(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct4(Fz12(5))*uncert12_ct4(Fz12(6)));
uncert12_ct5_Fz_3 = sqrt(1/4*uncert12_ct5(Fz12(5))^2+1/4*uncert12_ct5(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct5(Fz12(5))*uncert12_ct5(Fz12(6)));
uncert12_ct6_Fz_3 = sqrt(1/4*uncert12_ct6(Fz12(5))^2+1/4*uncert12_ct6(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct6(Fz12(5))*uncert12_ct6(Fz12(6)));
uncert12_ct7_Fz_3 = sqrt(1/4*uncert12_ct7(Fz12(5))^2+1/4*uncert12_ct7(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct7(Fz12(5))*uncert12_ct7(Fz12(6)));
uncert12_ct8_Fz_3 = sqrt(1/4*uncert12_ct8(Fz12(5))^2+1/4*uncert12_ct8(Fz12(6))^2+2*0.5*0.5*r_factor_c*uncert12_ct8(Fz12(5))*uncert12_ct8(Fz12(6)));
uncert12_ct1_Fz_4 = sqrt(1/4*uncert12_ct1(Fz12(7))^2+1/4*uncert12_ct1(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct1(Fz12(7))*uncert12_ct1(Fz12(8)));
uncert12_ct2_Fz_4 = sqrt(1/4*uncert12_ct2(Fz12(7))^2+1/4*uncert12_ct2(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct2(Fz12(7))*uncert12_ct2(Fz12(8)));
uncert12_ct3_Fz_4 = sqrt(1/4*uncert12_ct3(Fz12(7))^2+1/4*uncert12_ct3(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct3(Fz12(7))*uncert12_ct3(Fz12(8)));
uncert12_ct4_Fz_4 = sqrt(1/4*uncert12_ct4(Fz12(7))^2+1/4*uncert12_ct4(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct4(Fz12(7))*uncert12_ct4(Fz12(8)));
uncert12_ct5_Fz_4 = sqrt(1/4*uncert12_ct5(Fz12(7))^2+1/4*uncert12_ct5(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct5(Fz12(7))*uncert12_ct5(Fz12(8)));
uncert12_ct6_Fz_4 = sqrt(1/4*uncert12_ct6(Fz12(7))^2+1/4*uncert12_ct6(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct6(Fz12(7))*uncert12_ct6(Fz12(8)));
uncert12_ct7_Fz_4 = sqrt(1/4*uncert12_ct7(Fz12(7))^2+1/4*uncert12_ct7(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct7(Fz12(7))*uncert12_ct7(Fz12(8)));
uncert12_ct8_Fz_4 = sqrt(1/4*uncert12_ct8(Fz12(7))^2+1/4*uncert12_ct8(Fz12(8))^2+2*0.5*0.5*r_factor_c*uncert12_ct8(Fz12(7))*uncert12_ct8(Fz12(8)));
uncert13_ct1_Fz_1 = sqrt(1/4*uncert13_ct1(Fz13(1))^2+1/4*uncert13_ct1(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct1(Fz13(1))*uncert13_ct1(Fz13(2)));
uncert13_ct2_Fz_1 = sqrt(1/4*uncert13_ct2(Fz13(1))^2+1/4*uncert13_ct2(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct2(Fz13(1))*uncert13_ct2(Fz13(2)));
uncert13_ct3_Fz_1 = sqrt(1/4*uncert13_ct3(Fz13(1))^2+1/4*uncert13_ct3(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct3(Fz13(1))*uncert13_ct3(Fz13(2)));
uncert13_ct4_Fz_1 = sqrt(1/4*uncert13_ct4(Fz13(1))^2+1/4*uncert13_ct4(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct4(Fz13(1))*uncert13_ct4(Fz13(2)));
uncert13_ct5_Fz_1 = sqrt(1/4*uncert13_ct5(Fz13(1))^2+1/4*uncert13_ct5(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct5(Fz13(1))*uncert13_ct5(Fz13(2)));
uncert13_ct6_Fz_1 = sqrt(1/4*uncert13_ct6(Fz13(1))^2+1/4*uncert13_ct6(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct6(Fz13(1))*uncert13_ct6(Fz13(2)));
uncert13_ct7_Fz_1 = sqrt(1/4*uncert13_ct7(Fz13(1))^2+1/4*uncert13_ct7(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct7(Fz13(1))*uncert13_ct7(Fz13(2)));
uncert13_ct8_Fz_1 = sqrt(1/4*uncert13_ct8(Fz13(1))^2+1/4*uncert13_ct8(Fz13(2))^2+2*0.5*0.5*r_factor_c*uncert13_ct8(Fz13(1))*uncert13_ct8(Fz13(2)));
uncert13_ct1_Fz_2 = sqrt(1/4*uncert13_ct1(Fz13(3))^2+1/4*uncert13_ct1(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct1(Fz13(3))*uncert13_ct1(Fz13(4)));
uncert13_ct2_Fz_2 = sqrt(1/4*uncert13_ct2(Fz13(3))^2+1/4*uncert13_ct2(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct2(Fz13(3))*uncert13_ct2(Fz13(4)));
uncert13_ct3_Fz_2 = sqrt(1/4*uncert13_ct3(Fz13(3))^2+1/4*uncert13_ct3(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct3(Fz13(3))*uncert13_ct3(Fz13(4)));
uncert13_ct4_Fz_2 = sqrt(1/4*uncert13_ct4(Fz13(3))^2+1/4*uncert13_ct4(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct4(Fz13(3))*uncert13_ct4(Fz13(4)));
uncert13_ct5_Fz_2 = sqrt(1/4*uncert13_ct5(Fz13(3))^2+1/4*uncert13_ct5(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct5(Fz13(3))*uncert13_ct5(Fz13(4)));
uncert13_ct6_Fz_2 = sqrt(1/4*uncert13_ct6(Fz13(3))^2+1/4*uncert13_ct6(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct6(Fz13(3))*uncert13_ct6(Fz13(4)));
uncert13_ct7_Fz_2 = sqrt(1/4*uncert13_ct7(Fz13(3))^2+1/4*uncert13_ct7(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct7(Fz13(3))*uncert13_ct7(Fz13(4)));
uncert13_ct8_Fz_2 = sqrt(1/4*uncert13_ct8(Fz13(3))^2+1/4*uncert13_ct8(Fz13(4))^2+2*0.5*0.5*r_factor_c*uncert13_ct8(Fz13(3))*uncert13_ct8(Fz13(4)));
uncert13_ct1_Fz_3 = sqrt(1/4*uncert13_ct1(Fz13(5))^2+1/4*uncert13_ct1(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct1(Fz13(5))*uncert13_ct1(Fz13(6)));
uncert13_ct2_Fz_3 = sqrt(1/4*uncert13_ct2(Fz13(5))^2+1/4*uncert13_ct2(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct2(Fz13(5))*uncert13_ct2(Fz13(6)));
uncert13_ct3_Fz_3 = sqrt(1/4*uncert13_ct3(Fz13(5))^2+1/4*uncert13_ct3(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct3(Fz13(5))*uncert13_ct3(Fz13(6)));
uncert13_ct4_Fz_3 = sqrt(1/4*uncert13_ct4(Fz13(5))^2+1/4*uncert13_ct4(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct4(Fz13(5))*uncert13_ct4(Fz13(6)));
uncert13_ct5_Fz_3 = sqrt(1/4*uncert13_ct5(Fz13(5))^2+1/4*uncert13_ct5(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct5(Fz13(5))*uncert13_ct5(Fz13(6)));
uncert13_ct6_Fz_3 = sqrt(1/4*uncert13_ct6(Fz13(5))^2+1/4*uncert13_ct6(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct6(Fz13(5))*uncert13_ct6(Fz13(6)));
uncert13_ct7_Fz_3 = sqrt(1/4*uncert13_ct7(Fz13(5))^2+1/4*uncert13_ct7(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct7(Fz13(5))*uncert13_ct7(Fz13(6)));
uncert13_ct8_Fz_3 = sqrt(1/4*uncert13_ct8(Fz13(5))^2+1/4*uncert13_ct8(Fz13(6))^2+2*0.5*0.5*r_factor_c*uncert13_ct8(Fz13(5))*uncert13_ct8(Fz13(6)));
uncert13_ct1_Fz_4 = sqrt(1/4*uncert13_ct1(Fz13(7))^2+1/4*uncert13_ct1(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct1(Fz13(7))*uncert13_ct1(Fz13(8)));
uncert13_ct2_Fz_4 = sqrt(1/4*uncert13_ct2(Fz13(7))^2+1/4*uncert13_ct2(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct2(Fz13(7))*uncert13_ct2(Fz13(8)));
uncert13_ct3_Fz_4 = sqrt(1/4*uncert13_ct3(Fz13(7))^2+1/4*uncert13_ct3(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct3(Fz13(7))*uncert13_ct3(Fz13(8)));
uncert13_ct4_Fz_4 = sqrt(1/4*uncert13_ct4(Fz13(7))^2+1/4*uncert13_ct4(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct4(Fz13(7))*uncert13_ct4(Fz13(8)));
uncert13_ct5_Fz_4 = sqrt(1/4*uncert13_ct5(Fz13(7))^2+1/4*uncert13_ct5(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct5(Fz13(7))*uncert13_ct5(Fz13(8)));
uncert13_ct6_Fz_4 = sqrt(1/4*uncert13_ct6(Fz13(7))^2+1/4*uncert13_ct6(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct6(Fz13(7))*uncert13_ct6(Fz13(8)));
uncert13_ct7_Fz_4 = sqrt(1/4*uncert13_ct7(Fz13(7))^2+1/4*uncert13_ct7(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct7(Fz13(7))*uncert13_ct7(Fz13(8)));
uncert13_ct8_Fz_4 = sqrt(1/4*uncert13_ct8(Fz13(7))^2+1/4*uncert13_ct8(Fz13(8))^2+2*0.5*0.5*r_factor_c*uncert13_ct8(Fz13(7))*uncert13_ct8(Fz13(8)));


uncert10_cm1_allFz = sqrt((1/4*uncert10_cm1_Fz_1)^2+(1/4*uncert10_cm1_Fz_2)^2+(1/4*uncert10_cm1_Fz_3)^2+(1/4*uncert10_cm1_Fz_4)^2+2*(1/4)^4*0*uncert10_cm1_Fz_1*uncert10_cm1_Fz_2*uncert10_cm1_Fz_3*uncert10_cm1_Fz_4);
uncert10_cm2_allFz = sqrt((1/4*uncert10_cm2_Fz_1)^2+(1/4*uncert10_cm2_Fz_2)^2+(1/4*uncert10_cm2_Fz_3)^2+(1/4*uncert10_cm2_Fz_4)^2+2*(1/4)^4*0*uncert10_cm2_Fz_1*uncert10_cm2_Fz_2*uncert10_cm2_Fz_3*uncert10_cm2_Fz_4);
uncert10_cm3_allFz = sqrt((1/4*uncert10_cm3_Fz_1)^2+(1/4*uncert10_cm3_Fz_2)^2+(1/4*uncert10_cm3_Fz_3)^2+(1/4*uncert10_cm3_Fz_4)^2+2*(1/4)^4*0*uncert10_cm3_Fz_1*uncert10_cm3_Fz_2*uncert10_cm3_Fz_3*uncert10_cm3_Fz_4);
uncert10_cm4_allFz = sqrt((1/4*uncert10_cm4_Fz_1)^2+(1/4*uncert10_cm4_Fz_2)^2+(1/4*uncert10_cm4_Fz_3)^2+(1/4*uncert10_cm4_Fz_4)^2+2*(1/4)^4*0*uncert10_cm4_Fz_1*uncert10_cm4_Fz_2*uncert10_cm4_Fz_3*uncert10_cm4_Fz_4);
uncert10_cm5_allFz = sqrt((1/4*uncert10_cm5_Fz_1)^2+(1/4*uncert10_cm5_Fz_2)^2+(1/4*uncert10_cm5_Fz_3)^2+(1/4*uncert10_cm5_Fz_4)^2+2*(1/4)^4*0*uncert10_cm5_Fz_1*uncert10_cm5_Fz_2*uncert10_cm5_Fz_3*uncert10_cm5_Fz_4);
uncert10_cm6_allFz = sqrt((1/4*uncert10_cm6_Fz_1)^2+(1/4*uncert10_cm6_Fz_2)^2+(1/4*uncert10_cm6_Fz_3)^2+(1/4*uncert10_cm6_Fz_4)^2+2*(1/4)^4*0*uncert10_cm6_Fz_1*uncert10_cm6_Fz_2*uncert10_cm6_Fz_3*uncert10_cm6_Fz_4);
uncert10_cm7_allFz = sqrt((1/4*uncert10_cm7_Fz_1)^2+(1/4*uncert10_cm7_Fz_2)^2+(1/4*uncert10_cm7_Fz_3)^2+(1/4*uncert10_cm7_Fz_4)^2+2*(1/4)^4*0*uncert10_cm7_Fz_1*uncert10_cm7_Fz_2*uncert10_cm7_Fz_3*uncert10_cm7_Fz_4);
uncert10_cm8_allFz = sqrt((1/4*uncert10_cm8_Fz_1)^2+(1/4*uncert10_cm8_Fz_2)^2+(1/4*uncert10_cm8_Fz_3)^2+(1/4*uncert10_cm8_Fz_4)^2+2*(1/4)^4*0*uncert10_cm8_Fz_1*uncert10_cm8_Fz_2*uncert10_cm8_Fz_3*uncert10_cm8_Fz_4);
uncert12_cm1_allFz = sqrt((1/4*uncert12_cm1_Fz_1)^2+(1/4*uncert12_cm1_Fz_2)^2+(1/4*uncert12_cm1_Fz_3)^2+(1/4*uncert12_cm1_Fz_4)^2+2*(1/4)^4*0*uncert12_cm1_Fz_1*uncert12_cm1_Fz_2*uncert12_cm1_Fz_3*uncert12_cm1_Fz_4);
uncert12_cm2_allFz = sqrt((1/4*uncert12_cm2_Fz_1)^2+(1/4*uncert12_cm2_Fz_2)^2+(1/4*uncert12_cm2_Fz_3)^2+(1/4*uncert12_cm2_Fz_4)^2+2*(1/4)^4*0*uncert12_cm2_Fz_1*uncert12_cm2_Fz_2*uncert12_cm2_Fz_3*uncert12_cm2_Fz_4);
uncert12_cm3_allFz = sqrt((1/4*uncert12_cm3_Fz_1)^2+(1/4*uncert12_cm3_Fz_2)^2+(1/4*uncert12_cm3_Fz_3)^2+(1/4*uncert12_cm3_Fz_4)^2+2*(1/4)^4*0*uncert12_cm3_Fz_1*uncert12_cm3_Fz_2*uncert12_cm3_Fz_3*uncert12_cm3_Fz_4);
uncert12_cm4_allFz = sqrt((1/4*uncert12_cm4_Fz_1)^2+(1/4*uncert12_cm4_Fz_2)^2+(1/4*uncert12_cm4_Fz_3)^2+(1/4*uncert12_cm4_Fz_4)^2+2*(1/4)^4*0*uncert12_cm4_Fz_1*uncert12_cm4_Fz_2*uncert12_cm4_Fz_3*uncert12_cm4_Fz_4);
uncert12_cm5_allFz = sqrt((1/4*uncert12_cm5_Fz_1)^2+(1/4*uncert12_cm5_Fz_2)^2+(1/4*uncert12_cm5_Fz_3)^2+(1/4*uncert12_cm5_Fz_4)^2+2*(1/4)^4*0*uncert12_cm5_Fz_1*uncert12_cm5_Fz_2*uncert12_cm5_Fz_3*uncert12_cm5_Fz_4);
uncert12_cm6_allFz = sqrt((1/4*uncert12_cm6_Fz_1)^2+(1/4*uncert12_cm6_Fz_2)^2+(1/4*uncert12_cm6_Fz_3)^2+(1/4*uncert12_cm6_Fz_4)^2+2*(1/4)^4*0*uncert12_cm6_Fz_1*uncert12_cm6_Fz_2*uncert12_cm6_Fz_3*uncert12_cm6_Fz_4);
uncert12_cm7_allFz = sqrt((1/4*uncert12_cm7_Fz_1)^2+(1/4*uncert12_cm7_Fz_2)^2+(1/4*uncert12_cm7_Fz_3)^2+(1/4*uncert12_cm7_Fz_4)^2+2*(1/4)^4*0*uncert12_cm7_Fz_1*uncert12_cm7_Fz_2*uncert12_cm7_Fz_3*uncert12_cm7_Fz_4);
uncert12_cm8_allFz = sqrt((1/4*uncert12_cm8_Fz_1)^2+(1/4*uncert12_cm8_Fz_2)^2+(1/4*uncert12_cm8_Fz_3)^2+(1/4*uncert12_cm8_Fz_4)^2+2*(1/4)^4*0*uncert12_cm8_Fz_1*uncert12_cm8_Fz_2*uncert12_cm8_Fz_3*uncert12_cm8_Fz_4);
uncert13_cm1_allFz = sqrt((1/4*uncert13_cm1_Fz_1)^2+(1/4*uncert13_cm1_Fz_2)^2+(1/4*uncert13_cm1_Fz_3)^2+(1/4*uncert13_cm1_Fz_4)^2+2*(1/4)^4*0*uncert13_cm1_Fz_1*uncert13_cm1_Fz_2*uncert13_cm1_Fz_3*uncert13_cm1_Fz_4);
uncert13_cm2_allFz = sqrt((1/4*uncert13_cm2_Fz_1)^2+(1/4*uncert13_cm2_Fz_2)^2+(1/4*uncert13_cm2_Fz_3)^2+(1/4*uncert13_cm2_Fz_4)^2+2*(1/4)^4*0*uncert13_cm2_Fz_1*uncert13_cm2_Fz_2*uncert13_cm2_Fz_3*uncert13_cm2_Fz_4);
uncert13_cm3_allFz = sqrt((1/4*uncert13_cm3_Fz_1)^2+(1/4*uncert13_cm3_Fz_2)^2+(1/4*uncert13_cm3_Fz_3)^2+(1/4*uncert13_cm3_Fz_4)^2+2*(1/4)^4*0*uncert13_cm3_Fz_1*uncert13_cm3_Fz_2*uncert13_cm3_Fz_3*uncert13_cm3_Fz_4);
uncert13_cm4_allFz = sqrt((1/4*uncert13_cm4_Fz_1)^2+(1/4*uncert13_cm4_Fz_2)^2+(1/4*uncert13_cm4_Fz_3)^2+(1/4*uncert13_cm4_Fz_4)^2+2*(1/4)^4*0*uncert13_cm4_Fz_1*uncert13_cm4_Fz_2*uncert13_cm4_Fz_3*uncert13_cm4_Fz_4);
uncert13_cm5_allFz = sqrt((1/4*uncert13_cm5_Fz_1)^2+(1/4*uncert13_cm5_Fz_2)^2+(1/4*uncert13_cm5_Fz_3)^2+(1/4*uncert13_cm5_Fz_4)^2+2*(1/4)^4*0*uncert13_cm5_Fz_1*uncert13_cm5_Fz_2*uncert13_cm5_Fz_3*uncert13_cm5_Fz_4);
uncert13_cm6_allFz = sqrt((1/4*uncert13_cm6_Fz_1)^2+(1/4*uncert13_cm6_Fz_2)^2+(1/4*uncert13_cm6_Fz_3)^2+(1/4*uncert13_cm6_Fz_4)^2+2*(1/4)^4*0*uncert13_cm6_Fz_1*uncert13_cm6_Fz_2*uncert13_cm6_Fz_3*uncert13_cm6_Fz_4);
uncert13_cm7_allFz = sqrt((1/4*uncert13_cm7_Fz_1)^2+(1/4*uncert13_cm7_Fz_2)^2+(1/4*uncert13_cm7_Fz_3)^2+(1/4*uncert13_cm7_Fz_4)^2+2*(1/4)^4*0*uncert13_cm7_Fz_1*uncert13_cm7_Fz_2*uncert13_cm7_Fz_3*uncert13_cm7_Fz_4);
uncert13_cm8_allFz = sqrt((1/4*uncert13_cm8_Fz_1)^2+(1/4*uncert13_cm8_Fz_2)^2+(1/4*uncert13_cm8_Fz_3)^2+(1/4*uncert13_cm8_Fz_4)^2+2*(1/4)^4*0*uncert13_cm8_Fz_1*uncert13_cm8_Fz_2*uncert13_cm8_Fz_3*uncert13_cm8_Fz_4);

uncert10_cf1_allFz = sqrt((1/4*uncert10_cf1_Fz_1)^2+(1/4*uncert10_cf1_Fz_2)^2+(1/4*uncert10_cf1_Fz_3)^2+(1/4*uncert10_cf1_Fz_4)^2+2*(1/4)^4*0*uncert10_cf1_Fz_1*uncert10_cf1_Fz_2*uncert10_cf1_Fz_3*uncert10_cf1_Fz_4);
uncert10_cf2_allFz = sqrt((1/4*uncert10_cf2_Fz_1)^2+(1/4*uncert10_cf2_Fz_2)^2+(1/4*uncert10_cf2_Fz_3)^2+(1/4*uncert10_cf2_Fz_4)^2+2*(1/4)^4*0*uncert10_cf2_Fz_1*uncert10_cf2_Fz_2*uncert10_cf2_Fz_3*uncert10_cf2_Fz_4);
uncert10_cf3_allFz = sqrt((1/4*uncert10_cf3_Fz_1)^2+(1/4*uncert10_cf3_Fz_2)^2+(1/4*uncert10_cf3_Fz_3)^2+(1/4*uncert10_cf3_Fz_4)^2+2*(1/4)^4*0*uncert10_cf3_Fz_1*uncert10_cf3_Fz_2*uncert10_cf3_Fz_3*uncert10_cf3_Fz_4);
uncert10_cf4_allFz = sqrt((1/4*uncert10_cf4_Fz_1)^2+(1/4*uncert10_cf4_Fz_2)^2+(1/4*uncert10_cf4_Fz_3)^2+(1/4*uncert10_cf4_Fz_4)^2+2*(1/4)^4*0*uncert10_cf4_Fz_1*uncert10_cf4_Fz_2*uncert10_cf4_Fz_3*uncert10_cf4_Fz_4);
uncert10_cf5_allFz = sqrt((1/4*uncert10_cf5_Fz_1)^2+(1/4*uncert10_cf5_Fz_2)^2+(1/4*uncert10_cf5_Fz_3)^2+(1/4*uncert10_cf5_Fz_4)^2+2*(1/4)^4*0*uncert10_cf5_Fz_1*uncert10_cf5_Fz_2*uncert10_cf5_Fz_3*uncert10_cf5_Fz_4);
uncert10_cf6_allFz = sqrt((1/4*uncert10_cf6_Fz_1)^2+(1/4*uncert10_cf6_Fz_2)^2+(1/4*uncert10_cf6_Fz_3)^2+(1/4*uncert10_cf6_Fz_4)^2+2*(1/4)^4*0*uncert10_cf6_Fz_1*uncert10_cf6_Fz_2*uncert10_cf6_Fz_3*uncert10_cf6_Fz_4);
uncert10_cf7_allFz = sqrt((1/4*uncert10_cf7_Fz_1)^2+(1/4*uncert10_cf7_Fz_2)^2+(1/4*uncert10_cf7_Fz_3)^2+(1/4*uncert10_cf7_Fz_4)^2+2*(1/4)^4*0*uncert10_cf7_Fz_1*uncert10_cf7_Fz_2*uncert10_cf7_Fz_3*uncert10_cf7_Fz_4);
uncert10_cf8_allFz = sqrt((1/4*uncert10_cf8_Fz_1)^2+(1/4*uncert10_cf8_Fz_2)^2+(1/4*uncert10_cf8_Fz_3)^2+(1/4*uncert10_cf8_Fz_4)^2+2*(1/4)^4*0*uncert10_cf8_Fz_1*uncert10_cf8_Fz_2*uncert10_cf8_Fz_3*uncert10_cf8_Fz_4);
uncert12_cf1_allFz = sqrt((1/4*uncert12_cf1_Fz_1)^2+(1/4*uncert12_cf1_Fz_2)^2+(1/4*uncert12_cf1_Fz_3)^2+(1/4*uncert12_cf1_Fz_4)^2+2*(1/4)^4*0*uncert12_cf1_Fz_1*uncert12_cf1_Fz_2*uncert12_cf1_Fz_3*uncert12_cf1_Fz_4);
uncert12_cf2_allFz = sqrt((1/4*uncert12_cf2_Fz_1)^2+(1/4*uncert12_cf2_Fz_2)^2+(1/4*uncert12_cf2_Fz_3)^2+(1/4*uncert12_cf2_Fz_4)^2+2*(1/4)^4*0*uncert12_cf2_Fz_1*uncert12_cf2_Fz_2*uncert12_cf2_Fz_3*uncert12_cf2_Fz_4);
uncert12_cf3_allFz = sqrt((1/4*uncert12_cf3_Fz_1)^2+(1/4*uncert12_cf3_Fz_2)^2+(1/4*uncert12_cf3_Fz_3)^2+(1/4*uncert12_cf3_Fz_4)^2+2*(1/4)^4*0*uncert12_cf3_Fz_1*uncert12_cf3_Fz_2*uncert12_cf3_Fz_3*uncert12_cf3_Fz_4);
uncert12_cf4_allFz = sqrt((1/4*uncert12_cf4_Fz_1)^2+(1/4*uncert12_cf4_Fz_2)^2+(1/4*uncert12_cf4_Fz_3)^2+(1/4*uncert12_cf4_Fz_4)^2+2*(1/4)^4*0*uncert12_cf4_Fz_1*uncert12_cf4_Fz_2*uncert12_cf4_Fz_3*uncert12_cf4_Fz_4);
uncert12_cf5_allFz = sqrt((1/4*uncert12_cf5_Fz_1)^2+(1/4*uncert12_cf5_Fz_2)^2+(1/4*uncert12_cf5_Fz_3)^2+(1/4*uncert12_cf5_Fz_4)^2+2*(1/4)^4*0*uncert12_cf5_Fz_1*uncert12_cf5_Fz_2*uncert12_cf5_Fz_3*uncert12_cf5_Fz_4);
uncert12_cf6_allFz = sqrt((1/4*uncert12_cf6_Fz_1)^2+(1/4*uncert12_cf6_Fz_2)^2+(1/4*uncert12_cf6_Fz_3)^2+(1/4*uncert12_cf6_Fz_4)^2+2*(1/4)^4*0*uncert12_cf6_Fz_1*uncert12_cf6_Fz_2*uncert12_cf6_Fz_3*uncert12_cf6_Fz_4);
uncert12_cf7_allFz = sqrt((1/4*uncert12_cf7_Fz_1)^2+(1/4*uncert12_cf7_Fz_2)^2+(1/4*uncert12_cf7_Fz_3)^2+(1/4*uncert12_cf7_Fz_4)^2+2*(1/4)^4*0*uncert12_cf7_Fz_1*uncert12_cf7_Fz_2*uncert12_cf7_Fz_3*uncert12_cf7_Fz_4);
uncert12_cf8_allFz = sqrt((1/4*uncert12_cf8_Fz_1)^2+(1/4*uncert12_cf8_Fz_2)^2+(1/4*uncert12_cf8_Fz_3)^2+(1/4*uncert12_cf8_Fz_4)^2+2*(1/4)^4*0*uncert12_cf8_Fz_1*uncert12_cf8_Fz_2*uncert12_cf8_Fz_3*uncert12_cf8_Fz_4);
uncert13_cf1_allFz = sqrt((1/4*uncert13_cf1_Fz_1)^2+(1/4*uncert13_cf1_Fz_2)^2+(1/4*uncert13_cf1_Fz_3)^2+(1/4*uncert13_cf1_Fz_4)^2+2*(1/4)^4*0*uncert13_cf1_Fz_1*uncert13_cf1_Fz_2*uncert13_cf1_Fz_3*uncert13_cf1_Fz_4);
uncert13_cf2_allFz = sqrt((1/4*uncert13_cf2_Fz_1)^2+(1/4*uncert13_cf2_Fz_2)^2+(1/4*uncert13_cf2_Fz_3)^2+(1/4*uncert13_cf2_Fz_4)^2+2*(1/4)^4*0*uncert13_cf2_Fz_1*uncert13_cf2_Fz_2*uncert13_cf2_Fz_3*uncert13_cf2_Fz_4);
uncert13_cf3_allFz = sqrt((1/4*uncert13_cf3_Fz_1)^2+(1/4*uncert13_cf3_Fz_2)^2+(1/4*uncert13_cf3_Fz_3)^2+(1/4*uncert13_cf3_Fz_4)^2+2*(1/4)^4*0*uncert13_cf3_Fz_1*uncert13_cf3_Fz_2*uncert13_cf3_Fz_3*uncert13_cf3_Fz_4);
uncert13_cf4_allFz = sqrt((1/4*uncert13_cf4_Fz_1)^2+(1/4*uncert13_cf4_Fz_2)^2+(1/4*uncert13_cf4_Fz_3)^2+(1/4*uncert13_cf4_Fz_4)^2+2*(1/4)^4*0*uncert13_cf4_Fz_1*uncert13_cf4_Fz_2*uncert13_cf4_Fz_3*uncert13_cf4_Fz_4);
uncert13_cf5_allFz = sqrt((1/4*uncert13_cf5_Fz_1)^2+(1/4*uncert13_cf5_Fz_2)^2+(1/4*uncert13_cf5_Fz_3)^2+(1/4*uncert13_cf5_Fz_4)^2+2*(1/4)^4*0*uncert13_cf5_Fz_1*uncert13_cf5_Fz_2*uncert13_cf5_Fz_3*uncert13_cf5_Fz_4);
uncert13_cf6_allFz = sqrt((1/4*uncert13_cf6_Fz_1)^2+(1/4*uncert13_cf6_Fz_2)^2+(1/4*uncert13_cf6_Fz_3)^2+(1/4*uncert13_cf6_Fz_4)^2+2*(1/4)^4*0*uncert13_cf6_Fz_1*uncert13_cf6_Fz_2*uncert13_cf6_Fz_3*uncert13_cf6_Fz_4);
uncert13_cf7_allFz = sqrt((1/4*uncert13_cf7_Fz_1)^2+(1/4*uncert13_cf7_Fz_2)^2+(1/4*uncert13_cf7_Fz_3)^2+(1/4*uncert13_cf7_Fz_4)^2+2*(1/4)^4*0*uncert13_cf7_Fz_1*uncert13_cf7_Fz_2*uncert13_cf7_Fz_3*uncert13_cf7_Fz_4);
uncert13_cf8_allFz = sqrt((1/4*uncert13_cf8_Fz_1)^2+(1/4*uncert13_cf8_Fz_2)^2+(1/4*uncert13_cf8_Fz_3)^2+(1/4*uncert13_cf8_Fz_4)^2+2*(1/4)^4*0*uncert13_cf8_Fz_1*uncert13_cf8_Fz_2*uncert13_cf8_Fz_3*uncert13_cf8_Fz_4);




figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), Cm1_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
errorbar(distances(1), Cm1_off_10inches_RPM_2,uncert10_cm1_RPM_2,'o','color','k');
errorbar(distances(2), Cm2_off_10inches_RPM_2,uncert10_cm2_RPM_2,'o','color','k');
errorbar(distances(3), Cm3_off_10inches_RPM_2,uncert10_cm3_RPM_2,'o','color','k');
errorbar(distances(4), Cm4_off_10inches_RPM_2,uncert10_cm4_RPM_2,'o','color','k');
errorbar(distances(5), Cm5_off_10inches_RPM_2,uncert10_cm5_RPM_2,'o','color','k');
errorbar(distances(6), Cm6_off_10inches_RPM_2,uncert10_cm6_RPM_2,'o','color','k');
errorbar(distances(7), Cm7_off_10inches_RPM_2,uncert10_cm7_RPM_2,'o','color','k');
errorbar(distances(8), Cm8_off_10inches_RPM_2,uncert10_cm8_RPM_2,'o','color','k');
errorbar(distances(1), Cm1_off_12inches_RPM_2,uncert12_cm1_RPM_2,'o','color','b');
errorbar(distances(2), Cm2_off_12inches_RPM_2,uncert12_cm2_RPM_2,'o','color','b');
errorbar(distances(3), Cm3_off_12inches_RPM_2,uncert12_cm3_RPM_2,'o','color','b');
errorbar(distances(4), Cm4_off_12inches_RPM_2,uncert12_cm4_RPM_2,'o','color','b');
errorbar(distances(5), Cm5_off_12inches_RPM_2,uncert12_cm5_RPM_2,'o','color','b');
errorbar(distances(6), Cm6_off_12inches_RPM_2,uncert12_cm6_RPM_2,'o','color','b');
errorbar(distances(7), Cm7_off_12inches_RPM_2,uncert12_cm7_RPM_2,'o','color','b');
errorbar(distances(8), Cm8_off_12inches_RPM_2,uncert12_cm8_RPM_2,'o','color','b');
errorbar(distances(1), Cm1_off_13inches_RPM_2,uncert13_cm1_RPM_2,'o','color','r');
errorbar(distances(2), Cm2_off_13inches_RPM_2,uncert13_cm2_RPM_2,'o','color','r');
errorbar(distances(3), Cm3_off_13inches_RPM_2,uncert13_cm3_RPM_2,'o','color','r');
errorbar(distances(4), Cm4_off_13inches_RPM_2,uncert13_cm4_RPM_2,'o','color','r');
errorbar(distances(5), Cm5_off_13inches_RPM_2,uncert13_cm5_RPM_2,'o','color','r');
errorbar(distances(6), Cm6_off_13inches_RPM_2,uncert13_cm6_RPM_2,'o','color','r');
errorbar(distances(7), Cm7_off_13inches_RPM_2,uncert13_cm7_RPM_2,'o','color','r');
errorbar(distances(8), Cm8_off_13inches_RPM_2,uncert13_cm8_RPM_2,'o','color','r');
% ylim([-0.020, 0.025])
ylabel('C$_Q$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), Cf1_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_RPM_2,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_RPM_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_RPM_2,'o','color','r','markersize',5,'lineWidth',2);
errorbar(distances(1), Cf1_off_10inches_RPM_2,uncert10_cf1_RPM_2,'o','color','k');
errorbar(distances(2), Cf2_off_10inches_RPM_2,uncert10_cf2_RPM_2,'o','color','k');
errorbar(distances(3), Cf3_off_10inches_RPM_2,uncert10_cf3_RPM_2,'o','color','k');
errorbar(distances(4), Cf4_off_10inches_RPM_2,uncert10_cf4_RPM_2,'o','color','k');
errorbar(distances(5), Cf5_off_10inches_RPM_2,uncert10_cf5_RPM_2,'o','color','k');
errorbar(distances(6), Cf6_off_10inches_RPM_2,uncert10_cf6_RPM_2,'o','color','k');
errorbar(distances(7), Cf7_off_10inches_RPM_2,uncert10_cf7_RPM_2,'o','color','k');
errorbar(distances(8), Cf8_off_10inches_RPM_2,uncert10_cf8_RPM_2,'o','color','k');
errorbar(distances(1), Cf1_off_12inches_RPM_2,uncert12_cf1_RPM_2,'o','color','b');
errorbar(distances(2), Cf2_off_12inches_RPM_2,uncert12_cf2_RPM_2,'o','color','b');
errorbar(distances(3), Cf3_off_12inches_RPM_2,uncert12_cf3_RPM_2,'o','color','b');
errorbar(distances(4), Cf4_off_12inches_RPM_2,uncert12_cf4_RPM_2,'o','color','b');
errorbar(distances(5), Cf5_off_12inches_RPM_2,uncert12_cf5_RPM_2,'o','color','b');
errorbar(distances(6), Cf6_off_12inches_RPM_2,uncert12_cf6_RPM_2,'o','color','b');
errorbar(distances(7), Cf7_off_12inches_RPM_2,uncert12_cf7_RPM_2,'o','color','b');
errorbar(distances(8), Cf8_off_12inches_RPM_2,uncert12_cf8_RPM_2,'o','color','b');
errorbar(distances(1), Cf1_off_13inches_RPM_2,uncert13_cf1_RPM_2,'o','color','r');
errorbar(distances(2), Cf2_off_13inches_RPM_2,uncert13_cf2_RPM_2,'o','color','r');
errorbar(distances(3), Cf3_off_13inches_RPM_2,uncert13_cf3_RPM_2,'o','color','r');
errorbar(distances(4), Cf4_off_13inches_RPM_2,uncert13_cf4_RPM_2,'o','color','r');
errorbar(distances(5), Cf5_off_13inches_RPM_2,uncert13_cf5_RPM_2,'o','color','r');
errorbar(distances(6), Cf6_off_13inches_RPM_2,uncert13_cf6_RPM_2,'o','color','r');
errorbar(distances(7), Cf7_off_13inches_RPM_2,uncert13_cf7_RPM_2,'o','color','r');
errorbar(distances(8), Cf8_off_13inches_RPM_2,uncert13_cf8_RPM_2,'o','color','r');
xlabel('D/R [-]')
legend('10"x4.7" 4000 RPM','','','','','','12"x5" 4000 RPM','','','','','','10"x4.7" 12.8N','','','','','','12"x5" 12.8N','','','','','')
% ylim([-0.020, 0.025])
ylabel('C$_F$ [-]')

figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), mean([Cm1_off_10inches_Fz_1,Cm1_off_10inches_Fz_2,Cm1_off_10inches_Fz_3,Cm1_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cm2_off_10inches_Fz_1,Cm2_off_10inches_Fz_2,Cm2_off_10inches_Fz_3,Cm2_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cm3_off_10inches_Fz_1,Cm3_off_10inches_Fz_2,Cm3_off_10inches_Fz_3,Cm3_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cm4_off_10inches_Fz_1,Cm4_off_10inches_Fz_2,Cm4_off_10inches_Fz_3,Cm4_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cm5_off_10inches_Fz_1,Cm5_off_10inches_Fz_2,Cm5_off_10inches_Fz_3,Cm5_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cm6_off_10inches_Fz_1,Cm6_off_10inches_Fz_2,Cm6_off_10inches_Fz_3,Cm6_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cm7_off_10inches_Fz_1,Cm7_off_10inches_Fz_2,Cm7_off_10inches_Fz_3,Cm7_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cm8_off_10inches_Fz_1,Cm8_off_10inches_Fz_2,Cm8_off_10inches_Fz_3,Cm8_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
errorbar(distances(1), mean([Cm1_off_10inches_Fz_1,Cm1_off_10inches_Fz_2,Cm1_off_10inches_Fz_3,Cm1_off_10inches_Fz_4]),uncert10_cm1_allFz,'o','color','k');
errorbar(distances(2), mean([Cm2_off_10inches_Fz_1,Cm2_off_10inches_Fz_2,Cm2_off_10inches_Fz_3,Cm2_off_10inches_Fz_4]),uncert10_cm2_allFz,'o','color','k');
errorbar(distances(3), mean([Cm3_off_10inches_Fz_1,Cm3_off_10inches_Fz_2,Cm3_off_10inches_Fz_3,Cm3_off_10inches_Fz_4]),uncert10_cm3_allFz,'o','color','k');
errorbar(distances(4), mean([Cm4_off_10inches_Fz_1,Cm4_off_10inches_Fz_2,Cm4_off_10inches_Fz_3,Cm4_off_10inches_Fz_4]),uncert10_cm4_allFz,'o','color','k');
errorbar(distances(5), mean([Cm5_off_10inches_Fz_1,Cm5_off_10inches_Fz_2,Cm5_off_10inches_Fz_3,Cm5_off_10inches_Fz_4]),uncert10_cm5_allFz,'o','color','k');
errorbar(distances(6), mean([Cm6_off_10inches_Fz_1,Cm6_off_10inches_Fz_2,Cm6_off_10inches_Fz_3,Cm6_off_10inches_Fz_4]),uncert10_cm6_allFz,'o','color','k');
errorbar(distances(7), mean([Cm7_off_10inches_Fz_1,Cm7_off_10inches_Fz_2,Cm7_off_10inches_Fz_3,Cm7_off_10inches_Fz_4]),uncert10_cm7_allFz,'o','color','k');
errorbar(distances(8), mean([Cm8_off_10inches_Fz_1,Cm8_off_10inches_Fz_2,Cm8_off_10inches_Fz_3,Cm8_off_10inches_Fz_4]),uncert10_cm8_allFz,'o','color','k');
plot(distances(1), mean([Cm1_off_12inches_Fz_1,Cm1_off_12inches_Fz_2,Cm1_off_12inches_Fz_3,Cm1_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cm2_off_12inches_Fz_1,Cm2_off_12inches_Fz_2,Cm2_off_12inches_Fz_3,Cm2_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cm3_off_12inches_Fz_1,Cm3_off_12inches_Fz_2,Cm3_off_12inches_Fz_3,Cm3_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cm4_off_12inches_Fz_1,Cm4_off_12inches_Fz_2,Cm4_off_12inches_Fz_3,Cm4_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cm5_off_12inches_Fz_1,Cm5_off_12inches_Fz_2,Cm5_off_12inches_Fz_3,Cm5_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cm6_off_12inches_Fz_1,Cm6_off_12inches_Fz_2,Cm6_off_12inches_Fz_3,Cm6_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cm7_off_12inches_Fz_1,Cm7_off_12inches_Fz_2,Cm7_off_12inches_Fz_3,Cm7_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cm8_off_12inches_Fz_1,Cm8_off_12inches_Fz_2,Cm8_off_12inches_Fz_3,Cm8_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
errorbar(distances(1), mean([Cm1_off_12inches_Fz_1,Cm1_off_12inches_Fz_2,Cm1_off_12inches_Fz_3,Cm1_off_12inches_Fz_4]),uncert12_cm1_allFz,'o','color','b');
errorbar(distances(2), mean([Cm2_off_12inches_Fz_1,Cm2_off_12inches_Fz_2,Cm2_off_12inches_Fz_3,Cm2_off_12inches_Fz_4]),uncert12_cm2_allFz,'o','color','b');
errorbar(distances(3), mean([Cm3_off_12inches_Fz_1,Cm3_off_12inches_Fz_2,Cm3_off_12inches_Fz_3,Cm3_off_12inches_Fz_4]),uncert12_cm3_allFz,'o','color','b');
errorbar(distances(4), mean([Cm4_off_12inches_Fz_1,Cm4_off_12inches_Fz_2,Cm4_off_12inches_Fz_3,Cm4_off_12inches_Fz_4]),uncert12_cm4_allFz,'o','color','b');
errorbar(distances(5), mean([Cm5_off_12inches_Fz_1,Cm5_off_12inches_Fz_2,Cm5_off_12inches_Fz_3,Cm5_off_12inches_Fz_4]),uncert12_cm5_allFz,'o','color','b');
errorbar(distances(6), mean([Cm6_off_12inches_Fz_1,Cm6_off_12inches_Fz_2,Cm6_off_12inches_Fz_3,Cm6_off_12inches_Fz_4]),uncert12_cm6_allFz,'o','color','b');
errorbar(distances(7), mean([Cm7_off_12inches_Fz_1,Cm7_off_12inches_Fz_2,Cm7_off_12inches_Fz_3,Cm7_off_12inches_Fz_4]),uncert12_cm7_allFz,'o','color','b');
errorbar(distances(8), mean([Cm8_off_12inches_Fz_1,Cm8_off_12inches_Fz_2,Cm8_off_12inches_Fz_3,Cm8_off_12inches_Fz_4]),uncert12_cm8_allFz,'o','color','b');
plot(distances(1), mean([Cm1_off_13inches_Fz_1,Cm1_off_13inches_Fz_2,Cm1_off_13inches_Fz_3,Cm1_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cm2_off_13inches_Fz_1,Cm2_off_13inches_Fz_2,Cm2_off_13inches_Fz_3,Cm2_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cm3_off_13inches_Fz_1,Cm3_off_13inches_Fz_2,Cm3_off_13inches_Fz_3,Cm3_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cm4_off_13inches_Fz_1,Cm4_off_13inches_Fz_2,Cm4_off_13inches_Fz_3,Cm4_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cm5_off_13inches_Fz_1,Cm5_off_13inches_Fz_2,Cm5_off_13inches_Fz_3,Cm5_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cm6_off_13inches_Fz_1,Cm6_off_13inches_Fz_2,Cm6_off_13inches_Fz_3,Cm6_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cm7_off_13inches_Fz_1,Cm7_off_13inches_Fz_2,Cm7_off_13inches_Fz_3,Cm7_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cm8_off_13inches_Fz_1,Cm8_off_13inches_Fz_2,Cm8_off_13inches_Fz_3,Cm8_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
errorbar(distances(1), mean([Cm1_off_13inches_Fz_1,Cm1_off_13inches_Fz_2,Cm1_off_13inches_Fz_3,Cm1_off_13inches_Fz_4]),uncert13_cm1_allFz,'o','color','r');
errorbar(distances(2), mean([Cm2_off_13inches_Fz_1,Cm2_off_13inches_Fz_2,Cm2_off_13inches_Fz_3,Cm2_off_13inches_Fz_4]),uncert13_cm2_allFz,'o','color','r');
errorbar(distances(3), mean([Cm3_off_13inches_Fz_1,Cm3_off_13inches_Fz_2,Cm3_off_13inches_Fz_3,Cm3_off_13inches_Fz_4]),uncert13_cm3_allFz,'o','color','r');
errorbar(distances(4), mean([Cm4_off_13inches_Fz_1,Cm4_off_13inches_Fz_2,Cm4_off_13inches_Fz_3,Cm4_off_13inches_Fz_4]),uncert13_cm4_allFz,'o','color','r');
errorbar(distances(5), mean([Cm5_off_13inches_Fz_1,Cm5_off_13inches_Fz_2,Cm5_off_13inches_Fz_3,Cm5_off_13inches_Fz_4]),uncert13_cm5_allFz,'o','color','r');
errorbar(distances(6), mean([Cm6_off_13inches_Fz_1,Cm6_off_13inches_Fz_2,Cm6_off_13inches_Fz_3,Cm6_off_13inches_Fz_4]),uncert13_cm6_allFz,'o','color','r');
errorbar(distances(7), mean([Cm7_off_13inches_Fz_1,Cm7_off_13inches_Fz_2,Cm7_off_13inches_Fz_3,Cm7_off_13inches_Fz_4]),uncert13_cm7_allFz,'o','color','r');
errorbar(distances(8), mean([Cm8_off_13inches_Fz_1,Cm8_off_13inches_Fz_2,Cm8_off_13inches_Fz_3,Cm8_off_13inches_Fz_4]),uncert13_cm8_allFz,'o','color','r');
ylim([-0.02,0.04])
ylabel('C$_Q$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), mean([Cf1_off_10inches_Fz_1,Cf1_off_10inches_Fz_2,Cf1_off_10inches_Fz_3,Cf1_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cf2_off_10inches_Fz_1,Cf2_off_10inches_Fz_2,Cf2_off_10inches_Fz_3,Cf2_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cf3_off_10inches_Fz_1,Cf3_off_10inches_Fz_2,Cf3_off_10inches_Fz_3,Cf3_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cf4_off_10inches_Fz_1,Cf4_off_10inches_Fz_2,Cf4_off_10inches_Fz_3,Cf4_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cf5_off_10inches_Fz_1,Cf5_off_10inches_Fz_2,Cf5_off_10inches_Fz_3,Cf5_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cf6_off_10inches_Fz_1,Cf6_off_10inches_Fz_2,Cf6_off_10inches_Fz_3,Cf6_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cf7_off_10inches_Fz_1,Cf7_off_10inches_Fz_2,Cf7_off_10inches_Fz_3,Cf7_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cf8_off_10inches_Fz_1,Cf8_off_10inches_Fz_2,Cf8_off_10inches_Fz_3,Cf8_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
errorbar(distances(1), mean([Cf1_off_10inches_Fz_1,Cf1_off_10inches_Fz_2,Cf1_off_10inches_Fz_3,Cf1_off_10inches_Fz_4]),uncert10_cf1_allFz,'o','color','k');
errorbar(distances(2), mean([Cf2_off_10inches_Fz_1,Cf2_off_10inches_Fz_2,Cf2_off_10inches_Fz_3,Cf2_off_10inches_Fz_4]),uncert10_cf2_allFz,'o','color','k');
errorbar(distances(3), mean([Cf3_off_10inches_Fz_1,Cf3_off_10inches_Fz_2,Cf3_off_10inches_Fz_3,Cf3_off_10inches_Fz_4]),uncert10_cf3_allFz,'o','color','k');
errorbar(distances(4), mean([Cf4_off_10inches_Fz_1,Cf4_off_10inches_Fz_2,Cf4_off_10inches_Fz_3,Cf4_off_10inches_Fz_4]),uncert10_cf4_allFz,'o','color','k');
errorbar(distances(5), mean([Cf5_off_10inches_Fz_1,Cf5_off_10inches_Fz_2,Cf5_off_10inches_Fz_3,Cf5_off_10inches_Fz_4]),uncert10_cf5_allFz,'o','color','k');
errorbar(distances(6), mean([Cf6_off_10inches_Fz_1,Cf6_off_10inches_Fz_2,Cf6_off_10inches_Fz_3,Cf6_off_10inches_Fz_4]),uncert10_cf6_allFz,'o','color','k');
errorbar(distances(7), mean([Cf7_off_10inches_Fz_1,Cf7_off_10inches_Fz_2,Cf7_off_10inches_Fz_3,Cf7_off_10inches_Fz_4]),uncert10_cf7_allFz,'o','color','k');
errorbar(distances(8), mean([Cf8_off_10inches_Fz_1,Cf8_off_10inches_Fz_2,Cf8_off_10inches_Fz_3,Cf8_off_10inches_Fz_4]),uncert10_cf8_allFz,'o','color','k');
plot(distances(1), mean([Cf1_off_12inches_Fz_1,Cf1_off_12inches_Fz_2,Cf1_off_12inches_Fz_3,Cf1_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cf2_off_12inches_Fz_1,Cf2_off_12inches_Fz_2,Cf2_off_12inches_Fz_3,Cf2_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cf3_off_12inches_Fz_1,Cf3_off_12inches_Fz_2,Cf3_off_12inches_Fz_3,Cf3_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cf4_off_12inches_Fz_1,Cf4_off_12inches_Fz_2,Cf4_off_12inches_Fz_3,Cf4_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cf5_off_12inches_Fz_1,Cf5_off_12inches_Fz_2,Cf5_off_12inches_Fz_3,Cf5_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cf6_off_12inches_Fz_1,Cf6_off_12inches_Fz_2,Cf6_off_12inches_Fz_3,Cf6_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cf7_off_12inches_Fz_1,Cf7_off_12inches_Fz_2,Cf7_off_12inches_Fz_3,Cf7_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cf8_off_12inches_Fz_1,Cf8_off_12inches_Fz_2,Cf8_off_12inches_Fz_3,Cf8_off_12inches_Fz_4]),'o','color','b','markersize',5,'lineWidth',2);
errorbar(distances(1), mean([Cf1_off_12inches_Fz_1,Cf1_off_12inches_Fz_2,Cf1_off_12inches_Fz_3,Cf1_off_12inches_Fz_4]),uncert12_cf1_allFz,'o','color','b');
errorbar(distances(2), mean([Cf2_off_12inches_Fz_1,Cf2_off_12inches_Fz_2,Cf2_off_12inches_Fz_3,Cf2_off_12inches_Fz_4]),uncert12_cf2_allFz,'o','color','b');
errorbar(distances(3), mean([Cf3_off_12inches_Fz_1,Cf3_off_12inches_Fz_2,Cf3_off_12inches_Fz_3,Cf3_off_12inches_Fz_4]),uncert12_cf3_allFz,'o','color','b');
errorbar(distances(4), mean([Cf4_off_12inches_Fz_1,Cf4_off_12inches_Fz_2,Cf4_off_12inches_Fz_3,Cf4_off_12inches_Fz_4]),uncert12_cf4_allFz,'o','color','b');
errorbar(distances(5), mean([Cf5_off_12inches_Fz_1,Cf5_off_12inches_Fz_2,Cf5_off_12inches_Fz_3,Cf5_off_12inches_Fz_4]),uncert12_cf5_allFz,'o','color','b');
errorbar(distances(6), mean([Cf6_off_12inches_Fz_1,Cf6_off_12inches_Fz_2,Cf6_off_12inches_Fz_3,Cf6_off_12inches_Fz_4]),uncert12_cf6_allFz,'o','color','b');
errorbar(distances(7), mean([Cf7_off_12inches_Fz_1,Cf7_off_12inches_Fz_2,Cf7_off_12inches_Fz_3,Cf7_off_12inches_Fz_4]),uncert12_cf7_allFz,'o','color','b');
errorbar(distances(8), mean([Cf8_off_12inches_Fz_1,Cf8_off_12inches_Fz_2,Cf8_off_12inches_Fz_3,Cf8_off_12inches_Fz_4]),uncert12_cf8_allFz,'o','color','b');
plot(distances(1), mean([Cf1_off_13inches_Fz_1,Cf1_off_13inches_Fz_2,Cf1_off_13inches_Fz_3,Cf1_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cf2_off_13inches_Fz_1,Cf2_off_13inches_Fz_2,Cf2_off_13inches_Fz_3,Cf2_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cf3_off_13inches_Fz_1,Cf3_off_13inches_Fz_2,Cf3_off_13inches_Fz_3,Cf3_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cf4_off_13inches_Fz_1,Cf4_off_13inches_Fz_2,Cf4_off_13inches_Fz_3,Cf4_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cf5_off_13inches_Fz_1,Cf5_off_13inches_Fz_2,Cf5_off_13inches_Fz_3,Cf5_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cf6_off_13inches_Fz_1,Cf6_off_13inches_Fz_2,Cf6_off_13inches_Fz_3,Cf6_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cf7_off_13inches_Fz_1,Cf7_off_13inches_Fz_2,Cf7_off_13inches_Fz_3,Cf7_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cf8_off_13inches_Fz_1,Cf8_off_13inches_Fz_2,Cf8_off_13inches_Fz_3,Cf8_off_13inches_Fz_4]),'o','color','r','markersize',5,'lineWidth',2);
errorbar(distances(1), mean([Cf1_off_13inches_Fz_1,Cf1_off_13inches_Fz_2,Cf1_off_13inches_Fz_3,Cf1_off_13inches_Fz_4]),uncert13_cf1_allFz,'o','color','r');
errorbar(distances(2), mean([Cf2_off_13inches_Fz_1,Cf2_off_13inches_Fz_2,Cf2_off_13inches_Fz_3,Cf2_off_13inches_Fz_4]),uncert13_cf2_allFz,'o','color','r');
errorbar(distances(3), mean([Cf3_off_13inches_Fz_1,Cf3_off_13inches_Fz_2,Cf3_off_13inches_Fz_3,Cf3_off_13inches_Fz_4]),uncert13_cf3_allFz,'o','color','r');
errorbar(distances(4), mean([Cf4_off_13inches_Fz_1,Cf4_off_13inches_Fz_2,Cf4_off_13inches_Fz_3,Cf4_off_13inches_Fz_4]),uncert13_cf4_allFz,'o','color','r');
errorbar(distances(5), mean([Cf5_off_13inches_Fz_1,Cf5_off_13inches_Fz_2,Cf5_off_13inches_Fz_3,Cf5_off_13inches_Fz_4]),uncert13_cf5_allFz,'o','color','r');
errorbar(distances(6), mean([Cf6_off_13inches_Fz_1,Cf6_off_13inches_Fz_2,Cf6_off_13inches_Fz_3,Cf6_off_13inches_Fz_4]),uncert13_cf6_allFz,'o','color','r');
errorbar(distances(7), mean([Cf7_off_13inches_Fz_1,Cf7_off_13inches_Fz_2,Cf7_off_13inches_Fz_3,Cf7_off_13inches_Fz_4]),uncert13_cf7_allFz,'o','color','r');
errorbar(distances(8), mean([Cf8_off_13inches_Fz_1,Cf8_off_13inches_Fz_2,Cf8_off_13inches_Fz_3,Cf8_off_13inches_Fz_4]),uncert13_cf8_allFz,'o','color','r');
xlabel('D/R [-]')
ylim([-0.02,0.04])
legend('10"x4.5" F$_{z\infty}$ avg','','','','','','','','','','','','','','','','12"x6" F$_{z\infty}$ avg','','','','','','','','','','','','','','','','13"x6.5" F$_{z\infty}$ avg')
ylabel('C$_F$ [-]')



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
uncert_ct_10inch_txc =      [uncert_Ct_txc1_10inch_Fz1,uncert_Ct_txc2_10inch_Fz1,uncert_Ct_txc3_10inch_Fz1,uncert_Ct_txc4_10inch_Fz1,uncert_Ct_txc5_10inch_Fz1,uncert_Ct_txc6_10inch_Fz1;
                             uncert_Ct_txc1_10inch_Fz2,uncert_Ct_txc2_10inch_Fz2,uncert_Ct_txc3_10inch_Fz2,uncert_Ct_txc4_10inch_Fz2,uncert_Ct_txc5_10inch_Fz2,uncert_Ct_txc6_10inch_Fz2;
                             uncert_Ct_txc1_10inch_RPM1,uncert_Ct_txc2_10inch_RPM1,uncert_Ct_txc3_10inch_RPM1,uncert_Ct_txc4_10inch_RPM1,uncert_Ct_txc5_10inch_RPM1,uncert_Ct_txc6_10inch_RPM1;
                             uncert_Ct_txc1_10inch_RPM2,uncert_Ct_txc2_10inch_RPM2,uncert_Ct_txc3_10inch_RPM2,uncert_Ct_txc4_10inch_RPM2,uncert_Ct_txc5_10inch_RPM2,uncert_Ct_txc6_10inch_RPM2];                       
coefs_12inch_txc =      [Ct_txc1_12inch_Fz1,Ct_txc2_12inch_Fz1,Ct_txc3_12inch_Fz1,Ct_txc4_12inch_Fz1,Ct_txc5_12inch_Fz1,Ct_txc6_12inch_Fz1;
                         Ct_txc1_12inch_Fz2,Ct_txc2_12inch_Fz2,Ct_txc3_12inch_Fz2,Ct_txc4_12inch_Fz2,Ct_txc5_12inch_Fz2,Ct_txc6_12inch_Fz2;
                         Ct_txc1_12inch_RPM1,Ct_txc2_12inch_RPM1,Ct_txc3_12inch_RPM1,Ct_txc4_12inch_RPM1,Ct_txc5_12inch_RPM1,Ct_txc6_12inch_RPM1;
                         Ct_txc1_12inch_RPM2,Ct_txc2_12inch_RPM2,Ct_txc3_12inch_RPM2,Ct_txc4_12inch_RPM2,Ct_txc5_12inch_RPM2,Ct_txc6_12inch_RPM2];  
uncert_ct_12inch_txc =      [uncert_Ct_txc1_12inch_Fz1,uncert_Ct_txc2_12inch_Fz1,uncert_Ct_txc3_12inch_Fz1,uncert_Ct_txc4_12inch_Fz1,uncert_Ct_txc5_12inch_Fz1,uncert_Ct_txc6_12inch_Fz1;
                             uncert_Ct_txc1_12inch_Fz2,uncert_Ct_txc2_12inch_Fz2,uncert_Ct_txc3_12inch_Fz2,uncert_Ct_txc4_12inch_Fz2,uncert_Ct_txc5_12inch_Fz2,uncert_Ct_txc6_12inch_Fz2;
                             uncert_Ct_txc1_12inch_RPM1,uncert_Ct_txc2_12inch_RPM1,uncert_Ct_txc3_12inch_RPM1,uncert_Ct_txc4_12inch_RPM1,uncert_Ct_txc5_12inch_RPM1,uncert_Ct_txc6_12inch_RPM1;
                             uncert_Ct_txc1_12inch_RPM2,uncert_Ct_txc2_12inch_RPM2,uncert_Ct_txc3_12inch_RPM2,uncert_Ct_txc4_12inch_RPM2,uncert_Ct_txc5_12inch_RPM2,uncert_Ct_txc6_12inch_RPM2];
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
uncert_coefs_10inch_du =      [uncert10_ct1_Fz_1,uncert10_ct2_Fz_1,uncert10_ct3_Fz_1,uncert10_ct4_Fz_1,uncert10_ct5_Fz_1,uncert10_ct6_Fz_1,uncert10_ct7_Fz_1,uncert10_ct8_Fz_1;
                               uncert10_ct1_Fz_2,uncert10_ct2_Fz_2,uncert10_ct3_Fz_2,uncert10_ct4_Fz_2,uncert10_ct5_Fz_2,uncert10_ct6_Fz_2,uncert10_ct7_Fz_2,uncert10_ct8_Fz_2;
                               uncert10_ct1_Fz_3,uncert10_ct2_Fz_3,uncert10_ct3_Fz_3,uncert10_ct4_Fz_3,uncert10_ct5_Fz_3,uncert10_ct6_Fz_3,uncert10_ct7_Fz_3,uncert10_ct8_Fz_3;
                               uncert10_ct1_Fz_4,uncert10_ct2_Fz_4,uncert10_ct3_Fz_4,uncert10_ct4_Fz_4,uncert10_ct5_Fz_4,uncert10_ct6_Fz_4,uncert10_ct7_Fz_4,uncert10_ct8_Fz_4;
                               uncert10_ct1_RPM_1,uncert10_ct2_RPM_1,uncert10_ct3_RPM_1,uncert10_ct4_RPM_1,uncert10_ct5_RPM_1,uncert10_ct6_RPM_1,uncert10_ct7_RPM_1,uncert10_ct8_RPM_1];
coefs_12inch_du =      [Ct1_off_12inches_Fz_1,Ct2_off_12inches_Fz_1,Ct3_off_12inches_Fz_1,Ct4_off_12inches_Fz_1,Ct5_off_12inches_Fz_1,Ct6_off_12inches_Fz_1,Ct7_off_12inches_Fz_1,Ct8_off_12inches_Fz_1;
                         Ct1_off_12inches_Fz_2,Ct2_off_12inches_Fz_2,Ct3_off_12inches_Fz_2,Ct4_off_12inches_Fz_2,Ct5_off_12inches_Fz_2,Ct6_off_12inches_Fz_2,Ct7_off_12inches_Fz_2,Ct8_off_12inches_Fz_2;
                         Ct1_off_12inches_Fz_3,Ct2_off_12inches_Fz_3,Ct3_off_12inches_Fz_3,Ct4_off_12inches_Fz_3,Ct5_off_12inches_Fz_3,Ct6_off_12inches_Fz_3,Ct7_off_12inches_Fz_3,Ct8_off_12inches_Fz_3;
                         Ct1_off_12inches_Fz_4,Ct2_off_12inches_Fz_4,Ct3_off_12inches_Fz_4,Ct4_off_12inches_Fz_4,Ct5_off_12inches_Fz_4,Ct6_off_12inches_Fz_4,Ct7_off_12inches_Fz_4,Ct8_off_12inches_Fz_4;
                         Ct1_off_12inches_RPM_1,Ct2_off_12inches_RPM_1,Ct3_off_12inches_RPM_1,Ct4_off_12inches_RPM_1,Ct5_off_12inches_RPM_1,Ct6_off_12inches_RPM_1,Ct7_off_12inches_RPM_1,Ct8_off_12inches_RPM_1];
uncert_coefs_12inch_du =      [uncert12_ct1_Fz_1,uncert12_ct2_Fz_1,uncert12_ct3_Fz_1,uncert12_ct4_Fz_1,uncert12_ct5_Fz_1,uncert12_ct6_Fz_1,uncert12_ct7_Fz_1,uncert12_ct8_Fz_1;
                               uncert12_ct1_Fz_2,uncert12_ct2_Fz_2,uncert12_ct3_Fz_2,uncert12_ct4_Fz_2,uncert12_ct5_Fz_2,uncert12_ct6_Fz_2,uncert12_ct7_Fz_2,uncert12_ct8_Fz_2;
                               uncert12_ct1_Fz_3,uncert12_ct2_Fz_3,uncert12_ct3_Fz_3,uncert12_ct4_Fz_3,uncert12_ct5_Fz_3,uncert12_ct6_Fz_3,uncert12_ct7_Fz_3,uncert12_ct8_Fz_3;
                               uncert12_ct1_Fz_4,uncert12_ct2_Fz_4,uncert12_ct3_Fz_4,uncert12_ct4_Fz_4,uncert12_ct5_Fz_4,uncert12_ct6_Fz_4,uncert12_ct7_Fz_4,uncert12_ct8_Fz_4;
                               uncert12_ct1_RPM_1,uncert12_ct2_RPM_1,uncert12_ct3_RPM_1,uncert12_ct4_RPM_1,uncert12_ct5_RPM_1,uncert12_ct6_RPM_1,uncert12_ct7_RPM_1,uncert12_ct8_RPM_1];
coefs_13inch_du =       [Ct1_off_13inches_Fz_1,Ct2_off_13inches_Fz_1,Ct3_off_13inches_Fz_1,Ct4_off_13inches_Fz_1,Ct5_off_13inches_Fz_1,Ct6_off_13inches_Fz_1,Ct7_off_13inches_Fz_1,Ct8_off_13inches_Fz_1;
                         Ct1_off_13inches_Fz_2,Ct2_off_13inches_Fz_2,Ct3_off_13inches_Fz_2,Ct4_off_13inches_Fz_2,Ct5_off_13inches_Fz_2,Ct6_off_13inches_Fz_2,Ct7_off_13inches_Fz_2,Ct8_off_13inches_Fz_2;
                         Ct1_off_13inches_Fz_3,Ct2_off_13inches_Fz_3,Ct3_off_13inches_Fz_3,Ct4_off_13inches_Fz_3,Ct5_off_13inches_Fz_3,Ct6_off_13inches_Fz_3,Ct7_off_13inches_Fz_3,Ct8_off_13inches_Fz_3;
                         Ct1_off_13inches_Fz_4,Ct2_off_13inches_Fz_4,Ct3_off_13inches_Fz_4,Ct4_off_13inches_Fz_4,Ct5_off_13inches_Fz_4,Ct6_off_13inches_Fz_4,Ct7_off_13inches_Fz_4,Ct8_off_13inches_Fz_4;
                         Ct1_off_13inches_RPM_1,Ct2_off_13inches_RPM_1,Ct3_off_13inches_RPM_1,Ct4_off_13inches_RPM_1,Ct5_off_13inches_RPM_1,Ct6_off_13inches_RPM_1,Ct7_off_13inches_RPM_1,Ct8_off_13inches_RPM_1];
uncert_coefs_13inch_du =      [uncert13_ct1_Fz_1,uncert13_ct2_Fz_1,uncert13_ct3_Fz_1,uncert13_ct4_Fz_1,uncert13_ct5_Fz_1,uncert13_ct6_Fz_1,uncert13_ct7_Fz_1,uncert13_ct8_Fz_1;
                               uncert13_ct1_Fz_2,uncert13_ct2_Fz_2,uncert13_ct3_Fz_2,uncert13_ct4_Fz_2,uncert13_ct5_Fz_2,uncert13_ct6_Fz_2,uncert13_ct7_Fz_2,uncert13_ct8_Fz_2;
                               uncert13_ct1_Fz_3,uncert13_ct2_Fz_3,uncert13_ct3_Fz_3,uncert13_ct4_Fz_3,uncert13_ct5_Fz_3,uncert13_ct6_Fz_3,uncert13_ct7_Fz_3,uncert13_ct8_Fz_3;
                               uncert13_ct1_Fz_4,uncert13_ct2_Fz_4,uncert13_ct3_Fz_4,uncert13_ct4_Fz_4,uncert13_ct5_Fz_4,uncert13_ct6_Fz_4,uncert13_ct7_Fz_4,uncert13_ct8_Fz_4;
                               uncert13_ct1_RPM_1,uncert13_ct2_RPM_1,uncert13_ct3_RPM_1,uncert13_ct4_RPM_1,uncert13_ct5_RPM_1,uncert13_ct6_RPM_1,uncert13_ct7_RPM_1,uncert13_ct8_RPM_1];



figure()
hold on;grid minor;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,'x','color','k','markersize',5,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,'x','color','b','markersize',5,'lineWidth',2)
plot(mean(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)),mean(mean(coefs_10inch_txc)),'*','color','m','markersize',5,'lineWidth',2)
plot(mean(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)),mean(mean(coefs_12inch_txc)),'*','color','m','markersize',5,'lineWidth',2)
plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',5,'lineWidth',2)
plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',5,'lineWidth',2)
plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',5,'lineWidth',2)
plot(mean(rho_10inch_du(1,:)./rho_10inch_du(1,:)),mean(mean(coefs_10inch_du)),'*','color','m','markersize',5,'lineWidth',2)
plot(mean(rho_12inch_du(1,:)./rho_12inch_du(1,:)),mean(mean(coefs_12inch_du)),'*','color','m','markersize',5,'lineWidth',2)
plot(mean(rho_13inch_du(1,:)./rho_13inch_du(1,:)),mean(mean(coefs_13inch_du)),'*','color','m','markersize',5,'lineWidth',2)
% errorbar(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,uncert_ct_10inch_txc,'x','color','k','markersize',5)
% errorbar(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,uncert_ct_12inch_txc,'x','color','b','markersize',5)
% errorbar(rho_10inch_du./rho_10inch_du,coefs_10inch_du,uncert_coefs_10inch_du,'o','color','k','markersize',5)
% errorbar(rho_12inch_du./rho_12inch_du,coefs_12inch_du,uncert_coefs_12inch_du,'o','color','b','markersize',5)
% errorbar(rho_13inch_du./rho_13inch_du,coefs_13inch_du,uncert_coefs_13inch_du,'o','color','r','markersize',5)
xlabel('$\rho/\rho_{DU}$ [-]','FontSize',15)
% ylabel('Temperature [\circ C]')
ylabel('c$_T$ [-]','FontSize',15)
legend('10"x4.7" tXc', '', '', '' ,'' ,'' ,'12"x5" tXc', '', '', '' ,'' ,'' ,'','','10"x4.5" DU', '', '', '' ,'' ,'' ,'','','12"x6" DU', '', '', '' ,'' ,'' ,'','','13"x6.5" DU', '', '', '' ,'' ,'' ,'','','Location','best','fontsize',13)
xlim([0.95,1.25])
ylim([0.5,1.1])

htmlGray = [128 128 128]/255;

figure()
hold on;grid minor;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc.*(rho_10inch_txc./rho_10inch_du(1:4,1:6)),'x','color','k','markersize',5,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc.*(rho_12inch_txc./rho_12inch_du(1:4,1:6)),'x','color','b','markersize',5,'lineWidth',2)
plot(mean(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)),mean(mean(coefs_10inch_txc.*(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)))),'*','color','m','markersize',5,'lineWidth',2)
plot(mean(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)),mean(mean(coefs_12inch_txc.*(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)))),'*','color','m','markersize',5,'lineWidth',2)
% plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,'x','color',htmlGray,'markersize',5,'lineWidth',2)
% plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,'x','color','c','markersize',5,'lineWidth',2)
plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',5,'lineWidth',2)
plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',5,'lineWidth',2)
plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',5,'lineWidth',2)
plot(mean(rho_10inch_du(1,:)./rho_10inch_du(1,:)),mean(mean(coefs_10inch_du)),'*','color','m','markersize',5,'lineWidth',2)
plot(mean(rho_12inch_du(1,:)./rho_12inch_du(1,:)),mean(mean(coefs_12inch_du)),'*','color','m','markersize',5,'lineWidth',2)
plot(mean(rho_13inch_du(1,:)./rho_13inch_du(1,:)),mean(mean(coefs_13inch_du)),'*','color','m','markersize',5,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',5,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',5,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',5,'lineWidth',2)
% plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',5,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',5,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',5,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',5,'lineWidth',2)
% plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',5,'lineWidth',2)
xlabel('$\rho/\rho_{DU}$ [-]','FontSize',15)
% ylabel('Temperature [\circ C]')
ylabel('c$_T\cdot\frac{\rho}{\rho_{DU}}$ @ 4000 RPM [-]','FontSize',15)
legend('10"x4.7" tXc', '', '', '' ,'' ,'' ,'12"x5" tXc', '', '', '' ,'' ,'' , '', '','10"x4.5" DU', '', '', '' ,'' ,'' ,'','','12"x6" DU', '', '', '' ,'' ,'' ,'','','13"x6.5" DU', '', '', '' ,'' ,'' ,'','', 'Average','Location','best','fontsize',13)
xlim([0.9,1.3])



figure()
hold on;grid minor;
% surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc./coefs_10inch_txc(:,6),'x','color','k','markersize',5,'lineWidth',2)
plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc./coefs_12inch_txc(:,6),'x','color','b','markersize',5,'lineWidth',2)
plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du./coefs_10inch_du(:,8),'o','color','k','markersize',5,'lineWidth',2)
plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du./coefs_12inch_du(:,8),'o','color','b','markersize',5,'lineWidth',2)
plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du./coefs_13inch_du(:,8),'o','color','r','markersize',5,'lineWidth',2)
xlabel('$\rho/\rho_{DU}$ [-]','FontSize',15)
% ylabel('Temperature [\circ C]')
ylabel('c$_T/c_{T\infty}$ [-]','FontSize',15)
legend('10"x4.7" tXc', '', '', '' ,'' ,'' ,'12"x5" tXc', '', '', '' ,'', '' ,'' ,'' ,'','10"x4.5" DU', '', '', '' ,'' ,'' ,'12"x6" DU','' ,'' ,'','', '', '', '' ,'' ,'' ,'','13"x6.5" DU', '','','','12"x6" txc', '13"x6.5" DU', '', '', '' ,'' ,'' ,'','','Location','best','fontsize',13)
xlim([0.95,1.25])
ylim([0.95,1.2])

unc_10_du  =[];
unc_12_du  =[];
unc_13_du  =[];
unc_10_txc =[];
unc_12_txc =[];

figure()
% subplot(2,1,1)
hold on;grid minor;
for i=1:length(coefs_10inch_du)
    plot(distances(:,i),coefs_10inch_du(:,i)./coefs_10inch_du(:,1),'o','color','k','markersize',5,'lineWidth',2);
    plot(distances(:,i),coefs_12inch_du(:,i)./coefs_12inch_du(:,1),'o','color','b','markersize',5,'lineWidth',2);
    plot(distances(:,i),coefs_13inch_du(:,i)./coefs_13inch_du(:,1),'o','color','r','markersize',5,'lineWidth',2);
end
for i=1:length(coefs_10inch_txc)
    plot(distances_txc(:,i),coefs_10inch_txc(:,i)./coefs_10inch_txc(:,6),'x','color','k','markersize',5,'lineWidth',2);
    plot(distances_txc(:,i),coefs_12inch_txc(:,i)./coefs_12inch_txc(:,6),'x','color','b','markersize',5,'lineWidth',2);
end
legend('10"x4.5" DU', '', '', '' ,'','12"x6" DU', '', '', '' ,'', '13"x6.5" DU', '' , '', '' ,'' ,'', '' ,'','','' ,'' ,'' ,'', '', '', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'' ,'', '', '', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'', '', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'' ,'', '', '' ,'' ,'','' ,'' ,'','10"x4.7" tXc','' ,'' ,'','', '', '', '' ,'' ,'' ,'','12"x5" tXc','Location','best','fontsize',13)
ylim([0.95,1.2])
% subplot(2,1,2)
% hold on;grid on
% for i=1:length(coefs_10inch_du)
%     unc_10_du = [unc_10_du,sqrt((1./coefs_10inch_du(:,1).*uncert_coefs_10inch_du(:,i)).^2+(coefs_10inch_du(:,i)./(coefs_10inch_du(:,1).^2).*uncert_coefs_10inch_du(:,1)).^2)];
%     unc_12_du = [unc_12_du,sqrt((1./coefs_12inch_du(:,1).*uncert_coefs_12inch_du(:,i)).^2+(coefs_12inch_du(:,i)./(coefs_12inch_du(:,1).^2).*uncert_coefs_12inch_du(:,1)).^2)];
%     unc_13_du = [unc_13_du,sqrt((1./coefs_13inch_du(:,1).*uncert_coefs_13inch_du(:,i)).^2+(coefs_13inch_du(:,i)./(coefs_13inch_du(:,1).^2).*uncert_coefs_13inch_du(:,1)).^2)];
%     errorbar(distances(:,i),coefs_10inch_du(:,i)./coefs_10inch_du(:,1),unc_10_du(:,i),'o','color','k','markersize',5,'lineWidth',1.5);
%     errorbar(distances(:,i),coefs_12inch_du(:,i)./coefs_12inch_du(:,1),unc_12_du(:,i),'o','color','b','markersize',5,'lineWidth',1.5);
%     errorbar(distances(:,i),coefs_13inch_du(:,i)./coefs_13inch_du(:,1),unc_13_du(:,i),'o','color','r','markersize',5,'lineWidth',1.5);
% end
% for i=1:length(coefs_10inch_txc)
%     unc_10_txc = [unc_10_txc,sqrt((1./coefs_10inch_txc(:,6).*uncert_ct_10inch_txc(:,i)).^2+(coefs_10inch_txc(:,i)./(coefs_10inch_txc(:,6).^2).*uncert_ct_10inch_txc(:,6)).^2)];
%     unc_12_txc = [unc_12_txc,sqrt((1./coefs_12inch_txc(:,6).*uncert_ct_12inch_txc(:,i)).^2+(coefs_12inch_txc(:,i)./(coefs_12inch_txc(:,6).^2).*uncert_ct_12inch_txc(:,6)).^2)];
%     errorbar(distances_txc(:,i),coefs_10inch_txc(:,i)./coefs_10inch_txc(:,6),unc_10_txc(:,i),'x','color','k','markersize',5,'lineWidth',1.5);
%     errorbar(distances_txc(:,i),coefs_12inch_txc(:,i)./coefs_12inch_txc(:,6),unc_12_txc(:,i),'x','color','b','markersize',5,'lineWidth',1.5);
% end
xlabel('$D/R$ [-]','FontSize',15)
% ylim([0.95,1.2])
ylabel('c$_T/c_{T\infty}$ [-]','FontSize',15)
% legend('10"x4.7" tXc','','','','','','12"x5" tXc','','','','','','10"x4.5" DU','','','','','','','','12"x6" DU','','','','','','','','13"x6.5" DU')

% REU_10txc = unc_10_txc./(coefs_10inch_txc./coefs_10inch_txc(:,6))*100;
% REU_12txc = unc_12_txc./(coefs_12inch_txc./coefs_12inch_txc(:,6))*100;
% REU_10du = unc_10_du./(coefs_10inch_du./coefs_10inch_du(:,1))*100;
% REU_12du = unc_12_du./(coefs_12inch_du./coefs_12inch_du(:,1))*100;
% REU_13du = unc_13_du./(coefs_13inch_du./coefs_13inch_du(:,1))*100;



% figure()
% hold on;grid minor;
% % surf(temps_10inch_txc,press_10inch_txc,coefs_10inch_txc)
% plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc.*(rho_10inch_txc./rho_10inch_du(1:4,1:6)),'x','color','k','markersize',5,'lineWidth',2)
% plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc.*(rho_12inch_txc./rho_12inch_du(1:4,1:6)),'x','color','b','markersize',5,'lineWidth',2)
% plot(mean(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)),mean(mean(coefs_10inch_txc.*(rho_10inch_txc(1,:)./rho_10inch_du(1,1:6)))),'*','color','m','markersize',5,'lineWidth',2)
% plot(mean(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)),mean(mean(coefs_12inch_txc.*(rho_12inch_txc(1,:)./rho_12inch_du(1,1:6)))),'*','color','m','markersize',5,'lineWidth',2)
% plot(rho_10inch_txc./rho_10inch_du(1:4,1:6),coefs_10inch_txc,'o','color',htmlGray,'markersize',5,'lineWidth',2)
% plot(rho_12inch_txc./rho_12inch_du(1:4,1:6),coefs_12inch_txc,'o','color','c','markersize',5,'lineWidth',2)
% % plot(rho_10inch_du./rho_10inch_du,coefs_10inch_du,'o','color','k','markersize',5,'lineWidth',2)
% % plot(rho_12inch_du./rho_12inch_du,coefs_12inch_du,'o','color','b','markersize',5,'lineWidth',2)
% % plot(rho_13inch_du./rho_13inch_du,coefs_13inch_du,'o','color','r','markersize',5,'lineWidth',2)
% % plot(mean(rho_10inch_du(1,:)./rho_10inch_du(1,:)),mean(mean(coefs_10inch_du)),'*','color','m','markersize',5,'lineWidth',2)
% % plot(mean(rho_12inch_du(1,:)./rho_12inch_du(1,:)),mean(mean(coefs_12inch_du)),'*','color','m','markersize',5,'lineWidth',2)
% % plot(mean(rho_13inch_du(1,:)./rho_13inch_du(1,:)),mean(mean(coefs_13inch_du)),'*','color','m','markersize',5,'lineWidth',2)
% % plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_1,'x','color','b','markersize',5,'lineWidth',2)
% % plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_Fz_2,'x','color','b','markersize',5,'lineWidth',2)
% % plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_1,'x','color','b','markersize',5,'lineWidth',2)
% % plot3(Pres1_10inch, Temp1_10inch, Ct1_off_10inches_RPM_2,'x','color','b','markersize',5,'lineWidth',2)
% % plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_1,'x','color','b','markersize',5,'lineWidth',2)
% % plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_Fz_2,'x','color','b','markersize',5,'lineWidth',2)
% % plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_1,'x','color','b','markersize',5,'lineWidth',2)
% % plot3(Pres2_10inch, Temp2_10inch, Ct2_off_10inches_RPM_2,'x','color','b','markersize',5,'lineWidth',2)
% xlabel('$\rho/\rho_{DU}$ [-]','FontSize',15)
% % ylabel('Temperature [\circ C]')
% ylabel('c$_T\cdot\frac{\rho}{\rho_{DU}}$ @ 4000 RPM [-]','FontSize',15)
% legend('10"x4.7" tXc', '', '', '' ,'' ,'' ,'12"x5" tXc', '', '', '' ,'' ,'' , '', '','10"x4.5" DU', '', '', '' ,'' ,'' ,'','','12"x6" DU', '', '', '' ,'' ,'' ,'','','13"x6.5" DU', '', '', '' ,'' ,'' ,'','', 'Average','Location','best','fontsize',13)
% xlim([0.9,1.3])


%{
figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), Cm1_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), Cf1_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_1,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_1,'o','color','r','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 8 N','','','','','','','','12"x6" 8 N','','','','','','','','13"x6.5" 8 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')




figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), Cm1_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), Cf1_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_3,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_3,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 12 N','','','','','','','','12"x6" 12 N','','','','','','','','13"x6.5" 12 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')


figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), Cm1_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), Cf1_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_10inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5" 8 N','','','','','','','','10"x4.5" 10 N','','','','','','','','10"x4.5" 12 N','','','','','','','','10"x4.5" 14 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')

figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), Cm1_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), Cf1_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_12inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('12"x6" 8 N','','','','','','','','12"x6" 10 N','','','','','','','','12"x6" 12 N','','','','','','','','12"x6" 14 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')



figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), Cm1_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(1), Cm1_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(2), Cm2_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(3), Cm3_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(4), Cm4_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(5), Cm5_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(6), Cm6_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(7), Cm7_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(8), Cm8_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), Cf1_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_1,'o','color','k','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_2,'o','color','b','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_3,'o','color','r','markersize',5,'lineWidth',2);
plot(distances(1), Cf1_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(2), Cf2_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(3), Cf3_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(4), Cf4_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(5), Cf5_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(6), Cf6_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(7), Cf7_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
plot(distances(8), Cf8_off_13inches_Fz_4,'o','color','m','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('13"x6.5" 8 N','','','','','','','',' 10 N','','','','','','','','12 N','','','','','','','','14 N')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')


figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), mean([Cm1_off_10inches_Fz_1,Cm1_off_10inches_Fz_2,Cm1_off_10inches_Fz_3,Cm1_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cm2_off_10inches_Fz_1,Cm2_off_10inches_Fz_2,Cm2_off_10inches_Fz_3,Cm2_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cm3_off_10inches_Fz_1,Cm3_off_10inches_Fz_2,Cm3_off_10inches_Fz_3,Cm3_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cm4_off_10inches_Fz_1,Cm4_off_10inches_Fz_2,Cm4_off_10inches_Fz_3,Cm4_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cm5_off_10inches_Fz_1,Cm5_off_10inches_Fz_2,Cm5_off_10inches_Fz_3,Cm5_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cm6_off_10inches_Fz_1,Cm6_off_10inches_Fz_2,Cm6_off_10inches_Fz_3,Cm6_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cm7_off_10inches_Fz_1,Cm7_off_10inches_Fz_2,Cm7_off_10inches_Fz_3,Cm7_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cm8_off_10inches_Fz_1,Cm8_off_10inches_Fz_2,Cm8_off_10inches_Fz_3,Cm8_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), mean([Cf1_off_10inches_Fz_1,Cf1_off_10inches_Fz_2,Cf1_off_10inches_Fz_3,Cf1_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cf2_off_10inches_Fz_1,Cf2_off_10inches_Fz_2,Cf2_off_10inches_Fz_3,Cf2_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cf3_off_10inches_Fz_1,Cf3_off_10inches_Fz_2,Cf3_off_10inches_Fz_3,Cf3_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cf4_off_10inches_Fz_1,Cf4_off_10inches_Fz_2,Cf4_off_10inches_Fz_3,Cf4_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cf5_off_10inches_Fz_1,Cf5_off_10inches_Fz_2,Cf5_off_10inches_Fz_3,Cf5_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cf6_off_10inches_Fz_1,Cf6_off_10inches_Fz_2,Cf6_off_10inches_Fz_3,Cf6_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cf7_off_10inches_Fz_1,Cf7_off_10inches_Fz_2,Cf7_off_10inches_Fz_3,Cf7_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cf8_off_10inches_Fz_1,Cf8_off_10inches_Fz_2,Cf8_off_10inches_Fz_3,Cf8_off_10inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('10"x4.5"')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')


figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), mean([Cm1_off_12inches_Fz_1,Cm1_off_12inches_Fz_2,Cm1_off_12inches_Fz_3,Cm1_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cm2_off_12inches_Fz_1,Cm2_off_12inches_Fz_2,Cm2_off_12inches_Fz_3,Cm2_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cm3_off_12inches_Fz_1,Cm3_off_12inches_Fz_2,Cm3_off_12inches_Fz_3,Cm3_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cm4_off_12inches_Fz_1,Cm4_off_12inches_Fz_2,Cm4_off_12inches_Fz_3,Cm4_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cm5_off_12inches_Fz_1,Cm5_off_12inches_Fz_2,Cm5_off_12inches_Fz_3,Cm5_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cm6_off_12inches_Fz_1,Cm6_off_12inches_Fz_2,Cm6_off_12inches_Fz_3,Cm6_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cm7_off_12inches_Fz_1,Cm7_off_12inches_Fz_2,Cm7_off_12inches_Fz_3,Cm7_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cm8_off_12inches_Fz_1,Cm8_off_12inches_Fz_2,Cm8_off_12inches_Fz_3,Cm8_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), mean([Cf1_off_12inches_Fz_1,Cf1_off_12inches_Fz_2,Cf1_off_12inches_Fz_3,Cf1_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cf2_off_12inches_Fz_1,Cf2_off_12inches_Fz_2,Cf2_off_12inches_Fz_3,Cf2_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cf3_off_12inches_Fz_1,Cf3_off_12inches_Fz_2,Cf3_off_12inches_Fz_3,Cf3_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cf4_off_12inches_Fz_1,Cf4_off_12inches_Fz_2,Cf4_off_12inches_Fz_3,Cf4_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cf5_off_12inches_Fz_1,Cf5_off_12inches_Fz_2,Cf5_off_12inches_Fz_3,Cf5_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cf6_off_12inches_Fz_1,Cf6_off_12inches_Fz_2,Cf6_off_12inches_Fz_3,Cf6_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cf7_off_12inches_Fz_1,Cf7_off_12inches_Fz_2,Cf7_off_12inches_Fz_3,Cf7_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cf8_off_12inches_Fz_1,Cf8_off_12inches_Fz_2,Cf8_off_12inches_Fz_3,Cf8_off_12inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('12"x6"')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')







figure()
subplot(2,1,1)
hold on; grid minor;
plot(distances(1), mean([Cm1_off_13inches_Fz_1,Cm1_off_13inches_Fz_2,Cm1_off_13inches_Fz_3,Cm1_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cm2_off_13inches_Fz_1,Cm2_off_13inches_Fz_2,Cm2_off_13inches_Fz_3,Cm2_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cm3_off_13inches_Fz_1,Cm3_off_13inches_Fz_2,Cm3_off_13inches_Fz_3,Cm3_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cm4_off_13inches_Fz_1,Cm4_off_13inches_Fz_2,Cm4_off_13inches_Fz_3,Cm4_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cm5_off_13inches_Fz_1,Cm5_off_13inches_Fz_2,Cm5_off_13inches_Fz_3,Cm5_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cm6_off_13inches_Fz_1,Cm6_off_13inches_Fz_2,Cm6_off_13inches_Fz_3,Cm6_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cm7_off_13inches_Fz_1,Cm7_off_13inches_Fz_2,Cm7_off_13inches_Fz_3,Cm7_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cm8_off_13inches_Fz_1,Cm8_off_13inches_Fz_2,Cm8_off_13inches_Fz_3,Cm8_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
% legend('10"x4.5"','','','','','','','','12"x6"','','','','','','','','13"x6.5"')
ylabel('C$_m$ [-]')
subplot(2,1,2)
hold on; grid minor;
plot(distances(1), mean([Cf1_off_13inches_Fz_1,Cf1_off_13inches_Fz_2,Cf1_off_13inches_Fz_3,Cf1_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(2), mean([Cf2_off_13inches_Fz_1,Cf2_off_13inches_Fz_2,Cf2_off_13inches_Fz_3,Cf2_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(3), mean([Cf3_off_13inches_Fz_1,Cf3_off_13inches_Fz_2,Cf3_off_13inches_Fz_3,Cf3_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(4), mean([Cf4_off_13inches_Fz_1,Cf4_off_13inches_Fz_2,Cf4_off_13inches_Fz_3,Cf4_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(5), mean([Cf5_off_13inches_Fz_1,Cf5_off_13inches_Fz_2,Cf5_off_13inches_Fz_3,Cf5_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(6), mean([Cf6_off_13inches_Fz_1,Cf6_off_13inches_Fz_2,Cf6_off_13inches_Fz_3,Cf6_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(7), mean([Cf7_off_13inches_Fz_1,Cf7_off_13inches_Fz_2,Cf7_off_13inches_Fz_3,Cf7_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
plot(distances(8), mean([Cf8_off_13inches_Fz_1,Cf8_off_13inches_Fz_2,Cf8_off_13inches_Fz_3,Cf8_off_13inches_Fz_4]),'o','color','k','markersize',5,'lineWidth',2);
% xlabel('Segment [-]')
legend('13"x6.5"')
xlabel('D/R [-]')
% legend('10"x4.5" 4000 RPM','','','','','','12"x6" 4000 RPM','','','','','','10"x4.5" 12.8N','','','','','','12"x6" 12.8N','','','','','')
ylabel('C$_f$ [-]')

%}


wall.Fz10_1 = F_z1_off_10inches;
wall.Fz10_2 = F_z2_off_10inches;
wall.Fz10_3 = F_z3_off_10inches;
wall.Fz10_4 = F_z4_off_10inches;
wall.Fz10_5 = F_z5_off_10inches;
wall.Fz10_6 = F_z6_off_10inches;
wall.Fz10_7 = F_z7_off_10inches;
wall.Fz10_8 = F_z8_off_10inches;
wall.Fz12_1 = F_z1_off_12inches;
wall.Fz12_2 = F_z2_off_12inches;
wall.Fz12_3 = F_z3_off_12inches;
wall.Fz12_4 = F_z4_off_12inches;
wall.Fz12_5 = F_z5_off_12inches;
wall.Fz12_6 = F_z6_off_12inches;
wall.Fz12_7 = F_z7_off_12inches;
wall.Fz12_8 = F_z8_off_12inches;
wall.Fz13_1 = F_z1_off_13inches;
wall.Fz13_2 = F_z2_off_13inches;
wall.Fz13_3 = F_z3_off_13inches;
wall.Fz13_4 = F_z4_off_13inches;
wall.Fz13_5 = F_z5_off_13inches;
wall.Fz13_6 = F_z6_off_13inches;
wall.Fz13_7 = F_z7_off_13inches;
wall.Fz13_8 = F_z8_off_13inches;
wall.Fhtal10_1 = F_htal1_off_10inches;
wall.Fhtal10_2 = F_htal2_off_10inches;
wall.Fhtal10_3 = F_htal3_off_10inches;
wall.Fhtal10_4 = F_htal4_off_10inches;
wall.Fhtal10_5 = F_htal5_off_10inches;
wall.Fhtal10_6 = F_htal6_off_10inches;
wall.Fhtal10_7 = F_htal7_off_10inches;
wall.Fhtal10_8 = F_htal8_off_10inches;
wall.Fhtal12_1 = F_htal1_off_12inches;
wall.Fhtal12_2 = F_htal2_off_12inches;
wall.Fhtal12_3 = F_htal3_off_12inches;
wall.Fhtal12_4 = F_htal4_off_12inches;
wall.Fhtal12_5 = F_htal5_off_12inches;
wall.Fhtal12_6 = F_htal6_off_12inches;
wall.Fhtal12_7 = F_htal7_off_12inches;
wall.Fhtal12_8 = F_htal8_off_12inches;
wall.Fhtal13_1 = F_htal1_off_13inches;
wall.Fhtal13_2 = F_htal2_off_13inches;
wall.Fhtal13_3 = F_htal3_off_13inches;
wall.Fhtal13_4 = F_htal4_off_13inches;
wall.Fhtal13_5 = F_htal5_off_13inches;
wall.Fhtal13_6 = F_htal6_off_13inches;
wall.Fhtal13_7 = F_htal7_off_13inches;
wall.Fhtal13_8 = F_htal8_off_13inches;
wall.Mhtal10_1 = M_htal1_off_10inches;
wall.Mhtal10_2 = M_htal2_off_10inches;
wall.Mhtal10_3 = M_htal3_off_10inches;
wall.Mhtal10_4 = M_htal4_off_10inches;
wall.Mhtal10_5 = M_htal5_off_10inches;
wall.Mhtal10_6 = M_htal6_off_10inches;
wall.Mhtal10_7 = M_htal7_off_10inches;
wall.Mhtal10_8 = M_htal8_off_10inches;
wall.Mhtal12_1 = M_htal1_off_12inches;
wall.Mhtal12_2 = M_htal2_off_12inches;
wall.Mhtal12_3 = M_htal3_off_12inches;
wall.Mhtal12_4 = M_htal4_off_12inches;
wall.Mhtal12_5 = M_htal5_off_12inches;
wall.Mhtal12_6 = M_htal6_off_12inches;
wall.Mhtal12_7 = M_htal7_off_12inches;
wall.Mhtal12_8 = M_htal8_off_12inches;
wall.Mhtal13_1 = M_htal1_off_13inches;
wall.Mhtal13_2 = M_htal2_off_13inches;
wall.Mhtal13_3 = M_htal3_off_13inches;
wall.Mhtal13_4 = M_htal4_off_13inches;
wall.Mhtal13_5 = M_htal5_off_13inches;
wall.Mhtal13_6 = M_htal6_off_13inches;
wall.Mhtal13_7 = M_htal7_off_13inches;
wall.Mhtal13_8 = M_htal8_off_13inches;
wall.uncert_Fz10_1 = delta10_T1;
wall.uncert_Fz10_2 = delta10_T2;
wall.uncert_Fz10_3 = delta10_T3;
wall.uncert_Fz10_4 = delta10_T4;
wall.uncert_Fz10_5 = delta10_T5;
wall.uncert_Fz10_6 = delta10_T6;
wall.uncert_Fz10_7 = delta10_T7;
wall.uncert_Fz10_8 = delta10_T8;
wall.uncert_Fz12_1 = delta12_T1;
wall.uncert_Fz12_2 = delta12_T2;
wall.uncert_Fz12_3 = delta12_T3;
wall.uncert_Fz12_4 = delta12_T4;
wall.uncert_Fz12_5 = delta12_T5;
wall.uncert_Fz12_6 = delta12_T6;
wall.uncert_Fz12_7 = delta12_T7;
wall.uncert_Fz12_8 = delta12_T8;
wall.uncert_Fz13_1 = delta13_T1;
wall.uncert_Fz13_2 = delta13_T2;
wall.uncert_Fz13_3 = delta13_T3;
wall.uncert_Fz13_4 = delta13_T4;
wall.uncert_Fz13_5 = delta13_T5;
wall.uncert_Fz13_6 = delta13_T6;
wall.uncert_Fz13_7 = delta13_T7;
wall.uncert_Fz13_8 = delta13_T8;
wall.uncert_Fhtal10_1 = delta10_F1;
wall.uncert_Fhtal10_2 = delta10_F2;
wall.uncert_Fhtal10_3 = delta10_F3;
wall.uncert_Fhtal10_4 = delta10_F4;
wall.uncert_Fhtal10_5 = delta10_F5;
wall.uncert_Fhtal10_6 = delta10_F6;
wall.uncert_Fhtal10_7 = delta10_F7;
wall.uncert_Fhtal10_8 = delta10_F8;
wall.uncert_Fhtal12_1 = delta12_F1;
wall.uncert_Fhtal12_2 = delta12_F2;
wall.uncert_Fhtal12_3 = delta12_F3;
wall.uncert_Fhtal12_4 = delta12_F4;
wall.uncert_Fhtal12_5 = delta12_F5;
wall.uncert_Fhtal12_6 = delta12_F6;
wall.uncert_Fhtal12_7 = delta12_F7;
wall.uncert_Fhtal12_8 = delta12_F8;
wall.uncert_Fhtal13_1 = delta13_F1;
wall.uncert_Fhtal13_2 = delta13_F2;
wall.uncert_Fhtal13_3 = delta13_F3;
wall.uncert_Fhtal13_4 = delta13_F4;
wall.uncert_Fhtal13_5 = delta13_F5;
wall.uncert_Fhtal13_6 = delta13_F6;
wall.uncert_Fhtal13_7 = delta13_F7;
wall.uncert_Fhtal13_8 = delta13_F8;
wall.uncert_Mhtal10_1 = delta10_M1;
wall.uncert_Mhtal10_2 = delta10_M2;
wall.uncert_Mhtal10_3 = delta10_M3;
wall.uncert_Mhtal10_4 = delta10_M4;
wall.uncert_Mhtal10_5 = delta10_M5;
wall.uncert_Mhtal10_6 = delta10_M6;
wall.uncert_Mhtal10_7 = delta10_M7;
wall.uncert_Mhtal10_8 = delta10_M8;
wall.uncert_Mhtal12_1 = delta12_M1;
wall.uncert_Mhtal12_2 = delta12_M2;
wall.uncert_Mhtal12_3 = delta12_M3;
wall.uncert_Mhtal12_4 = delta12_M4;
wall.uncert_Mhtal12_5 = delta12_M5;
wall.uncert_Mhtal12_6 = delta12_M6;
wall.uncert_Mhtal12_7 = delta12_M7;
wall.uncert_Mhtal12_8 = delta12_M8;
wall.uncert_Mhtal13_1 = delta13_M1;
wall.uncert_Mhtal13_2 = delta13_M2;
wall.uncert_Mhtal13_3 = delta13_M3;
wall.uncert_Mhtal13_4 = delta13_M4;
wall.uncert_Mhtal13_5 = delta13_M5;
wall.uncert_Mhtal13_6 = delta13_M6;
wall.uncert_Mhtal13_7 = delta13_M7;
wall.uncert_Mhtal13_8 = delta13_M8;
wall.ct10_1 = Ct1Scana_10inch;
wall.ct10_2 = Ct2Scana_10inch;
wall.ct10_3 = Ct3Scana_10inch;
wall.ct10_4 = Ct4Scana_10inch;
wall.ct10_5 = Ct5Scana_10inch;
wall.ct10_6 = Ct6Scana_10inch;
wall.ct10_7 = Ct7Scana_10inch;
wall.ct10_8 = Ct8Scana_10inch;
wall.ct12_1 = Ct1Scana_12inch;
wall.ct12_2 = Ct2Scana_12inch;
wall.ct12_3 = Ct3Scana_12inch;
wall.ct12_4 = Ct4Scana_12inch;
wall.ct12_5 = Ct5Scana_12inch;
wall.ct12_6 = Ct6Scana_12inch;
wall.ct12_7 = Ct7Scana_12inch;
wall.ct12_8 = Ct8Scana_12inch;
wall.ct13_1 = Ct1Scana_13inch;
wall.ct13_2 = Ct2Scana_13inch;
wall.ct13_3 = Ct3Scana_13inch;
wall.ct13_4 = Ct4Scana_13inch;
wall.ct13_5 = Ct5Scana_13inch;
wall.ct13_6 = Ct6Scana_13inch;
wall.ct13_7 = Ct7Scana_13inch;
wall.ct13_8 = Ct8Scana_13inch;
wall.cf10_1 = Cf1Scana_10inch;
wall.cf10_2 = Cf2Scana_10inch;
wall.cf10_3 = Cf3Scana_10inch;
wall.cf10_4 = Cf4Scana_10inch;
wall.cf10_5 = Cf5Scana_10inch;
wall.cf10_6 = Cf6Scana_10inch;
wall.cf10_7 = Cf7Scana_10inch;
wall.cf10_8 = Cf8Scana_10inch;
wall.cf12_1 = Cf1Scana_12inch;
wall.cf12_2 = Cf2Scana_12inch;
wall.cf12_3 = Cf3Scana_12inch;
wall.cf12_4 = Cf4Scana_12inch;
wall.cf12_5 = Cf5Scana_12inch;
wall.cf12_6 = Cf6Scana_12inch;
wall.cf12_7 = Cf7Scana_12inch;
wall.cf12_8 = Cf8Scana_12inch;
wall.cf13_1 = Cf1Scana_13inch;
wall.cf13_2 = Cf2Scana_13inch;
wall.cf13_3 = Cf3Scana_13inch;
wall.cf13_4 = Cf4Scana_13inch;
wall.cf13_5 = Cf5Scana_13inch;
wall.cf13_6 = Cf6Scana_13inch;
wall.cf13_7 = Cf7Scana_13inch;
wall.cf13_8 = Cf8Scana_13inch;
wall.cm10_1 = Cm1Scana_10inch;
wall.cm10_2 = Cm2Scana_10inch;
wall.cm10_3 = Cm3Scana_10inch;
wall.cm10_4 = Cm4Scana_10inch;
wall.cm10_5 = Cm5Scana_10inch;
wall.cm10_6 = Cm6Scana_10inch;
wall.cm10_7 = Cm7Scana_10inch;
wall.cm10_8 = Cm8Scana_10inch;
wall.cm12_1 = Cm1Scana_12inch;
wall.cm12_2 = Cm2Scana_12inch;
wall.cm12_3 = Cm3Scana_12inch;
wall.cm12_4 = Cm4Scana_12inch;
wall.cm12_5 = Cm5Scana_12inch;
wall.cm12_6 = Cm6Scana_12inch;
wall.cm12_7 = Cm7Scana_12inch;
wall.cm12_8 = Cm8Scana_12inch;
wall.cm13_1 = Cm1Scana_13inch;
wall.cm13_2 = Cm2Scana_13inch;
wall.cm13_3 = Cm3Scana_13inch;
wall.cm13_4 = Cm4Scana_13inch;
wall.cm13_5 = Cm5Scana_13inch;
wall.cm13_6 = Cm6Scana_13inch;
wall.cm13_7 = Cm7Scana_13inch;
wall.cm13_8 = Cm8Scana_13inch;
wall.uncert_ct10_1 = uncert10_ct1;
wall.uncert_ct10_2 = uncert10_ct2;
wall.uncert_ct10_3 = uncert10_ct3;
wall.uncert_ct10_4 = uncert10_ct4;
wall.uncert_ct10_5 = uncert10_ct5;
wall.uncert_ct10_6 = uncert10_ct6;
wall.uncert_ct10_7 = uncert10_ct7;
wall.uncert_ct10_8 = uncert10_ct8;
wall.uncert_ct12_1 = uncert12_ct1;
wall.uncert_ct12_2 = uncert12_ct2;
wall.uncert_ct12_3 = uncert12_ct3;
wall.uncert_ct12_4 = uncert12_ct4;
wall.uncert_ct12_5 = uncert12_ct5;
wall.uncert_ct12_6 = uncert12_ct6;
wall.uncert_ct12_7 = uncert12_ct7;
wall.uncert_ct12_8 = uncert12_ct8;
wall.uncert_ct13_1 = uncert13_ct1;
wall.uncert_ct13_2 = uncert13_ct2;
wall.uncert_ct13_3 = uncert13_ct3;
wall.uncert_ct13_4 = uncert13_ct4;
wall.uncert_ct13_5 = uncert13_ct5;
wall.uncert_ct13_6 = uncert13_ct6;
wall.uncert_ct13_7 = uncert13_ct7;
wall.uncert_ct13_8 = uncert13_ct8;
wall.uncert_cf10_1 = uncert10_cf1;
wall.uncert_cf10_2 = uncert10_cf2;
wall.uncert_cf10_3 = uncert10_cf3;
wall.uncert_cf10_4 = uncert10_cf4;
wall.uncert_cf10_5 = uncert10_cf5;
wall.uncert_cf10_6 = uncert10_cf6;
wall.uncert_cf10_7 = uncert10_cf7;
wall.uncert_cf10_8 = uncert10_cf8;
wall.uncert_cf12_1 = uncert12_cf1;
wall.uncert_cf12_2 = uncert12_cf2;
wall.uncert_cf12_3 = uncert12_cf3;
wall.uncert_cf12_4 = uncert12_cf4;
wall.uncert_cf12_5 = uncert12_cf5;
wall.uncert_cf12_6 = uncert12_cf6;
wall.uncert_cf12_7 = uncert12_cf7;
wall.uncert_cf12_8 = uncert12_cf8;
wall.uncert_cf13_1 = uncert13_cf1;
wall.uncert_cf13_2 = uncert13_cf2;
wall.uncert_cf13_3 = uncert13_cf3;
wall.uncert_cf13_4 = uncert13_cf4;
wall.uncert_cf13_5 = uncert13_cf5;
wall.uncert_cf13_6 = uncert13_cf6;
wall.uncert_cf13_7 = uncert13_cf7;
wall.uncert_cf13_8 = uncert13_cf8;
wall.uncert_cm10_1 = uncert10_cm1;
wall.uncert_cm10_2 = uncert10_cm2;
wall.uncert_cm10_3 = uncert10_cm3;
wall.uncert_cm10_4 = uncert10_cm4;
wall.uncert_cm10_5 = uncert10_cm5;
wall.uncert_cm10_6 = uncert10_cm6;
wall.uncert_cm10_7 = uncert10_cm7;
wall.uncert_cm10_8 = uncert10_cm8;
wall.uncert_cm12_1 = uncert12_cm1;
wall.uncert_cm12_2 = uncert12_cm2;
wall.uncert_cm12_3 = uncert12_cm3;
wall.uncert_cm12_4 = uncert12_cm4;
wall.uncert_cm12_5 = uncert12_cm5;
wall.uncert_cm12_6 = uncert12_cm6;
wall.uncert_cm12_7 = uncert12_cm7;
wall.uncert_cm12_8 = uncert12_cm8;
wall.uncert_cm13_1 = uncert13_cm1;
wall.uncert_cm13_2 = uncert13_cm2;
wall.uncert_cm13_3 = uncert13_cm3;
wall.uncert_cm13_4 = uncert13_cm4;
wall.uncert_cm13_5 = uncert13_cm5;
wall.uncert_cm13_6 = uncert13_cm6;
wall.uncert_cm13_7 = uncert13_cm7;
wall.uncert_cm13_8 = uncert13_cm8;
wall.temp10_1 = Temp1_10inch;
wall.temp10_2 = Temp2_10inch;
wall.temp10_3 = Temp3_10inch;
wall.temp10_4 = Temp4_10inch;
wall.temp10_5 = Temp5_10inch;
wall.temp10_6 = Temp6_10inch;
wall.temp10_7 = Temp7_10inch;
wall.temp10_8 = Temp8_10inch;
wall.temp12_1 = Temp1_12inch;
wall.temp12_2 = Temp2_12inch;
wall.temp12_3 = Temp3_12inch;
wall.temp12_4 = Temp4_12inch;
wall.temp12_5 = Temp5_12inch;
wall.temp12_6 = Temp6_12inch;
wall.temp12_7 = Temp7_12inch;
wall.temp12_8 = Temp8_12inch;
wall.temp13_1 = Temp1_13inch;
wall.temp13_2 = Temp2_13inch;
wall.temp13_3 = Temp3_13inch;
wall.temp13_4 = Temp4_13inch;
wall.temp13_5 = Temp5_13inch;
wall.temp13_6 = Temp6_13inch;
wall.temp13_7 = Temp7_13inch;
wall.temp13_8 = Temp8_13inch;
wall.temp12_6 = Temp6_12inch;
wall.pres10_1 = Pres1_10inch;
wall.pres10_2 = Pres2_10inch;
wall.pres10_3 = Pres3_10inch;
wall.pres10_4 = Pres4_10inch;
wall.pres10_5 = Pres5_10inch;
wall.pres10_6 = Pres6_10inch;
wall.pres10_7 = Pres7_10inch;
wall.pres10_8 = Pres8_10inch;
wall.pres12_1 = Pres1_12inch;
wall.pres12_2 = Pres2_12inch;
wall.pres12_3 = Pres3_12inch;
wall.pres12_4 = Pres4_12inch;
wall.pres12_5 = Pres5_12inch;
wall.pres12_6 = Pres6_12inch;
wall.pres12_7 = Pres7_12inch;
wall.pres12_8 = Pres8_12inch;
wall.pres13_1 = Pres1_13inch;
wall.pres13_2 = Pres2_13inch;
wall.pres13_3 = Pres3_13inch;
wall.pres13_4 = Pres4_13inch;
wall.pres13_5 = Pres5_13inch;
wall.pres13_6 = Pres6_13inch;
wall.pres13_7 = Pres7_13inch;
wall.pres13_8 = Pres8_13inch;
wall.rho10_1 = rho1_10inch;
wall.rho10_2 = rho2_10inch;
wall.rho10_3 = rho3_10inch;
wall.rho10_4 = rho4_10inch;
wall.rho10_5 = rho5_10inch;
wall.rho10_6 = rho6_10inch;
wall.rho10_7 = rho7_10inch;
wall.rho10_8 = rho8_10inch;
wall.rho12_1 = rho1_12inch;
wall.rho12_2 = rho2_12inch;
wall.rho12_3 = rho3_12inch;
wall.rho12_4 = rho4_12inch;
wall.rho12_5 = rho5_12inch;
wall.rho12_6 = rho6_12inch;
wall.rho12_7 = rho7_12inch;
wall.rho12_8 = rho8_12inch;
wall.rho13_1 = rho1_13inch;
wall.rho13_2 = rho2_13inch;
wall.rho13_3 = rho3_13inch;
wall.rho13_4 = rho4_13inch;
wall.rho13_5 = rho5_13inch;
wall.rho13_6 = rho6_13inch;
wall.rho13_7 = rho7_13inch;
wall.rho13_8 = rho8_13inch;
wall.distance(1) = distances(1);
wall.distance(2) = distances(2);
wall.distance(3) = distances(3);
wall.distance(4) = distances(4);
wall.distance(5) = distances(5);
wall.distance(6) = distances(6);
wall.distance(7) = distances(7);
wall.distance(8) = distances(8);
wall.rpm10_1_1 = tach10_1;
wall.rpm10_1_2 = tach10_2;
wall.rpm10_1_3 = tach10_3;
wall.rpm10_1_4 = tach10_4;
wall.rpm10_1_5 = tach10_5;
wall.rpm10_1_6 = tach10_6;
wall.rpm10_1_7 = tach10_7;
wall.rpm10_1_8 = tach10_8;
wall.rpm12_1_1 = tach10_1;
wall.rpm12_1_2 = tach12_2;
wall.rpm12_1_3 = tach12_3;
wall.rpm12_1_4 = tach12_4;
wall.rpm12_1_5 = tach12_5;
wall.rpm12_1_6 = tach12_6;
wall.rpm12_1_7 = tach12_7;
wall.rpm12_1_8 = tach12_8;
wall.rpm13_1_1 = tach13_1;
wall.rpm13_1_2 = tach13_2;
wall.rpm13_1_3 = tach13_3;
wall.rpm13_1_4 = tach13_4;
wall.rpm13_1_5 = tach13_5;
wall.rpm13_1_6 = tach13_6;
wall.rpm13_1_7 = tach13_7;
wall.rpm13_1_8 = tach13_8;

save('du_Wall_data.mat','wall')