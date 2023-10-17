clear variables
close all

%%%% This script compares two .mat files obtained from average_equal.m or
%%%% average_equal_4files.m

ft_path1  = '../LogFiles/20231011/FT/';
ft_path2  = '../LogFiles/20231011/FT/';

file1 = 'log_20231011_10inch_Rinf_average.mat';
file2 = 'log_20231011_10inch_Rinf_average.mat';

filepath1 = strcat(ft_path1,file1);
filepath2 = strcat(ft_path2,file2);

file1 = load(filepath1);
file2 = load(filepath2);


figure()
subplot(3,1,1)
hold on;grid on;
plot(file1.result.time,file1.result.Fy,'linewidth',2)
plot(file2.result.time,file2.result.Fy,'linewidth',2)
ylabel('F_y [N]')
legend('File1','FIle2')
subplot(3,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.Mx,'linewidth',2)
plot(file2.result.time,file2.result.Mx,'linewidth',2)
ylabel('M_x [N\cdot m]')
subplot(3,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Fz,'linewidth',2)
plot(file2.result.time,file2.result.Fz,'linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')
