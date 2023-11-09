clear variables
close all

%%%% This script compares two .mat files obtained from average_equal.m or
%%%% average_equal_4files.m

ft_path1  = '../LogFiles/matfiles/';
ft_path2  = '../LogFiles/matfiles/';
ft_path3  = '../LogFiles/matfiles/';
ft_path4  = '../LogFiles/matfiles/';

file1 = 'log_20231027_10inch_Rinf.mat';  %%% Orientation: 0º
file2 = 'log_20231027_10inch_Rinf.mat';  %%% Orientation: 90º
file3 = 'log_20231027_10inch_Rinf.mat';  %%% Orientation: 180º
file4 = 'log_20231027_10inch_Rinf.mat';  %%% Orientation: 270º

% file1 = 'log_20231027_10inch_R3_0deg.mat';  %%% Orientation: 0º
% file2 = 'log_20231027_10inch_R3_90deg.mat';  %%% Orientation: 90º
% file3 = 'log_20231027_10inch_R3_180deg.mat';  %%% Orientation: 180º
% file4 = 'log_20231027_10inch_R3_270deg.mat';  %%% Orientation: 270º

filename = "avgALL/log_20231027_10inch_Rinf_avgAll.mat";

% filename = "avgALL/log_20231027_10inch_R3_avgAll.mat";

save_file = strcat(ft_path1,filename);
title_size = 6;
points_to_avg = 100;

sampl_f1 = 150;                                                      % Sampling frequency of the signal
sampl_f2 = 150;                                                      % Sampling frequency of the signal
sampl_f3 = 150;                                                      % Sampling frequency of the signal
sampl_f4 = 150;                                                      % Sampling frequency of the signal
Ts1 = 1/sampl_f1;
Ts2 = 1/sampl_f2;
Ts3 = 1/sampl_f3;
Ts4 = 1/sampl_f4;


step_dur_insecs = 15;                                                       % Step duration in seconds (as specified in the arduino file)
aver_points = 0.7;                                                          % Percentage of each step to be taken for average
step_duration = step_dur_insecs/Ts1;                                        % Actual number of data points that make a step
segment_points = aver_points*step_duration;                                 % Number of points used for aveaging
offset_points  = 250;                                                       % points to be ignored from last step backward
steps_per_stair = 6; 


filepath1 = strcat(ft_path1,file1);
filepath2 = strcat(ft_path2,file2);
filepath3 = strcat(ft_path3,file3);
filepath4 = strcat(ft_path4,file4);

file1 = load(filepath1);
file2 = load(filepath2);
file3 = load(filepath3);
file4 = load(filepath4);


figure()
subplot(5,1,1)
hold on;grid on;
title('Raw data')
plot(file1.result.time,file1.result.Fx,'linewidth',2)
plot(file2.result.time,file2.result.Fx,'linewidth',2)
plot(file3.result.time,file3.result.Fx,'linewidth',2)
plot(file4.result.time,file4.result.Fx,'linewidth',2)
ylim([-1, 1])
ylabel('F_x [N]')
subplot(5,1,2)
hold on;grid on;
plot(file1.result.time,file1.result.Fy,'linewidth',2)
plot(file2.result.time,file2.result.Fy,'linewidth',2)
plot(file3.result.time,file3.result.Fy,'linewidth',2)
plot(file4.result.time,file4.result.Fy,'linewidth',2)
ylim([-1, 1])
ylabel('F_y [N]')
legend('File1','File2','File3','File4')
subplot(5,1,3)
hold on;grid on;
plot(file1.result.time,file1.result.Mx,'linewidth',2)
plot(file2.result.time,file2.result.Mx,'linewidth',2)
plot(file3.result.time,file3.result.Mx,'linewidth',2)
plot(file4.result.time,file4.result.Mx,'linewidth',2)
ylabel('M_x [N\cdot m]')
ylim([-0.2, 0.2])
subplot(5,1,4)
hold on;grid on;
plot(file1.result.time,file1.result.My,'linewidth',2)
plot(file2.result.time,file2.result.My,'linewidth',2)
plot(file3.result.time,file3.result.My,'linewidth',2)
plot(file4.result.time,file4.result.My,'linewidth',2)
ylabel('M_y [N\cdot m]')
ylim([-0.2, 0.2])
subplot(5,1,5)
hold on;grid on;
plot(file1.result.time,file1.result.Fz,'linewidth',2)
plot(file2.result.time,file2.result.Fz,'linewidth',2)
plot(file3.result.time,file3.result.Fz,'linewidth',2)
plot(file4.result.time,file4.result.Fz,'linewidth',2)
ylabel('F_z [N]')
xlabel('Time [s]')


%% %%% Automatic point selection for multiple files

Fx1 = file1.result.Fx;
Fx2 = file2.result.Fy;
Fx3 = -file3.result.Fx;
Fx4 = -file4.result.Fy;
Fy1 = file1.result.Fy;
Fy2 = -file2.result.Fx;
Fy3 = -file3.result.Fy;
Fy4 = file4.result.Fx;
Mx1 = file1.result.Mx;
Mx2 = file2.result.My;
Mx3 = -file3.result.Mx;
Mx4 = -file4.result.My;
My1 = file1.result.My;
My2 = -file2.result.Mx;
My3 = -file3.result.My;
My4 = file4.result.Mx;
Mz1 = file1.result.Mz;
Mz2 = file2.result.Mz;
Mz3 = file3.result.Mz;
Mz4 = file4.result.Mz;
ti1    = file1.result.time;
ti2    = file2.result.time;
ti3    = file3.result.time;
ti4    = file4.result.time;
time1    = file1.result.time;
time2    = file2.result.time;
time3    = file3.result.time;
time4    = file4.result.time;

Fz1 = file1.result.Fz;
Fz2 = file2.result.Fz;
Fz3 = file3.result.Fz;
Fz4 = file4.result.Fz;

diff1 = 0;                                                                  % gradient initialization
diff2 = 0;                                                                  % gradient initialization
diff3 = 0;                                                                  % gradient initialization
diff4 = 0;                                                                  % gradient initialization

Force_z1 = [];
Force_z2 = [];
Force_z3 = [];
Force_z4 = [];

timing1  = [];
timing2  = [];
timing3  = [];
timing4  = [];

Force_z1_off = [];
Force_z2_off = [];
Force_z3_off = [];
Force_z4_off = [];

for i=1:1:length(Fz1)-1   
    diff1 = [diff1; (Fz1(i)-Fz1(i+1))/Ts1];                                 % compute the gradient at Ts1
end   
for i=1:1:length(Fz2)-1   
    diff2 = [diff2; (Fz2(i)-Fz2(i+1))/Ts2];                                 % compute the gradient at Ts2
end
for i=1:1:length(Fz3)-1   
    diff3 = [diff3; (Fz3(i)-Fz3(i+1))/Ts3];                                 % compute the gradient at Ts2
end
for i=1:1:length(Fz4)-1   
    diff4 = [diff4; (Fz4(i)-Fz4(i+1))/Ts4];                                 % compute the gradient at Ts2
end

figure()
title('Check that derivative selection is right')
hold on;grid on;
plot(time1/Ts1, Fz1,'linewidth',2)
plot(time1/Ts1, diff1)
legend('Filtered data', 'Derivative')
xlabel('Datapoints')
ylabel('Data value')

% [~,C1] = maxk(abs(diff1),10);                                               % get the 10 maximum values in the gradient
% [~,C2] = maxk(abs(diff2),10);
% [~,C3] = maxk(abs(diff3),10);
% [~,C4] = maxk(abs(diff4),10);
[A1,C1] = find(abs(diff1)>12);                                               % get the 10 maximum values in the gradient
[A2,C2] = find(abs(diff2)>12);
[A3,C3] = find(abs(diff3)>12);
[A4,C4] = find(abs(diff4)>12);

time_stamp1 = maxk(A1,1):-step_duration:1;                                  % adjust timestamp depending on step duration
time_stamp2 = maxk(A2,1):-step_duration:1;                                  % adjust timestamp depending on step duration
time_stamp3 = maxk(A3,1):-step_duration:1;                                  % adjust timestamp depending on step duration
time_stamp4 = maxk(A4,1):-step_duration:1;                                  % adjust timestamp depending on step duration


timestamp1 = [];
for i=1:1:length(time_stamp1)                                              % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end


timestamp2 = [];
for i=1:1:length(time_stamp2)                                              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

timestamp3 = [];
for i=1:1:length(time_stamp3)                                              % Create timestamp vector of smaller segments
    time_stamp3(i) = time_stamp3(i)-offset_points;
    ending = time_stamp3(i)-segment_points;
    timestamp3 = [timestamp3;time_stamp3(i);ending];
end

timestamp4 = [];
for i=1:1:length(time_stamp4)                                             % Create timestamp vector of smaller segments
    time_stamp4(i) = time_stamp4(i)-offset_points;
    ending = time_stamp4(i)-segment_points;
    timestamp4 = [timestamp4;time_stamp4(i);ending];
end

timestamp1 = sort(timestamp1);
timestamp2 = sort(timestamp2);
timestamp3 = sort(timestamp3);
timestamp4 = sort(timestamp4);

% Finding the average position in time
for i = 1:2:length(timestamp1)-1              
    timing1  = [timing1;mean(abs(timestamp1(i:i+1)))];    
end
% Compute the average of the force of points_to_avg centered in timing(i)
for i=1:length(timing1)
    Force_z1 = [Force_z1; mean(Fz1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))] ;
end
% Finding offsets and removing them
D1 = find(Force_z1==Force_z1(end-steps_per_stair+1));                      
D1 = max(D1);
E1 = [D1:-steps_per_stair:1];
positions1 = sort(E1);
F_z_1 =[Fz1(1:timing1(positions1(1)))-Force_z1(positions1(1))];
for i = 1:length(positions1)-1
    F_z_1 = [F_z_1;Fz1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Force_z1(positions1(i))];
end
F_z_1 = [F_z_1;Fz1(timing1(positions1(end))+1:end)-Force_z1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Force_z1_off = [Force_z1_off;mean(F_z_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


% Finding the average position in time
for i = 1:2:length(timestamp2)-1              
    timing2  = [timing2;mean(abs(timestamp2(i:i+1)))];    
end
% Compute the average of the force of points_to_avg centered in timing(i)
for i=1:length(timing2)
    Force_z2 = [Force_z2; mean(Fz2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))] ;
end
% Finding offsets and removing them
D2 = find(Force_z2==Force_z2(end-steps_per_stair+1));
D2 = max(D2);
E2 = [D2:-steps_per_stair:1];
positions2 = sort(E2);
F_z_2 =[Fz2(1:timing2(positions2(1)))-Force_z2(positions2(1))];
for i = 1:length(positions2)-1
    F_z_2 = [F_z_2;Fz2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Force_z2(positions2(i))];
end
F_z_2 = [F_z_2;Fz2(timing2(positions2(end))+1:end)-Force_z2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Force_z2_off = [Force_z2_off;mean(F_z_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end



% Finding the average position in time
for i = 1:2:length(timestamp3)-1              
    timing3  = [timing3;mean(abs(timestamp3(i:i+1)))];    
end
% Compute the average of the force of points_to_avg centered in timing(i)
for i=1:length(timing3)
    Force_z3 = [Force_z3; mean(Fz3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))] ;
end
% Finding offsets and removing them
D3 = find(Force_z3==Force_z3(end-steps_per_stair+1));
D3 = max(D3);
E3 = [D3:-steps_per_stair:1];
positions3 = sort(E3);
F_z_3 =[Fz3(1:timing3(positions3(1)))-Force_z3(positions3(1))];
for i = 1:length(positions3)-1
    F_z_3 = [F_z_3;Fz3(timing3(positions3(i))+1:timing3(positions3(i+1)))-Force_z3(positions3(i))];
end
F_z_3 = [F_z_3;Fz3(timing3(positions3(end))+1:end)-Force_z3(positions3(end))];
% We compute again the average values of the segments
for i = 1:length(timing3)             % Compute average of force in such timestamp
    Force_z3_off = [Force_z3_off;mean(F_z_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end



% Finding the average position in time
for i = 1:2:length(timestamp4)-1              
    timing4  = [timing4;mean(abs(timestamp4(i:i+1)))];    
end
% Compute the average of the force of points_to_avg centered in timing(i)
for i=1:length(timing4)
    Force_z4 = [Force_z4; mean(Fz4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))] ;
end
% Finding offsets and removing them
D4 = find(Force_z4==Force_z4(end-steps_per_stair+1));
D4 = max(D4);
E4 = [D4:-steps_per_stair:1];
positions4 = sort(E4);
F_z_4 =[Fz4(1:timing4(positions4(1)))-Force_z4(positions4(1))];
for i = 1:length(positions4)-1
    F_z_4 = [F_z_4;Fz4(timing4(positions4(i))+1:timing4(positions4(i+1)))-Force_z4(positions4(i))];
end
F_z_4 = [F_z_4;Fz4(timing4(positions4(end))+1:end)-Force_z4(positions4(end))];
% We compute again the average values of the segments
for i = 1:length(timing4)             % Compute average of force in such timestamp
    Force_z4_off = [Force_z4_off;mean(F_z_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end


while length(Force_z1_off)<=11
    Force_z1_off = [0;Force_z1_off];
    timing1  = [points_to_avg+1;timing1];
end
while length(Force_z2_off)<=11
    Force_z2_off = [0;Force_z2_off];
    timing2  = [points_to_avg+1;timing2];
end
while length(Force_z3_off)<=11
    Force_z3_off = [0;Force_z3_off];
    timing3  = [points_to_avg+1;timing3];
end
while length(Force_z4_off)<=11
    Force_z4_off = [0;Force_z4_off];
    timing4  = [points_to_avg+1;timing4];
end

F_z1_off = Force_z1_off;
F_z2_off = Force_z2_off;
F_z3_off = Force_z3_off;
F_z4_off = Force_z4_off;

i=1;
while length(F_z1_off)>12
    F_z1_off(1) = [];
    i = i + 1;
end
i=1;
while length(F_z2_off)>12
    F_z2_off(1) = [];
    i = i + 1;
end
i=1;
while length(F_z3_off)>12
    F_z3_off(1) = [];
    i = i + 1;
end
i=1;
while length(F_z4_off)>12
    F_z4_off(1) = [];
    i = i + 1;
end

%%%%% Fx. Force %%%%%
Force_x1 = [];
Force_x2 = [];
Force_x3 = [];
Force_x4 = [];
Force_x1_off = [];
Force_x2_off = [];
Force_x3_off = [];
Force_x4_off = [];

for i=1:length(timing1)
    Force_x1 = [Force_x1; mean(Fx1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))] ;
end
F_x1 = Fx1(1:timing1(positions1(1)))-Force_x1(positions1(1));
for i = 1:length(positions1)-1
    F_x1 = [F_x1;Fx1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Force_x1(positions1(i))];
end
F_x1 = [F_x1;Fx1(timing1(positions1(end))+1:end)-Force_x1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Force_x1_off = [Force_x1_off;mean(F_x1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


for i=1:length(timing2)
    Force_x2 = [Force_x2; mean(Fx2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))] ;
end
F_x2 =Fx2(1:timing2(positions2(1)))-Force_x2(positions2(1));
for i = 1:length(positions2)-1
    F_x2 = [F_x2;Fx2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Force_x2(positions2(i))];
end
F_x2 = [F_x2;Fx2(timing2(positions2(end))+1:end)-Force_x2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Force_x2_off = [Force_x2_off;mean(F_x2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end

for i=1:length(timing3)
    Force_x3 = [Force_x3; mean(Fx3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))] ;
end
F_x3 =Fx3(1:timing3(positions3(1)))-Force_x3(positions3(1));
for i = 1:length(positions3)-1
    F_x3 = [F_x3;Fx3(timing3(positions3(i))+1:timing3(positions3(i+1)))-Force_x3(positions3(i))];
end
F_x3 = [F_x3;Fx3(timing3(positions3(end))+1:end)-Force_x3(positions3(end))];
% We compute again the average values of the segments
for i = 1:length(timing3)             % Compute average of force in such timestamp
    Force_x3_off = [Force_x3_off;mean(F_x3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end

for i=1:length(timing4)
    Force_x4 = [Force_x4; mean(Fx4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))] ;
end
F_x4 =Fx4(1:timing4(positions4(1)))-Force_x4(positions4(1));
for i = 1:length(positions4)-1
    F_x4 = [F_x4;Fx4(timing4(positions4(i))+1:timing4(positions4(i+1)))-Force_x4(positions4(i))];
end
F_x4 = [F_x4;Fx4(timing4(positions4(end))+1:end)-Force_x4(positions4(end))];
% We compute again the average values of the segments
for i = 1:length(timing4)             % Compute average of force in such timestamp
    Force_x4_off = [Force_x4_off;mean(F_x4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end


while length(Force_x1_off)<=11
    Force_x1_off = [0;Force_x1_off];
end
while length(Force_x2_off)<=11
    Force_x2_off = [0;Force_x2_off];
end
while length(Force_x3_off)<=11
    Force_x3_off = [0;Force_x3_off];
end
while length(Force_x4_off)<=11
    Force_x4_off = [0;Force_x4_off];
end



%%%%% Fy. Force %%%%%
Force_y1 = [];
Force_y2 = [];
Force_y3 = [];
Force_y4 = [];
Force_y1_off = [];
Force_y2_off = [];
Force_y3_off = [];
Force_y4_off = [];

for i=1:length(timing1)
    Force_y1 = [Force_y1; mean(Fy1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))] ;
end
F_y1 = Fy1(1:timing1(positions1(1)))-Force_y1(positions1(1));
for i = 1:length(positions1)-1
    F_y1 = [F_y1;Fy1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Force_y1(positions1(i))];
end
F_y1 = [F_y1;Fy1(timing1(positions1(end))+1:end)-Force_y1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Force_y1_off = [Force_y1_off;mean(F_y1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


for i=1:length(timing2)
    Force_y2 = [Force_y2; mean(Fy2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))] ;
end
F_y2 =Fy2(1:timing2(positions2(1)))-Force_y2(positions2(1));
for i = 1:length(positions2)-1
    F_y2 = [F_y2;Fy2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Force_y2(positions2(i))];
end
F_y2 = [F_y2;Fy2(timing2(positions2(end))+1:end)-Force_y2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Force_y2_off = [Force_y2_off;mean(F_y2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end

for i=1:length(timing3)
    Force_y3 = [Force_y3; mean(Fy3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))] ;
end
F_y3 =Fy3(1:timing3(positions3(1)))-Force_y3(positions3(1));
for i = 1:length(positions3)-1
    F_y3 = [F_y3;Fy3(timing3(positions3(i))+1:timing3(positions3(i+1)))-Force_y3(positions3(i))];
end
F_y3 = [F_y3;Fy3(timing3(positions3(end))+1:end)-Force_y3(positions3(end))];
% We compute again the average values of the segments
for i = 1:length(timing3)             % Compute average of force in such timestamp
    Force_y3_off = [Force_y3_off;mean(F_y3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end

for i=1:length(timing4)
    Force_y4 = [Force_y4; mean(Fy4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))] ;
end
F_y4 =Fy4(1:timing4(positions4(1)))-Force_y4(positions4(1));
for i = 1:length(positions4)-1
    F_y4 = [F_y4;Fy4(timing4(positions4(i))+1:timing4(positions4(i+1)))-Force_y4(positions4(i))];
end
F_y4 = [F_y4;Fy4(timing4(positions4(end))+1:end)-Force_y4(positions4(end))];
% We compute again the average values of the segments
for i = 1:length(timing4)             % Compute average of force in such timestamp
    Force_y4_off = [Force_y4_off;mean(F_y4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end


while length(Force_y1_off)<=11
    Force_y1_off = [0;Force_y1_off];
end
while length(Force_y2_off)<=11
    Force_y2_off = [0;Force_y2_off];
end
while length(Force_y3_off)<=11
    Force_y3_off = [0;Force_y3_off];
end
while length(Force_y4_off)<=11
    Force_y4_off = [0;Force_y4_off];
end


%%%%% Torque x %%%%%
Torquex1 = [];
Torquex2 = [];
Torquex3 = [];
Torquex4 = [];
Torque_x1_off = [];
Torque_x2_off = [];
Torque_x3_off = [];
Torque_x4_off = [];


for i = 1:length(timing1)
    Torquex1 = [Torquex1; mean(Mx1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end
M_x_1 = Mx1(1:timing1(positions1(1)))-Torquex1(positions1(1));
for i = 1:length(positions1)-1
    M_x_1 = [M_x_1;Mx1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Torquex1(positions1(i))];
end
M_x_1 = [M_x_1;Mx1(timing1(positions1(end))+1:end)-Torquex1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Torque_x1_off = [Torque_x1_off;mean(M_x_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


for i = 1:length(timing2)
    Torquex2 = [Torquex2; mean(Mx2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end
M_x_2 = Mx2(1:timing2(positions2(1)))-Torquex2(positions2(1));
for i = 1:length(positions2)-1
    M_x_2 = [M_x_2;Mx2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Torquex2(positions2(i))];
end
M_x_2 = [M_x_2;Mx2(timing2(positions2(end))+1:end)-Torquex2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Torque_x2_off = [Torque_x2_off;mean(M_x_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end


for i = 1:length(timing3)
    Torquex3 = [Torquex3; mean(Mx3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end
M_x_3 = Mx3(1:timing3(positions3(1)))-Torquex3(positions3(1));
for i = 1:length(positions2)-1
    M_x_3 = [M_x_3;Mx3(timing3(positions3(i))+1:timing3(positions3(i+1)))-Torquex3(positions3(i))];
end
M_x_3 = [M_x_3;Mx3(timing3(positions3(end))+1:end)-Torquex3(positions3(end))];
% We compute again the average values of the segments
for i = 1:length(timing3)             % Compute average of force in such timestamp
    Torque_x3_off = [Torque_x3_off;mean(M_x_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end


for i = 1:length(timing4)
    Torquex4 = [Torquex4; mean(Mx4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end
M_x_4 = Mx4(1:timing4(positions4(1)))-Torquex4(positions4(1));
for i = 1:length(positions4)-1
    M_x_4 = [M_x_4;Mx4(timing4(positions4(i))+1:timing4(positions4(i+1)))-Torquex4(positions4(i))];
end
M_x_4 = [M_x_4;Mx4(timing4(positions4(end))+1:end)-Torquex4(positions4(end))];
% We compute again the average values of the segments
for i = 1:length(timing4)             % Compute average of force in such timestamp
    Torque_x4_off = [Torque_x4_off;mean(M_x_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end


while length(Torque_x1_off)<=11
    Torque_x1_off = [0;Torque_x1_off];
end
while length(Torque_x2_off)<=11
    Torque_x2_off = [0;Torque_x2_off];
end
while length(Torque_x3_off)<=11
    Torque_x3_off = [0;Torque_x3_off];
end
while length(Torque_x4_off)<=11
    Torque_x4_off = [0;Torque_x4_off];
end

%%%%% Torque y %%%%%
Torquey1 = [];
Torquey2 = [];
Torquey3 = [];
Torquey4 = [];
Torque_y1_off = [];
Torque_y2_off = [];
Torque_y3_off = [];
Torque_y4_off = [];


for i = 1:length(timing1)
    Torquey1 = [Torquey1; mean(My1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end
M_y_1 = My1(1:timing1(positions1(1)))-Torquey1(positions1(1));
for i = 1:length(positions1)-1
    M_y_1 = [M_y_1;My1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Torquey1(positions1(i))];
end
M_y_1 = [M_y_1;My1(timing1(positions1(end))+1:end)-Torquey1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Torque_y1_off = [Torque_y1_off;mean(M_y_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


for i = 1:length(timing2)
    Torquey2 = [Torquey2; mean(My2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end
M_y_2 = My2(1:timing2(positions2(1)))-Torquey2(positions2(1));
for i = 1:length(positions2)-1
    M_y_2 = [M_y_2;My2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Torquey2(positions2(i))];
end
M_y_2 = [M_y_2;My2(timing2(positions2(end))+1:end)-Torquey2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Torque_y2_off = [Torque_y2_off;mean(M_y_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end


for i = 1:length(timing3)
    Torquey3 = [Torquey3; mean(My3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end
M_y_3 = My3(1:timing3(positions3(1)))-Torquey3(positions3(1));
for i = 1:length(positions2)-1
    M_y_3 = [M_y_3;My3(timing3(positions3(i))+1:timing3(positions3(i+1)))-Torquey3(positions3(i))];
end
M_y_3 = [M_y_3;My3(timing3(positions3(end))+1:end)-Torquey3(positions3(end))];
% We compute again the average values of the segments
for i = 1:length(timing3)             % Compute average of force in such timestamp
    Torque_y3_off = [Torque_y3_off;mean(M_y_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end


for i = 1:length(timing4)
    Torquey4 = [Torquey4; mean(My4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end
M_y_4 = My4(1:timing4(positions4(1)))-Torquey4(positions4(1));
for i = 1:length(positions4)-1
    M_y_4 = [M_y_4;My4(timing4(positions4(i))+1:timing4(positions4(i+1)))-Torquey4(positions4(i))];
end
M_y_4 = [M_y_4;My4(timing4(positions4(end))+1:end)-Torquey4(positions4(end))];
% We compute again the average values of the segments
for i = 1:length(timing4)             % Compute average of force in such timestamp
    Torque_y4_off = [Torque_y4_off;mean(M_y_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end


while length(Torque_y1_off)<=11
    Torque_y1_off = [0;Torque_y1_off];
end
while length(Torque_y2_off)<=11
    Torque_y2_off = [0;Torque_y2_off];
end
while length(Torque_y3_off)<=11
    Torque_y3_off = [0;Torque_y3_off];
end
while length(Torque_y4_off)<=11
    Torque_y4_off = [0;Torque_y4_off];
end

%%%%% Torque z %%%%%
Torquez1 = [];
Torquez2 = [];
Torquez3 = [];
Torquez4 = [];
Torque_z1_off = [];
Torque_z2_off = [];
Torque_z3_off = [];
Torque_z4_off = [];


for i = 1:length(timing1)
    Torquez1 = [Torquez1; mean(Mz1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end
M_z_1 = Mz1(1:timing1(positions1(1)))-Torquez1(positions1(1));
for i = 1:length(positions1)-1
    M_z_1 = [M_z_1;Mz1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Torquez1(positions1(i))];
end
M_z_1 = [M_z_1;Mz1(timing1(positions1(end))+1:end)-Torquez1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Torque_z1_off = [Torque_z1_off;mean(M_z_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


for i = 1:length(timing2)
    Torquez2 = [Torquez2; mean(Mz2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end
M_z_2 = Mz2(1:timing2(positions2(1)))-Torquez2(positions2(1));
for i = 1:length(positions2)-1
    M_z_2 = [M_z_2;Mz2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Torquez2(positions2(i))];
end
M_z_2 = [M_z_2;Mz2(timing2(positions2(end))+1:end)-Torquez2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Torque_z2_off = [Torque_z2_off;mean(M_z_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end


for i = 1:length(timing3)
    Torquez3 = [Torquez3; mean(Mz3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end
M_z_3 = Mz3(1:timing3(positions3(1)))-Torquez3(positions3(1));
for i = 1:length(positions2)-1
    M_z_3 = [M_z_3;Mz3(timing3(positions3(i))+1:timing3(positions3(i+1)))-Torquez3(positions3(i))];
end
M_z_3 = [M_z_3;Mz3(timing3(positions3(end))+1:end)-Torquez3(positions3(end))];
% We compute again the average values of the segments
for i = 1:length(timing3)             % Compute average of force in such timestamp
    Torque_z3_off = [Torque_z3_off;mean(M_z_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2))];
end


for i = 1:length(timing4)
    Torquez4 = [Torquez4; mean(Mz4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end
M_z_4 = Mz4(1:timing4(positions4(1)))-Torquez4(positions4(1));
for i = 1:length(positions4)-1
    M_z_4 = [M_z_4;Mz4(timing4(positions4(i))+1:timing4(positions4(i+1)))-Torquez4(positions4(i))];
end
M_z_4 = [M_z_4;Mz4(timing4(positions4(end))+1:end)-Torquez4(positions4(end))];
% We compute again the average values of the segments
for i = 1:length(timing4)             % Compute average of force in such timestamp
    Torque_z4_off = [Torque_z4_off;mean(M_z_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2))];
end


while length(Torque_z1_off)<=11
    Torque_z1_off = [0;Torque_z1_off];
end
while length(Torque_z2_off)<=11
    Torque_z2_off = [0;Torque_z2_off];
end
while length(Torque_z3_off)<=11
    Torque_z3_off = [0;Torque_z3_off];
end
while length(Torque_z4_off)<=11
    Torque_z4_off = [0;Torque_z4_off];
end

auto.timestamp{1} = timestamp1;
auto.timestamp{2} = timestamp2;
auto.timestamp{3} = timestamp3;
auto.timestamp{4} = timestamp4;
auto.timing{1} = timing1;
auto.timing{2} = timing2;
auto.timing{3} = timing3;
auto.timing{4} = timing4;

myvars.Fx{1} = F_x1;
myvars.Fx{2} = F_x2;
myvars.Fx{3} = F_x3;
myvars.Fx{4} = F_x4;

myvars.Fy{1} = F_y1;
myvars.Fy{2} = F_y2;
myvars.Fy{3} = F_y3;
myvars.Fy{4} = F_y4;

myvars.Fz{1} = F_z_1;
myvars.Fz{2} = F_z_2;
myvars.Fz{3} = F_z_3;
myvars.Fz{4} = F_z_4;

myvars.Mx{1} = M_x_1;
myvars.Mx{2} = M_x_2;
myvars.Mx{3} = M_x_3;
myvars.Mx{4} = M_x_4;

myvars.My{1} = M_y_1;
myvars.My{2} = M_y_2;
myvars.My{3} = M_y_3;
myvars.My{4} = M_y_4;

myvars.Mz{1} = M_z_1;
myvars.Mz{2} = M_z_2;
myvars.Mz{3} = M_z_3;
myvars.Mz{4} = M_z_4;

myvars.t{1} = ti1';
myvars.t{2} = ti2';
myvars.t{3} = ti3';
myvars.t{4} = ti4';


%%% WE HAVE THE FOLLOWING VARIABLES AVAILABLE: %%%
%%% Horizontal Forces: Fy
%%% Horizontal Torques: Mx
%%% Force_z
%%% times
%%% These stucts contain the variables of each datafile


% Plot of Fz removing offsets and marking all levels average
figure()
hold on
plot(time1,diff1);
plot(time2,diff2);
plot(time3,diff3);
plot(time4,diff4);
plot(ti1,Fz1,'lineWidth',1.5)
plot(ti2,Fz2,'lineWidth',1.5)
plot(ti3,Fz3,'lineWidth',1.5)
plot(ti4,Fz4,'lineWidth',1.5)
plot(timestamp1*Ts1,ones(length(timestamp1),1),'x','lineWidth',2,'MarkerSize',8)
plot(timestamp2*Ts2,ones(length(timestamp2),1),'x','lineWidth',2,'MarkerSize',8)
plot(timestamp3*Ts3,ones(length(timestamp3),1),'x','lineWidth',2,'MarkerSize',8)
plot(timestamp4*Ts4,ones(length(timestamp4),1),'x','lineWidth',2,'MarkerSize',8)
grid on
plot(timing1*Ts1,Force_z1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2*Ts2,Force_z2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
plot(timing3*Ts3,Force_z3_off,'x','color','r','lineWidth',2,'MarkerSize',6)
plot(timing4*Ts4,Force_z4_off,'x','color','g','lineWidth',2,'MarkerSize',6)
ylabel('Fz no offsets [N] ')
legend("Data 1", "Data 2", "Data 3", "Data 4")
title("Interval selection and averaging")
xlabel('Time [s]')
hold off


figure()
hold on; grid on;
plot(ti1,Fy1,'lineWidth',1.5)
plot(ti2,Fy2,'lineWidth',1.5)
plot(ti3,Fy3,'lineWidth',1.5)
plot(ti4,Fy4,'lineWidth',1.5)
plot(timing1*Ts1,Force_y1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2*Ts2,Force_y2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
plot(timing3*Ts3,Force_y3_off,'x','color','b','lineWidth',2,'MarkerSize',6)
plot(timing4*Ts4,Force_y4_off,'x','color','b','lineWidth',2,'MarkerSize',6)
ylabel('Fy no offsets [N]')
legend("Data 1", "Data 2", "Data 3", "Data 4")
title("Interval selection and averaging")
xlabel('Time [s]')
hold off


figure()
hold on; grid on;
plot(ti1, Mx1,'lineWidth',1.5)
plot(ti2, Mx2,'lineWidth',1.5)
plot(ti3, Mx3,'lineWidth',1.5)
plot(ti4, Mx4,'lineWidth',1.5)
plot(timing1*Ts1,Torque_x1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2*Ts2,Torque_x2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
plot(timing3*Ts3,Torque_x3_off,'x','color','b','lineWidth',2,'MarkerSize',6)
plot(timing4*Ts4,Torque_x4_off,'x','color','b','lineWidth',2,'MarkerSize',6)
ylabel('Mx no offsets [Nm]')
legend("Data 1", "Data 2", "Data 3", "Data 4")
title("Interval selection and averaging")
xlabel('Time [s]')
hold off

%% Alignment of the tests

timestamps = zeros(1,length(auto.timestamp));
KJ = 1;
timelength = length(myvars.t{1});
for i = 1:length(auto.timestamp)
    timestamps(i) = auto.timestamp{i}(end);                                % Store all timestamp ends on one vector
    if length(myvars.t{i}) < timelength
        timelength = length(myvars.t{i});
        KJ = i;
    end
end

[~,KK] = mink(timestamps,1);                                                % Find the minimum of the ends, which is going to be the reference for the rest of the tests

reference_point = timestamps(KK);
for i=1:length(timestamps)                                                  % Obtain how many points need to be cut from the rest of the data, except for the reference
    timestamps(i) = timestamps(i)-reference_point;
    if timestamps(i) == 0
        timestamps(i) = 1;
    end
end


fn = fieldnames(myvars);
for k=1:numel(fn)-1
    for i = 1:length(timestamps)
        myvars.(fn{k}){i} = myvars.(fn{k}){i}(timestamps(i):end,:);
    end
end

for i = 1:length(timestamps)
    myvars.t{i} = myvars.t{i}(timestamps(i):end-1,:);
end

for j = 1:length(timestamps)
    myvars.t{j} = myvars.t{j} - myvars.t{j}(1,1);
end

% Finding shortest data vector
vector_lengths = zeros(1,length(timestamps));
for i =1:length(timestamps)
    vector_lengths(1,i) = length(myvars.Fy{i});
end
[~,KL] = maxk(vector_lengths,1);

% figure()
% hold on; grid on;
% plot(myvars.t{1},myvars.Fz{1},'linewidth',2)
% plot(myvars.t{2},myvars.Fz{2},'linewidth',2)
% plot(myvars.t{3},myvars.Fz{3},'linewidth',2)
% plot(myvars.t{4},myvars.Fz{4},'linewidth',2)


% Forcing equal lengths
for k=1:numel(fn)-1
    for i = 1:length(timestamps)
        myvars.(fn{k}){i} = [myvars.(fn{k}){i};zeros(vector_lengths(KL)-vector_lengths(i),1)];
    end
end 

for i = 1:length(timestamps)
    myvars.t{i} = [0:Ts1:(vector_lengths(KL)-1)*Ts1];
end


% Check alignment
figure()
subplot(3,1,1)
title("Alignment check")
hold on; grid on;
plot(myvars.t{1},myvars.Mx{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Mx{2},'lineWidth',1.5)
plot(myvars.t{3},myvars.Mx{3},'lineWidth',1.5)
plot(myvars.t{4},myvars.Mx{4},'lineWidth',1.5)
ylabel("M_x [N]")
subplot(3,1,2)
hold on; grid on;
plot(myvars.t{1},myvars.Fy{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Fy{2},'lineWidth',1.5)
plot(myvars.t{3},myvars.Fy{3},'lineWidth',1.5)
plot(myvars.t{4},myvars.Fy{4},'lineWidth',1.5)
ylabel("F_y [N]")
subplot(3,1,3)
hold on; grid on;
plot(myvars.t{1},myvars.Fz{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Fz{2},'lineWidth',1.5)
plot(myvars.t{3},myvars.Fz{3},'lineWidth',1.5)
plot(myvars.t{4},myvars.Fz{4},'lineWidth',1.5)
xlabel("Time [s]")
ylabel("F_z [N]")


%% Averaging the final result

myvars.tot_Fx = zeros(vector_lengths(KL),1);
for i = 1:length(timestamps)
    myvars.tot_Fx = myvars.tot_Fx + myvars.Fx{i};
end
myvars.tot_Fx = myvars.tot_Fx/i;

myvars.tot_Fy = zeros(vector_lengths(KL),1);
for i = 1:length(timestamps)
    myvars.tot_Fy = myvars.tot_Fy + myvars.Fy{i};
end
myvars.tot_Fy = myvars.tot_Fy/i;

myvars.tot_Mx = zeros(vector_lengths(KL),1);
for i = 1:length(timestamps)
    myvars.tot_Mx = myvars.tot_Mx + myvars.Mx{i};
end
myvars.tot_Mx = myvars.tot_Mx/i;

myvars.tot_My = zeros(vector_lengths(KL),1);
for i = 1:length(timestamps)
    myvars.tot_My = myvars.tot_My + myvars.My{i};
end
myvars.tot_My = myvars.tot_My/i;

myvars.tot_Mz = zeros(vector_lengths(KL),1);
for i = 1:length(timestamps)
    myvars.tot_Mz = myvars.tot_Mz + myvars.Mz{i};
end
myvars.tot_Mz = myvars.tot_Mz/i;

myvars.tot_Fz = zeros(vector_lengths(KL),1);
for i = 1:length(timestamps)
    myvars.tot_Fz = myvars.tot_Fz + myvars.Fz{i};
end
myvars.tot_Fz = myvars.tot_Fz/i;


%  %%% Find maximum points
Fx = myvars.tot_Fx;
Fy = myvars.tot_Fy;
Mx = myvars.tot_Mx;
My = myvars.tot_My;
Mz = myvars.tot_Mz;
ti = myvars.t{KK};
Fz = myvars.tot_Fz;

Force_z_avg  = [];
Force_x_avg  = [];
Force_y_avg  = [];
Torque_x_avg = [];
Torque_y_avg = [];
Torque_z_avg = [];

timing    = auto.timing{KK};
% Finding the average value of each segment and it's position in time
for i = 1:length(timing)              % Compute average of force in such timestamp
    Force_z_avg = [Force_z_avg;mean(Fz(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end
for i = 1:length(timing)              % Compute average of force in such timestamp
    Force_x_avg = [Force_x_avg;mean(Fx(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end
for i = 1:length(timing)              % Compute average of force in such timestamp
    Force_y_avg = [Force_y_avg;mean(Fy(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end
for i = 1:length(timing)              % Compute average of force in such timestamp
    Torque_x_avg = [Torque_x_avg;mean(Mx(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end
for i = 1:length(timing)              % Compute average of force in such timestamp
    Torque_y_avg = [Torque_y_avg;mean(My(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end
for i = 1:length(timing)              % Compute average of force in such timestamp
    Torque_z_avg = [Torque_z_avg;mean(Mz(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end

% Display mean
figure()
subplot(3,1,1)
title("Result of average")
hold on; grid on;
plot(myvars.t{KJ},myvars.tot_Mx,'lineWidth',1.5)
plot(timing*Ts1, Torque_x_avg, 'x', 'LineWidth',2,'MarkerSize',7)
ylabel("M_x avg [N]")
subplot(3,1,2)
hold on; grid on;
plot(myvars.t{KJ},myvars.tot_Fy,'lineWidth',1.5)
plot(timing*Ts1, Force_y_avg, 'x', 'LineWidth',2,'MarkerSize',7)
ylabel("F_y avg [N]")
subplot(3,1,3)
hold on; grid on;
plot(myvars.t{KJ},myvars.tot_Fz,'lineWidth',1.5)
plot(timing*Ts1, Force_z_avg, 'x', 'LineWidth',2,'MarkerSize',7)
xlabel("Time [s]")
ylabel("F_z avg [N]")
hold off

% Display mean
figure()
subplot(3,1,1)
title("Result of average")
hold on; grid on;
plot(myvars.t{KJ},myvars.tot_My,'lineWidth',1.5)
plot(timing*Ts1, Torque_y_avg, 'x', 'LineWidth',2,'MarkerSize',7)
ylabel("M_y avg [N]")
subplot(3,1,2)
hold on; grid on;
plot(myvars.t{KJ},myvars.tot_Fx,'lineWidth',1.5)
plot(timing*Ts1, Force_x_avg, 'x', 'LineWidth',2,'MarkerSize',7)
ylabel("F_x avg [N]")
subplot(3,1,3)
hold on; grid on;
plot(myvars.t{KJ},myvars.tot_Fz,'lineWidth',1.5)
plot(timing*Ts1, Force_z_avg, 'x', 'LineWidth',2,'MarkerSize',7)
xlabel("Time [s]")
ylabel("F_z avg [N]")
hold off
%% Saving the data into a csv file that can be later on used

result.files{1} = file1;
result.files{2} = file2;
result.files{3} = file2;
result.files{4} = file2;

result.time = myvars.t{KK};
result.Fx = myvars.tot_Fx;
result.Fy = myvars.tot_Fy;
result.Fz = myvars.tot_Fz;
result.Mx = myvars.tot_Mx;
result.My = myvars.tot_My;
result.Mz = myvars.tot_Mz;

result.timing    = timing;
result.Fx_points = Force_x_avg;
result.Fy_points = Force_y_avg;
result.Fz_points = Force_z_avg;
result.Mx_points = Torque_x_avg;
result.My_points = Torque_y_avg;
result.Mz_points = Torque_z_avg;

save(save_file, 'result');
