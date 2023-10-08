clear variables
close all

% This file averages TWO equivalent data logs

%%%% For extended files containing voltages and time vector
ft_path = '../LogFiles/20231002/FT/';
rpm_path = '../LogFiles/20231002/RPM/';
file1 = 'log_20231002_10inch1R_test4.csv';
file2 = 'log_20231002_10inch1R_test3.csv';

filename = "log_20231002_10inch1R_average.mat";

save_file = strcat(ft_path,filename);
title_size = 6;
points_to_avg = 100;


filepath1 = strcat(ft_path,file1);
filepath2 = strcat(ft_path,file2);
filepath1_rpm = strcat(rpm_path,file1);
filepath2_rpm = strcat(rpm_path,file2);

test1 = readtable(filepath1);
test2 = readtable(filepath2);
rpm1  = readtable(filepath1_rpm);
rpm2  = readtable(filepath2_rpm);

sampl_f1 = test1{1,1};                                                      % Sampling frequency of the signal
sampl_f2 = test2{1,1};                                                      % Sampling frequency of the signal
Ts1 = 1/sampl_f1;
Ts2 = 1/sampl_f2;
temp1 = test1{1,4};                                                         % Temperature
temp2 = test2{1,4};
pres1 = test1{1,5};                                                         % Pressure
pres2 = test1{1,5};


step_dur_insecs = 10;                                                       % Step duration in seconds (as specified in the arduino file)
aver_points = 0.7;                                                          % Percentage of each step to be taken for average
step_duration = step_dur_insecs/Ts1;                                        % Actual number of data points that make a step
segment_points = aver_points*step_duration;                                 % Number of points used for aveaging
offset_points  = 250;                                                       % points to be ignored from last step backward
steps_per_stair = 5;                                                        % How many steps is each stair


temp1 = test1(1,4);
temp2 = test2(1,4);
pres1 = test1(1,5);
pres2 = test2(1,5);

offset    = 1000;  % 3000 is 20s (offset*Ts = seconds)
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
filtered_Fx1 = filtered_Fx1(1:end) - filtered_Fx1(offset);
filtered_Fy1 = filtered_Fy1(1:end) - filtered_Fy1(offset);
filtered_Fz1 = filtered_Fz1(1:end) - filtered_Fz1(offset);
filtered_Mx1 = filtered_Mx1(1:end) - filtered_Mx1(offset);
filtered_My1 = filtered_My1(1:end) - filtered_My1(offset);
filtered_Mz1 = filtered_Mz1(1:end) - filtered_Mz1(offset);

filtered_Fx2 = filtered_Fx2(1:end) - filtered_Fx2(offset);
filtered_Fy2 = filtered_Fy2(1:end) - filtered_Fy2(offset);
filtered_Fz2 = filtered_Fz2(1:end) - filtered_Fz2(offset);
filtered_Mx2 = filtered_Mx2(1:end) - filtered_Mx2(offset);
filtered_My2 = filtered_My2(1:end) - filtered_My2(offset);
filtered_Mz2 = filtered_Mz2(1:end) - filtered_Mz2(offset);


%%%% Data without base offsets (Check point that everything is fine)
% FORCES
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

% TORQUES
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


%% %%% Automatic point selection for multiple files

Fhtal1 = filtered_Fy1;
Mhtal1 = filtered_Mx1;
ti1    = time1;
Fhtal2 = filtered_Fy2;
Mhtal2 = filtered_Mx2;
ti2    = time2;

Fz1 = filtered_Fz1;
Fz2 = filtered_Fz2;

diff1 = 0;                                                                  % gradient initialization
diff2 = 0;                                                                  % gradient initialization

Force_z1 = [];
Force_z2 = [];

timing1  = [];
timing2  = [];

Force_z1_off = [];
Force_z2_off = [];


for i=1:1:length(Fz1)-1   
    diff1 = [diff1; (Fz1(i)-Fz1(i+1))/Ts1];                                 % compute the gradient at Ts1
end   
for i=1:1:length(Fz2)-1   
    diff2 = [diff2; (Fz2(i)-Fz2(i+1))/Ts2];                                 % compute the gradient at Ts2
end  


[~,C1] = maxk(abs(diff1),10);                                               % get the 10 maximum values in the gradient
[~,C2] = maxk(abs(diff2),10);

time_stamp1 = maxk(C1,1):-step_duration:1;                                  % adjust timestamp depending on step duration
time_stamp2 = maxk(C2,1):-step_duration:1;                                  % adjust timestamp depending on step duration


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


timestamp1 = sort(timestamp1);
timestamp2 = sort(timestamp2);



% Finding the average position in time
for i = 1:2:length(timestamp1)-1              
    timing1  = [timing1;abs(mean(timestamp1(i:i+1)))];    
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
    timing2  = [timing2;abs(mean(timestamp2(i:i+1)))];    
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


while length(Force_z1_off)<=11
    Force_z1_off = [0;Force_z1_off];
    timing1  = [1;timing1];
end
while length(Force_z2_off)<=11
    Force_z2_off = [0;Force_z2_off];
    timing2  = [1;timing2];
end

F_z1_off = Force_z1_off;
F_z2_off = Force_z2_off;

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



%%%%% H. Force %%%%%
Force_1 = [];
Force_2 = [];
Force_1_off = [];
Force_2_off = [];

for i=1:length(timing1)
    Force_1 = [Force_1; mean(Fhtal1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))] ;
end
F_1 = Fhtal1(1:timing1(positions1(1)))-Force_1(positions1(1));
for i = 1:length(positions1)-1
    F_1 = [F_1;Fhtal1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Force_1(positions1(i))];
end
F_1 = [F_1;Fhtal1(timing1(positions1(end))+1:end)-Force_1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Force_1_off = [Force_1_off;mean(F_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


for i=1:length(timing2)
    Force_2 = [Force_2; mean(Fhtal2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))] ;
end
F_2 =Fhtal2(1:timing2(positions2(1)))-Force_2(positions2(1));
for i = 1:length(positions2)-1
    F_2 = [F_2;Fhtal2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Force_2(positions2(i))];
end
F_2 = [F_2;Fhtal2(timing2(positions2(end))+1:end)-Force_2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Force_2_off = [Force_2_off;mean(F_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end


while length(Force_1_off)<=11
    Force_1_off = [0;Force_1_off];
end
while length(Force_2_off)<=11
    Force_2_off = [0;Force_2_off];
end


%%%%% Torque %%%%%
Torque1 = [];
Torque2 = [];
Torque_1_off = [];
Torque_2_off = [];


for i = 1:length(timing1)
    Torque1 = [Torque1; mean(Mhtal1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end
M_x_1 = Mhtal1(1:timing1(positions1(1)))-Torque1(positions1(1));
for i = 1:length(positions1)-1
    M_x_1 = [M_x_1;Mhtal1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Torque1(positions1(i))];
end
M_x_1 = [M_x_1;Mhtal1(timing1(positions1(end))+1:end)-Torque1(positions1(end))];
% We compute again the average values of the segments
for i = 1:length(timing1)             % Compute average of force in such timestamp
    Torque_1_off = [Torque_1_off;mean(M_x_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2))];
end


for i = 1:length(timing2)
    Torque2 = [Torque2; mean(Mhtal2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end
M_x_2 = Mhtal2(1:timing2(positions2(1)))-Torque2(positions2(1));
for i = 1:length(positions2)-1
    M_x_2 = [M_x_2;Mhtal2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Torque2(positions2(i))];
end
M_x_2 = [M_x_2;Mhtal2(timing2(positions2(end))+1:end)-Torque2(positions2(end))];
% We compute again the average values of the segments
for i = 1:length(timing2)             % Compute average of force in such timestamp
    Torque_2_off = [Torque_2_off;mean(M_x_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2))];
end


while length(Torque_1_off)<=11
    Torque_1_off = [0;Torque_1_off];
end
while length(Torque_2_off)<=11
    Torque_2_off = [0;Torque_2_off];
end


auto.timestamp{1} = timestamp1;
auto.timestamp{2} = timestamp2;
auto.timing{1} = timing1;
auto.timing{2} = timing2;

myvars.Fy{1} = F_1;
myvars.Fy{2} = F_2;

myvars.Fz{1} = F_z_1;
myvars.Fz{2} = F_z_2;

myvars.Mx{1} = M_x_1;
myvars.Mx{2} = M_x_2;

myvars.t{1} = ti1';
myvars.t{2} = ti2';


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
plot(ti1,filtered_Fz1,'lineWidth',1.5)
plot(ti2,filtered_Fz2,'lineWidth',1.5)
plot(timestamp1*Ts1,ones(length(timestamp1),1),'x','lineWidth',2,'MarkerSize',8)
plot(timestamp2*Ts2,ones(length(timestamp2),1),'x','lineWidth',2,'MarkerSize',8)
grid on
plot(timing1*Ts1,Force_z1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2*Ts1,Force_z2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
ylabel('Fz no offsets [N] ')
legend("Data 1", "Data 2")
title("Interval selection and averaging")
xlabel('Time [s]')
hold off


figure()
hold on; grid on;
plot(ti1,filtered_Fy1,'lineWidth',1.5)
plot(ti2,filtered_Fy2,'lineWidth',1.5)
plot(timing1*Ts1,Force_1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2*Ts1,Force_2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
ylabel('Fy no offsets [N]')
legend("Data 1", "Data 2")
title("Interval selection and averaging")
xlabel('Time [s]')
hold off


figure()
hold on; grid on;
plot(ti1,filtered_Mx1,'lineWidth',1.5)
plot(ti2,filtered_Mx2,'lineWidth',1.5)
plot(timing1*Ts1,Torque_1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2*Ts1,Torque_2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
ylabel('Mx no offsets [Nm]')
legend("Data 1", "Data 2")
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
reference_length = length(myvars.t{KJ});
for i=1:length(timestamps)                                                  % Obtain how many points need to be cut from the rest of the data, except for the reference
    timestamps(i) = timestamps(i)-reference_point;
    if timestamps(i) == 0
        timestamps(i) = 1;
    end
end


fn = fieldnames(myvars);
for k=1:numel(fn)
    for i = 1:length(timestamps)
        myvars.(fn{k}){i} = myvars.(fn{k}){i}(timestamps(i):reference_length,:);
    end
end

for j = 1:length(timestamps)
    myvars.t{j} = myvars.t{j} - myvars.t{j}(1,1);
end

% Finding shortest data vector
vector_lengths = zeros(1,length(timestamps));
for i =1:length(timestamps)
    vector_lengths(1,i) = length(myvars.Fy{i});
end
[~,KL] = mink(vector_lengths,1);

% Forcing equal lengths
for k=1:numel(fn)
    for i = 1:length(timestamps)
        myvars.(fn{k}){i} = myvars.(fn{k}){i}(1:vector_lengths(KL),:);
    end
end 


% Check alignment
figure()
subplot(3,1,1)
title("Alignment check")
hold on; grid on;
plot(myvars.t{1},myvars.Mx{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Mx{2},'lineWidth',1.5)
ylabel("M_x [N]")
subplot(3,1,2)
hold on; grid on;
plot(myvars.t{1},myvars.Fy{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Fy{2},'lineWidth',1.5)
ylabel("F_y [N]")
subplot(3,1,3)
hold on; grid on;
plot(myvars.t{1},myvars.Fz{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Fz{2},'lineWidth',1.5)
xlabel("Time [s]")
ylabel("F_z [N]")


%% Averaging the final result


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

 myvars.tot_Fz = zeros(vector_lengths(KL),1);
 for i = 1:length(timestamps)
     myvars.tot_Fz = myvars.tot_Fz + myvars.Fz{i};
 end
 myvars.tot_Fz = myvars.tot_Fz/i;


%  %%% Find maximum points
F = myvars.tot_Fy;
M = myvars.tot_Mx;
ti = myvars.t{KJ};
Fz = myvars.tot_Fz;

Force_z_avg  = [];
Force_y_avg  = [];
Torque_x_avg = [];

timing    = auto.timing{KJ};
% Finding the average value of each segment and it's position in time
for i = 1:length(timing)              % Compute average of force in such timestamp
    Force_z_avg = [Force_z_avg;mean(Fz(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end
for i = 1:length(timing)              % Compute average of force in such timestamp
    Force_y_avg = [Force_y_avg;mean(F(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
end
for i = 1:length(timing)              % Compute average of force in such timestamp
    Torque_x_avg = [Torque_x_avg;mean(M(timing(i)-points_to_avg/2:timing(i)+points_to_avg/2))];
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

%% Saving the data into a csv file that can be later on used

result.files{1} = file1;
result.files{2} = file2;

result.time = myvars.t{KJ};
result.Fy = myvars.tot_Fy;
result.Fz = myvars.tot_Fz;
result.Mx = myvars.tot_Mx;

result.timing    = timing;
result.Fy_points = Force_y_avg;
result.Fz_points = Force_z_avg;
result.Mx_points = Torque_x_avg;

save(save_file, 'result');
