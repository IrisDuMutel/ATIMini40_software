clear variables
close all


% Problem parameters
L          = 0.20;     %m
numBlades  = 2;
Radius     = 0.2032/2; %m (diameter if 0.2 is used
R_constant = 287.04; % m^2 /°Ksec^2
toKelvin   = 273.15;
rpm12 = [4,7,9,12];  %%% Levels to be taken for equal RPM comparison



%%%% For extended files containing voltages and time vector
folder = fileparts(pwd);
ft_path = '../LogFiles/20231002/FT/';
rpm_path = '../LogFiles/20231002/RPM/';
file1 = 'log_20231002_10inch1R_test4.csv';
file2 = 'log_20231002_10inch1R_test3.csv';

title_size = 6;

filepath1 = strcat(ft_path,file1);
filepath2 = strcat(ft_path,file2);
filepath1_rpm = strcat(rpm_path,file1);
filepath2_rpm = strcat(rpm_path,file2);

test1 = readtable(filepath1);
test2 = readtable(filepath2);
rpm1  = readtable(filepath1_rpm);
rpm2  = readtable(filepath2_rpm);

sampl_f1 = test1{1,1}; % Sampling frequency of the signal
sampl_f2 = test2{1,1}; % Sampling frequency of the signal
Ts1 = 1/sampl_f1;
Ts2 = 1/sampl_f2;

step_dur_insecs = 10;
aver_points = 0.7;                              % Percentage of each step to be taken for average
step_duration = step_dur_insecs/Ts1;
segment_points = aver_points*step_duration;     % Number of points used for aveaging
offset_points  = 250;                           % points to be ignored from last step backward
steps_per_stair = 5;                            % How many steps is each stair


temp1 = test1(1,4);
temp2 = test2(1,4);
pres1 = test1(1,5);
pres2 = test2(1,5);

offset    = 1;  % 3000 is 20s (offset*Ts = seconds)
fx_column = 1;
fy_column = 2;
fz_column = 3;
mx_column = 4;
my_column = 5;
mz_column = 6;

time1 = [offset*Ts1:Ts1:Ts1*(length(test1{:,2})-1)];
time2 = [offset*Ts2:Ts2:Ts2*(length(test2{:,2})-1)];

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
filtered_Fx1 = filtered_Fx1(offset:end) - filtered_Fx1(offset);
filtered_Fy1 = filtered_Fy1(offset:end) - filtered_Fy1(offset);
filtered_Fz1 = filtered_Fz1(offset:end) - filtered_Fz1(offset);
filtered_Mx1 = filtered_Mx1(offset:end) - filtered_Mx1(offset);
filtered_My1 = filtered_My1(offset:end) - filtered_My1(offset);
filtered_Mz1 = filtered_Mz1(offset:end) - filtered_Mz1(offset);

filtered_Fx2 = filtered_Fx2(offset:end) - filtered_Fx2(offset);
filtered_Fy2 = filtered_Fy2(offset:end) - filtered_Fy2(offset);
filtered_Fz2 = filtered_Fz2(offset:end) - filtered_Fz2(offset);
filtered_Mx2 = filtered_Mx2(offset:end) - filtered_Mx2(offset);
filtered_My2 = filtered_My2(offset:end) - filtered_My2(offset);
filtered_Mz2 = filtered_Mz2(offset:end) - filtered_Mz2(offset);


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
for i=length(time_stamp1):-1:1                                              % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end


timestamp2 = [];
for i=length(time_stamp2):-1:1                                              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp1)-1              % Compute average of force in such timestamp
    Force_z1 = [Force_z1;mean(Fz1(abs(timestamp1(i:i+1))))];
    timing1  = [timing1;abs(mean(timestamp1(i:i+1)))];     % Place average of force at average of time
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
Fz1_off = F_z_1;
for i = 1:2:length(timestamp1)-1             % Compute average of force in such timestamp
    Force_z1_off = [Force_z1_off;mean(Fz1_off(abs(timestamp1(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp2)-1              % Compute average of force in such timestamp
    Force_z2 = [Force_z2;mean(Fz2(abs(timestamp2(i:i+1))))];
    timing2  = [timing2;abs(mean(timestamp2(i:i+1)))];     % Place average of force at average of time
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
Fz2_off = F_z_2;
for i = 1:2:length(timestamp2)-1             % Compute average of force in such timestamp
    Force_z2_off = [Force_z2_off;mean(Fz2_off(abs(timestamp2(i:i+1))))];
end


while length(Force_z1_off)<=11
    Force_z1_off = [0;Force_z1_off];
    timing1  = [1;timing1];
end
while length(Force_z2_off)<=11
    Force_z2_off = [0;Force_z2_off];
    timing2  = [1;timing2];
end

F_z1_off_12inches = Force_z1_off;
F_z2_off_12inches = Force_z2_off;
Force_z1_off_12inches = Force_z1_off;
Force_z2_off_12inches = Force_z2_off;


i=1;
while length(F_z1_off_12inches)>12
    F_z1_off_12inches(1) = [];
    i = i + 1;
end
i=1;
while length(F_z2_off_12inches)>12
    F_z2_off_12inches(1) = [];
    i = i + 1;
end

timing1_12inches = timing1;
timing2_12inches = timing2;

ti1_12inches = ti1;
ti2_12inches = ti2;


%%%%% H. Force %%%%%
Force_1 = [];
Force_2 = [];
Force_1_off = [];
Force_2_off = [];

for i = 1:2:length(timestamp1)-1
    Force_1 = [Force_1; mean(Fhtal1(abs(timestamp1(i:i+1))))];
end
F_1 =[Fhtal1(1:timing1(positions1(1)))-Force_1(positions1(1))];
for i = 1:length(positions1)-1
    F_1 = [F_1;Fhtal1(timing1(positions1(i))+1:timing1(positions1(i+1)))-Force_1(positions1(i))];
end
F_1 = [F_1;Fhtal1(timing1(positions1(end))+1:end)-Force_1(positions1(end))];
% We compute again the average values of the segments
Fhtal1_off = F_1;
for i = 1:2:length(timestamp1)-1             % Compute average of force in such timestamp
    Force_1_off = [Force_1_off;mean(Fhtal1_off(abs(timestamp1(i:i+1))))];
end


for i = 1:2:length(timestamp2)-1
    Force_2 = [Force_2; mean(Fhtal2(abs(timestamp2(i:i+1))))];
end
F_2 =[Fhtal2(1:timing2(positions2(1)))-Force_2(positions2(1))];
for i = 1:length(positions2)-1
    F_2 = [F_2;Fhtal2(timing2(positions2(i))+1:timing2(positions2(i+1)))-Force_2(positions2(i))];
end
F_2 = [F_2;Fhtal2(timing2(positions2(end))+1:end)-Force_2(positions2(end))];
% We compute again the average values of the segments
Fhtal2_off = F_2;
for i = 1:2:length(timestamp2)-1             % Compute average of force in such timestamp
    Force_2_off = [Force_2_off;mean(Fhtal2_off(abs(timestamp2(i:i+1))))];
end



while length(Force_1_off)<=11
    Force_1_off = [0;Force_1_off];
end
while length(Force_2_off)<=11
    Force_2_off = [0;Force_2_off];
end


%%%%% Torque %%%%%
M_htal1 = [];
M_htal2 = [];
M_htal1_off = [];
M_htal2_off = [];


for i = 1:2:length(timestamp1)-1
    M_htal1 = [M_htal1; mean(Mhtal1(abs(timestamp1(i:i+1))))];
end
M_x_1 =[Mhtal1(1:timing1(positions1(1)))-M_htal1(positions1(1))];
for i = 1:length(positions1)-1
    M_x_1 = [M_x_1;Mhtal1(timing1(positions1(i))+1:timing1(positions1(i+1)))-M_htal1(positions1(i))];
end
M_x_1 = [M_x_1;Mhtal1(timing1(positions1(end))+1:end)-M_htal1(positions1(end))];
% We compute again the average values of the segments
Mhtal1_off = M_x_1;
for i = 1:2:length(timestamp1)-1             % Compute average of force in such timestamp
    M_htal1_off = [M_htal1_off;mean(Mhtal1_off(abs(timestamp1(i:i+1))))];
end


for i = 1:2:length(timestamp2)-1
    M_htal2 = [M_htal2; mean(Mhtal2(abs(timestamp2(i:i+1))))];
end
M_x_2 =[Mhtal2(1:timing2(positions2(1)))-M_htal2(positions2(1))];
for i = 1:length(positions2)-1
    M_x_2 = [M_x_2;Mhtal2(timing2(positions2(i))+1:timing2(positions2(i+1)))-M_htal2(positions2(i))];
end
M_x_2 = [M_x_2;Mhtal2(timing2(positions2(end))+1:end)-M_htal2(positions2(end))];
% We compute again the average values of the segments
Mhtal2_off = M_x_2;
for i = 1:2:length(timestamp2)-1             % Compute average of force in such timestamp
    M_htal2_off = [M_htal2_off;mean(Mhtal2_off(abs(timestamp2(i:i+1))))];
end


while length(M_htal1_off)<=11
    M_htal1_off = [0;M_htal1_off];
end
while length(M_htal2_off)<=11
    M_htal2_off = [0;M_htal2_off];
end


myvars.Fy{1} = Fhtal1_off;
myvars.Fy{2} = Fhtal2_off;

myvars.Fz{1} = Fz1_off;
myvars.Fz{2} = Fz2_off;

myvars.Mx{1} = Mhtal1_off;
myvars.Mx{2} = Mhtal2_off;

myvars.t{1} = ti1_12inches';
myvars.t{2} = ti2_12inches';


%%% WE HAVE THO FOLLOWING VARIABLES AVAILABLE: %%%
%%% Horizontal Forces: Fy
%%% Horizontal Torques: Mx
%%% Force_z
%%% times
%%% These stucts contain the variables of each datafile


% Plot of Fz removing offsets and marking RPM12 levels
figure()
hold on
plot(time1,diff1);
plot(time2,diff2);
plot(ti1_12inches,filtered_Fz1,'lineWidth',1.5)
plot(ti2_12inches,filtered_Fz2,'lineWidth',1.5)
plot(timestamp1*Ts1,ones(length(timestamp1),1),'x','lineWidth',2,'MarkerSize',8)
plot(timestamp2*Ts2,ones(length(timestamp2),1),'x','lineWidth',2,'MarkerSize',8)
grid on
plot(timing1_12inches*Ts1,Force_z1_off_12inches,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2_12inches*Ts1,Force_z2_off_12inches,'x','color','b','lineWidth',2,'MarkerSize',6)
ylabel('Fz no offsets [N] 12"x5"')
legend("Data 1", "Data 2")
title("Interval selection and averaging")
xlabel('Time [s]')
hold off


%% Alignment of the tests

timestamps = [timestamp1(end); timestamp2(end)];                            % Store all timestamp ends on one vector

[~,KK] = mink(timestamps,1);                                                % Find the minimum of the ends, which is coing to be the reference for the rest of the tests
[~,KJ] = mink([length(time1),length(time2)],1);                                                % Find the minimum of the ends, which is coing to be the reference for the rest of the tests

reference_point = timestamps(KK);
reference_length = length(myvars.t{KJ})
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
    myvars.t{i} = myvars.t{i} - myvars.t{i}(1);
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
hold on; grid on;
plot(myvars.t{1},myvars.Fz{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Fz{2},'lineWidth',1.5)
xlabel("Time [s]")
ylabel("F_z [N]")
title("Alignment check")

%% Averaging

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

 % Display mean
figure()
hold on; grid on;
plot(myvars.t{1},myvars.Fz{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Fz{2},'lineWidth',1.5)
plot(myvars.t{1},myvars.tot_Fz,'lineWidth',1.5)
xlabel("Time [s]")
ylabel("F_z [N]")
title("Result of average")

%% Saving the data into a csv file that can be later on used