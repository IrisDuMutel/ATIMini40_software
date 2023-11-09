close all
clear variables

ft_path1  = '../LogFiles/matfiles/';

file1 = 'log_20231025_13inch_R1_0deg.mat';  %%% Orientation: 0º

save_file = strcat(ft_path1,file1);
title_size = 6;
points_to_avg = 100;

sampl_f1 = 150; 
Ts1 = 1/sampl_f1;

step_dur_insecs = 15;                                                       % Step duration in seconds (as specified in the arduino file)
aver_points = 0.7;                                                          % Percentage of each step to be taken for average
step_duration = step_dur_insecs/Ts1;                                        % Actual number of data points that make a step
segment_points = aver_points*step_duration;                                 % Number of points used for aveaging
offset_points  = 250;                                                       % points to be ignored from last step backward
steps_per_stair = 6; 


filepath1 = strcat(ft_path1,file1);
file1 = load(filepath1);


figure()
subplot(5,1,1)
hold on;grid on;
title('Raw data')
plot(file1.result.time,file1.result.Fx,'linewidth',2)
ylim([-1, 1])
ylabel('F_x [N]')
subplot(5,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.Fy,'linewidth',2)
ylim([-1, 1])
ylabel('F_y [N]')
legend('File1','File2','File3','File4')
subplot(5,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Mx,'linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-0.2, 0.2])
subplot(5,1,4)
hold on;grid on;
plot(file1.result.time,file1.result.My,'linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-0.2, 0.2])
subplot(5,1,5)
hold on;grid on;
plot(file1.result.time,file1.result.Fz,'linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')