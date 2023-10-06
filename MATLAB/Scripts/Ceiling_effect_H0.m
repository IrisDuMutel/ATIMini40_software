close all
clear variables
% This script shows results of ceiling effect from tests conducted on March 2023

% Problem parameters
timeLoadCellfactor = 10;
distances = [5,15,25,35,100];
rpm10 = [4,6,9,11];  %%% Levels to be taken for equal RPM comparison
rpm12 = [4,7,9,12];  %%% Levels to be taken for equal RPM comparison
Fz10  = [5,7,10,12]; %%% Levels to be taken for equal Fz comparison
Fz12  = [5,6,10,11]; %%% Levels to be taken for equal Fz comparison
% Load Cell parameters
Nominal_accuracy = 0.0025;
Fz_meas_range    = 400; % - (-400);
Fxy_meas_range   = 200; % - (-200);
M_meas_range     = 16;  % - (-16);
Fz_acc  = 0;            %Nominal_accuracy*Fz_meas_range;
Fxy_acc = 0;            %Nominal_accuracy*Fxy_meas_range;
M_acc   = 0;            %Nominal_accuracy*M_meas_range;
test_orient = pi/4;


set(groot,'defaultLegendInterpreter','latex');
%%%% File selection and loading of data

LC1 = '20230321/LoadCell/log_20230321_095608_12inch_ceiling5cm_12.csv';
LC2 = '20230321/LoadCell/log_20230321_095608_12inch_ceiling15cm_14.csv';
LC3 = '20230322/LoadCell/log_20230322_111212_12inch_ceiling_25cm_9.csv';
LC4 = '20230322/LoadCell/log_20230322_111212_12inch_ceiling_35cm_11.csv';
LC5 = '20230323/LoadCell/log_20230323_090052_12inch_wall_infR_21.csv';

step_duration = 450;
segment_points = 150;           %100 8 inches           % how many points do we select
offset_points  = 100;            % 80 8 inches
steps_per_stair = 5;

text1 = string(distances(1));
text2 = string(distances(2));
text3 = string(distances(3));
text4 = string(distances(4));
text5 = string(distances(5));

test1 = readtable(LC1);
test2 = readtable(LC2);
test3 = readtable(LC3);
test4 = readtable(LC4);
test5 = readtable(LC5);

time1 = test1{1:end,1}./timeLoadCellfactor;
Fx1 = test1{1:end,2}-test1{1,2};
Fy1 = test1{1:end,3}-test1{1,3};
Fz1 = test1{1:end,4}-test1{1,4};
Mx1 = (test1{1:end,5}-test1{1,5})/10;
My1 = (test1{1:end,6}-test1{1,6})/10;
Mz1 = (test1{1:end,7}-test1{1,7})/10;


time2 = test2{1:end,1}./timeLoadCellfactor;
Fx2 = test2{1:end,2}-test2{1,2};
Fy2 = test2{1:end,3}-test2{1,3};
Fz2 = test2{1:end,4}-test2{1,4};
Mx2 = (test2{1:end,5}-test2{1,5})/10;
My2 = (test2{1:end,6}-test2{1,6})/10;
Mz2 = (test2{1:end,7}-test2{1,7})/10;


time3 = test3{1:end,1}./timeLoadCellfactor;
Fx3 = test3{1:end,2}-test3{1,2};
Fy3 = test3{1:end,3}-test3{1,3};
Fz3 = test3{1:end,4}-test3{1,4};
Mx3 = (test3{1:end,5}-test3{1,5})/10;
My3 = (test3{1:end,6}-test3{1,6})/10;
Mz3 = (test3{1:end,7}-test3{1,7})/10;


time4 = test4{1:end,1}./timeLoadCellfactor;
Fx4 = test4{1:end,2}-test4{1,2};
Fy4 = test4{1:end,3}-test4{1,3};
Fz4 = test4{1:end,4}-test4{1,4};
Mx4 = (test4{1:end,5}-test4{1,5})/10;
My4 = (test4{1:end,6}-test4{1,6})/10;
Mz4 = (test4{1:end,7}-test4{1,7})/10;


time5 = test5{1:end,1}./timeLoadCellfactor;
Fx5 = test5{1:end,2}-test5{1,2};
Fy5 = test5{1:end,3}-test5{1,3};
Fz5 = test5{1:end,4}-test5{1,4};
Mx5 = (test5{1:end,5}-test5{1,5})/10;
My5 = (test5{1:end,6}-test5{1,6})/10;
Mz5 = (test5{1:end,7}-test5{1,7})/10;


time1 = time1 - time1(1) + 1;
time2 = time2 - time2(1) + 1;
time3 = time3 - time3(1) + 1;
time4 = time4 - time4(1) + 1;
time5 = time5 - time5(1) + 1;


F1_tot =    -Fx1.*sin(test_orient)+Fy1.*cos(test_orient);
M1_tot =     Mx1.*cos(test_orient)+My1.*sin(test_orient);
F2_tot =    -Fx2.*sin(test_orient)+Fy2.*cos(test_orient);
M2_tot =     Mx2.*cos(test_orient)+My2.*sin(test_orient);
F3_tot =    -Fx3.*sin(test_orient)+Fy3.*cos(test_orient);
M3_tot =     Mx3.*cos(test_orient)+My3.*sin(test_orient);
F4_tot =    -Fx4.*sin(test_orient)+Fy4.*cos(test_orient);
M4_tot =     Mx4.*cos(test_orient)+My4.*sin(test_orient);
F5_tot =    -Fx5.*sin(test_orient)+Fy5.*cos(test_orient);
M5_tot =     Mx5.*cos(test_orient)+My5.*sin(test_orient);

%% %%% Automatic point selection for six files

Fhtal1 = F1_tot;
Mhtal1 = M1_tot;
ti1    = time1;
Fhtal2 = F2_tot;
Mhtal2 = M2_tot;
ti2    = time2;
Fhtal3 = F3_tot;
Mhtal3 = M3_tot;
ti3    = time3;
Fhtal4 = F4_tot;
Mhtal4 = M4_tot;
ti4    = time4;
Fhtal5 = F5_tot;
Mhtal5 = M5_tot;
ti5    = time5;

diff1 = 0;                                    % gradient initialization
diff2 = 0;                                    % gradient initialization
diff3 = 0;                                    % gradient initialization
diff4 = 0;                                    % gradient initialization
diff5 = 0;                                    % gradient initialization
diff6 = 0;                                    % gradient initialization
Force_z1 = [];
Force_z2 = [];
Force_z3 = [];
Force_z4 = [];
Force_z5 = [];
timing1  = [];
timing2  = [];
timing3  = [];
timing4  = [];
timing5  = [];
Force_z1_off = [];
Force_z2_off = [];
Force_z3_off = [];
Force_z4_off = [];
Force_z5_off = [];

for i=1:1:length(Fz1)-1   
    diff1 = [diff1; (Fz1(i)-Fz1(i+1))/0.1];    % compute the gradient at 10 Hz
end   
for i=1:1:length(Fz2)-1   
    diff2 = [diff2; (Fz2(i)-Fz2(i+1))/0.1];    % compute the gradient at 10 Hz
end  
for i=1:1:length(Fz3)-1   
    diff3 = [diff3; (Fz3(i)-Fz3(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(Fz4)-1   
    diff4 = [diff4; (Fz4(i)-Fz4(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(Fz5)-1   
    diff5 = [diff5; (Fz5(i)-Fz5(i+1))/0.1];    % compute the gradient at 10 Hz
end

[~,C1] = maxk(abs(diff1),10);                      % get the 10 maximum values in the gradient
[~,C2] = maxk(abs(diff2),10); 
[~,C3] = maxk(abs(diff3),10); 
[~,C4] = maxk(abs(diff4),10); 
[~,C5] = maxk(abs(diff5),10); 

time_stamp1 = maxk(C1,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp2 = maxk(C2,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp3 = maxk(C3,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp4 = maxk(C4,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp5 = maxk(C5,1):-step_duration:1;   % adjust timestamp depending on step duration

timestamp1 = [];
for i=length(time_stamp1):-1:1                 % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end


timestamp2 = [];
for i=length(time_stamp2):-1:1              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

timestamp3 = [];
for i=length(time_stamp3):-1:1              % Create timestamp vector of smaller segments
    time_stamp3(i) = time_stamp3(i)-offset_points;
    ending = time_stamp3(i)-segment_points;
    timestamp3 = [timestamp3;time_stamp3(i);ending];
end

timestamp4 = [];
for i=length(time_stamp4):-1:1                 % Create timestamp vector of smaller segments
    time_stamp4(i) = time_stamp4(i)-offset_points;
    ending = time_stamp4(i)-segment_points;
    timestamp4 = [timestamp4;time_stamp4(i);ending];
end

timestamp5 = [];
for i=length(time_stamp5):-1:1                 % Create timestamp vector of smaller segments
    time_stamp5(i) = time_stamp5(i)-offset_points;
    ending = time_stamp5(i)-segment_points;
    timestamp5 = [timestamp5;time_stamp5(i);ending];
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


zero_point = find(timestamp3==0);
if isempty(zero_point) == 0
    timestamp3(zero_point) = 1;
end
% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp3)-1              % Compute average of force in such timestamp
    Force_z3 = [Force_z3;mean(Fz3(abs(timestamp3(i:i+1))))];
    timing3  = [timing3;abs(mean(timestamp3(i:i+1)))];     % Place average of force at average of time
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
Fz3_off = F_z_3;
for i = 1:2:length(timestamp3)-1             % Compute average of force in such timestamp
    Force_z3_off = [Force_z3_off;mean(Fz3_off(abs(timestamp3(i:i+1))))];
end


zero_point = find(timestamp4==0);
if isempty(zero_point) == 0
    timestamp4(zero_point) = 1;
end

% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp4)-1              % Compute average of force in such timestamp
    Force_z4 = [Force_z4;mean(Fz4(abs(timestamp4(i:i+1))))];
    timing4  = [timing4;abs(mean(timestamp4(i:i+1)))];     % Place average of force at average of time
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
Fz4_off = F_z_4;
for i = 1:2:length(timestamp4)-1             % Compute average of force in such timestamp
    Force_z4_off = [Force_z4_off;mean(Fz4_off(abs(timestamp4(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp5)-1              % Compute average of force in such timestamp
    Force_z5 = [Force_z5;mean(Fz5(abs(timestamp5(i:i+1))))];
    timing5  = [timing5;abs(mean(timestamp5(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D5 = find(Force_z5==Force_z5(end-steps_per_stair+1));
D5 = max(D5);
E5 = [D5:-steps_per_stair:1];
positions5 = sort(E5);
F_z_5 =[Fz5(1:timing5(positions5(1)))-Force_z5(positions5(1))];
for i = 1:length(positions5)-1
    F_z_5 = [F_z_5;Fz5(timing5(positions5(i))+1:timing5(positions5(i+1)))-Force_z5(positions5(i))];
end
F_z_5 = [F_z_5;Fz5(timing5(positions5(end))+1:end)-Force_z5(positions5(end))];
% We compute again the average values of the segments
Fz5_off = F_z_5;
for i = 1:2:length(timestamp5)-1             % Compute average of force in such timestamp
    Force_z5_off = [Force_z5_off;mean(Fz5_off(abs(timestamp5(i:i+1))))];
end


while length(Force_z1_off)<=11
    Force_z1_off = [0;Force_z1_off];
    timing1  = [1;timing1];
end
while length(Force_z2_off)<=11
    Force_z2_off = [0;Force_z2_off];
    timing2  = [1;timing2];
end
while length(Force_z3_off)<=11
    Force_z3_off = [0;Force_z3_off];
    timing3  = [1;timing3];
end
while length(Force_z4_off)<=11
    Force_z4_off = [0;Force_z4_off];
    timing4  = [1;timing4];
end
while length(Force_z5_off)<=11
    Force_z5_off = [0;Force_z5_off];
    timing5  = [1;timing5];
end

F_z1_off_12inches = Force_z1_off;
F_z2_off_12inches = Force_z2_off;
F_z3_off_12inches = Force_z3_off;
F_z4_off_12inches = Force_z4_off;
F_z5_off_12inches = Force_z5_off;

Force_z1_off_12inches = Force_z1_off;
Force_z2_off_12inches = Force_z2_off;
Force_z3_off_12inches = Force_z3_off;
Force_z4_off_12inches = Force_z4_off;
Force_z5_off_12inches = Force_z5_off;

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
i=1;
while length(F_z3_off_12inches)>12
    F_z3_off_12inches(1) = [];
    i = i + 1;
end
i=1;
while length(F_z4_off_12inches)>12
    F_z4_off_12inches(1) = [];
    i = i + 1;
end
i=1;
while length(F_z5_off_12inches)>12
    F_z5_off_12inches(i) = [];
    i = i + 1;
end

Fz1_off_12inches = Fz1_off;
Fz2_off_12inches = Fz2_off;
Fz3_off_12inches = Fz3_off;
Fz4_off_12inches = Fz4_off;
Fz5_off_12inches = Fz5_off;

timing1_12inches = timing1;
timing2_12inches = timing2;
timing3_12inches = timing3;
timing4_12inches = timing4;
timing5_12inches = timing5;

ti1_12inches = ti1;
ti2_12inches = ti2;
ti3_12inches = ti3;
ti4_12inches = ti4;
ti5_12inches = ti5;

%% %% RPM and adimensionalization %%%%

R_10 = (24.5e-2)/2; % in meters
R_12 = (30.48e-2)/2;% in meters
L    = 0.22; %m
R_constant = 287.04; % m^2 /°Ksec^2
toKelvin   = 273.15;
step_duration = 320;
segment_points = 50;           %100 8 inches           % how many points do we select
offset_points  = 80;            % 80 8 inches
steps_per_stair = 5;
timeRPMfactor = 1;


%%% Load cell data
tach1_12inch_1 = '20230321/Tachometer3/20230321_test12.csv';
tach1_12inch_2 = '20230321/TachometerI/20230321_test12.csv';
tach2_12inch_1 = '20230321/Tachometer3/20230321_test14.csv';
tach2_12inch_2 = '20230321/TachometerI/20230321_test14.csv';
tach3_12inch_1 = '20230322/Tachometer3/20230322_test9.csv';
tach3_12inch_2 = '20230322/TachometerI/20230322_test9.csv';
tach4_12inch_1 = '20230322/Tachometer3/20230322_test11.csv';
tach4_12inch_2 = '20230322/TachometerI/20230322_test11.csv';
tach5_12inch_1 = '20230323/Tachometer3/20230323_test21.csv';
tach5_12inch_2 = '20230323/TachometerI/20230323_test21.csv';

T1_12inch = 20.6;
T2_12inch = 20.6;
T3_12inch = 20.6;
T4_12inch = 20.6;
T5_12inch = 20.6;
P1_12inch = 983.3e2;
P2_12inch = 982.6e2;
P3_12inch = 982.5e2;
P4_12inch = 982.5e2;
P5_12inch = 982.5e2;

rho1_12inch = P1_12inch/(R_constant*(T1_12inch+toKelvin));
rho2_12inch = P2_12inch/(R_constant*(T2_12inch+toKelvin));
rho3_12inch = P3_12inch/(R_constant*(T3_12inch+toKelvin));
rho4_12inch = P4_12inch/(R_constant*(T4_12inch+toKelvin));
rho5_12inch = P5_12inch/(R_constant*(T5_12inch+toKelvin));

tach1_12inch_3 = readtable(tach1_12inch_1);
tach1_12inch_I = readtable(tach1_12inch_2);
tach2_12inch_3 = readtable(tach2_12inch_1);
tach2_12inch_I = readtable(tach2_12inch_2);
tach3_12inch_3 = readtable(tach3_12inch_1);
tach3_12inch_I = readtable(tach3_12inch_2);
tach4_12inch_3 = readtable(tach4_12inch_1);
tach4_12inch_I = readtable(tach4_12inch_2);
tach5_12inch_3 = readtable(tach5_12inch_1);
tach5_12inch_I = readtable(tach5_12inch_2);

RPM1_12inch_3 = tach1_12inch_3{1:end,3}./2;
RPM1_12inch_I = tach1_12inch_I{1:end,3}./2;
RPM2_12inch_3 = tach2_12inch_3{1:end,3}./2;
RPM2_12inch_I = tach2_12inch_I{1:end,3}./2;
RPM3_12inch_3 = tach3_12inch_3{1:end,3}./2;
RPM3_12inch_I = tach3_12inch_I{1:end,3}./2;
RPM4_12inch_3 = tach4_12inch_3{1:end,3}./2;
RPM4_12inch_I = tach4_12inch_I{1:end,3}./2;
RPM5_12inch_3 = tach5_12inch_3{1:end,3}./2;
RPM5_12inch_I = tach5_12inch_I{1:end,3}./2;

time_RPM1_12inch_3 = tach1_12inch_3{1:end,1}./timeRPMfactor;
time_RPM1_12inch_I = tach1_12inch_I{1:end,1}./timeRPMfactor;
time_RPM2_12inch_3 = tach2_12inch_3{1:end,1}./timeRPMfactor;
time_RPM2_12inch_I = tach2_12inch_I{1:end,1}./timeRPMfactor;
time_RPM3_12inch_3 = tach3_12inch_3{1:end,1}./timeRPMfactor;
time_RPM3_12inch_I = tach3_12inch_I{1:end,1}./timeRPMfactor;
time_RPM4_12inch_3 = tach4_12inch_3{1:end,1}./timeRPMfactor;
time_RPM4_12inch_I = tach4_12inch_I{1:end,1}./timeRPMfactor;
time_RPM5_12inch_3 = tach5_12inch_3{1:end,1}./timeRPMfactor;
time_RPM5_12inch_I = tach5_12inch_I{1:end,1}./timeRPMfactor;

%% %%%%Tachometers 12 inches

ti1_12inch_3 = time_RPM1_12inch_3;
ti2_12inch_3 = time_RPM2_12inch_3;
ti3_12inch_3 = time_RPM3_12inch_3;
ti4_12inch_3 = time_RPM4_12inch_3;
ti5_12inch_3 = time_RPM5_12inch_3;
ti1_12inch_I = time_RPM1_12inch_I;
ti2_12inch_I = time_RPM2_12inch_I;
ti3_12inch_I = time_RPM3_12inch_I;
ti4_12inch_I = time_RPM4_12inch_I;
ti5_12inch_I = time_RPM5_12inch_I;

%%%%%% Tachometer 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diff1 = 0;                                    % gradient initialization
diff2 = 0;                                    % gradient initialization
diff3 = 0;                                    % gradient initialization
diff4 = 0;                                    % gradient initialization
diff5 = 0;                                    % gradient initialization

for i=1:1:length(RPM1_12inch_3)-1   
    diff1 = [diff1; (RPM1_12inch_3(i)-RPM1_12inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end   
for i=1:1:length(RPM2_12inch_3)-1   
    diff2 = [diff2; (RPM2_12inch_3(i)-RPM2_12inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end  
for i=1:1:length(RPM3_12inch_3)-1   
    diff3 = [diff3; (RPM3_12inch_3(i)-RPM3_12inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM4_12inch_3)-1   
    diff4 = [diff4; (RPM4_12inch_3(i)-RPM4_12inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM5_12inch_3)-1   
    diff5 = [diff5; (RPM5_12inch_3(i)-RPM5_12inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end

[~,C1] = maxk(abs(diff1),10);                      % get the 10 maximum values in the gradient
[~,C2] = maxk(abs(diff2),10); 
[~,C3] = maxk(abs(diff3),10); 
[~,C4] = maxk(abs(diff4),10); 
[~,C5] = maxk(abs(diff5),10); 

time_stamp1 = maxk(C1,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp2 = maxk(C2,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp3 = maxk(C3,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp4 = maxk(C4,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp5 = maxk(C5,1):-step_duration:1;   % adjust timestamp depending on step duration

timestamp1 = [];
for i=length(time_stamp1):-1:1                 % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end

timestamp2 = [];
for i=length(time_stamp2):-1:1              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

timestamp3 = [];
for i=length(time_stamp3):-1:1              % Create timestamp vector of smaller segments
    time_stamp3(i) = time_stamp3(i)-offset_points;
    ending = time_stamp3(i)-segment_points;
    timestamp3 = [timestamp3;time_stamp3(i);ending];
end

timestamp4 = [];
for i=length(time_stamp4):-1:1                 % Create timestamp vector of smaller segments
    time_stamp4(i) = time_stamp4(i)-offset_points;
    ending = time_stamp4(i)-segment_points;
    timestamp4 = [timestamp4;time_stamp4(i);ending];
end

timestamp5 = [];
for i=length(time_stamp5):-1:1                 % Create timestamp vector of smaller segments
    time_stamp5(i) = time_stamp5(i)-offset_points;
    ending = time_stamp5(i)-segment_points;
    timestamp5 = [timestamp5;time_stamp5(i);ending];
end

% Finding the average value of each segment and it's position in time
Tach1_12_3    = [];
timing1_12_3  = [];
Tach2_12_3    = [];
timing2_12_3  = [];
Tach3_12_3    = [];
timing3_12_3  = [];
Tach4_12_3    = [];
timing4_12_3  = [];
Tach5_12_3    = [];
timing5_12_3  = [];


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp1)-1              % Compute average of force in such timestamp
    Tach1_12_3 = [Tach1_12_3;mean(RPM1_12inch_3(abs(timestamp1(i:i+1))))];
    timing1_12_3  = [timing1_12_3;abs(mean(timestamp1(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D1 = find(Tach1_12_3==Tach1_12_3(end-steps_per_stair+1));
D1 = max(D1);
E1 = [D1:-steps_per_stair:1];
positions1 = sort(E1);
T1_12_3 =[RPM1_12inch_3(1:timing1_12_3(positions1(1)))-Tach1_12_3(positions1(1))];
for i = 1:length(positions1)-1
    T1_12_3 = [T1_12_3;RPM1_12inch_3(timing1_12_3(positions1(i))+1:timing1_12_3(positions1(i+1)))-Tach1_12_3(positions1(i))];
end
T1_12_3 = [T1_12_3;RPM1_12inch_3(timing1_12_3(positions1(end))+1:end)-Tach1_12_3(positions1(end))];
% We compute again the average values of the segments
Tach1_12_off_3 = [];
for i = 1:2:length(timestamp1)-1             % Compute average of force in such timestamp
    Tach1_12_off_3 = [Tach1_12_off_3;mean(T1_12_3(abs(timestamp1(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp2)-1              % Compute average of force in such timestamp
    Tach2_12_3 = [Tach2_12_3;mean(RPM2_12inch_3(abs(timestamp2(i:i+1))))];
    timing2_12_3  = [timing2_12_3;abs(mean(timestamp2(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D2 = find(Tach2_12_3==Tach2_12_3(end-steps_per_stair+1));
D2 = max(D2);
E2 = [D2:-steps_per_stair:1];
positions2 = sort(E2);
T2_12_3 =[RPM2_12inch_3(1:timing2_12_3(positions2(1)))-Tach2_12_3(positions2(1))];
for i = 1:length(positions2)-1
    T2_12_3 = [T2_12_3;RPM2_12inch_3(timing2_12_3(positions2(i))+1:timing2_12_3(positions2(i+1)))-Tach2_12_3(positions2(i))];
end
T2_12_3 = [T2_12_3;RPM2_12inch_3(timing2_12_3(positions2(end))+1:end)-Tach2_12_3(positions2(end))];
% We compute again the average values of the segments
Tach2_12_off_3 = [];
for i = 1:2:length(timestamp2)-1             % Compute average of force in such timestamp
    Tach2_12_off_3 = [Tach2_12_off_3;mean(T2_12_3(abs(timestamp2(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp3)-1              % Compute average of force in such timestamp
    Tach3_12_3 = [Tach3_12_3;mean(RPM3_12inch_3(abs(timestamp3(i:i+1))))];
    timing3_12_3  = [timing3_12_3;abs(mean(timestamp3(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D3 = find(Tach3_12_3==Tach3_12_3(end-steps_per_stair+1));
D3 = max(D3);
E3 = [D3:-steps_per_stair:1];
positions3 = sort(E3);
T3_12_3 =[RPM3_12inch_3(1:timing3_12_3(positions3(1)))-Tach3_12_3(positions3(1))];
for i = 1:length(positions3)-1
    T3_12_3 = [T3_12_3;RPM3_12inch_3(timing3_12_3(positions3(i))+1:timing3_12_3(positions3(i+1)))-Tach3_12_3(positions3(i))];
end
T3_12_3 = [T3_12_3;RPM3_12inch_3(timing3_12_3(positions3(end))+1:end)-Tach3_12_3(positions3(end))];
% We compute again the average values of the segments
Tach3_12_off_3 = [];
for i = 1:2:length(timestamp3)-1             % Compute average of force in such timestamp
    Tach3_12_off_3 = [Tach3_12_off_3;mean(T3_12_3(abs(timestamp3(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp4)-1              % Compute average of force in such timestamp
    Tach4_12_3 = [Tach4_12_3;mean(RPM4_12inch_3(abs(timestamp4(i:i+1))))];
    timing4_12_3  = [timing4_12_3;abs(mean(timestamp4(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D4 = find(Tach4_12_3==Tach4_12_3(end-steps_per_stair+1));
D4 = max(D4);
E4 = [D4:-steps_per_stair:1];
positions4 = sort(E4);
T4_12_3 =[RPM4_12inch_3(1:timing4_12_3(positions4(1)))-Tach4_12_3(positions4(1))];
for i = 1:length(positions4)-1
    T4_12_3 = [T4_12_3;RPM4_12inch_3(timing4_12_3(positions4(i))+1:timing4_12_3(positions4(i+1)))-Tach4_12_3(positions4(i))];
end
T4_12_3 = [T4_12_3;RPM4_12inch_3(timing4_12_3(positions4(end))+1:end)-Tach4_12_3(positions4(end))];
% We compute again the average values of the segments
Tach4_12_off_3 = [];
for i = 1:2:length(timestamp4)-1             % Compute average of force in such timestamp
    Tach4_12_off_3 = [Tach4_12_off_3;mean(T4_12_3(abs(timestamp4(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp5)-1              % Compute average of force in such timestamp
    Tach5_12_3 = [Tach5_12_3;mean(RPM5_12inch_3(abs(timestamp5(i:i+1))))];
    timing5_12_3  = [timing5_12_3;abs(mean(timestamp5(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D5 = find(Tach5_12_3==Tach5_12_3(end-steps_per_stair+1));
D5 = max(D5);
E5 = [D5:-steps_per_stair:1];
positions5 = sort(E5);
T5_12_3 =[RPM5_12inch_3(1:timing5_12_3(positions5(1)))-Tach5_12_3(positions5(1))];
for i = 1:length(positions5)-1
    T5_12_3 = [T5_12_3;RPM5_12inch_3(timing5_12_3(positions5(i))+1:timing5_12_3(positions5(i+1)))-Tach5_12_3(positions5(i))];
end
T5_12_3 = [T5_12_3;RPM5_12inch_3(timing5_12_3(positions5(end))+1:end)-Tach5_12_3(positions5(end))];
% We compute again the average values of the segments
Tach5_12_off_3 = [];
for i = 1:2:length(timestamp5)-1             % Compute average of force in such timestamp
    Tach5_12_off_3 = [Tach5_12_off_3;mean(T5_12_3(abs(timestamp5(i:i+1))))];
end


while length(Tach1_12_off_3)<=11
    Tach1_12_off_3 = [1;Tach1_12_off_3];
    timing1_12_3  = [1;timing1_12_3];
end
while length(Tach2_12_off_3)<=11
    Tach2_12_off_3 = [1;Tach2_12_off_3];
    timing2_12_3  = [1;timing2_12_3];
end
while length(Tach3_12_off_3)<=11
    Tach3_12_off_3 = [1;Tach3_12_off_3];
    timing3_12_3  = [1;timing3_12_3];
end
while length(Tach4_12_off_3)<=11
    Tach4_12_off_3 = [1;Tach4_12_off_3];
    timing4_12_3  = [1;timing4_12_3];
end
while length(Tach5_12_off_3)<=11
    Tach5_12_off_3 = [1;Tach5_12_off_3];
    timing5_12_3  = [1;timing5_12_3];
end

k = find(Tach1_12_off_3==0);
for i=1:length(k)
    Tach1_12_off_3(k(i)) = 0.1;
end
k = find(Tach2_12_off_3==0);
for i=1:length(k)
    Tach2_12_off_3(k(i)) = 0.1;
end
k = find(Tach3_12_off_3==0);
for i=1:length(k)
    Tach3_12_off_3(k(i)) = 0.1;
end
k = find(Tach4_12_off_3==0);
for i=1:length(k)
    Tach4_12_off_3(k(i)) = 0.1;
end
k = find(Tach5_12_off_3==0);
for i=1:length(k)
    Tach5_12_off_3(k(i)) = 0.1;
end

%% %%%%% I tachometers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

diff1 = 0;                                    % gradient initialization
diff2 = 0;                                    % gradient initialization
diff3 = 0;                                    % gradient initialization
diff4 = 0;                                    % gradient initialization
diff5 = 0;                                    % gradient initialization

for i=1:1:length(RPM1_12inch_I)-1   
    diff1 = [diff1; (RPM1_12inch_I(i)-RPM1_12inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end   
for i=1:1:length(RPM2_12inch_I)-1   
    diff2 = [diff2; (RPM2_12inch_I(i)-RPM2_12inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end  
for i=1:1:length(RPM3_12inch_I)-1   
    diff3 = [diff3; (RPM3_12inch_I(i)-RPM3_12inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM4_12inch_I)-1   
    diff4 = [diff4; (RPM4_12inch_I(i)-RPM4_12inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM5_12inch_I)-1   
    diff5 = [diff5; (RPM5_12inch_I(i)-RPM5_12inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end

[~,C1] = maxk(abs(diff1),10);                      % get the 10 maximum values in the gradient
[~,C2] = maxk(abs(diff2),10); 
[~,C3] = maxk(abs(diff3),10); 
[~,C4] = maxk(abs(diff4),10); 
[~,C5] = maxk(abs(diff5),10); 

time_stamp1 = maxk(C1,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp2 = maxk(C2,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp3 = maxk(C3,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp4 = maxk(C4,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp5 = maxk(C5,1):-step_duration:1;   % adjust timestamp depending on step duration

timestamp1 = [];
for i=length(time_stamp1):-1:1                 % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end

timestamp2 = [];
for i=length(time_stamp2):-1:1              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

timestamp3 = [];
for i=length(time_stamp3):-1:1              % Create timestamp vector of smaller segments
    time_stamp3(i) = time_stamp3(i)-offset_points;
    ending = time_stamp3(i)-segment_points;
    timestamp3 = [timestamp3;time_stamp3(i);ending];
end

timestamp4 = [];
for i=length(time_stamp4):-1:1                 % Create timestamp vector of smaller segments
    time_stamp4(i) = time_stamp4(i)-offset_points;
    ending = time_stamp4(i)-segment_points;
    timestamp4 = [timestamp4;time_stamp4(i);ending];
end

timestamp5 = [];
for i=length(time_stamp5):-1:1                 % Create timestamp vector of smaller segments
    time_stamp5(i) = time_stamp5(i)-offset_points;
    ending = time_stamp5(i)-segment_points;
    timestamp5 = [timestamp5;time_stamp5(i);ending];
end

% Finding the average value of each segment and it's position in time
Tach1_12_I    = [];
timing1_12_I  = [];
Tach2_12_I    = [];
timing2_12_I  = [];
Tach3_12_I    = [];
timing3_12_I  = [];
Tach4_12_I    = [];
timing4_12_I  = [];
Tach5_12_I    = [];
timing5_12_I  = [];

for i = 1:2:length(timestamp1)-1              % Compute average of force in such timestamp
    Tach1_12_I = [Tach1_12_I;mean(RPM1_12inch_I(abs(timestamp1(i:i+1))))];
    timing1_12_I  = [timing1_12_I;abs(mean(timestamp1(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D1 = find(Tach1_12_I==Tach1_12_I(end-steps_per_stair+1));
D1 = max(D1);
E1 = [D1:-steps_per_stair:1];
positions1 = sort(E1);
T1_12_I =[RPM1_12inch_I(1:timing1_12_I(positions1(1)))-Tach1_12_I(positions1(1))];
for i = 1:length(positions1)-1
    T1_12_I = [T1_12_I;RPM1_12inch_I(timing1_12_I(positions1(i))+1:timing1_12_I(positions1(i+1)))-Tach1_12_I(positions1(i))];
end
T1_12_I = [T1_12_I;RPM1_12inch_I(timing1_12_I(positions1(end))+1:end)-Tach1_12_I(positions1(end))];
% We compute again the average values of the segments
Tach1_12_off_I = [];
for i = 1:2:length(timestamp1)-1             % Compute average of force in such timestamp
    Tach1_12_off_I = [Tach1_12_off_I;mean(T1_12_I(abs(timestamp1(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp2)-1              % Compute average of force in such timestamp
    Tach2_12_I = [Tach2_12_I;mean(RPM2_12inch_I(abs(timestamp2(i:i+1))))];
    timing2_12_I  = [timing2_12_I;abs(mean(timestamp2(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D2 = find(Tach2_12_I==Tach2_12_I(end-steps_per_stair+1));
D2 = max(D2);
E2 = [D2:-steps_per_stair:1];
positions2 = sort(E2);
T2_12_I =[RPM2_12inch_I(1:timing2_12_I(positions2(1)))-Tach2_12_I(positions2(1))];
for i = 1:length(positions2)-1
    T2_12_I = [T2_12_I;RPM2_12inch_I(timing2_12_I(positions2(i))+1:timing2_12_I(positions2(i+1)))-Tach2_12_I(positions2(i))];
end
T2_12_I = [T2_12_I;RPM2_12inch_I(timing2_12_I(positions2(end))+1:end)-Tach2_12_I(positions2(end))];
% We compute again the average values of the segments
Tach2_12_off_I = [];
for i = 1:2:length(timestamp2)-1             % Compute average of force in such timestamp
    Tach2_12_off_I = [Tach2_12_off_I;mean(T2_12_I(abs(timestamp2(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp3)-1              % Compute average of force in such timestamp
    Tach3_12_I = [Tach3_12_I;mean(RPM3_12inch_I(abs(timestamp3(i:i+1))))];
    timing3_12_I  = [timing3_12_I;abs(mean(timestamp3(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D3 = find(Tach3_12_I==Tach3_12_I(end-steps_per_stair+1));
D3 = max(D3);
E3 = [D3:-steps_per_stair:1];
positions3 = sort(E3);
T3_12_I =[RPM3_12inch_I(1:timing3_12_I(positions3(1)))-Tach3_12_I(positions3(1))];
for i = 1:length(positions3)-1
    T3_12_I = [T3_12_I;RPM3_12inch_I(timing3_12_I(positions3(i))+1:timing3_12_I(positions3(i+1)))-Tach3_12_I(positions3(i))];
end
T3_12_I = [T3_12_I;RPM3_12inch_I(timing3_12_I(positions3(end))+1:end)-Tach3_12_I(positions3(end))];
% We compute again the average values of the segments
Tach3_12_off_I = [];
for i = 1:2:length(timestamp3)-1             % Compute average of force in such timestamp
    Tach3_12_off_I = [Tach3_12_off_I;mean(T3_12_I(abs(timestamp3(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp4)-1              % Compute average of force in such timestamp
    Tach4_12_I = [Tach4_12_I;mean(RPM4_12inch_I(abs(timestamp4(i:i+1))))];
    timing4_12_I  = [timing4_12_I;abs(mean(timestamp4(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D4 = find(Tach4_12_I==Tach4_12_I(end-steps_per_stair+1));
D4 = max(D4);
E4 = [D4:-steps_per_stair:1];
positions4 = sort(E4);
T4_12_I =[RPM4_12inch_I(1:timing4_12_I(positions4(1)))-Tach4_12_I(positions4(1))];
for i = 1:length(positions4)-1
    T4_12_I = [T4_12_I;RPM4_12inch_I(timing4_12_I(positions4(i))+1:timing4_12_I(positions4(i+1)))-Tach4_12_I(positions4(i))];
end
T4_12_I = [T4_12_I;RPM4_12inch_I(timing4_12_I(positions4(end))+1:end)-Tach4_12_I(positions4(end))];
% We compute again the average values of the segments
Tach4_12_off_I = [];
for i = 1:2:length(timestamp4)-1             % Compute average of force in such timestamp
    Tach4_12_off_I = [Tach4_12_off_I;mean(T4_12_I(abs(timestamp4(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp5)-1              % Compute average of force in such timestamp
    Tach5_12_I = [Tach5_12_I;mean(RPM5_12inch_I(abs(timestamp5(i:i+1))))];
    timing5_12_I  = [timing5_12_I;abs(mean(timestamp5(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D5 = find(Tach5_12_I==Tach5_12_I(end-steps_per_stair+1));
D5 = max(D5);
E5 = [D5:-steps_per_stair:1];
positions5 = sort(E5);
T5_12_I =[RPM5_12inch_I(1:timing5_12_I(positions5(1)))-Tach5_12_I(positions5(1))];
for i = 1:length(positions5)-1
    T5_12_I = [T5_12_I;RPM5_12inch_I(timing5_12_I(positions5(i))+1:timing5_12_I(positions5(i+1)))-Tach5_12_I(positions5(i))];
end
T5_12_I = [T5_12_I;RPM5_12inch_I(timing5_12_I(positions5(end))+1:end)-Tach5_12_I(positions5(end))];
% We compute again the average values of the segments
Tach5_12_off_I = [];
for i = 1:2:length(timestamp5)-1             % Compute average of force in such timestamp
    Tach5_12_off_I = [Tach5_12_off_I;mean(T5_12_I(abs(timestamp5(i:i+1))))];
end


while length(Tach1_12_off_I)<=11
    Tach1_12_off_I = [1;Tach1_12_off_I];
    timing1_12_I  = [1;timing1_12_I];
end
while length(Tach2_12_off_I)<=11
    Tach2_12_off_I = [1;Tach2_12_off_I];
    timing2_12_I  = [1;timing2_12_I];
end
while length(Tach3_12_off_I)<=11
    Tach3_12_off_I = [1;Tach3_12_off_I];
    timing3_12_I  = [1;timing3_12_I];
end
while length(Tach4_12_off_I)<=11
    Tach4_12_off_I = [1;Tach4_12_off_I];
    timing4_12_I  = [1;timing4_12_I];
end
while length(Tach5_12_off_I)<=11
    Tach5_12_off_I = [1;Tach5_12_off_I];
    timing5_12_I  = [1;timing5_12_I];
end


k = find(Tach1_12_off_I==0);
for i=1:length(k)
    Tach1_12_off_I(k(i)) = 0.1;
end
k = find(Tach2_12_off_I==0);
for i=1:length(k)
    Tach2_12_off_I(k(i)) = 0.1;
end
k = find(Tach3_12_off_I==0);
for i=1:length(k)
    Tach3_12_off_I(k(i)) = 0.1;
end
k = find(Tach4_12_off_I==0);
for i=1:length(k)
    Tach4_12_off_I(k(i)) = 0.1;
end
k = find(Tach5_12_off_I==0);
for i=1:length(k)
    Tach5_12_off_I(k(i)) = 0.1;
end

Tach1_12inch = zeros(12,1);
Tach2_12inch = zeros(12,1);
Tach3_12inch = zeros(12,1);
Tach4_12inch = zeros(12,1);
Tach5_12inch = zeros(12,1);

for i = 1:length(Tach1_12_off_3)
    Tach1_12inch(i) = mean([Tach1_12_off_3(i), Tach1_12_off_I(i)]);
    Tach2_12inch(i) = mean([Tach2_12_off_3(i), Tach2_12_off_I(i)]);
    Tach3_12inch(i) = mean([Tach3_12_off_3(i), Tach3_12_off_I(i)]);
    Tach4_12inch(i) = mean([Tach4_12_off_3(i), Tach4_12_off_I(i)]);
    Tach5_12inch(i) = mean([Tach5_12_off_3(i), Tach5_12_off_I(i)]);
end

for1_12inch = 0.5*pi*rho1_12inch*(Tach1_12inch*2*pi/60).^2*R_12^3*L;
for2_12inch = 0.5*pi*rho2_12inch*(Tach2_12inch*2*pi/60).^2*R_12^3*L;
for3_12inch = 0.5*pi*rho3_12inch*(Tach3_12inch*2*pi/60).^2*R_12^3*L;
for4_12inch = 0.5*pi*rho4_12inch*(Tach4_12inch*2*pi/60).^2*R_12^3*L;
for5_12inch = 0.5*pi*rho5_12inch*(Tach5_12inch*2*pi/60).^2*R_12^3*L;

% From Scanavino
for1Scana_12inch = 0.5*rho1_12inch*(Tach1_12inch/60).^2*(R_12*2)^4;
for2Scana_12inch = 0.5*rho2_12inch*(Tach2_12inch/60).^2*(R_12*2)^4;
for3Scana_12inch = 0.5*rho3_12inch*(Tach3_12inch/60).^2*(R_12*2)^4;
for4Scana_12inch = 0.5*rho4_12inch*(Tach4_12inch/60).^2*(R_12*2)^4;
for5Scana_12inch = 0.5*rho5_12inch*(Tach5_12inch/60).^2*(R_12*2)^4;

Cf1_12inch  = F_z1_off_12inches./for1_12inch;
Cf2_12inch  = F_z2_off_12inches./for2_12inch;
Cf3_12inch  = F_z3_off_12inches./for3_12inch;
Cf4_12inch  = F_z4_off_12inches./for4_12inch;
Cf5_12inch  = F_z5_off_12inches./for5_12inch;

% Scanavino
Cf1Scana_12inch  = F_z1_off_12inches./for1Scana_12inch;
Cf2Scana_12inch  = F_z2_off_12inches./for2Scana_12inch;
Cf3Scana_12inch  = F_z3_off_12inches./for3Scana_12inch;
Cf4Scana_12inch  = F_z4_off_12inches./for4Scana_12inch;
Cf5Scana_12inch  = F_z5_off_12inches./for5Scana_12inch;

Fz1_off_12inches_Fz_1 = mean([F_z1_off_12inches(Fz12(1)),F_z1_off_12inches(Fz12(3))]);
Fz2_off_12inches_Fz_1 = mean([F_z2_off_12inches(Fz12(1)),F_z2_off_12inches(Fz12(3))]);
Fz3_off_12inches_Fz_1 = mean([F_z3_off_12inches(Fz12(1)),F_z3_off_12inches(Fz12(3))]);
Fz4_off_12inches_Fz_1 = mean([F_z4_off_12inches(Fz12(1)),F_z4_off_12inches(Fz12(3))]);
Fz5_off_12inches_Fz_1 = mean([F_z5_off_12inches(Fz12(1)),F_z5_off_12inches(Fz12(3))]);
Fz1_off_12inches_Fz_2 = mean([F_z1_off_12inches(Fz12(2)),F_z1_off_12inches(Fz12(4))]);
Fz2_off_12inches_Fz_2 = mean([F_z2_off_12inches(Fz12(2)),F_z2_off_12inches(Fz12(4))]);
Fz3_off_12inches_Fz_2 = mean([F_z3_off_12inches(Fz12(2)),F_z3_off_12inches(Fz12(4))]);
Fz4_off_12inches_Fz_2 = mean([F_z4_off_12inches(Fz12(2)),F_z4_off_12inches(Fz12(4))]);
Fz5_off_12inches_Fz_2 = mean([F_z5_off_12inches(Fz12(2)),F_z5_off_12inches(Fz12(4))]);
Fz1_off_12inches_RPM_1 = mean([F_z1_off_12inches(rpm12(1)),F_z1_off_12inches(rpm12(3))]);
Fz2_off_12inches_RPM_1 = mean([F_z2_off_12inches(rpm12(1)),F_z2_off_12inches(rpm12(3))]);
Fz3_off_12inches_RPM_1 = mean([F_z3_off_12inches(rpm12(1)),F_z3_off_12inches(rpm12(3))]);
Fz4_off_12inches_RPM_1 = mean([F_z4_off_12inches(rpm12(1)),F_z4_off_12inches(rpm12(3))]);
Fz5_off_12inches_RPM_1 = mean([F_z5_off_12inches(rpm12(1)),F_z5_off_12inches(rpm12(3))]);
Fz1_off_12inches_RPM_2 = mean([F_z1_off_12inches(rpm12(2)),F_z1_off_12inches(rpm12(4))]);
Fz2_off_12inches_RPM_2 = mean([F_z2_off_12inches(rpm12(2)),F_z2_off_12inches(rpm12(4))]);
Fz3_off_12inches_RPM_2 = mean([F_z3_off_12inches(rpm12(2)),F_z3_off_12inches(rpm12(4))]);
Fz4_off_12inches_RPM_2 = mean([F_z4_off_12inches(rpm12(2)),F_z4_off_12inches(rpm12(4))]);
Fz5_off_12inches_RPM_2 = mean([F_z5_off_12inches(rpm12(2)),F_z5_off_12inches(rpm12(4))]);

Cf1_off_12inches_Fz_1 = mean([Cf1_12inch(Fz12(1)),Cf1_12inch(Fz12(3))]);
Cf2_off_12inches_Fz_1 = mean([Cf2_12inch(Fz12(1)),Cf2_12inch(Fz12(3))]);
Cf3_off_12inches_Fz_1 = mean([Cf3_12inch(Fz12(1)),Cf3_12inch(Fz12(3))]);
Cf4_off_12inches_Fz_1 = mean([Cf4_12inch(Fz12(1)),Cf4_12inch(Fz12(3))]);
Cf5_off_12inches_Fz_1 = mean([Cf5_12inch(Fz12(1)),Cf5_12inch(Fz12(3))]);
Cf1_off_12inches_Fz_2 = mean([Cf1_12inch(Fz12(2)),Cf1_12inch(Fz12(4))]);
Cf2_off_12inches_Fz_2 = mean([Cf2_12inch(Fz12(2)),Cf2_12inch(Fz12(4))]);
Cf3_off_12inches_Fz_2 = mean([Cf3_12inch(Fz12(2)),Cf3_12inch(Fz12(4))]);
Cf4_off_12inches_Fz_2 = mean([Cf4_12inch(Fz12(2)),Cf4_12inch(Fz12(4))]);
Cf5_off_12inches_Fz_2 = mean([Cf5_12inch(Fz12(2)),Cf5_12inch(Fz12(4))]);
Cf1_off_12inches_RPM_1 = mean([Cf1_12inch(rpm12(1)),Cf1_12inch(rpm12(3))]);
Cf2_off_12inches_RPM_1 = mean([Cf2_12inch(rpm12(1)),Cf2_12inch(rpm12(3))]);
Cf3_off_12inches_RPM_1 = mean([Cf3_12inch(rpm12(1)),Cf3_12inch(rpm12(3))]);
Cf4_off_12inches_RPM_1 = mean([Cf4_12inch(rpm12(1)),Cf4_12inch(rpm12(3))]);
Cf5_off_12inches_RPM_1 = mean([Cf5_12inch(rpm12(1)),Cf5_12inch(rpm12(3))]);
Cf1_off_12inches_RPM_2 = mean([Cf1_12inch(rpm12(2)),Cf1_12inch(rpm12(4))]);
Cf2_off_12inches_RPM_2 = mean([Cf2_12inch(rpm12(2)),Cf2_12inch(rpm12(4))]);
Cf3_off_12inches_RPM_2 = mean([Cf3_12inch(rpm12(2)),Cf3_12inch(rpm12(4))]);
Cf4_off_12inches_RPM_2 = mean([Cf4_12inch(rpm12(2)),Cf4_12inch(rpm12(4))]);
Cf5_off_12inches_RPM_2 = mean([Cf5_12inch(rpm12(2)),Cf5_12inch(rpm12(4))]);

% Scanavino
Cf1Scana_off_12inches_Fz_1 = mean([Cf1Scana_12inch(Fz12(1)),Cf1Scana_12inch(Fz12(3))]);
Cf2Scana_off_12inches_Fz_1 = mean([Cf2Scana_12inch(Fz12(1)),Cf2Scana_12inch(Fz12(3))]);
Cf3Scana_off_12inches_Fz_1 = mean([Cf3Scana_12inch(Fz12(1)),Cf3Scana_12inch(Fz12(3))]);
Cf4Scana_off_12inches_Fz_1 = mean([Cf4Scana_12inch(Fz12(1)),Cf4Scana_12inch(Fz12(3))]);
Cf5Scana_off_12inches_Fz_1 = mean([Cf5Scana_12inch(Fz12(1)),Cf5Scana_12inch(Fz12(3))]);
Cf1Scana_off_12inches_Fz_2 = mean([Cf1Scana_12inch(Fz12(2)),Cf1Scana_12inch(Fz12(4))]);
Cf2Scana_off_12inches_Fz_2 = mean([Cf2Scana_12inch(Fz12(2)),Cf2Scana_12inch(Fz12(4))]);
Cf3Scana_off_12inches_Fz_2 = mean([Cf3Scana_12inch(Fz12(2)),Cf3Scana_12inch(Fz12(4))]);
Cf4Scana_off_12inches_Fz_2 = mean([Cf4Scana_12inch(Fz12(2)),Cf4Scana_12inch(Fz12(4))]);
Cf5Scana_off_12inches_Fz_2 = mean([Cf5Scana_12inch(Fz12(2)),Cf5Scana_12inch(Fz12(4))]);
Cf1Scana_off_12inches_RPM_1 = mean([Cf1Scana_12inch(rpm12(1)),Cf1Scana_12inch(rpm12(3))]);
Cf2Scana_off_12inches_RPM_1 = mean([Cf2Scana_12inch(rpm12(1)),Cf2Scana_12inch(rpm12(3))]);
Cf3Scana_off_12inches_RPM_1 = mean([Cf3Scana_12inch(rpm12(1)),Cf3Scana_12inch(rpm12(3))]);
Cf4Scana_off_12inches_RPM_1 = mean([Cf4Scana_12inch(rpm12(1)),Cf4Scana_12inch(rpm12(3))]);
Cf5Scana_off_12inches_RPM_1 = mean([Cf5Scana_12inch(rpm12(1)),Cf5Scana_12inch(rpm12(3))]);
Cf1Scana_off_12inches_RPM_2 = mean([Cf1Scana_12inch(rpm12(2)),Cf1Scana_12inch(rpm12(4))]);
Cf2Scana_off_12inches_RPM_2 = mean([Cf2Scana_12inch(rpm12(2)),Cf2Scana_12inch(rpm12(4))]);
Cf3Scana_off_12inches_RPM_2 = mean([Cf3Scana_12inch(rpm12(2)),Cf3Scana_12inch(rpm12(4))]);
Cf4Scana_off_12inches_RPM_2 = mean([Cf4Scana_12inch(rpm12(2)),Cf4Scana_12inch(rpm12(4))]);
Cf5Scana_off_12inches_RPM_2 = mean([Cf5Scana_12inch(rpm12(2)),Cf5Scana_12inch(rpm12(4))]);


%% %%%%%%%%%%%% PLOTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%


% Plot of Fz removing offsets and marking RPM12 levels
figure()
hold on
plot(ti1_12inches,Fz1_off_12inches,'lineWidth',1.5)
plot(ti2_12inches,Fz2_off_12inches,'lineWidth',1.5)
plot(ti3_12inches,Fz3_off_12inches,'lineWidth',1.5)
plot(ti4_12inches,Fz4_off_12inches,'lineWidth',1.5)
plot(ti5_12inches,Fz5_off_12inches,'lineWidth',1.5)
grid on
plot(timing1_12inches(rpm12(1))*0.1,Force_z1_off_12inches(rpm12(1)),'x','color','k','lineWidth',2)
plot(timing2_12inches(rpm12(1))*0.1,Force_z2_off_12inches(rpm12(1)),'x','color','b','lineWidth',2)
plot(timing3_12inches(rpm12(1))*0.1,Force_z3_off_12inches(rpm12(1)),'x','color','r','lineWidth',2)
plot(timing4_12inches(rpm12(1))*0.1,Force_z4_off_12inches(rpm12(1)),'x','color','g','lineWidth',2)
plot(timing5_12inches(rpm12(1))*0.1,Force_z5_off_12inches(rpm12(1)),'x','color','m','lineWidth',2)
plot(timing1_12inches(rpm12(2))*0.1,Force_z1_off_12inches(rpm12(2)),'x','color','k','lineWidth',2)
plot(timing2_12inches(rpm12(2))*0.1,Force_z2_off_12inches(rpm12(2)),'x','color','b','lineWidth',2)
plot(timing3_12inches(rpm12(2))*0.1,Force_z3_off_12inches(rpm12(2)),'x','color','r','lineWidth',2)
plot(timing4_12inches(rpm12(2))*0.1,Force_z4_off_12inches(rpm12(2)),'x','color','g','lineWidth',2)
plot(timing5_12inches(rpm12(2))*0.1,Force_z5_off_12inches(rpm12(2)),'x','color','m','lineWidth',2)
plot(timing1_12inches(rpm12(3))*0.1,Force_z1_off_12inches(rpm12(3)),'x','color','k','lineWidth',2)
plot(timing2_12inches(rpm12(3))*0.1,Force_z2_off_12inches(rpm12(3)),'x','color','b','lineWidth',2)
plot(timing3_12inches(rpm12(3))*0.1,Force_z3_off_12inches(rpm12(3)),'x','color','r','lineWidth',2)
plot(timing4_12inches(rpm12(3))*0.1,Force_z4_off_12inches(rpm12(3)),'x','color','g','lineWidth',2)
plot(timing5_12inches(rpm12(3))*0.1,Force_z5_off_12inches(rpm12(3)),'x','color','m','lineWidth',2)
plot(timing1_12inches(rpm12(4))*0.1,Force_z1_off_12inches(rpm12(4)),'x','color','k','lineWidth',2)
plot(timing2_12inches(rpm12(4))*0.1,Force_z2_off_12inches(rpm12(4)),'x','color','b','lineWidth',2)
plot(timing3_12inches(rpm12(4))*0.1,Force_z3_off_12inches(rpm12(4)),'x','color','r','lineWidth',2)
plot(timing4_12inches(rpm12(4))*0.1,Force_z4_off_12inches(rpm12(4)),'x','color','g','lineWidth',2)
plot(timing5_12inches(rpm12(4))*0.1,Force_z5_off_12inches(rpm12(4)),'x','color','m','lineWidth',2)
plot((timing1_12inches(rpm12(1))+segment_points/2)*0.1,Force_z1_off_12inches(rpm12(1)),'x','color','k','lineWidth',2)
plot((timing1_12inches(rpm12(1))-segment_points/2)*0.1,Force_z1_off_12inches(rpm12(1)),'x','color','k','lineWidth',2)
plot((timing2_12inches(rpm12(1))+segment_points/2)*0.1,Force_z2_off_12inches(rpm12(1)),'x','color','b','lineWidth',2)
plot((timing2_12inches(rpm12(1))-segment_points/2)*0.1,Force_z2_off_12inches(rpm12(1)),'x','color','b','lineWidth',2)
plot((timing3_12inches(rpm12(1))+segment_points/2)*0.1,Force_z3_off_12inches(rpm12(1)),'x','color','r','lineWidth',2)
plot((timing3_12inches(rpm12(1))-segment_points/2)*0.1,Force_z3_off_12inches(rpm12(1)),'x','color','r','lineWidth',2)
plot((timing4_12inches(rpm12(1))+segment_points/2)*0.1,Force_z4_off_12inches(rpm12(1)),'x','color','g','lineWidth',2)
plot((timing4_12inches(rpm12(1))-segment_points/2)*0.1,Force_z4_off_12inches(rpm12(1)),'x','color','g','lineWidth',2)
plot((timing5_12inches(rpm12(1))+segment_points/2)*0.1,Force_z5_off_12inches(rpm12(1)),'x','color','m','lineWidth',2)
plot((timing5_12inches(rpm12(1))-segment_points/2)*0.1,Force_z5_off_12inches(rpm12(1)),'x','color','m','lineWidth',2)
plot((timing1_12inches(rpm12(2))+segment_points/2)*0.1,Force_z1_off_12inches(rpm12(2)),'x','color','k','lineWidth',2)
plot((timing1_12inches(rpm12(2))-segment_points/2)*0.1,Force_z1_off_12inches(rpm12(2)),'x','color','k','lineWidth',2)
plot((timing2_12inches(rpm12(2))+segment_points/2)*0.1,Force_z2_off_12inches(rpm12(2)),'x','color','b','lineWidth',2)
plot((timing2_12inches(rpm12(2))-segment_points/2)*0.1,Force_z2_off_12inches(rpm12(2)),'x','color','b','lineWidth',2)
plot((timing3_12inches(rpm12(2))+segment_points/2)*0.1,Force_z3_off_12inches(rpm12(2)),'x','color','r','lineWidth',2)
plot((timing3_12inches(rpm12(2))-segment_points/2)*0.1,Force_z3_off_12inches(rpm12(2)),'x','color','r','lineWidth',2)
plot((timing4_12inches(rpm12(2))+segment_points/2)*0.1,Force_z4_off_12inches(rpm12(2)),'x','color','g','lineWidth',2)
plot((timing4_12inches(rpm12(2))-segment_points/2)*0.1,Force_z4_off_12inches(rpm12(2)),'x','color','g','lineWidth',2)
plot((timing5_12inches(rpm12(2))+segment_points/2)*0.1,Force_z5_off_12inches(rpm12(2)),'x','color','m','lineWidth',2)
plot((timing5_12inches(rpm12(2))-segment_points/2)*0.1,Force_z5_off_12inches(rpm12(2)),'x','color','m','lineWidth',2)
plot((timing1_12inches(rpm12(3))+segment_points/2)*0.1,Force_z1_off_12inches(rpm12(3)),'x','color','k','lineWidth',2)
plot((timing1_12inches(rpm12(3))-segment_points/2)*0.1,Force_z1_off_12inches(rpm12(3)),'x','color','k','lineWidth',2)
plot((timing2_12inches(rpm12(3))+segment_points/2)*0.1,Force_z2_off_12inches(rpm12(3)),'x','color','b','lineWidth',2)
plot((timing2_12inches(rpm12(3))-segment_points/2)*0.1,Force_z2_off_12inches(rpm12(3)),'x','color','b','lineWidth',2)
plot((timing3_12inches(rpm12(3))+segment_points/2)*0.1,Force_z3_off_12inches(rpm12(3)),'x','color','r','lineWidth',2)
plot((timing3_12inches(rpm12(3))-segment_points/2)*0.1,Force_z3_off_12inches(rpm12(3)),'x','color','r','lineWidth',2)
plot((timing4_12inches(rpm12(3))+segment_points/2)*0.1,Force_z4_off_12inches(rpm12(3)),'x','color','g','lineWidth',2)
plot((timing4_12inches(rpm12(3))-segment_points/2)*0.1,Force_z4_off_12inches(rpm12(3)),'x','color','g','lineWidth',2)
plot((timing5_12inches(rpm12(3))+segment_points/2)*0.1,Force_z5_off_12inches(rpm12(3)),'x','color','m','lineWidth',2)
plot((timing5_12inches(rpm12(3))-segment_points/2)*0.1,Force_z5_off_12inches(rpm12(3)),'x','color','m','lineWidth',2)
plot((timing1_12inches(rpm12(4))+segment_points/2)*0.1,Force_z1_off_12inches(rpm12(4)),'x','color','k','lineWidth',2)
plot((timing1_12inches(rpm12(4))-segment_points/2)*0.1,Force_z1_off_12inches(rpm12(4)),'x','color','k','lineWidth',2)
plot((timing2_12inches(rpm12(4))+segment_points/2)*0.1,Force_z2_off_12inches(rpm12(4)),'x','color','b','lineWidth',2)
plot((timing2_12inches(rpm12(4))-segment_points/2)*0.1,Force_z2_off_12inches(rpm12(4)),'x','color','b','lineWidth',2)
plot((timing3_12inches(rpm12(4))+segment_points/2)*0.1,Force_z3_off_12inches(rpm12(4)),'x','color','r','lineWidth',2)
plot((timing3_12inches(rpm12(4))-segment_points/2)*0.1,Force_z3_off_12inches(rpm12(4)),'x','color','r','lineWidth',2)
plot((timing4_12inches(rpm12(4))+segment_points/2)*0.1,Force_z4_off_12inches(rpm12(4)),'x','color','g','lineWidth',2)
plot((timing4_12inches(rpm12(4))-segment_points/2)*0.1,Force_z4_off_12inches(rpm12(4)),'x','color','g','lineWidth',2)
plot((timing5_12inches(rpm12(4))+segment_points/2)*0.1,Force_z5_off_12inches(rpm12(4)),'x','color','m','lineWidth',2)
plot((timing5_12inches(rpm12(4))-segment_points/2)*0.1,Force_z5_off_12inches(rpm12(4)),'x','color','m','lineWidth',2)
ylabel('Fz no offsets [N] 12"x5"')
legend(text1,text2,text3,text4,text5)
xlabel('Time [s]')
hold off
%}


% Plot for tachometers 3 and marking every point of every level
figure()
hold on
plot(ti1_12inch_3,RPM1_12inch_3,'lineWidth',1.5)
plot(ti2_12inch_3,RPM2_12inch_3,'lineWidth',1.5)
plot(ti3_12inch_3,RPM3_12inch_3,'lineWidth',1.5)
plot(ti4_12inch_3,RPM4_12inch_3,'lineWidth',1.5)
plot(ti5_12inch_3,RPM5_12inch_3,'lineWidth',1.5)
grid on
plot(timing1_12_3,Tach1_12_off_3,'x','color','k','lineWidth',2)
plot(timing2_12_3,Tach2_12_off_3,'x','color','b','lineWidth',2)
plot(timing3_12_3,Tach3_12_off_3,'x','color','r','lineWidth',2)
plot(timing4_12_3,Tach4_12_off_3,'x','color','g','lineWidth',2)
plot(timing5_12_3,Tach5_12_off_3,'x','color','m','lineWidth',2)
ylabel('RPM [rev/min] ')
legend(text1,text2,text3,text4,text5, 'Fz1 offset','Fz2 offset','Fz3 offset','Fz4 offset','Fz5 offset')
xlabel('Time [s]')
title('Tachometer 3')
hold off



% % Plot for tachometers I and marking every point of every level
figure()
hold on
plot(ti1_12inch_I,RPM1_12inch_I,'lineWidth',1.5)
plot(ti2_12inch_I,RPM2_12inch_I,'lineWidth',1.5)
plot(ti3_12inch_I,RPM3_12inch_I,'lineWidth',1.5)
plot(ti4_12inch_I,RPM4_12inch_I,'lineWidth',1.5)
plot(ti5_12inch_I,RPM5_12inch_I,'lineWidth',1.5)
grid on
plot(timing1_12_I,Tach1_12_off_I,'x','color','k','lineWidth',2)
plot(timing2_12_I,Tach2_12_off_I,'x','color','b','lineWidth',2)
plot(timing3_12_I,Tach3_12_off_I,'x','color','r','lineWidth',2)
plot(timing4_12_I,Tach4_12_off_I,'x','color','g','lineWidth',2)
plot(timing5_12_I,Tach5_12_off_I,'x','color','m','lineWidth',2)
ylabel('RPM [rev/min] ')
legend(text1,text2,text3,text4,text5, 'Fz1 offset','Fz2 offset','Fz3 offset','Fz4 offset','Fz5 offset')
xlabel('Time [s]')
title('Tachometer I')
hold off


%{
% Forces on levels of Fz10"max and F10"max/2 and relationship with distance
figure()
hold on;grid on;
plot(distances(1),Fz1_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(1),Fz1_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
xlabel('Distance [cm]')
ylabel('F_z 12"x5"[-]')
legend('$F_z$ F10"max','','','','','$F_z$ F10" max/2')
title('Ceiling effect F_z ')

% Forces on levels of RPM12"max and RPM12"max/2 and relationship with distance
figure()
hold on;grid on;
plot(distances(1),Fz1_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(1),Fz1_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
xlabel('Distance [cm]')
ylabel('F_z 12"x5"[-]')
legend('$F_z$ RMP12"max','','','','','$F_z$ RMP12" max/2')
title('Ceiling effect F_z ')


% Scanavino Coefficients for Fz10" and Fz10"/2
figure()
hold on;grid on;
plot(distances(1),Cf1Scana_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(2),Cf2Scana_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(3),Cf3Scana_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(4),Cf4Scana_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(5),Cf5Scana_off_12inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(1),Cf1Scana_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(2),Cf2Scana_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(3),Cf3Scana_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(4),Cf4Scana_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(5),Cf5Scana_off_12inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
xlabel('Distance [cm]')
ylabel('C_f 12"x5"[-]')
legend('$C_f$ F10"max','','','','','$C_f$ F10" max/2')
title('Ceiling effect C_f ')


% Scanavino Coefficients for RPM12" and RPM12"/2
figure()
hold on;grid on;
plot(distances(1),Cf1Scana_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(2),Cf2Scana_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(3),Cf3Scana_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(4),Cf4Scana_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(5),Cf5Scana_off_12inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(1),Cf1Scana_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(2),Cf2Scana_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(3),Cf3Scana_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(4),Cf4Scana_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(5),Cf5Scana_off_12inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
xlabel('Distance [cm]')
ylabel('C_f 12"x5"[-]')
legend('$C_f$ RMP12"max','','','','','$C_f$ RMP12" max/2')
title('Ceiling effect C_f')

%}

%% %%%%%%%%% CURVE FITTING EXPERIMENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
D_R = [distances(1)
distances(2)
distances(3)
distances(4)
distances(5)];

C_f12 = [Cf1Scana_off_12inches_RPM_2-Cf5Scana_off_12inches_RPM_2
         Cf2Scana_off_12inches_RPM_2-Cf5Scana_off_12inches_RPM_2
         Cf3Scana_off_12inches_RPM_2-Cf5Scana_off_12inches_RPM_2
         Cf4Scana_off_12inches_RPM_2-Cf5Scana_off_12inches_RPM_2
         Cf5Scana_off_12inches_RPM_2-Cf5Scana_off_12inches_RPM_2];

population312inch = fit(D_R,C_f12,'poly1','Normalize','on');
population412inch = fit(D_R,C_f12,'poly2','Normalize','on');
population512inch = fit(D_R,C_f12,'poly3','Normalize','on');
% population6 = fit(D_R,C_f12,'rat11','Normalize','on');
populationExp12inch = fit(D_R,C_f12,'exp1');

C_f12 = [Cf1Scana_off_12inches_RPM_2
         Cf2Scana_off_12inches_RPM_2
         Cf3Scana_off_12inches_RPM_2
         Cf4Scana_off_12inches_RPM_2
         Cf5Scana_off_12inches_RPM_2];

% Fitting Cf_scanavino at RPM12"max as exponential expression
% figure()
% hold on
% plot(D_R,C_f12,'x','color','k','lineWidth',2)
% plot(populationExp12inch(0:100)+Cf5Scana_off_12inches_RPM_2,'r--');
% hold off
% legend('Datapoints','exp1','Location','NorthWest');
% grid on
% xlabel('D [cm]')
% ylabel('C_f 4000 RPM" 12"x5" [-]')
% xlim([0 100])
% title('Ceilinf effect at 4000 RPM')
% caption = sprintf('y = %f * exp(%f*x) + %f', populationExp_12inch.a,populationExp_12inch.b,Fz5_off_12inches_RPM_2);
% gtext(caption, 'FontSize', 16, 'Color', 'k');

F_12_RPM2 = [Fz1_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
        Fz2_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
        Fz3_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
        Fz4_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
        Fz5_off_12inches_RPM_2-Fz5_off_12inches_RPM_2];

populationExp12inch_4000rpm = fit(D_R,F_12_RPM2,'exp1');

F_12_RPM2 = [Fz1_off_12inches_RPM_2
        Fz2_off_12inches_RPM_2
        Fz3_off_12inches_RPM_2
        Fz4_off_12inches_RPM_2
        Fz5_off_12inches_RPM_2];

% Fitting F_z_12" at RPM12"max as exponential expression

figure()
hold on
plot(D_R,F_12_RPM2,'x','color','k','lineWidth',2)
plot(populationExp12inch_4000rpm(0:100)+Fz5_off_12inches_RPM_2,'r--');
hold off
legend('Datapoints','exp1','Location','NorthWest');
grid on
xlabel('D [cm]')
ylabel('Fz 4000 RPM 12"x5" [-]')
xlim([0 100])
title('Ceiling effect at 4000 RPM, 20ºC, 200 m ASL')
% caption = sprintf('y = %f * exp(%f*x) + %f', populationExp12inch_4000rpm.a,populationExp12inch_4000rpm.b,Fz5_off_12inches_RPM_2);
% gtext(caption, 'FontSize', 16, 'Color', 'k');

%}

%% %%%%%%% 10" Propellers ceiling eff %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LC1 = '20230321/LoadCell/log_20230321_095608_10inch_ceiling5cm_9.csv';
LC2 = '20230322/LoadCell/log_20230322_111212_10inch_ceiling_15cm_1.csv';
LC3 = '20230322/LoadCell/log_20230322_111212_10inch_ceiling_25cm_3.csv';
LC4 = '20230322/LoadCell/log_20230322_111212_10inch_ceiling_35cm_17.csv';
LC5 = '20230323/LoadCell/log_20230323_090052_10inch_wall_infR_25.csv';

step_duration = 450;
segment_points = 150;           %100 8 inches           % how many points do we select
offset_points  = 100;            % 80 8 inches
steps_per_stair = 5;

text1 = string(distances(1));
text2 = string(distances(2));
text3 = string(distances(3));
text4 = string(distances(4));
text5 = string(distances(5));

test1 = readtable(LC1);
test2 = readtable(LC2);
test3 = readtable(LC3);
test4 = readtable(LC4);
test5 = readtable(LC5);

time1 = test1{1:end,1}./timeLoadCellfactor;
Fx1 = test1{1:end,2}-test1{1,2};
Fy1 = test1{1:end,3}-test1{1,3};
Fz1 = test1{1:end,4}-test1{1,4};
Mx1 = (test1{1:end,5}-test1{1,5})/10;
My1 = (test1{1:end,6}-test1{1,6})/10;
Mz1 = (test1{1:end,7}-test1{1,7})/10;


time2 = test2{1:end,1}./timeLoadCellfactor;
Fx2 = test2{1:end,2}-test2{1,2};
Fy2 = test2{1:end,3}-test2{1,3};
Fz2 = test2{1:end,4}-test2{1,4};
Mx2 = (test2{1:end,5}-test2{1,5})/10;
My2 = (test2{1:end,6}-test2{1,6})/10;
Mz2 = (test2{1:end,7}-test2{1,7})/10;


time3 = test3{1:end,1}./timeLoadCellfactor;
Fx3 = test3{1:end,2}-test3{1,2};
Fy3 = test3{1:end,3}-test3{1,3};
Fz3 = test3{1:end,4}-test3{1,4};
Mx3 = (test3{1:end,5}-test3{1,5})/10;
My3 = (test3{1:end,6}-test3{1,6})/10;
Mz3 = (test3{1:end,7}-test3{1,7})/10;


time4 = test4{1:end,1}./timeLoadCellfactor;
Fx4 = test4{1:end,2}-test4{1,2};
Fy4 = test4{1:end,3}-test4{1,3};
Fz4 = test4{1:end,4}-test4{1,4};
Mx4 = (test4{1:end,5}-test4{1,5})/10;
My4 = (test4{1:end,6}-test4{1,6})/10;
Mz4 = (test4{1:end,7}-test4{1,7})/10;


time5 = test5{1:end,1}./timeLoadCellfactor;
Fx5 = test5{1:end,2}-test5{1,2};
Fy5 = test5{1:end,3}-test5{1,3};
Fz5 = test5{1:end,4}-test5{1,4};
Mx5 = (test5{1:end,5}-test5{1,5})/10;
My5 = (test5{1:end,6}-test5{1,6})/10;
Mz5 = (test5{1:end,7}-test5{1,7})/10;


time1 = time1 - time1(1) + 1;
time2 = time2 - time2(1) + 1;
time3 = time3 - time3(1) + 1;
time4 = time4 - time4(1) + 1;
time5 = time5 - time5(1) + 1;


F1_tot =    -Fx1.*sin(test_orient)+Fy1.*cos(test_orient);
M1_tot =     Mx1.*cos(test_orient)+My1.*sin(test_orient);
F2_tot =    -Fx2.*sin(test_orient)+Fy2.*cos(test_orient);
M2_tot =     Mx2.*cos(test_orient)+My2.*sin(test_orient);
F3_tot =    -Fx3.*sin(test_orient)+Fy3.*cos(test_orient);
M3_tot =     Mx3.*cos(test_orient)+My3.*sin(test_orient);
F4_tot =    -Fx4.*sin(test_orient)+Fy4.*cos(test_orient);
M4_tot =     Mx4.*cos(test_orient)+My4.*sin(test_orient);
F5_tot =    -Fx5.*sin(test_orient)+Fy5.*cos(test_orient);
M5_tot =     Mx5.*cos(test_orient)+My5.*sin(test_orient);

%% %%% Automatic point selection for six files

Fhtal1 = F1_tot;
Mhtal1 = M1_tot;
ti1    = time1;
Fhtal2 = F2_tot;
Mhtal2 = M2_tot;
ti2    = time2;
Fhtal3 = F3_tot;
Mhtal3 = M3_tot;
ti3    = time3;
Fhtal4 = F4_tot;
Mhtal4 = M4_tot;
ti4    = time4;
Fhtal5 = F5_tot;
Mhtal5 = M5_tot;
ti5    = time5;

diff1 = 0;                                    % gradient initialization
diff2 = 0;                                    % gradient initialization
diff3 = 0;                                    % gradient initialization
diff4 = 0;                                    % gradient initialization
diff5 = 0;                                    % gradient initialization
diff6 = 0;                                    % gradient initialization
Force_z1 = [];
Force_z2 = [];
Force_z3 = [];
Force_z4 = [];
Force_z5 = [];
timing1  = [];
timing2  = [];
timing3  = [];
timing4  = [];
timing5  = [];
Force_z1_off = [];
Force_z2_off = [];
Force_z3_off = [];
Force_z4_off = [];
Force_z5_off = [];

for i=1:1:length(Fz1)-1   
    diff1 = [diff1; (Fz1(i)-Fz1(i+1))/0.1];    % compute the gradient at 10 Hz
end   
for i=1:1:length(Fz2)-1   
    diff2 = [diff2; (Fz2(i)-Fz2(i+1))/0.1];    % compute the gradient at 10 Hz
end  
for i=1:1:length(Fz3)-1   
    diff3 = [diff3; (Fz3(i)-Fz3(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(Fz4)-1   
    diff4 = [diff4; (Fz4(i)-Fz4(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(Fz5)-1   
    diff5 = [diff5; (Fz5(i)-Fz5(i+1))/0.1];    % compute the gradient at 10 Hz
end

[~,C1] = maxk(abs(diff1),10);                      % get the 10 maximum values in the gradient
[~,C2] = maxk(abs(diff2),10); 
[~,C3] = maxk(abs(diff3),10); 
[~,C4] = maxk(abs(diff4),10); 
[~,C5] = maxk(abs(diff5),10); 

time_stamp1 = maxk(C1,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp2 = maxk(C2,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp3 = maxk(C3,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp4 = maxk(C4,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp5 = maxk(C5,1):-step_duration:1;   % adjust timestamp depending on step duration

timestamp1 = [];
for i=length(time_stamp1):-1:1                 % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end


timestamp2 = [];
for i=length(time_stamp2):-1:1              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

timestamp3 = [];
for i=length(time_stamp3):-1:1              % Create timestamp vector of smaller segments
    time_stamp3(i) = time_stamp3(i)-offset_points;
    ending = time_stamp3(i)-segment_points;
    timestamp3 = [timestamp3;time_stamp3(i);ending];
end

timestamp4 = [];
for i=length(time_stamp4):-1:1                 % Create timestamp vector of smaller segments
    time_stamp4(i) = time_stamp4(i)-offset_points;
    ending = time_stamp4(i)-segment_points;
    timestamp4 = [timestamp4;time_stamp4(i);ending];
end

timestamp5 = [];
for i=length(time_stamp5):-1:1                 % Create timestamp vector of smaller segments
    time_stamp5(i) = time_stamp5(i)-offset_points;
    ending = time_stamp5(i)-segment_points;
    timestamp5 = [timestamp5;time_stamp5(i);ending];
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


zero_point = find(timestamp3==0);
if isempty(zero_point) == 0
    timestamp3(zero_point) = 1;
end
% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp3)-1              % Compute average of force in such timestamp
    Force_z3 = [Force_z3;mean(Fz3(abs(timestamp3(i:i+1))))];
    timing3  = [timing3;abs(mean(timestamp3(i:i+1)))];     % Place average of force at average of time
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
Fz3_off = F_z_3;
for i = 1:2:length(timestamp3)-1             % Compute average of force in such timestamp
    Force_z3_off = [Force_z3_off;mean(Fz3_off(abs(timestamp3(i:i+1))))];
end


zero_point = find(timestamp4==0);
if isempty(zero_point) == 0
    timestamp4(zero_point) = 1;
end
% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp4)-1              % Compute average of force in such timestamp
    Force_z4 = [Force_z4;mean(Fz4(abs(timestamp4(i:i+1))))];
    timing4  = [timing4;abs(mean(timestamp4(i:i+1)))];     % Place average of force at average of time
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
Fz4_off = F_z_4;
for i = 1:2:length(timestamp4)-1             % Compute average of force in such timestamp
    Force_z4_off = [Force_z4_off;mean(Fz4_off(abs(timestamp4(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp5)-1              % Compute average of force in such timestamp
    Force_z5 = [Force_z5;mean(Fz5(abs(timestamp5(i:i+1))))];
    timing5  = [timing5;abs(mean(timestamp5(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D5 = find(Force_z5==Force_z5(end-steps_per_stair+1));
D5 = max(D5);
E5 = [D5:-steps_per_stair:1];
positions5 = sort(E5);
F_z_5 =[Fz5(1:timing5(positions5(1)))-Force_z5(positions5(1))];
for i = 1:length(positions5)-1
    F_z_5 = [F_z_5;Fz5(timing5(positions5(i))+1:timing5(positions5(i+1)))-Force_z5(positions5(i))];
end
F_z_5 = [F_z_5;Fz5(timing5(positions5(end))+1:end)-Force_z5(positions5(end))];
% We compute again the average values of the segments
Fz5_off = F_z_5;
for i = 1:2:length(timestamp5)-1             % Compute average of force in such timestamp
    Force_z5_off = [Force_z5_off;mean(Fz5_off(abs(timestamp5(i:i+1))))];
end


while length(Force_z1_off)<=11
    Force_z1_off = [0;Force_z1_off];
    timing1  = [1;timing1];
end
while length(Force_z2_off)<=11
    Force_z2_off = [0;Force_z2_off];
    timing2  = [1;timing2];
end
while length(Force_z3_off)<=11
    Force_z3_off = [0;Force_z3_off];
    timing3  = [1;timing3];
end
while length(Force_z4_off)<=11
    Force_z4_off = [0;Force_z4_off];
    timing4  = [1;timing4];
end
while length(Force_z5_off)<=11
    Force_z5_off = [0;Force_z5_off];
    timing5  = [1;timing5];
end

F_z1_off_10inches = Force_z1_off;
F_z2_off_10inches = Force_z2_off;
F_z3_off_10inches = Force_z3_off;
F_z4_off_10inches = Force_z4_off;
F_z5_off_10inches = Force_z5_off;

Force_z1_off_10inches = Force_z1_off;
Force_z2_off_10inches = Force_z2_off;
Force_z3_off_10inches = Force_z3_off;
Force_z4_off_10inches = Force_z4_off;
Force_z5_off_10inches = Force_z5_off;

i=1;
while length(F_z1_off_10inches)>12
    F_z1_off_10inches(1) = [];
    i = i + 1;
end
i=1;
while length(F_z2_off_10inches)>12
    F_z2_off_10inches(1) = [];
    i = i + 1;
end
i=1;
while length(F_z3_off_10inches)>12
    F_z3_off_10inches(1) = [];
    i = i + 1;
end
i=1;
while length(F_z4_off_10inches)>12
    F_z4_off_10inches(1) = [];
    i = i + 1;
end
i=1;
while length(F_z5_off_10inches)>12
    F_z5_off_10inches(i) = [];
    i = i + 1;
end

Fz1_off_10inches = Fz1_off;
Fz2_off_10inches = Fz2_off;
Fz3_off_10inches = Fz3_off;
Fz4_off_10inches = Fz4_off;
Fz5_off_10inches = Fz5_off;

timing1_10inches = timing1;
timing2_10inches = timing2;
timing3_10inches = timing3;
timing4_10inches = timing4;
timing5_10inches = timing5;

ti1_10inches = ti1;
ti2_10inches = ti2;
ti3_10inches = ti3;
ti4_10inches = ti4;
ti5_10inches = ti5;

%% %% RPM and adimensionalization %%%%

step_duration = 320;
segment_points = 50;           %100 8 inches           % how many points do we select
offset_points  = 80;            % 80 8 inches
steps_per_stair = 5;


%%% Load cell data
tach1_10inch_1 = '20230321/Tachometer3/20230321_test9.csv';
tach1_10inch_2 = '20230321/Tachometer3/20230321_test9.csv';
tach2_10inch_1 = '20230322/Tachometer3/20230322_test1.csv';
tach2_10inch_2 = '20230322/TachometerI/20230322_test1.csv';
tach3_10inch_1 = '20230322/Tachometer3/20230322_test3.csv';
tach3_10inch_2 = '20230322/TachometerI/20230322_test3.csv';
tach4_10inch_1 = '20230322/Tachometer3/20230322_test17.csv';
tach4_10inch_2 = '20230322/Tachometer3/20230322_test17.csv';
tach5_10inch_1 = '20230323/Tachometer3/20230323_test25.csv';
tach5_10inch_2 = '20230323/Tachometer3/20230323_test25.csv';

T1_10inch = 20.6;
T2_10inch = 20.6;
T3_10inch = 20.6;
T4_10inch = 20.6;
T5_10inch = 20.6;
P1_10inch = 983.3e2;
P2_10inch = 982.6e2;
P3_10inch = 982.5e2;
P4_10inch = 982.5e2;
P5_10inch = 982.5e2;

rho1_10inch = P1_10inch/(R_constant*(T1_10inch+toKelvin));
rho2_10inch = P2_10inch/(R_constant*(T2_10inch+toKelvin));
rho3_10inch = P3_10inch/(R_constant*(T3_10inch+toKelvin));
rho4_10inch = P4_10inch/(R_constant*(T4_10inch+toKelvin));
rho5_10inch = P5_10inch/(R_constant*(T5_10inch+toKelvin));

tach1_10inch_3 = readtable(tach1_10inch_1);
tach1_10inch_I = readtable(tach1_10inch_2);
tach2_10inch_3 = readtable(tach2_10inch_1);
tach2_10inch_I = readtable(tach2_10inch_2);
tach3_10inch_3 = readtable(tach3_10inch_1);
tach3_10inch_I = readtable(tach3_10inch_2);
tach4_10inch_3 = readtable(tach4_10inch_1);
tach4_10inch_I = readtable(tach4_10inch_2);
tach5_10inch_3 = readtable(tach5_10inch_1);
tach5_10inch_I = readtable(tach5_10inch_2);

RPM1_10inch_3 = tach1_10inch_3{1:end,3}./2;
RPM1_10inch_I = tach1_10inch_I{1:end,3}./2;
RPM2_10inch_3 = tach2_10inch_3{1:end,3}./2;
RPM2_10inch_I = tach2_10inch_I{1:end,3}./2;
RPM3_10inch_3 = tach3_10inch_3{1:end,3}./2;
RPM3_10inch_I = tach3_10inch_I{1:end,3}./2;
RPM4_10inch_3 = tach4_10inch_3{1:end,3}./2;
RPM4_10inch_I = tach4_10inch_I{1:end,3}./2;
RPM5_10inch_3 = tach5_10inch_3{1:end,3}./2;
RPM5_10inch_I = tach5_10inch_I{1:end,3}./2;

time_RPM1_10inch_3 = tach1_10inch_3{1:end,1}./timeRPMfactor;
time_RPM1_10inch_I = tach1_10inch_I{1:end,1}./timeRPMfactor;
time_RPM2_10inch_3 = tach2_10inch_3{1:end,1}./timeRPMfactor;
time_RPM2_10inch_I = tach2_10inch_I{1:end,1}./timeRPMfactor;
time_RPM3_10inch_3 = tach3_10inch_3{1:end,1}./timeRPMfactor;
time_RPM3_10inch_I = tach3_10inch_I{1:end,1}./timeRPMfactor;
time_RPM4_10inch_3 = tach4_10inch_3{1:end,1}./timeRPMfactor;
time_RPM4_10inch_I = tach4_10inch_I{1:end,1}./timeRPMfactor;
time_RPM5_10inch_3 = tach5_10inch_3{1:end,1}./timeRPMfactor;
time_RPM5_10inch_I = tach5_10inch_I{1:end,1}./timeRPMfactor;

%% %%%%Tachometers 10 inches

ti1_10inch_3 = time_RPM1_10inch_3;
ti2_10inch_3 = time_RPM2_10inch_3;
ti3_10inch_3 = time_RPM3_10inch_3;
ti4_10inch_3 = time_RPM4_10inch_3;
ti5_10inch_3 = time_RPM5_10inch_3;
ti1_10inch_I = time_RPM1_10inch_I;
ti2_10inch_I = time_RPM2_10inch_I;
ti3_10inch_I = time_RPM3_10inch_I;
ti4_10inch_I = time_RPM4_10inch_I;
ti5_10inch_I = time_RPM5_10inch_I;

%%%%%% Tachometer 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diff1 = 0;                                    % gradient initialization
diff2 = 0;                                    % gradient initialization
diff3 = 0;                                    % gradient initialization
diff4 = 0;                                    % gradient initialization
diff5 = 0;                                    % gradient initialization

for i=1:1:length(RPM1_10inch_3)-1   
    diff1 = [diff1; (RPM1_10inch_3(i)-RPM1_10inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end   
for i=1:1:length(RPM2_10inch_3)-1   
    diff2 = [diff2; (RPM2_10inch_3(i)-RPM2_10inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end  
for i=1:1:length(RPM3_10inch_3)-1   
    diff3 = [diff3; (RPM3_10inch_3(i)-RPM3_10inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM4_10inch_3)-1   
    diff4 = [diff4; (RPM4_10inch_3(i)-RPM4_10inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM5_10inch_3)-1   
    diff5 = [diff5; (RPM5_10inch_3(i)-RPM5_10inch_3(i+1))/0.1];    % compute the gradient at 10 Hz
end

[~,C1] = maxk(abs(diff1),10);                      % get the 10 maximum values in the gradient
[~,C2] = maxk(abs(diff2),10); 
[~,C3] = maxk(abs(diff3),10); 
[~,C4] = maxk(abs(diff4),10); 
[~,C5] = maxk(abs(diff5),10); 

time_stamp1 = maxk(C1,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp2 = maxk(C2,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp3 = maxk(C3,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp4 = maxk(C4,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp5 = maxk(C5,1):-step_duration:1;   % adjust timestamp depending on step duration

timestamp1 = [];
for i=length(time_stamp1):-1:1                 % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end

timestamp2 = [];
for i=length(time_stamp2):-1:1              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

timestamp3 = [];
for i=length(time_stamp3):-1:1              % Create timestamp vector of smaller segments
    time_stamp3(i) = time_stamp3(i)-offset_points;
    ending = time_stamp3(i)-segment_points;
    timestamp3 = [timestamp3;time_stamp3(i);ending];
end

timestamp4 = [];
for i=length(time_stamp4):-1:1                 % Create timestamp vector of smaller segments
    time_stamp4(i) = time_stamp4(i)-offset_points;
    ending = time_stamp4(i)-segment_points;
    timestamp4 = [timestamp4;time_stamp4(i);ending];
end

timestamp5 = [];
for i=length(time_stamp5):-1:1                 % Create timestamp vector of smaller segments
    time_stamp5(i) = time_stamp5(i)-offset_points;
    ending = time_stamp5(i)-segment_points;
    timestamp5 = [timestamp5;time_stamp5(i);ending];
end

% Finding the average value of each segment and it's position in time
Tach1_10_3    = [];
timing1_10_3  = [];
Tach2_10_3    = [];
timing2_10_3  = [];
Tach3_10_3    = [];
timing3_10_3  = [];
Tach4_10_3    = [];
timing4_10_3  = [];
Tach5_10_3    = [];
timing5_10_3  = [];


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp1)-1              % Compute average of force in such timestamp
    Tach1_10_3 = [Tach1_10_3;mean(RPM1_10inch_3(abs(timestamp1(i:i+1))))];
    timing1_10_3  = [timing1_10_3;abs(mean(timestamp1(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D1 = find(Tach1_10_3==Tach1_10_3(end-steps_per_stair+1));
D1 = max(D1);
E1 = [D1:-steps_per_stair:1];
positions1 = sort(E1);
T1_10_3 =[RPM1_10inch_3(1:timing1_10_3(positions1(1)))-Tach1_10_3(positions1(1))];
for i = 1:length(positions1)-1
    T1_10_3 = [T1_10_3;RPM1_10inch_3(timing1_10_3(positions1(i))+1:timing1_10_3(positions1(i+1)))-Tach1_10_3(positions1(i))];
end
T1_10_3 = [T1_10_3;RPM1_10inch_3(timing1_10_3(positions1(end))+1:end)-Tach1_10_3(positions1(end))];
% We compute again the average values of the segments
Tach1_10_off_3 = [];
for i = 1:2:length(timestamp1)-1             % Compute average of force in such timestamp
    Tach1_10_off_3 = [Tach1_10_off_3;mean(T1_10_3(abs(timestamp1(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp2)-1              % Compute average of force in such timestamp
    Tach2_10_3 = [Tach2_10_3;mean(RPM2_10inch_3(abs(timestamp2(i:i+1))))];
    timing2_10_3  = [timing2_10_3;abs(mean(timestamp2(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D2 = find(Tach2_10_3==Tach2_10_3(end-steps_per_stair+1));
D2 = max(D2);
E2 = [D2:-steps_per_stair:1];
positions2 = sort(E2);
T2_10_3 =[RPM2_10inch_3(1:timing2_10_3(positions2(1)))-Tach2_10_3(positions2(1))];
for i = 1:length(positions2)-1
    T2_10_3 = [T2_10_3;RPM2_10inch_3(timing2_10_3(positions2(i))+1:timing2_10_3(positions2(i+1)))-Tach2_10_3(positions2(i))];
end
T2_10_3 = [T2_10_3;RPM2_10inch_3(timing2_10_3(positions2(end))+1:end)-Tach2_10_3(positions2(end))];
% We compute again the average values of the segments
Tach2_10_off_3 = [];
for i = 1:2:length(timestamp2)-1             % Compute average of force in such timestamp
    Tach2_10_off_3 = [Tach2_10_off_3;mean(T2_10_3(abs(timestamp2(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp3)-1              % Compute average of force in such timestamp
    Tach3_10_3 = [Tach3_10_3;mean(RPM3_10inch_3(abs(timestamp3(i:i+1))))];
    timing3_10_3  = [timing3_10_3;abs(mean(timestamp3(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D3 = find(Tach3_10_3==Tach3_10_3(end-steps_per_stair+1));
D3 = max(D3);
E3 = [D3:-steps_per_stair:1];
positions3 = sort(E3);
T3_10_3 =[RPM3_10inch_3(1:timing3_10_3(positions3(1)))-Tach3_10_3(positions3(1))];
for i = 1:length(positions3)-1
    T3_10_3 = [T3_10_3;RPM3_10inch_3(timing3_10_3(positions3(i))+1:timing3_10_3(positions3(i+1)))-Tach3_10_3(positions3(i))];
end
T3_10_3 = [T3_10_3;RPM3_10inch_3(timing3_10_3(positions3(end))+1:end)-Tach3_10_3(positions3(end))];
% We compute again the average values of the segments
Tach3_10_off_3 = [];
for i = 1:2:length(timestamp3)-1             % Compute average of force in such timestamp
    Tach3_10_off_3 = [Tach3_10_off_3;mean(T3_10_3(abs(timestamp3(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp4)-1              % Compute average of force in such timestamp
    Tach4_10_3 = [Tach4_10_3;mean(RPM4_10inch_3(abs(timestamp4(i:i+1))))];
    timing4_10_3  = [timing4_10_3;abs(mean(timestamp4(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D4 = find(Tach4_10_3==Tach4_10_3(end-steps_per_stair+1));
D4 = max(D4);
E4 = [D4:-steps_per_stair:1];
positions4 = sort(E4);
T4_10_3 =[RPM4_10inch_3(1:timing4_10_3(positions4(1)))-Tach4_10_3(positions4(1))];
for i = 1:length(positions4)-1
    T4_10_3 = [T4_10_3;RPM4_10inch_3(timing4_10_3(positions4(i))+1:timing4_10_3(positions4(i+1)))-Tach4_10_3(positions4(i))];
end
T4_10_3 = [T4_10_3;RPM4_10inch_3(timing4_10_3(positions4(end))+1:end)-Tach4_10_3(positions4(end))];
% We compute again the average values of the segments
Tach4_10_off_3 = [];
for i = 1:2:length(timestamp4)-1             % Compute average of force in such timestamp
    Tach4_10_off_3 = [Tach4_10_off_3;mean(T4_10_3(abs(timestamp4(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp5)-1              % Compute average of force in such timestamp
    Tach5_10_3 = [Tach5_10_3;mean(RPM5_10inch_3(abs(timestamp5(i:i+1))))];
    timing5_10_3  = [timing5_10_3;abs(mean(timestamp5(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D5 = find(Tach5_10_3==Tach5_10_3(end-steps_per_stair+1));
D5 = max(D5);
E5 = [D5:-steps_per_stair:1];
positions5 = sort(E5);
T5_10_3 =[RPM5_10inch_3(1:timing5_10_3(positions5(1)))-Tach5_10_3(positions5(1))];
for i = 1:length(positions5)-1
    T5_10_3 = [T5_10_3;RPM5_10inch_3(timing5_10_3(positions5(i))+1:timing5_10_3(positions5(i+1)))-Tach5_10_3(positions5(i))];
end
T5_10_3 = [T5_10_3;RPM5_10inch_3(timing5_10_3(positions5(end))+1:end)-Tach5_10_3(positions5(end))];
% We compute again the average values of the segments
Tach5_10_off_3 = [];
for i = 1:2:length(timestamp5)-1             % Compute average of force in such timestamp
    Tach5_10_off_3 = [Tach5_10_off_3;mean(T5_10_3(abs(timestamp5(i:i+1))))];
end


while length(Tach1_10_off_3)<=11
    Tach1_10_off_3 = [1;Tach1_10_off_3];
    timing1_10_3  = [1;timing1_10_3];
end
while length(Tach2_10_off_3)<=11
    Tach2_10_off_3 = [1;Tach2_10_off_3];
    timing2_10_3  = [1;timing2_10_3];
end
while length(Tach3_10_off_3)<=11
    Tach3_10_off_3 = [1;Tach3_10_off_3];
    timing3_10_3  = [1;timing3_10_3];
end
while length(Tach4_10_off_3)<=11
    Tach4_10_off_3 = [1;Tach4_10_off_3];
    timing4_10_3  = [1;timing4_10_3];
end
while length(Tach5_10_off_3)<=11
    Tach5_10_off_3 = [1;Tach5_10_off_3];
    timing5_10_3  = [1;timing5_10_3];
end

k = find(Tach1_10_off_3==0);
for i=1:length(k)
    Tach1_10_off_3(k(i)) = 0.1;
end
k = find(Tach2_10_off_3==0);
for i=1:length(k)
    Tach2_10_off_3(k(i)) = 0.1;
end
k = find(Tach3_10_off_3==0);
for i=1:length(k)
    Tach3_10_off_3(k(i)) = 0.1;
end
k = find(Tach4_10_off_3==0);
for i=1:length(k)
    Tach4_10_off_3(k(i)) = 0.1;
end
k = find(Tach5_10_off_3==0);
for i=1:length(k)
    Tach5_10_off_3(k(i)) = 0.1;
end

%% %%%%% I tachometers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

diff1 = 0;                                    % gradient initialization
diff2 = 0;                                    % gradient initialization
diff3 = 0;                                    % gradient initialization
diff4 = 0;                                    % gradient initialization
diff5 = 0;                                    % gradient initialization

for i=1:1:length(RPM1_10inch_I)-1   
    diff1 = [diff1; (RPM1_10inch_I(i)-RPM1_10inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end   
for i=1:1:length(RPM2_10inch_I)-1   
    diff2 = [diff2; (RPM2_10inch_I(i)-RPM2_10inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end  
for i=1:1:length(RPM3_10inch_I)-1   
    diff3 = [diff3; (RPM3_10inch_I(i)-RPM3_10inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM4_10inch_I)-1   
    diff4 = [diff4; (RPM4_10inch_I(i)-RPM4_10inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end
for i=1:1:length(RPM5_10inch_I)-1   
    diff5 = [diff5; (RPM5_10inch_I(i)-RPM5_10inch_I(i+1))/0.1];    % compute the gradient at 10 Hz
end

[~,C1] = maxk(abs(diff1),10);                      % get the 10 maximum values in the gradient
[~,C2] = maxk(abs(diff2),10); 
[~,C3] = maxk(abs(diff3),10); 
[~,C4] = maxk(abs(diff4),10); 
[~,C5] = maxk(abs(diff5),10); 

time_stamp1 = maxk(C1,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp2 = maxk(C2,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp3 = maxk(C3,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp4 = maxk(C4,1):-step_duration:1;   % adjust timestamp depending on step duration
time_stamp5 = maxk(C5,1):-step_duration:1;   % adjust timestamp depending on step duration

timestamp1 = [];
for i=length(time_stamp1):-1:1                 % Create timestamp vector of smaller segments
    time_stamp1(i) = time_stamp1(i)-offset_points;
    ending = time_stamp1(i)-segment_points;
    timestamp1 = [timestamp1;time_stamp1(i);ending];
end

timestamp2 = [];
for i=length(time_stamp2):-1:1              % Create timestamp vector of smaller segments
    time_stamp2(i) = time_stamp2(i)-offset_points;
    ending = time_stamp2(i)-segment_points;
    timestamp2 = [timestamp2;time_stamp2(i);ending];
end

timestamp3 = [];
for i=length(time_stamp3):-1:1              % Create timestamp vector of smaller segments
    time_stamp3(i) = time_stamp3(i)-offset_points;
    ending = time_stamp3(i)-segment_points;
    timestamp3 = [timestamp3;time_stamp3(i);ending];
end

timestamp4 = [];
for i=length(time_stamp4):-1:1                 % Create timestamp vector of smaller segments
    time_stamp4(i) = time_stamp4(i)-offset_points;
    ending = time_stamp4(i)-segment_points;
    timestamp4 = [timestamp4;time_stamp4(i);ending];
end

timestamp5 = [];
for i=length(time_stamp5):-1:1                 % Create timestamp vector of smaller segments
    time_stamp5(i) = time_stamp5(i)-offset_points;
    ending = time_stamp5(i)-segment_points;
    timestamp5 = [timestamp5;time_stamp5(i);ending];
end

% Finding the average value of each segment and it's position in time
Tach1_10_I    = [];
Tach2_10_I    = [];
Tach3_10_I    = [];
Tach4_10_I    = [];
Tach5_10_I    = [];
timing1_10_I  = [];
timing2_10_I  = [];
timing3_10_I  = [];
timing4_10_I  = [];
timing5_10_I  = [];

for i = 1:2:length(timestamp1)-1              % Compute average of force in such timestamp
    Tach1_10_I = [Tach1_10_I;mean(RPM1_10inch_I(abs(timestamp1(i:i+1))))];
    timing1_10_I  = [timing1_10_I;abs(mean(timestamp1(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D1 = find(Tach1_10_I==Tach1_10_I(end-steps_per_stair+1));
D1 = max(D1);
E1 = [D1:-steps_per_stair:1];
positions1 = sort(E1);
T1_10_I =[RPM1_10inch_I(1:timing1_10_I(positions1(1)))-Tach1_10_I(positions1(1))];
for i = 1:length(positions1)-1
    T1_10_I = [T1_10_I;RPM1_10inch_I(timing1_10_I(positions1(i))+1:timing1_10_I(positions1(i+1)))-Tach1_10_I(positions1(i))];
end
T1_10_I = [T1_10_I;RPM1_10inch_I(timing1_10_I(positions1(end))+1:end)-Tach1_10_I(positions1(end))];
% We compute again the average values of the segments
Tach1_10_off_I = [];
for i = 1:2:length(timestamp1)-1             % Compute average of force in such timestamp
    Tach1_10_off_I = [Tach1_10_off_I;mean(T1_10_I(abs(timestamp1(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp2)-1              % Compute average of force in such timestamp
    Tach2_10_I = [Tach2_10_I;mean(RPM2_10inch_I(abs(timestamp2(i:i+1))))];
    timing2_10_I  = [timing2_10_I;abs(mean(timestamp2(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D2 = find(Tach2_10_I==Tach2_10_I(end-steps_per_stair+1));
D2 = max(D2);
E2 = [D2:-steps_per_stair:1];
positions2 = sort(E2);
T2_10_I =[RPM2_10inch_I(1:timing2_10_I(positions2(1)))-Tach2_10_I(positions2(1))];
for i = 1:length(positions2)-1
    T2_10_I = [T2_10_I;RPM2_10inch_I(timing2_10_I(positions2(i))+1:timing2_10_I(positions2(i+1)))-Tach2_10_I(positions2(i))];
end
T2_10_I = [T2_10_I;RPM2_10inch_I(timing2_10_I(positions2(end))+1:end)-Tach2_10_I(positions2(end))];
% We compute again the average values of the segments
Tach2_10_off_I = [];
for i = 1:2:length(timestamp2)-1             % Compute average of force in such timestamp
    Tach2_10_off_I = [Tach2_10_off_I;mean(T2_10_I(abs(timestamp2(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp3)-1              % Compute average of force in such timestamp
    Tach3_10_I = [Tach3_10_I;mean(RPM3_10inch_I(abs(timestamp3(i:i+1))))];
    timing3_10_I  = [timing3_10_I;abs(mean(timestamp3(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D3 = find(Tach3_10_I==Tach3_10_I(end-steps_per_stair+1));
D3 = max(D3);
E3 = [D3:-steps_per_stair:1];
positions3 = sort(E3);
T3_10_I =[RPM3_10inch_I(1:timing3_10_I(positions3(1)))-Tach3_10_I(positions3(1))];
for i = 1:length(positions3)-1
    T3_10_I = [T3_10_I;RPM3_10inch_I(timing3_10_I(positions3(i))+1:timing3_10_I(positions3(i+1)))-Tach3_10_I(positions3(i))];
end
T3_10_I = [T3_10_I;RPM3_10inch_I(timing3_10_I(positions3(end))+1:end)-Tach3_10_I(positions3(end))];
% We compute again the average values of the segments
Tach3_10_off_I = [];
for i = 1:2:length(timestamp3)-1             % Compute average of force in such timestamp
    Tach3_10_off_I = [Tach3_10_off_I;mean(T3_10_I(abs(timestamp3(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp4)-1              % Compute average of force in such timestamp
    Tach4_10_I = [Tach4_10_I;mean(RPM4_10inch_I(abs(timestamp4(i:i+1))))];
    timing4_10_I  = [timing4_10_I;abs(mean(timestamp4(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D4 = find(Tach4_10_I==Tach4_10_I(end-steps_per_stair+1));
D4 = max(D4);
E4 = [D4:-steps_per_stair:1];
positions4 = sort(E4);
T4_10_I =[RPM4_10inch_I(1:timing4_10_I(positions4(1)))-Tach4_10_I(positions4(1))];
for i = 1:length(positions4)-1
    T4_10_I = [T4_10_I;RPM4_10inch_I(timing4_10_I(positions4(i))+1:timing4_10_I(positions4(i+1)))-Tach4_10_I(positions4(i))];
end
T4_10_I = [T4_10_I;RPM4_10inch_I(timing4_10_I(positions4(end))+1:end)-Tach4_10_I(positions4(end))];
% We compute again the average values of the segments
Tach4_10_off_I = [];
for i = 1:2:length(timestamp4)-1             % Compute average of force in such timestamp
    Tach4_10_off_I = [Tach4_10_off_I;mean(T4_10_I(abs(timestamp4(i:i+1))))];
end


% Finding the average value of each segment and it's position in time
for i = 1:2:length(timestamp5)-1              % Compute average of force in such timestamp
    Tach5_10_I = [Tach5_10_I;mean(RPM5_10inch_I(abs(timestamp5(i:i+1))))];
    timing5_10_I  = [timing5_10_I;abs(mean(timestamp5(i:i+1)))];     % Place average of force at average of time
end
% Finding offsets and removing them
D5 = find(Tach5_10_I==Tach5_10_I(end-steps_per_stair+1));
D5 = max(D5);
E5 = [D5:-steps_per_stair:1];
positions5 = sort(E5);
T5_10_I =[RPM5_10inch_I(1:timing5_10_I(positions5(1)))-Tach5_10_I(positions5(1))];
for i = 1:length(positions5)-1
    T5_10_I = [T5_10_I;RPM5_10inch_I(timing5_10_I(positions5(i))+1:timing5_10_I(positions5(i+1)))-Tach5_10_I(positions5(i))];
end
T5_10_I = [T5_10_I;RPM5_10inch_I(timing5_10_I(positions5(end))+1:end)-Tach5_10_I(positions5(end))];
% We compute again the average values of the segments
Tach5_10_off_I = [];
for i = 1:2:length(timestamp5)-1             % Compute average of force in such timestamp
    Tach5_10_off_I = [Tach5_10_off_I;mean(T5_10_I(abs(timestamp5(i:i+1))))];
end


while length(Tach1_10_off_I)<=11
    Tach1_10_off_I = [1;Tach1_10_off_I];
    timing1_10_I  = [1;timing1_10_I];
end
while length(Tach2_10_off_I)<=11
    Tach2_10_off_I = [1;Tach2_10_off_I];
    timing2_10_I  = [1;timing2_10_I];
end
while length(Tach3_10_off_I)<=11
    Tach3_10_off_I = [1;Tach3_10_off_I];
    timing3_10_I  = [1;timing3_10_I];
end
while length(Tach4_10_off_I)<=11
    Tach4_10_off_I = [1;Tach4_10_off_I];
    timing4_10_I  = [1;timing4_10_I];
end
while length(Tach5_10_off_I)<=11
    Tach5_10_off_I = [1;Tach5_10_off_I];
    timing5_10_I  = [1;timing5_10_I];
end


k = find(Tach1_10_off_I==0);
for i=1:length(k)
    Tach1_10_off_I(k(i)) = 0.1;
end
k = find(Tach2_10_off_I==0);
for i=1:length(k)
    Tach2_10_off_I(k(i)) = 0.1;
end
k = find(Tach3_10_off_I==0);
for i=1:length(k)
    Tach3_10_off_I(k(i)) = 0.1;
end
k = find(Tach4_10_off_I==0);
for i=1:length(k)
    Tach4_10_off_I(k(i)) = 0.1;
end
k = find(Tach5_10_off_I==0);
for i=1:length(k)
    Tach5_10_off_I(k(i)) = 0.1;
end

Tach1_10inch = zeros(12,1);
Tach2_10inch = zeros(12,1);
Tach3_10inch = zeros(12,1);
Tach4_10inch = zeros(12,1);
Tach5_10inch = zeros(12,1);

for i = 1:length(Tach1_10_off_3)
    Tach1_10inch(i) = mean([Tach1_10_off_3(i), Tach1_10_off_I(i)]);
    Tach2_10inch(i) = mean([Tach2_10_off_3(i), Tach2_10_off_I(i)]);
    Tach3_10inch(i) = mean([Tach3_10_off_3(i), Tach3_10_off_I(i)]);
    Tach4_10inch(i) = mean([Tach4_10_off_3(i), Tach4_10_off_I(i)]);
    Tach5_10inch(i) = mean([Tach5_10_off_3(i), Tach5_10_off_I(i)]);
end

for1_10inch = 0.5*pi*rho1_10inch*(Tach1_10inch*2*pi/60).^2*R_10^3*L;
for2_10inch = 0.5*pi*rho2_10inch*(Tach2_10inch*2*pi/60).^2*R_10^3*L;
for3_10inch = 0.5*pi*rho3_10inch*(Tach3_10inch*2*pi/60).^2*R_10^3*L;
for4_10inch = 0.5*pi*rho4_10inch*(Tach4_10inch*2*pi/60).^2*R_10^3*L;
for5_10inch = 0.5*pi*rho5_10inch*(Tach5_10inch*2*pi/60).^2*R_10^3*L;

% From Scanavino
for1Scana_10inch = 0.5*rho1_10inch*(Tach1_10inch/60).^2*(R_10*2)^4;
for2Scana_10inch = 0.5*rho2_10inch*(Tach2_10inch/60).^2*(R_10*2)^4;
for3Scana_10inch = 0.5*rho3_10inch*(Tach3_10inch/60).^2*(R_10*2)^4;
for4Scana_10inch = 0.5*rho4_10inch*(Tach4_10inch/60).^2*(R_10*2)^4;
for5Scana_10inch = 0.5*rho5_10inch*(Tach5_10inch/60).^2*(R_10*2)^4;

Cf1_10inch  = F_z1_off_10inches./for1_10inch;
Cf2_10inch  = F_z2_off_10inches./for2_10inch;
Cf3_10inch  = F_z3_off_10inches./for3_10inch;
Cf4_10inch  = F_z4_off_10inches./for4_10inch;
Cf5_10inch  = F_z5_off_10inches./for5_10inch;

% Scanavino
Cf1Scana_10inch  = F_z1_off_10inches./for1Scana_10inch;
Cf2Scana_10inch  = F_z2_off_10inches./for2Scana_10inch;
Cf3Scana_10inch  = F_z3_off_10inches./for3Scana_10inch;
Cf4Scana_10inch  = F_z4_off_10inches./for4Scana_10inch;
Cf5Scana_10inch  = F_z5_off_10inches./for5Scana_10inch;

Fz1_off_10inches_Fz_1 = mean([F_z1_off_10inches(Fz10(1)),F_z1_off_10inches(Fz10(3))]);
Fz2_off_10inches_Fz_1 = mean([F_z2_off_10inches(Fz10(1)),F_z2_off_10inches(Fz10(3))]);
Fz3_off_10inches_Fz_1 = mean([F_z3_off_10inches(Fz10(1)),F_z3_off_10inches(Fz10(3))]);
Fz4_off_10inches_Fz_1 = mean([F_z4_off_10inches(Fz10(1)),F_z4_off_10inches(Fz10(3))]);
Fz5_off_10inches_Fz_1 = mean([F_z5_off_10inches(Fz10(1)),F_z5_off_10inches(Fz10(3))]);
Fz1_off_10inches_Fz_2 = mean([F_z1_off_10inches(Fz10(2)),F_z1_off_10inches(Fz10(4))]);
Fz2_off_10inches_Fz_2 = mean([F_z2_off_10inches(Fz10(2)),F_z2_off_10inches(Fz10(4))]);
Fz3_off_10inches_Fz_2 = mean([F_z3_off_10inches(Fz10(2)),F_z3_off_10inches(Fz10(4))]);
Fz4_off_10inches_Fz_2 = mean([F_z4_off_10inches(Fz10(2)),F_z4_off_10inches(Fz10(4))]);
Fz5_off_10inches_Fz_2 = mean([F_z5_off_10inches(Fz10(2)),F_z5_off_10inches(Fz10(4))]);
Fz1_off_10inches_RPM_1 = mean([F_z1_off_10inches(rpm10(1)),F_z1_off_10inches(rpm10(3))]);
Fz2_off_10inches_RPM_1 = mean([F_z2_off_10inches(rpm10(1)),F_z2_off_10inches(rpm10(3))]);
Fz3_off_10inches_RPM_1 = mean([F_z3_off_10inches(rpm10(1)),F_z3_off_10inches(rpm10(3))]);
Fz4_off_10inches_RPM_1 = mean([F_z4_off_10inches(rpm10(1)),F_z4_off_10inches(rpm10(3))]);
Fz5_off_10inches_RPM_1 = mean([F_z5_off_10inches(rpm10(1)),F_z5_off_10inches(rpm10(3))]);
Fz1_off_10inches_RPM_2 = mean([F_z1_off_10inches(rpm10(2)),F_z1_off_10inches(rpm10(4))]);
Fz2_off_10inches_RPM_2 = mean([F_z2_off_10inches(rpm10(2)),F_z2_off_10inches(rpm10(4))]);
Fz3_off_10inches_RPM_2 = mean([F_z3_off_10inches(rpm10(2)),F_z3_off_10inches(rpm10(4))]);
Fz4_off_10inches_RPM_2 = mean([F_z4_off_10inches(rpm10(2)),F_z4_off_10inches(rpm10(4))]);
Fz5_off_10inches_RPM_2 = mean([F_z5_off_10inches(rpm10(2)),F_z5_off_10inches(rpm10(4))]);

Cf1_off_10inches_Fz_1 = mean([Cf1_10inch(Fz10(1)),Cf1_10inch(Fz10(3))]);
Cf2_off_10inches_Fz_1 = mean([Cf2_10inch(Fz10(1)),Cf2_10inch(Fz10(3))]);
Cf3_off_10inches_Fz_1 = mean([Cf3_10inch(Fz10(1)),Cf3_10inch(Fz10(3))]);
Cf4_off_10inches_Fz_1 = mean([Cf4_10inch(Fz10(1)),Cf4_10inch(Fz10(3))]);
Cf5_off_10inches_Fz_1 = mean([Cf5_10inch(Fz10(1)),Cf5_10inch(Fz10(3))]);
Cf1_off_10inches_Fz_2 = mean([Cf1_10inch(Fz10(2)),Cf1_10inch(Fz10(4))]);
Cf2_off_10inches_Fz_2 = mean([Cf2_10inch(Fz10(2)),Cf2_10inch(Fz10(4))]);
Cf3_off_10inches_Fz_2 = mean([Cf3_10inch(Fz10(2)),Cf3_10inch(Fz10(4))]);
Cf4_off_10inches_Fz_2 = mean([Cf4_10inch(Fz10(2)),Cf4_10inch(Fz10(4))]);
Cf5_off_10inches_Fz_2 = mean([Cf5_10inch(Fz10(2)),Cf5_10inch(Fz10(4))]);
Cf1_off_10inches_RPM_1 = mean([Cf1_10inch(rpm10(1)),Cf1_10inch(rpm10(3))]);
Cf2_off_10inches_RPM_1 = mean([Cf2_10inch(rpm10(1)),Cf2_10inch(rpm10(3))]);
Cf3_off_10inches_RPM_1 = mean([Cf3_10inch(rpm10(1)),Cf3_10inch(rpm10(3))]);
Cf4_off_10inches_RPM_1 = mean([Cf4_10inch(rpm10(1)),Cf4_10inch(rpm10(3))]);
Cf5_off_10inches_RPM_1 = mean([Cf5_10inch(rpm10(1)),Cf5_10inch(rpm10(3))]);
Cf1_off_10inches_RPM_2 = mean([Cf1_10inch(rpm10(2)),Cf1_10inch(rpm10(4))]);
Cf2_off_10inches_RPM_2 = mean([Cf2_10inch(rpm10(2)),Cf2_10inch(rpm10(4))]);
Cf3_off_10inches_RPM_2 = mean([Cf3_10inch(rpm10(2)),Cf3_10inch(rpm10(4))]);
Cf4_off_10inches_RPM_2 = mean([Cf4_10inch(rpm10(2)),Cf4_10inch(rpm10(4))]);
Cf5_off_10inches_RPM_2 = mean([Cf5_10inch(rpm10(2)),Cf5_10inch(rpm10(4))]);

% Scanavino
Cf1Scana_off_10inches_Fz_1 = mean([Cf1Scana_10inch(Fz10(1)),Cf1Scana_10inch(Fz10(3))]);
Cf2Scana_off_10inches_Fz_1 = mean([Cf2Scana_10inch(Fz10(1)),Cf2Scana_10inch(Fz10(3))]);
Cf3Scana_off_10inches_Fz_1 = mean([Cf3Scana_10inch(Fz10(1)),Cf3Scana_10inch(Fz10(3))]);
Cf4Scana_off_10inches_Fz_1 = mean([Cf4Scana_10inch(Fz10(1)),Cf4Scana_10inch(Fz10(3))]);
Cf5Scana_off_10inches_Fz_1 = mean([Cf5Scana_10inch(Fz10(1)),Cf5Scana_10inch(Fz10(3))]);
Cf1Scana_off_10inches_Fz_2 = mean([Cf1Scana_10inch(Fz10(2)),Cf1Scana_10inch(Fz10(4))]);
Cf2Scana_off_10inches_Fz_2 = mean([Cf2Scana_10inch(Fz10(2)),Cf2Scana_10inch(Fz10(4))]);
Cf3Scana_off_10inches_Fz_2 = mean([Cf3Scana_10inch(Fz10(2)),Cf3Scana_10inch(Fz10(4))]);
Cf4Scana_off_10inches_Fz_2 = mean([Cf4Scana_10inch(Fz10(2)),Cf4Scana_10inch(Fz10(4))]);
Cf5Scana_off_10inches_Fz_2 = mean([Cf5Scana_10inch(Fz10(2)),Cf5Scana_10inch(Fz10(4))]);
Cf1Scana_off_10inches_RPM_1 = mean([Cf1Scana_10inch(rpm10(1)),Cf1Scana_10inch(rpm10(3))]);
Cf2Scana_off_10inches_RPM_1 = mean([Cf2Scana_10inch(rpm10(1)),Cf2Scana_10inch(rpm10(3))]);
Cf3Scana_off_10inches_RPM_1 = mean([Cf3Scana_10inch(rpm10(1)),Cf3Scana_10inch(rpm10(3))]);
Cf4Scana_off_10inches_RPM_1 = mean([Cf4Scana_10inch(rpm10(1)),Cf4Scana_10inch(rpm10(3))]);
Cf5Scana_off_10inches_RPM_1 = mean([Cf5Scana_10inch(rpm10(1)),Cf5Scana_10inch(rpm10(3))]);
Cf1Scana_off_10inches_RPM_2 = mean([Cf1Scana_10inch(rpm10(2)),Cf1Scana_10inch(rpm10(4))]);
Cf2Scana_off_10inches_RPM_2 = mean([Cf2Scana_10inch(rpm10(2)),Cf2Scana_10inch(rpm10(4))]);
Cf3Scana_off_10inches_RPM_2 = mean([Cf3Scana_10inch(rpm10(2)),Cf3Scana_10inch(rpm10(4))]);
Cf4Scana_off_10inches_RPM_2 = mean([Cf4Scana_10inch(rpm10(2)),Cf4Scana_10inch(rpm10(4))]);
Cf5Scana_off_10inches_RPM_2 = mean([Cf5Scana_10inch(rpm10(2)),Cf5Scana_10inch(rpm10(4))]);


%% %%%%%%%%%%%% PLOTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%

% Plot of Fz removing offsets and marking RPM12 levels
figure()
hold on
plot(ti1_10inches,Fz1_off_10inches,'lineWidth',1.5)
plot(ti2_10inches,Fz2_off_10inches,'lineWidth',1.5)
plot(ti3_10inches,Fz3_off_10inches,'lineWidth',1.5)
plot(ti4_10inches,Fz4_off_10inches,'lineWidth',1.5)
plot(ti5_10inches,Fz5_off_10inches,'lineWidth',1.5)
grid on
plot(timing1_10inches(rpm10(1))*0.1,Force_z1_off_10inches(rpm10(1)),'x','color','k','lineWidth',2)
plot(timing2_10inches(rpm10(1))*0.1,Force_z2_off_10inches(rpm10(1)),'x','color','b','lineWidth',2)
plot(timing3_10inches(rpm10(1))*0.1,Force_z3_off_10inches(rpm10(1)),'x','color','r','lineWidth',2)
plot(timing4_10inches(rpm10(1))*0.1,Force_z4_off_10inches(rpm10(1)),'x','color','g','lineWidth',2)
plot(timing5_10inches(rpm10(1))*0.1,Force_z5_off_10inches(rpm10(1)),'x','color','m','lineWidth',2)
plot(timing1_10inches(rpm10(2))*0.1,Force_z1_off_10inches(rpm10(2)),'x','color','k','lineWidth',2)
plot(timing2_10inches(rpm10(2))*0.1,Force_z2_off_10inches(rpm10(2)),'x','color','b','lineWidth',2)
plot(timing3_10inches(rpm10(2))*0.1,Force_z3_off_10inches(rpm10(2)),'x','color','r','lineWidth',2)
plot(timing4_10inches(rpm10(2))*0.1,Force_z4_off_10inches(rpm10(2)),'x','color','g','lineWidth',2)
plot(timing5_10inches(rpm10(2))*0.1,Force_z5_off_10inches(rpm10(2)),'x','color','m','lineWidth',2)
plot(timing1_10inches(rpm10(3))*0.1,Force_z1_off_10inches(rpm10(3)),'x','color','k','lineWidth',2)
plot(timing2_10inches(rpm10(3))*0.1,Force_z2_off_10inches(rpm10(3)),'x','color','b','lineWidth',2)
plot(timing3_10inches(rpm10(3))*0.1,Force_z3_off_10inches(rpm10(3)),'x','color','r','lineWidth',2)
plot(timing4_10inches(rpm10(3))*0.1,Force_z4_off_10inches(rpm10(3)),'x','color','g','lineWidth',2)
plot(timing5_10inches(rpm10(3))*0.1,Force_z5_off_10inches(rpm10(3)),'x','color','m','lineWidth',2)
plot(timing1_10inches(rpm10(4))*0.1,Force_z1_off_10inches(rpm10(4)),'x','color','k','lineWidth',2)
plot(timing2_10inches(rpm10(4))*0.1,Force_z2_off_10inches(rpm10(4)),'x','color','b','lineWidth',2)
plot(timing3_10inches(rpm10(4))*0.1,Force_z3_off_10inches(rpm10(4)),'x','color','r','lineWidth',2)
plot(timing4_10inches(rpm10(4))*0.1,Force_z4_off_10inches(rpm10(4)),'x','color','g','lineWidth',2)
plot(timing5_10inches(rpm10(4))*0.1,Force_z5_off_10inches(rpm10(4)),'x','color','m','lineWidth',2)
plot((timing1_10inches(rpm10(1))+segment_points/2)*0.1,Force_z1_off_10inches(rpm10(1)),'x','color','k','lineWidth',2)
plot((timing1_10inches(rpm10(1))-segment_points/2)*0.1,Force_z1_off_10inches(rpm10(1)),'x','color','k','lineWidth',2)
plot((timing2_10inches(rpm10(1))+segment_points/2)*0.1,Force_z2_off_10inches(rpm10(1)),'x','color','b','lineWidth',2)
plot((timing2_10inches(rpm10(1))-segment_points/2)*0.1,Force_z2_off_10inches(rpm10(1)),'x','color','b','lineWidth',2)
plot((timing3_10inches(rpm10(1))+segment_points/2)*0.1,Force_z3_off_10inches(rpm10(1)),'x','color','r','lineWidth',2)
plot((timing3_10inches(rpm10(1))-segment_points/2)*0.1,Force_z3_off_10inches(rpm10(1)),'x','color','r','lineWidth',2)
plot((timing4_10inches(rpm10(1))+segment_points/2)*0.1,Force_z4_off_10inches(rpm10(1)),'x','color','g','lineWidth',2)
plot((timing4_10inches(rpm10(1))-segment_points/2)*0.1,Force_z4_off_10inches(rpm10(1)),'x','color','g','lineWidth',2)
plot((timing5_10inches(rpm10(1))+segment_points/2)*0.1,Force_z5_off_10inches(rpm10(1)),'x','color','m','lineWidth',2)
plot((timing5_10inches(rpm10(1))-segment_points/2)*0.1,Force_z5_off_10inches(rpm10(1)),'x','color','m','lineWidth',2)
plot((timing1_10inches(rpm10(2))+segment_points/2)*0.1,Force_z1_off_10inches(rpm10(2)),'x','color','k','lineWidth',2)
plot((timing1_10inches(rpm10(2))-segment_points/2)*0.1,Force_z1_off_10inches(rpm10(2)),'x','color','k','lineWidth',2)
plot((timing2_10inches(rpm10(2))+segment_points/2)*0.1,Force_z2_off_10inches(rpm10(2)),'x','color','b','lineWidth',2)
plot((timing2_10inches(rpm10(2))-segment_points/2)*0.1,Force_z2_off_10inches(rpm10(2)),'x','color','b','lineWidth',2)
plot((timing3_10inches(rpm10(2))+segment_points/2)*0.1,Force_z3_off_10inches(rpm10(2)),'x','color','r','lineWidth',2)
plot((timing3_10inches(rpm10(2))-segment_points/2)*0.1,Force_z3_off_10inches(rpm10(2)),'x','color','r','lineWidth',2)
plot((timing4_10inches(rpm10(2))+segment_points/2)*0.1,Force_z4_off_10inches(rpm10(2)),'x','color','g','lineWidth',2)
plot((timing4_10inches(rpm10(2))-segment_points/2)*0.1,Force_z4_off_10inches(rpm10(2)),'x','color','g','lineWidth',2)
plot((timing5_10inches(rpm10(2))+segment_points/2)*0.1,Force_z5_off_10inches(rpm10(2)),'x','color','m','lineWidth',2)
plot((timing5_10inches(rpm10(2))-segment_points/2)*0.1,Force_z5_off_10inches(rpm10(2)),'x','color','m','lineWidth',2)
plot((timing1_10inches(rpm10(3))+segment_points/2)*0.1,Force_z1_off_10inches(rpm10(3)),'x','color','k','lineWidth',2)
plot((timing1_10inches(rpm10(3))-segment_points/2)*0.1,Force_z1_off_10inches(rpm10(3)),'x','color','k','lineWidth',2)
plot((timing2_10inches(rpm10(3))+segment_points/2)*0.1,Force_z2_off_10inches(rpm10(3)),'x','color','b','lineWidth',2)
plot((timing2_10inches(rpm10(3))-segment_points/2)*0.1,Force_z2_off_10inches(rpm10(3)),'x','color','b','lineWidth',2)
plot((timing3_10inches(rpm10(3))+segment_points/2)*0.1,Force_z3_off_10inches(rpm10(3)),'x','color','r','lineWidth',2)
plot((timing3_10inches(rpm10(3))-segment_points/2)*0.1,Force_z3_off_10inches(rpm10(3)),'x','color','r','lineWidth',2)
plot((timing4_10inches(rpm10(3))+segment_points/2)*0.1,Force_z4_off_10inches(rpm10(3)),'x','color','g','lineWidth',2)
plot((timing4_10inches(rpm10(3))-segment_points/2)*0.1,Force_z4_off_10inches(rpm10(3)),'x','color','g','lineWidth',2)
plot((timing5_10inches(rpm10(3))+segment_points/2)*0.1,Force_z5_off_10inches(rpm10(3)),'x','color','m','lineWidth',2)
plot((timing5_10inches(rpm10(3))-segment_points/2)*0.1,Force_z5_off_10inches(rpm10(3)),'x','color','m','lineWidth',2)
plot((timing1_10inches(rpm10(4))+segment_points/2)*0.1,Force_z1_off_10inches(rpm10(4)),'x','color','k','lineWidth',2)
plot((timing1_10inches(rpm10(4))-segment_points/2)*0.1,Force_z1_off_10inches(rpm10(4)),'x','color','k','lineWidth',2)
plot((timing2_10inches(rpm10(4))+segment_points/2)*0.1,Force_z2_off_10inches(rpm10(4)),'x','color','b','lineWidth',2)
plot((timing2_10inches(rpm10(4))-segment_points/2)*0.1,Force_z2_off_10inches(rpm10(4)),'x','color','b','lineWidth',2)
plot((timing3_10inches(rpm10(4))+segment_points/2)*0.1,Force_z3_off_10inches(rpm10(4)),'x','color','r','lineWidth',2)
plot((timing3_10inches(rpm10(4))-segment_points/2)*0.1,Force_z3_off_10inches(rpm10(4)),'x','color','r','lineWidth',2)
plot((timing4_10inches(rpm10(4))+segment_points/2)*0.1,Force_z4_off_10inches(rpm10(4)),'x','color','g','lineWidth',2)
plot((timing4_10inches(rpm10(4))-segment_points/2)*0.1,Force_z4_off_10inches(rpm10(4)),'x','color','g','lineWidth',2)
plot((timing5_10inches(rpm10(4))+segment_points/2)*0.1,Force_z5_off_10inches(rpm10(4)),'x','color','m','lineWidth',2)
plot((timing5_10inches(rpm10(4))-segment_points/2)*0.1,Force_z5_off_10inches(rpm10(4)),'x','color','m','lineWidth',2)
ylabel('Fz no offsets [N] 10"x4.7"')
legend(text1,text2,text3,text4,text5)
xlabel('Time [s]')
hold off

% Plot for tachometers 3 and marking every point of every level
figure()
hold on
plot(ti1_10inch_3,RPM1_10inch_3,'lineWidth',1.5)
plot(ti2_10inch_3,RPM2_10inch_3,'lineWidth',1.5)
plot(ti3_10inch_3,RPM3_10inch_3,'lineWidth',1.5)
plot(ti4_10inch_3,RPM4_10inch_3,'lineWidth',1.5)
plot(ti5_10inch_3,RPM5_10inch_3,'lineWidth',1.5)
grid on
plot(timing1_10_3,Tach1_10_off_3,'x','color','k','lineWidth',2)
plot(timing2_10_3,Tach2_10_off_3,'x','color','b','lineWidth',2)
plot(timing3_10_3,Tach3_10_off_3,'x','color','r','lineWidth',2)
plot(timing4_10_3,Tach4_10_off_3,'x','color','g','lineWidth',2)
plot(timing5_10_3,Tach5_10_off_3,'x','color','m','lineWidth',2)
ylabel('RPM [rev/min] ')
legend(text1,text2,text3,text4,text5, 'Fz1 offset','Fz2 offset','Fz3 offset','Fz4 offset','Fz5 offset')
xlabel('Time [s]')
title('Tachometer 3 10"')
hold off

% Plot for tachometers I and marking every point of every level
figure()
hold on
plot(ti1_10inch_I,RPM1_10inch_I,'lineWidth',1.5)
plot(ti2_10inch_I,RPM2_10inch_I,'lineWidth',1.5)
plot(ti3_10inch_I,RPM3_10inch_I,'lineWidth',1.5)
plot(ti4_10inch_I,RPM4_10inch_I,'lineWidth',1.5)
plot(ti5_10inch_I,RPM5_10inch_I,'lineWidth',1.5)
grid on
plot(timing1_10_I,Tach1_10_off_I,'x','color','k','lineWidth',2)
plot(timing2_10_I,Tach2_10_off_I,'x','color','b','lineWidth',2)
plot(timing3_10_I,Tach3_10_off_I,'x','color','r','lineWidth',2)
plot(timing4_10_I,Tach4_10_off_I,'x','color','g','lineWidth',2)
plot(timing5_10_I,Tach5_10_off_I,'x','color','m','lineWidth',2)
ylabel('RPM [rev/min] ')
legend(text1,text2,text3,text4,text5, 'Fz1 offset','Fz2 offset','Fz3 offset','Fz4 offset','Fz5 offset')
xlabel('Time [s]')
title('Tachometer I 10"')
% hold off


%
% Forces on levels of Fz10"max and F10"max/2 and relationship with distance
figure()
hold on;grid on;
plot(distances(1),Fz1_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(1),Fz1_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
xlabel('Distance [cm]')
ylabel('F_z 10"x4.7"[-]')
legend('$F_z$ F10"max','','','','','$F_z$ F10" max/2')
title('Ceiling effect F_z ')

% Forces on levels of RPM12"max and RPM12"max/2 and relationship with distance
figure()
hold on;grid on;
plot(distances(1),Fz1_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
plot(distances(1),Fz1_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(2),Fz2_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(3),Fz3_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(4),Fz4_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
plot(distances(5),Fz5_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
xlabel('Distance [cm]')
ylabel('F_z 10"x4.7"[-]')
legend('$F_z$ RMP12"max','','','','','$F_z$ RMP12" max/2')
title('Ceiling effect F_z ')


% Scanavino Coefficients for Fz10" and Fz10"/2
% figure()
% hold on;grid on;
% plot(distances(1),Cf1Scana_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(2),Cf2Scana_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(3),Cf3Scana_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(4),Cf4Scana_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(5),Cf5Scana_off_10inches_Fz_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(1),Cf1Scana_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(2),Cf2Scana_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(3),Cf3Scana_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(4),Cf4Scana_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(5),Cf5Scana_off_10inches_Fz_1,'x','color','r','linewidth',2,'markersize',8)
% xlabel('Distance [cm]')
% ylabel('C_f 10"x4.7"[-]')
% legend('$C_f$ F10"max','','','','','$C_f$ F10" max/2')
% title('Ceiling effect C_f ')


% Scanavino Coefficients for RPM12" and RPM12"/2
% figure()
% hold on;grid on;
% plot(distances(1),Cf1Scana_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(2),Cf2Scana_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(3),Cf3Scana_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(4),Cf4Scana_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(5),Cf5Scana_off_10inches_RPM_2,'x','color','b','linewidth',2,'markersize',8)
% plot(distances(1),Cf1Scana_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(2),Cf2Scana_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(3),Cf3Scana_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(4),Cf4Scana_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
% plot(distances(5),Cf5Scana_off_10inches_RPM_1,'x','color','r','linewidth',2,'markersize',8)
% xlabel('Distance [cm]')
% ylabel('C_f 10"x4.7"[-]')
% legend('$C_f$ RMP12"max','','','','','$C_f$ RMP12" max/2')
% title('Ceiling effect C_f')
%}

%% %%%%%%%%% CURVE FITTING EXPERIMENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

D_R = [distances(1)
distances(2)
distances(3)
distances(4)
distances(5)];

% C_f10 = [Cf1Scana_off_10inches_RPM_2-Cf5Scana_off_10inches_RPM_2
%          Cf2Scana_off_10inches_RPM_2-Cf5Scana_off_10inches_RPM_2
%          Cf3Scana_off_10inches_RPM_2-Cf5Scana_off_10inches_RPM_2
%          Cf4Scana_off_10inches_RPM_2-Cf5Scana_off_10inches_RPM_2
%          Cf5Scana_off_10inches_RPM_2-Cf5Scana_off_10inches_RPM_2];
% 
% population3_10inch = fit(D_R,C_f10,'poly1','Normalize','on');
% population4_10inch = fit(D_R,C_f10,'poly2','Normalize','on');
% population5_10inch = fit(D_R,C_f10,'poly3','Normalize','on');
% % population6 = fit(D_R,C_f12,'rat11','Normalize','on');
% populationExp10inch_4000rpm = fit(D_R,C_f10,'exp1');
% 
% C_f10 = [Cf1Scana_off_10inches_RPM_2
%          Cf2Scana_off_10inches_RPM_2
%          Cf3Scana_off_10inches_RPM_2
%          Cf4Scana_off_10inches_RPM_2
%          Cf5Scana_off_10inches_RPM_2];

% Fitting Cf_scanavino at RPM12"max as exponential expression
% figure()
% hold on
% plot(D_R,C_f10,'x','color','k','lineWidth',2)
% plot(populationExp10inch_4000rpm(0:100)+Cf5Scana_off_10inches_RPM_2,'r--');
% hold off
% legend('Datapoints','exp1','Location','NorthWest');
% grid on
% xlabel('D [cm]')
% ylabel('C_f 4000 RPM" 10"x4.7" [-]')
% xlim([0 100])
% title('Ceiling effect at 4650 RPM')
% caption = sprintf('y = %f * exp(%f*x) + %f', populationExp10inch.a,populationExp10inch.b,Fz5_off_10inches_RPM_2);
% gtext(caption, 'FontSize', 16, 'Color', 'k');


%% %% 10 and 12 inches plots and computetions RPM %%%%%%%%%%%%%%%
F_10_RPM1 = [Fz1_off_10inches_RPM_1-Fz5_off_10inches_RPM_1
             Fz2_off_10inches_RPM_1-Fz5_off_10inches_RPM_1
             Fz3_off_10inches_RPM_1-Fz5_off_10inches_RPM_1
             Fz4_off_10inches_RPM_1-Fz5_off_10inches_RPM_1
             Fz5_off_10inches_RPM_1-Fz5_off_10inches_RPM_1];

populationExp10inch_2000rpm = fit(D_R,F_10_RPM1,'exp1');
populationExp10inch_2000rpm1 = fit((D_R)./(R_10*100),F_10_RPM1,'exp1');

F_10_RPM1 = [Fz1_off_10inches_RPM_1
             Fz2_off_10inches_RPM_1
             Fz3_off_10inches_RPM_1
             Fz4_off_10inches_RPM_1
             Fz5_off_10inches_RPM_1];

x10_cheeserpm1 = [(D_R(1)*1e-2)/R_10:0.01:10];
y10_cheeserpm1 = Fz5_off_10inches_RPM_1./(1-(0.25*1./x10_cheeserpm1).^2);
fit_10xrpm1 = [(D_R(1)*1e-2)/R_10:0.01:10];
fit_10yrpm1 = populationExp10inch_2000rpm1(fit_10xrpm1)+Fz5_off_10inches_RPM_1;


F_10_RPM2 = [Fz1_off_10inches_RPM_2-Fz5_off_10inches_RPM_2
             Fz2_off_10inches_RPM_2-Fz5_off_10inches_RPM_2
             Fz3_off_10inches_RPM_2-Fz5_off_10inches_RPM_2
             Fz4_off_10inches_RPM_2-Fz5_off_10inches_RPM_2
             Fz5_off_10inches_RPM_2-Fz5_off_10inches_RPM_2];

populationExp10inch_4000rpm = fit(D_R,F_10_RPM2,'exp1');
populationExp10inch_4000rpm2 = fit((D_R)./(R_10*100),F_10_RPM2,'exp1');

F_10_RPM2 = [Fz1_off_10inches_RPM_2
             Fz2_off_10inches_RPM_2
             Fz3_off_10inches_RPM_2
             Fz4_off_10inches_RPM_2
             Fz5_off_10inches_RPM_2];

fit_10xrpm2 = [(D_R(1)*1e-2)/R_10:0.01:10];
fit_10yrpm2 = populationExp10inch_4000rpm2(fit_10xrpm2)+Fz5_off_10inches_RPM_2;
x10_cheeserpm2 = [(D_R(1)*1e-2)/R_10:0.01:10];
y10_cheeserpm2 = Fz5_off_10inches_RPM_2./(1-(0.25*1./x10_cheeserpm2).^2);

%%%%% 12 inches %%%%
F_12_RPM1 = [Fz1_off_12inches_RPM_1-Fz5_off_12inches_RPM_1
             Fz2_off_12inches_RPM_1-Fz5_off_12inches_RPM_1
             Fz3_off_12inches_RPM_1-Fz5_off_12inches_RPM_1
             Fz4_off_12inches_RPM_1-Fz5_off_12inches_RPM_1
             Fz5_off_12inches_RPM_1-Fz5_off_12inches_RPM_1];

populationExp12inch_2000rpm = fit(D_R,F_12_RPM1,'exp1');
populationExp12inch_2000rpm1 = fit((D_R)./(R_12*100),F_12_RPM1,'exp1');

F_12_RPM1 = [Fz1_off_12inches_RPM_1
             Fz2_off_12inches_RPM_1
             Fz3_off_12inches_RPM_1
             Fz4_off_12inches_RPM_1
             Fz5_off_12inches_RPM_1];

x12_cheeserpm1 = [(D_R(1)*1e-2)/R_12:0.01:10];
y12_cheeserpm1 = Fz5_off_12inches_RPM_1./(1-(0.25*1./x12_cheeserpm1).^2);
fit_12xrpm1 = [(D_R(1)*1e-2)/R_12:0.01:10];
fit_12yrpm1 = populationExp12inch_2000rpm1(fit_12xrpm1)+Fz5_off_12inches_RPM_1;

F_12_RPM2 = [Fz1_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
             Fz2_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
             Fz3_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
             Fz4_off_12inches_RPM_2-Fz5_off_12inches_RPM_2
             Fz5_off_12inches_RPM_2-Fz5_off_12inches_RPM_2];

populationExp12inch_4000rpm = fit(D_R,F_12_RPM2,'exp1');
populationExp12inch_4000rpm2 = fit((D_R)./(R_12*100),F_12_RPM2,'exp1');

F_12_RPM2 = [Fz1_off_12inches_RPM_2
             Fz2_off_12inches_RPM_2
             Fz3_off_12inches_RPM_2
             Fz4_off_12inches_RPM_2
             Fz5_off_12inches_RPM_2];

x12_cheeserpm2 = [(D_R(1)*1e-2)/R_12:0.01:10];
y12_cheeserpm2 = Fz5_off_12inches_RPM_2./(1-(0.25*1./x12_cheeserpm2).^2);
fit_12xrpm2 = [(D_R(1)*1e-2)/R_12:0.01:10];
fit_12yrpm2 = populationExp12inch_4000rpm2(fit_12xrpm2)+Fz5_off_12inches_RPM_2;


%% %%%%%%%%%%% Fz %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

F_10_Fz1 = [Fz1_off_10inches_Fz_1-Fz5_off_10inches_Fz_1
            Fz2_off_10inches_Fz_1-Fz5_off_10inches_Fz_1
            Fz3_off_10inches_Fz_1-Fz5_off_10inches_Fz_1
            Fz4_off_10inches_Fz_1-Fz5_off_10inches_Fz_1
            Fz5_off_10inches_Fz_1-Fz5_off_10inches_Fz_1];
F_12_Fz1 = [Fz1_off_12inches_Fz_1-Fz5_off_12inches_Fz_1
            Fz2_off_12inches_Fz_1-Fz5_off_12inches_Fz_1
            Fz3_off_12inches_Fz_1-Fz5_off_12inches_Fz_1
            Fz4_off_12inches_Fz_1-Fz5_off_12inches_Fz_1
            Fz5_off_12inches_Fz_1-Fz5_off_12inches_Fz_1];

populationExp10inch_Fz1 = fit(D_R,F_10_Fz1,'exp1');
populationExp12inch_Fz1 = fit(D_R,F_12_Fz1,'exp1');
populationExp10inch_DRFz1 = fit((D_R)./(R_10*100),F_10_Fz1,'exp1');
populationExp12inch_DRFz1 = fit((D_R)./(R_12*100),F_12_Fz1,'exp1');

F_10_Fz1 = [ Fz1_off_10inches_Fz_1
             Fz2_off_10inches_Fz_1
             Fz3_off_10inches_Fz_1
             Fz4_off_10inches_Fz_1
             Fz5_off_10inches_Fz_1];
F_12_Fz1 = [ Fz1_off_12inches_Fz_1
             Fz2_off_12inches_Fz_1
             Fz3_off_12inches_Fz_1
             Fz4_off_12inches_Fz_1
             Fz5_off_12inches_Fz_1];

x10_cheeseFz1 = [(D_R(1)*1e-2)/R_10:0.01:10];
y10_cheeseFz1 = Fz5_off_10inches_Fz_1./(1-(0.25*1./x10_cheeseFz1).^2);
fit_10xFz1  = [(D_R(1)*1e-2)/R_10:0.01:10];
fit_10yFz1  = populationExp10inch_DRFz1(fit_10xFz1)+Fz5_off_10inches_Fz_1;
x12_cheeseFz1 = [(D_R(1)*1e-2)/R_12:0.01:10];
y12_cheeseFz1 = Fz5_off_12inches_Fz_1./(1-(0.25*1./x12_cheeseFz1).^2);
fit_12xFz1 = [(D_R(1)*1e-2)/R_12:0.01:10];
fit_12yFz1 = populationExp12inch_DRFz1(fit_12xFz1)+Fz5_off_12inches_Fz_1;


F_10_Fz2 = [ Fz1_off_10inches_Fz_2-Fz5_off_10inches_Fz_2
             Fz2_off_10inches_Fz_2-Fz5_off_10inches_Fz_2
             Fz3_off_10inches_Fz_2-Fz5_off_10inches_Fz_2
             Fz4_off_10inches_Fz_2-Fz5_off_10inches_Fz_2
             Fz5_off_10inches_Fz_2-Fz5_off_10inches_Fz_2];
F_12_Fz2 = [ Fz1_off_12inches_Fz_2-Fz5_off_12inches_Fz_2
             Fz2_off_12inches_Fz_2-Fz5_off_12inches_Fz_2
             Fz3_off_12inches_Fz_2-Fz5_off_12inches_Fz_2
             Fz4_off_12inches_Fz_2-Fz5_off_12inches_Fz_2
             Fz5_off_12inches_Fz_2-Fz5_off_12inches_Fz_2];

populationExp10inch_Fz2 = fit(D_R,F_10_Fz2,'exp1');
populationExp12inch_Fz2 = fit(D_R,F_12_Fz2,'exp1');
populationExp10inch_DRFz2 = fit((D_R)./(R_10*100),F_10_Fz2,'exp1');
populationExp12inch_DRFz2 = fit((D_R)./(R_12*100),F_12_Fz2,'exp1');

F_10_Fz2 = [ Fz1_off_10inches_Fz_2
             Fz2_off_10inches_Fz_2
             Fz3_off_10inches_Fz_2
             Fz4_off_10inches_Fz_2
             Fz5_off_10inches_Fz_2];
F_12_Fz2 = [ Fz1_off_12inches_Fz_2
             Fz2_off_12inches_Fz_2
             Fz3_off_12inches_Fz_2
             Fz4_off_12inches_Fz_2
             Fz5_off_12inches_Fz_2];

x10_cheeseFz2 = [(D_R(1)*1e-2)/R_10:0.01:10];
y10_cheeseFz2 = Fz5_off_10inches_Fz_2./(1-(0.25*1./x10_cheeseFz2).^2);
fit_10xFz2  = [(D_R(1)*1e-2)/R_10:0.01:10];
fit_10yFz2  = populationExp10inch_DRFz2(fit_10xFz2)+Fz5_off_10inches_Fz_2;
x12_cheeseFz2 = [(D_R(1)*1e-2)/R_12:0.01:10];
y12_cheeseFz2 = Fz5_off_12inches_Fz_2./(1-(0.25*1./x12_cheeseFz2).^2);
fit_12xFz2 = [(D_R(1)*1e-2)/R_12:0.01:10];
fit_12yFz2 = populationExp12inch_DRFz2(fit_12xFz2)+Fz5_off_12inches_Fz_2;


%
% Fz 10" 4000 rpm D/R // Regression exp // Cheeseman&Bennett
figure()
hold on
plot((D_R)./(R_10*100),F_10_RPM2,'x','color','k','lineWidth',2)
plot(fit_10xrpm2,fit_10yrpm2,'r--');
plot(x10_cheeserpm2,y10_cheeserpm2,'k--');
hold off
legend('Datapoints','Exponential regression','CheesemanBennett','Location','NorthWest');
grid on
xlabel('D/R [-]')
ylabel('Fz 4000 RPM 10"x4.7" [-]')
xlim([0 10])
title('Ceiling effect at 4000 RPM, 20ºC, 200 m ASL')
caption = sprintf('F_z_{10} = %f * e^{%f*Z/R} + %f', populationExp10inch_4000rpm2.a,populationExp10inch_4000rpm2.b,Fz5_off_10inches_RPM_2);
gtext(caption, 'FontSize', 12, 'Color', 'k');

% Fz 12" 4000 rpm D/R // Regression exp // Cheeseman&Bennett
figure()
hold on
plot((D_R)./(R_12*100),F_12_RPM2,'x','color','k','lineWidth',2)
plot(fit_12xrpm2,fit_12yrpm2,'r--');
plot(x12_cheeserpm2,y12_cheeserpm2,'k--');
hold off
legend('Datapoints','Exponential regression','CheesemanBennett','Location','NorthWest');
grid on
xlabel('D/R [-]')
ylabel('Fz 4000 RPM 12"x5" [-]')
xlim([0 10])
ylim([15 20])
title('Ceiling effect at 4000 RPM, 20ºC, 200 m ASL')
caption = sprintf('F_z_{12} = %f * e^{%f*Z/R} + %f', populationExp12inch_4000rpm2.a,populationExp12inch_4000rpm2.b,Fz5_off_10inches_RPM_2);
gtext(caption, 'FontSize', 12, 'Color', 'k');



% Fz 10" and 12" 4000 rpm D/R // Regression exp // Cheeseman&Bennett
figure()
hold on
plot((D_R)./(R_10*100),F_10_RPM2,'x','color','k','lineWidth',2)
plot(fit_10xrpm2,fit_10yrpm2,'r','linewidth',1.5);
plot(x10_cheeserpm2,y10_cheeserpm2,'m--','linewidth',1.5);
plot((D_R)./(R_12*100),F_12_RPM2,'x','color','b','lineWidth',2)
plot(fit_12xrpm2,fit_12yrpm2,'g','linewidth',1.5);
plot(x12_cheeserpm2,y12_cheeserpm2,'c--','linewidth',1.5);
hold off
legend('10"','expReg','Cheesman','12"','expReg','Cheesman','Location','NorthWest');
grid on
xlabel('Z/R [-]')
ylabel('Fz 4000 RPM [-]')
xlim([0 10])
ylim([7 20])
title('Ceiling effect at 4000 RPM, 20ºC, 200 m ASL')
caption = sprintf('F_z_{10} = %f * e^{%f*Z/R} + %f', populationExp10inch_4000rpm.a,populationExp10inch_4000rpm.b,Fz5_off_10inches_RPM_2);
gtext(caption, 'FontSize', 11, 'Color', 'k');
caption = sprintf('F_z_{12} = %f * e^{%f*Z/R} + %f', populationExp12inch_4000rpm.a,populationExp12inch_4000rpm.b,Fz5_off_12inches_RPM_2);
gtext(caption, 'FontSize', 11, 'Color', 'k');


% Fz 10" and 12" 4000 rpm d[cm] // Regression exp
figure()
hold on
plot(D_R,F_10_RPM2,'x','color','k','lineWidth',2)
plot(populationExp10inch_4000rpm(0:100)+Fz5_off_10inches_RPM_2,'r');
plot(D_R,F_12_RPM2,'x','color','b','lineWidth',2)
plot(populationExp12inch_4000rpm(0:100)+Fz5_off_12inches_RPM_2,'g');
hold off
legend('10"','exp1','12"','exp1','Location','NorthWest');
grid on
xlabel('D [cm]')
ylabel('Fz 4000 RPM [-]')
xlim([0 100])
title('Ceiling effect at 4000 RPM, 20ºC, 200 m ASL')
caption = sprintf('F_z_{10} = %f * exp(%f*x) + %f', populationExp10inch_4000rpm.a,populationExp10inch_4000rpm.b,Fz5_off_10inches_RPM_2);
gtext(caption, 'FontSize', 16, 'Color', 'k');
caption = sprintf('F_z_{12} = %f * exp(%f*x) + %f', populationExp12inch_4000rpm.a,populationExp12inch_4000rpm.b,Fz5_off_12inches_RPM_2);
gtext(caption, 'FontSize', 16, 'Color', 'k');


% Fz 10" and 12" 2000/4000 rpm d[cm] // Regression exp
figure()
hold on
plot(D_R,F_10_RPM2,'x','color','k','lineWidth',2)
plot(populationExp10inch_4000rpm(0:100)+Fz5_off_10inches_RPM_2,'r--');
plot(D_R,F_12_RPM2,'x','color','b','lineWidth',2)
plot(populationExp12inch_4000rpm(0:100)+Fz5_off_12inches_RPM_2,'g--');
plot(D_R,F_10_RPM1,'x','color','k','lineWidth',2)
plot(populationExp10inch_2000rpm(0:100)+Fz5_off_10inches_RPM_1,'r--');
plot(D_R,F_12_RPM1,'x','color','b','lineWidth',2)
plot(populationExp12inch_2000rpm(0:100)+Fz5_off_12inches_RPM_1,'g--');
hold off
legend('Data 10"','','Data 12"','','Location','NorthWest');
grid on
xlabel('D [cm]')
ylabel('Fz [N]')
xlim([0 100])
title('Ceiling effect at 20ºC, 200 m ASL')

% caption = sprintf('F_z_{12_{4000rpm}} = %f * e^{%f*x} + %f', populationExp12inch_4000rpm.a,populationExp12inch_4000rpm.b,Fz5_off_12inches_RPM_2);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{10_{4000rpm}} = %f * e^{%f*x} + %f', populationExp10inch_4000rpm.a,populationExp10inch_4000rpm.b,Fz5_off_10inches_RPM_2);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{12_{2000rpm}} = %f * e^{%f*x} + %f', populationExp12inch_2000rpm.a,populationExp12inch_2000rpm.b,Fz5_off_12inches_RPM_1);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{10_{2000rpm}} = %f * e^{%f*x} + %f', populationExp10inch_2000rpm.a,populationExp10inch_2000rpm.b,Fz5_off_10inches_RPM_1);
% gtext(caption, 'FontSize', 11, 'Color', 'k');



% Fz 10" and 12" Fzmax Fzmax/2 d[cm] // Regression exp
figure()
hold on
plot(D_R,F_10_Fz2,'x','color','k','lineWidth',2)
plot(populationExp10inch_Fz2(0:100)+Fz5_off_10inches_Fz_2,'r--');
plot(D_R,F_12_Fz2,'x','color','b','lineWidth',2)
plot(populationExp12inch_Fz2(0:100)+Fz5_off_12inches_Fz_2,'g--');
plot(D_R,F_10_Fz1,'x','color','k','lineWidth',2)
plot(populationExp10inch_Fz1(0:100)+Fz5_off_10inches_Fz_1,'r--');
plot(D_R,F_12_Fz1,'x','color','b','lineWidth',2)
plot(populationExp12inch_Fz1(0:100)+Fz5_off_12inches_Fz_1,'g--');
hold off
legend('Data 10"','','Data 12"','','Location','NorthWest');
grid on
xlabel('D [cm]')
ylabel('Fz at equal Fz [-]')
xlim([0 100])
title('Ceiling effect at 20ºC, 200 m ASL')
% caption = sprintf('F_z_{12_{Fz10max}} = %f * e^{%f*x} + %f', populationExp12inch_Fz2.a,populationExp12inch_Fz2.b,Fz5_off_12inches_Fz_2);
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{10_{Fz10max}} = %f * e^{%f*x} + %f', populationExp10inch_Fz2.a,populationExp10inch_Fz2.b,Fz5_off_10inches_Fz_2);
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{12_{Fz10mmax/2}} = %f * e^{%f*x} + %f', populationExp12inch_Fz1.a,populationExp12inch_Fz1.b,Fz5_off_12inches_Fz_1);
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{10_{Fz10max/2}} = %f * e^{%f*x} + %f', populationExp10inch_Fz1.a,populationExp10inch_Fz1.b,Fz5_off_10inches_Fz_1);
% gtext(caption, 'FontSize', 12, 'Color', 'k');

% Fz 10" and 12" 2000/4000 rpm D/R // Regression exp // Cheeseman&Bennett
% figure()
% hold on
% plot((D_R)./(R_12*100),F_12_RPM2,'x','color','b','lineWidth',2)
% plot(fit_12xrpm2,fit_12yrpm2,'r');
% plot(x12_cheeserpm2,y12_cheeserpm2,'k--');
% plot((D_R)./(R_10*100),F_10_RPM2,'x','color','r','lineWidth',2)
% plot(fit_10xrpm2,fit_10yrpm2,'r');
% plot(x10_cheeserpm2,y10_cheeserpm2,'k--');
% plot((D_R)./(R_12*100),F_12_RPM1,'x','color','c','lineWidth',2)
% plot(fit_12xrpm1,fit_12yrpm1,'r');
% plot(x12_cheeserpm1,y12_cheeserpm1,'k--');
% plot((D_R)./(R_10*100),F_10_RPM1,'x','color','m','lineWidth',2)
% plot(fit_10xrpm1,fit_10yrpm1,'r');
% plot(x10_cheeserpm1,y10_cheeserpm1,'k--');
% hold off
% legend('','','','','','','','','','','ExpRegr','CheesemanBennett','Location','NorthWest');
% grid on
% xlabel('Z/R [-]')
% ylabel('Fz [N]')
% xlim([0 10])
% ylim([0 20])
% title('Ceiling effect at 20ºC, 200 m ASL')
% caption = sprintf('F_z_{12_{4000rpm}} = %f * e^{%f*x} + %f', populationExp12inch_4000rpm2.a,populationExp12inch_4000rpm2.b,Fz5_off_12inches_RPM_2);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{10_{4000rpm}} = %f * e^{%f*x} + %f', populationExp10inch_4000rpm2.a,populationExp10inch_4000rpm2.b,Fz5_off_10inches_RPM_2);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{12_{2000rpm}} = %f * e^{%f*x} + %f', populationExp12inch_2000rpm1.a,populationExp12inch_2000rpm1.b,Fz5_off_12inches_RPM_1);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{10_{2000rpm}} = %f * e^{%f*x} + %f', populationExp10inch_2000rpm1.a,populationExp10inch_2000rpm1.b,Fz5_off_10inches_RPM_1);
% gtext(caption, 'FontSize', 11, 'Color', 'k');

% Fz 10" and 12" 12.8N/6.5N D/R // Regression exp // Cheeseman&Bennett
% figure()
% hold on
% plot(fit_12xFz2,fit_12yFz2,'color','b','linewidth',1);
% plot(x12_cheeseFz2,y12_cheeseFz2,'k--');
% plot((D_R)./(R_12*100),F_12_Fz2,'x','color','b','lineWidth',2)
% plot(fit_10xFz2,fit_10yFz2,'color','r','linewidth',1);
% plot(x10_cheeseFz2,y10_cheeseFz2,'k--');
% plot((D_R)./(R_10*100),F_10_Fz2,'x','color','r','lineWidth',2)
% plot(fit_12xFz1,fit_12yFz1,'color','c','linewidth',1);
% plot(x12_cheeseFz1,y12_cheeseFz1,'k--');
% plot((D_R)./(R_12*100),F_12_Fz1,'x','color','c','lineWidth',2)
% plot(fit_10xFz1,fit_10yFz1,'color','m','linewidth',1);
% plot(x10_cheeseFz1,y10_cheeseFz1,'k--');
% plot((D_R)./(R_10*100),F_10_Fz1,'x','color','m','lineWidth',2)
% hold off
% legend('ExpRegr','CheesemanBennett','12" 12.8N','','','10" 12.8N','','','12" 6.5N','','','10" 6.5N','Location','NorthWest');
% grid on
% xlabel('Z/R [-]')
% ylabel('Fz [N]')
% xlim([0 10])
% ylim([0 20])
% title('Ceiling effect at 20ºC, 200 m ASL')

% caption = sprintf('F_z_{12_{12.8N}} = %f * e^{%f*x} + %f', populationExp12inch_DRFz2.a,populationExp12inch_DRFz2.b,Fz5_off_12inches_Fz_2);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{10_{12.8N}} = %f * e^{%f*x} + %f', populationExp10inch_DRFz2.a,populationExp10inch_DRFz2.b,Fz5_off_10inches_Fz_2);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{12_{6.5N}} = %f * e^{%f*x} + %f', populationExp12inch_DRFz1.a,populationExp12inch_DRFz1.b,Fz5_off_12inches_Fz_1);
% gtext(caption, 'FontSize', 11, 'Color', 'k');
% caption = sprintf('F_z_{10_{6.5N}} = %f * e^{%f*x} + %f', populationExp10inch_DRFz1.a,populationExp10inch_DRFz1.b,Fz5_off_10inches_Fz_1);
% gtext(caption, 'FontSize', 11, 'Color', 'k');


% options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
% lb = [];
% ub = [];
% x = lsqcurvefit(fun,x0,xdata,ydata,lb,ub,options);
%}

%% %%%%%%% Plots of Ceiling effect at all rpm levels of each prop size

populationExp12inch1 = fit(Tach1_12inch,F_z1_off_12inches,'poly2');
populationExp12inch2 = fit(Tach2_12inch,F_z2_off_12inches,'poly2');
populationExp12inch3 = fit(Tach3_12inch,F_z3_off_12inches,'poly2');
populationExp12inch4 = fit(Tach4_12inch,F_z4_off_12inches,'poly2');
populationExp12inch5 = fit(Tach5_12inch,F_z5_off_12inches,'poly2');
populationExp12inch = fit(Tach5_12inch,F_z5_off_12inches,'poly2');

% save populationExp12inch populationExp12inch

%{
figure()
hold on;
grid on;
plot(Tach1_12inch,F_z1_off_12inches,'x','color','b','MarkerSize',7,'linewidth',1.5);
plot(Tach2_12inch,F_z2_off_12inches,'x','color','r','MarkerSize',7,'linewidth',1.5);
plot(Tach3_12inch,F_z3_off_12inches,'x','color','g','MarkerSize',7,'linewidth',1.5);
plot(Tach4_12inch,F_z4_off_12inches,'x','color','k','MarkerSize',7,'linewidth',1.5);
plot(Tach5_12inch,F_z5_off_12inches,'x','color','m','MarkerSize',7,'linewidth',1.5);
plot(populationExp12inch1(0:5000),'b--')
plot(populationExp12inch2(0:5000),'r--')
plot(populationExp12inch3(0:5000),'g--')
plot(populationExp12inch4(0:5000),'k--')
plot(populationExp12inch5(0:5000),'m--')
legend('5cm', '15cm', '25cm', '35cm','100cm')
xlabel('RPM [rev/min]')
ylabel('Fz [N]')
title('Ceiling effect 12"x5"')
caption = sprintf('F_{5cm} = %f * x^{2} + %f * x + %f', populationExp12inch1.p1,populationExp12inch1.p2,populationExp12inch1.p3);
gtext(caption, 'FontSize', 9, 'Color', 'b');
caption = sprintf('F_{15cm} = %f * x^{2} + %f * x + %f', populationExp12inch2.p1,populationExp12inch2.p2,populationExp12inch2.p3);
gtext(caption, 'FontSize', 9, 'Color', 'r');
caption = sprintf('F_{25cm} = %f * x^{2} + %f * x + %f', populationExp12inch3.p1,populationExp12inch3.p2,populationExp12inch3.p3);
gtext(caption, 'FontSize', 9, 'Color', 'g');
caption = sprintf('F_{35cm} = %f * x^{2} + %f * x + %f', populationExp12inch4.p1,populationExp12inch4.p2,populationExp12inch4.p3);
gtext(caption, 'FontSize', 9, 'Color', 'k');
caption = sprintf('F_{100cm} = %f * x^{2} + %f * x + %f', populationExp12inch5.p1,populationExp12inch5.p2,populationExp12inch5.p3);
gtext(caption, 'FontSize', 9, 'Color', 'm');
%}

populationExp10inch1 = fit(Tach1_10inch,F_z1_off_10inches,'poly2');
populationExp10inch2 = fit(Tach2_10inch,F_z2_off_10inches,'poly2');
populationExp10inch3 = fit(Tach3_10inch,F_z3_off_10inches,'poly2');
populationExp10inch4 = fit(Tach4_10inch,F_z4_off_10inches,'poly2');
populationExp10inch5 = fit(Tach5_10inch,F_z5_off_10inches,'poly2');
populationExp10inch  = fit(Tach5_10inch,F_z5_off_10inches,'poly2');

% save populationExp10inch populationExp10inch

%{
figure()
hold on;
grid on;
plot(Tach1_10inch,F_z1_off_10inches,'x','color','b','MarkerSize',7,'linewidth',1.5);
plot(Tach2_10inch,F_z2_off_10inches,'x','color','r','MarkerSize',7,'linewidth',1.5);
plot(Tach3_10inch,F_z3_off_10inches,'x','color','g','MarkerSize',7,'linewidth',1.5);
plot(Tach4_10inch,F_z4_off_10inches,'x','color','k','MarkerSize',7,'linewidth',1.5);
plot(Tach5_10inch,F_z5_off_10inches,'x','color','m','MarkerSize',7,'linewidth',1.5);
plot(populationExp10inch1(0:5000),'b--')
plot(populationExp10inch2(0:5000),'r--')
plot(populationExp10inch3(0:5000),'g--')
plot(populationExp10inch4(0:5000),'k--')
plot(populationExp10inch5(0:5000),'m--')
legend('5cm', '15cm', '25cm', '35cm','100cm')
xlabel('RPM [rev/min]')
ylabel('Fz [N]')
title('Ceiling effect 10"x4.7"')
caption = sprintf('F_{5cm} = %f * x^{2} + %f * x + %f', populationExp12inch1.p1,populationExp12inch1.p2,populationExp12inch1.p3);
gtext(caption, 'FontSize', 9, 'Color', 'b');
caption = sprintf('F_{15cm} = %f * x^{2} + %f * x + %f', populationExp12inch2.p1,populationExp12inch2.p2,populationExp12inch2.p3);
gtext(caption, 'FontSize', 9, 'Color', 'r');
caption = sprintf('F_{25cm} = %f * x^{2} + %f * x + %f', populationExp12inch3.p1,populationExp12inch3.p2,populationExp12inch3.p3);
gtext(caption, 'FontSize', 9, 'Color', 'g');
caption = sprintf('F_{35cm} = %f * x^{2} + %f * x + %f', populationExp12inch4.p1,populationExp12inch4.p2,populationExp12inch4.p3);
gtext(caption, 'FontSize', 9, 'Color', 'k');
caption = sprintf('F_{100cm} = %f * x^{2} + %f * x + %f', populationExp12inch5.p1,populationExp12inch5.p2,populationExp12inch5.p3);
gtext(caption, 'FontSize', 9, 'Color', 'm');
%}

%% %%%%% Experimenting with exponential parameters

xx = [0:0.01:10];


%{
% figure()
% hold on;
% grid on;
% plot(xx,exp(-xx),'color','b','linewidth',1.5)
% plot(xx,1.5*exp(-xx),'color','r','linewidth',1.5)
% plot(xx,2*exp(-xx),'color','g','linewidth',1.5)
% plot(xx,2.5*exp(-xx),'color','m','linewidth',1.5)
% legend('e$^{-x}$', '1.5e$^{-x}$', '2e$^{-x}$', '2.5e$^{-x}$','interpreter','latex')
% 
% figure()
% hold on;
% grid on;
% plot(xx,exp(-xx),'color','b','linewidth',1.5)
% plot(xx,exp(-1.5*xx),'color','r','linewidth',1.5)
% plot(xx,exp(-2*xx),'color','g','linewidth',1.5)
% plot(xx,exp(-2.5*xx),'color','m','linewidth',1.5)
% legend('e$^{-x}$', 'e$^{-1.5x}$', 'e$^{-2x}$', 'e$^{-2.5x}$','interpreter','latex')



rpm_10inches = [Tach5_10inch(7),Tach5_10inch(6),Tach5_10inch(5),Tach5_10inch(4)]';
a_10inches   = [populationExp10inch_DRFz2.a,populationExp10inch_4000rpm2.a,populationExp10inch_DRFz1.a,populationExp10inch_2000rpm1.a]';
b_10inches   = [populationExp10inch_DRFz2.b,populationExp10inch_4000rpm2.b,populationExp10inch_DRFz1.b,populationExp10inch_2000rpm1.b]';
a_poly_10 = fit(rpm_10inches, a_10inches,'poly2');
b_poly_10 = fit(rpm_10inches, b_10inches,'poly2');

save ab_poly_10 a_poly_10 b_poly_10

load('populationExp10inch.mat') % Thrust = poly2(RPM) at rinf
Z_R_12 = [0:0.01:10];
RPM_2 = 4000;
Fice_10inches_4000 = (a_poly_10(RPM_2))*exp(b_poly_10(RPM_2)*Z_R_12) + populationExp10inch.p1*RPM_2^2 + populationExp10inch.p2*RPM_2 + populationExp10inch.p3;
RPM_2 = 2000;
Fice_10inches_2000 = (a_poly_10(RPM_2))*exp(b_poly_10(RPM_2)*Z_R_12) + populationExp10inch.p1*RPM_2^2 + populationExp10inch.p2*RPM_2 + populationExp10inch.p3;
% figure()
% % ylim([2 20])
% % xlim([0 8])
% hold on;grid on;
% plot((D_R)./(R_10*100),F_10_RPM2,'x','color','b','lineWidth',2)
% plot(fit_10xrpm2,fit_10yrpm2,'r','linewidth',2);
% plot(x10_cheeserpm2,y10_cheeserpm2,'k--');
% plot(Z_R_12, Fice_10inches_4000,'color','g','linewidth',1.5)
% plot((D_R)./(R_10*100),F_10_RPM1,'x','color','b','lineWidth',2)
% plot(fit_10xrpm1,fit_10yrpm1,'r','linewidth',2);
% plot(x10_cheeserpm1,y10_cheeserpm1,'k--');
% plot(Z_R_12, Fice_10inches_2000,'color','g','linewidth',1.5)
% % caption = sprintf('F_z_{10_{4000rpm}} = a(RPM) * e^{b(RPM)*Z/R} + F_{OCE}(RPM)');
% % gtext(caption, 'FontSize', 11, 'Color', 'k');
% % caption = sprintf('F_z_{10_{2000rpm}} = a(RPM) * e^{b(RPM)*Z/R} + F_{OCE}(RPM)');
% % gtext(caption, 'FontSize', 11, 'Color', 'k');
% xlabel('Z/R [-]')
% ylabel('F_z [N]')
% title('Ceiling effect for 10"x4.7" at 4000RPM 0 m and 20\circ C')
% legend('Datapoints','ExpRegression','CheesemanBennett','Model$_{Iris}$','interpreter','latex')


% figure()
% hold on;grid on;
% RPM = [0:500:4000];
% y = b_poly_10(RPM);
% yy = a_poly_10(RPM);
% plot(RPM,yy,'o','color','r')
% plot(RPM,y,'o','color','b')
% xlabel('RPM [rev/min]')
% ylabel('Coefficient value [-]')
% legend('$a_{10"}$', '$b_{10"}$','interpreter','latex')


rpm_12inches = [Tach5_12inch(7),Tach5_12inch(6),Tach5_12inch(5),Tach5_12inch(4)]';
a_12inches   = [populationExp12inch_4000rpm2.a,populationExp12inch_DRFz2.a,populationExp12inch_DRFz1.a,populationExp12inch_2000rpm1.a]';
b_12inches   = [populationExp12inch_4000rpm2.b,populationExp12inch_DRFz2.b,populationExp12inch_DRFz1.b,populationExp12inch_2000rpm1.b]';
a_poly_12 = fit(rpm_12inches, a_12inches,'poly2');
b_poly_12 = fit(rpm_12inches, b_12inches,'poly2');

% save ab_poly_12 a_poly_12 b_poly_12

load('populationExp12inch.mat') % Thrust = poly2(RPM)
Z_R_12 = [0:0.01:10];
RPM_2 = 4000;
Fice_12inches_4000 = (a_poly_12(RPM_2))*exp(b_poly_12(RPM_2)*Z_R_12) + populationExp12inch.p1*RPM_2^2 + populationExp12inch.p2*RPM_2 + populationExp12inch.p3;
RPM_2 = 2000;
Fice_12inches_2000 = (a_poly_12(RPM_2))*exp(b_poly_12(RPM_2)*Z_R_12) + populationExp12inch.p1*RPM_2^2 + populationExp12inch.p2*RPM_2 + populationExp12inch.p3;

% figure()
% ylim([2 20])
% xlim([0 8])
% hold on;grid on;
% plot((D_R)./(R_12*100),F_12_RPM2,'x','color','b','lineWidth',2)
% plot(fit_12xrpm2,fit_12yrpm2,'r','linewidth',2);
% plot(x12_cheeserpm2,y12_cheeserpm2,'k--');
% plot(Z_R_12, Fice_12inches_4000,'color','g','linewidth',1.5)
% plot((D_R)./(R_12*100),F_12_RPM1,'x','color','b','lineWidth',2)
% plot(fit_12xrpm1,fit_12yrpm1,'r','linewidth',2);
% plot(x12_cheeserpm1,y12_cheeserpm1,'k--');
% plot(Z_R_12, Fice_12inches_2000,'color','g','linewidth',1.5)
% % caption = sprintf('F_z_{12_{4000rpm}} = a(RPM) * e^{b(RPM)*Z/R} + F_{OCE}(RPM)');
% % gtext(caption, 'FontSize', 11, 'Color', 'k');
% % caption = sprintf('F_z_{12_{2000rpm}} = a(RPM) * e^{b(RPM)*Z/R} + F_{OCE}(RPM)');
% % gtext(caption, 'FontSize', 11, 'Color', 'k');
% xlabel('Z/R [-]')
% ylabel('F_z [N]')
% title('Ceiling effect for 12"x5" at 4000RPM 0 m and 20\circ C')
% legend('Datapoints','ExpRegression','CheesemanBennett','Model$_{Iris}$','interpreter','latex')


% figure()
% hold on;grid on;
% RPM = [0:500:4000];
% y = b_poly_12(RPM);
% yy = a_poly_12(RPM);
% plot(RPM,yy,'o','color','r')
% plot(RPM,y,'o','color','b')
% xlabel('RPM [rev/min]')
% ylabel('Coefficient value [-]')
% legend('$a_{12"}$', '$b_{12"}$','interpreter','latex')

% Fz 10" all 4 levels D/R // Regression exp // Cheeseman&Bennett
% rpm_10inches = [4800,4000,3540,2000]';
Fice_10inches_4000 = (a_poly_10(rpm_10inches(2)))*exp(b_poly_10(rpm_10inches(2))*Z_R_12) + populationExp10inch(rpm_10inches(2));
Fice_10inches_2000 = (a_poly_10(rpm_10inches(4)))*exp(b_poly_10(rpm_10inches(4))*Z_R_12) + populationExp10inch(rpm_10inches(4));
Fice_10inches_4890 = (a_poly_10(rpm_10inches(1)))*exp(b_poly_10(rpm_10inches(1))*Z_R_12) + populationExp10inch(rpm_10inches(1));
Fice_10inches_3540 = (a_poly_10(rpm_10inches(3)))*exp(b_poly_10(rpm_10inches(3))*Z_R_12) + populationExp10inch(rpm_10inches(3));
% figure()
% hold on
% plot((D_R)./(R_10*100),F_10_Fz2,'x','color','k','lineWidth',2)
% plot(fit_10xFz2,fit_10yFz2,'r--');
% plot(x10_cheeseFz2,y10_cheeseFz2,'k--');
% plot(Z_R_12, Fice_10inches_4890,'color','g','linewidth',1.5)
% plot((D_R)./(R_10*100),F_10_RPM2,'x','color','k','lineWidth',2)
% plot(fit_10xrpm2,fit_10yrpm2,'r--');
% plot(x10_cheeserpm2,y10_cheeserpm2,'k--');
% plot(Z_R_12, Fice_10inches_4000,'color','g','linewidth',1.5)
% plot((D_R)./(R_10*100),F_10_Fz1,'x','color','k','lineWidth',2)
% plot(fit_10xFz1,fit_10yFz1,'r--');
% plot(x10_cheeseFz1,y10_cheeseFz1,'k--');
% plot(Z_R_12, Fice_10inches_3540,'color','g','linewidth',1.5)
% plot((D_R)./(R_10*100),F_10_RPM1,'x','color','k','lineWidth',2)
% plot(fit_10xrpm1,fit_10yrpm1,'r--');
% plot(x10_cheeserpm1,y10_cheeserpm1,'k--');
% plot(Z_R_12, Fice_10inches_2000,'color','g','linewidth',1.5)
% hold off
% legend('Datapoints','Exponential regression','CheesemanBennett','Model$_{Iris}$','Location','NorthWest');
% grid on
% xlabel('D/R [-]')
% ylabel('Fz 10"x4.7" [-]')
% % xlim([0 10])
% % ylim([15 20])
% title('Ceiling effect at 20ºC and 200 m ASL')
% caption = sprintf('F_z_{10_{12.8N}} = %f * e^{%f*Z/R} + %f', a_poly_10(rpm_10inches(1)),b_poly_10(rpm_10inches(1)),populationExp10inch(rpm_10inches(1)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{10_{4000RPM}} = %f * e^{%f*Z/R} + %f', a_poly_10(rpm_10inches(2)),b_poly_10(rpm_10inches(2)),populationExp10inch(rpm_10inches(2)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{10_{6.5N}} = %f * e^{%f*Z/R} + %f', a_poly_10(rpm_10inches(3)),b_poly_10(rpm_10inches(3)),populationExp10inch(rpm_10inches(3)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{10_{2000RPM}} = %f * e^{%f*Z/R} + %f', a_poly_10(rpm_10inches(4)),b_poly_10(rpm_10inches(4)),populationExp10inch(rpm_10inches(4)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');



% Fz 12" all 4 levels D/R // Regression exp // Cheeseman&Bennett
Fice_12inches_4000 = (a_poly_12(rpm_12inches(1)))*exp(b_poly_12(rpm_12inches(1))*Z_R_12) + populationExp12inch(rpm_12inches(1));
Fice_12inches_2000 = (a_poly_12(rpm_12inches(4)))*exp(b_poly_12(rpm_12inches(4))*Z_R_12) + populationExp12inch(rpm_12inches(4));
Fice_12inches_3700 = (a_poly_12(rpm_12inches(2)))*exp(b_poly_12(rpm_12inches(2))*Z_R_12) + populationExp12inch(rpm_12inches(2));
Fice_12inches_2591 = (a_poly_12(rpm_12inches(3)))*exp(b_poly_12(rpm_12inches(3))*Z_R_12) + populationExp12inch(rpm_12inches(3));
figure()
hold on
plot((D_R)./(R_12*100),F_12_RPM2,'x','color','k','lineWidth',2)
plot(fit_12xrpm2,fit_12yrpm2,'r--');
plot(x12_cheeserpm2,y12_cheeserpm2,'k--');
plot(Z_R_12, Fice_12inches_4000,'color','g','linewidth',1.5)
plot((D_R)./(R_12*100),F_12_Fz2,'x','color','k','lineWidth',2)
plot(fit_12xFz2,fit_12yFz2,'r--');
plot(x12_cheeseFz2,y12_cheeseFz2,'k--');
plot(Z_R_12, Fice_12inches_3700,'color','g','linewidth',1.5)
plot((D_R)./(R_12*100),F_12_Fz1,'x','color','k','lineWidth',2)
plot(fit_12xFz1,fit_12yFz1,'r--');
plot(x12_cheeseFz1,y12_cheeseFz1,'k--');
plot(Z_R_12, Fice_12inches_2591,'color','g','linewidth',1.5)
plot((D_R)./(R_12*100),F_12_RPM1,'x','color','k','lineWidth',2)
plot(fit_12xrpm1,fit_12yrpm1,'r--');
plot(x12_cheeserpm1,y12_cheeserpm1,'k--');
plot(Z_R_12, Fice_12inches_2000,'color','g','linewidth',1.5)
hold off
legend('Datapoints','Exponential regression','CheesemanBennett','Model$_{Iris}$','Location','NorthWest');
grid on
xlabel('D/R [-]')
ylabel('Fz 12"x5" [-]')
% xlim([0 10])
% ylim([15 20])
title('Ceiling effect at 20ºC and 200 m ASL')
% caption = sprintf('F_z_{12_{4000RPM}} = %f * e^{%f*Z/R} + %f', a_poly_12(rpm_12inches(1)),b_poly_12(rpm_12inches(1)),populationExp12inch(rpm_12inches(1)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{12_{12.8N}} = %f * e^{%f*Z/R} + %f', a_poly_12(rpm_12inches(2)),b_poly_12(rpm_12inches(2)),populationExp12inch(rpm_12inches(2)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{12_{6.5N}} = %f * e^{%f*Z/R} + %f', a_poly_12(rpm_12inches(3)),b_poly_12(rpm_12inches(3)),populationExp12inch(rpm_12inches(3)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z_{12_{2000RPM}} = %f * e^{%f*Z/R} + %f', a_poly_12(rpm_12inches(4)),b_poly_12(rpm_12inches(4)),populationExp12inch(rpm_12inches(4)));
% gtext(caption, 'FontSize', 12, 'Color', 'k');


% a and b comparison
figure()
hold on;grid on;
RPM_2 = [0:500:5000];
y = b_poly_12(RPM_2);
yy = a_poly_12(RPM_2);
z = b_poly_10(RPM_2);
zz = a_poly_10(RPM_2);
plot(RPM_2,yy,'o','color','r','linewidth',2)
plot(RPM_2,y,'o','color','b','linewidth',2)
plot(RPM_2,zz,'o','color','m','linewidth',2)
plot(RPM_2,z,'o','color','g','linewidth',2)
xlabel('RPM [rev/min]')
ylabel('Coefficient value [-]')
legend('$a_{12"}$', '$b_{12"}$','$a_{10"}$', '$b_{10"}$','fontsize',14,'interpreter','latex')

% Foce comparison
figure()
hold on;grid on;
RPM_2 = [0:500:5000];
y = populationExp12inch(RPM_2);
yy = populationExp10inch(RPM_2);
plot(RPM_2,y,'o','color','r','linewidth',2)
plot(RPM_2,yy,'o','color','b','linewidth',2)
xlabel('RPM [rev/min]')
ylabel('F_{OCE}','fontsize',14)
legend('$F_{OCE12"}$', '$F_{OCE10"}$','fontsize',14,'interpreter','latex')

% RPM = 1000;
% Fice_12inches_1000 = (a_poly_12(RPM))*exp(populationExp12inch_2000rpm1.b*Z_R) + populationExp12inch.p1*RPM^2 + populationExp12inch.p2*RPM + populationExp12inch.p3;
% RPM = 3000;
% Fice_12inches_3000 = (a_poly_12(RPM))*exp(populationExp12inch_2000rpm1.b*Z_R) + populationExp12inch.p1*RPM^2 + populationExp12inch.p2*RPM + populationExp12inch.p3;
% RPM = 5000;
% Fice_12inches_5000 = (a_poly_12(RPM))*exp(populationExp12inch_2000rpm1.b*Z_R) + populationExp12inch.p1*RPM^2 + populationExp12inch.p2*RPM + populationExp12inch.p3;
% RPM = 500;
% Fice_12inches_500 = (a_poly_12(RPM))*exp(populationExp12inch_2000rpm1.b*Z_R) + populationExp12inch.p1*RPM^2 + populationExp12inch.p2*RPM + populationExp12inch.p3;
% figure()
% hold on;grid on;
% plot(Z_R, Fice_12inches_5000,'linewidth',1.5)
% plot(Z_R, Fice_12inches_4000,'linewidth',1.5)
% plot(Z_R, Fice_12inches_3000,'linewidth',1.5)
% plot(Z_R, Fice_12inches_2000,'linewidth',1.5)
% plot(Z_R, Fice_12inches_1000,'linewidth',1.5)
% plot(Z_R, Fice_12inches_500,'linewidth',1.5)
% xlabel('Z/R [-]')
% ylabel('F_z [N]')
% legend('5000 RPM','4000 RPM','3000 RPM','2000 RPM','1000 RPM','500 RPM')

load F_OCE_ceiling

% Ceiling effect model
radius = 12;
Z_R_12 = [(D_R)/(R_12*100):0.01:10]';
Z_R_10 = [(D_R)/(R_10*100):0.01:10]';
RPM_2 = 4000;
RPM_1 = 2000;
F_oce12_rpm2 = p1_regr(12).*RPM_2.^2 + p2_regr(12).*RPM_2 + p3_regr(12);
F_oce10_rpm2 = p1_regr(10).*RPM_2.^2 + p2_regr(10).*RPM_2 + p3_regr(10);
F_oce12_rpm1 = p1_regr(12).*RPM_1.^2 + p2_regr(12).*RPM_1 + p3_regr(12);
F_oce10_rpm1 = p1_regr(10).*RPM_1.^2 + p2_regr(10).*RPM_1 + p3_regr(10);
F_ceiling12_rpm2 = a_poly_12(RPM_2).*exp(b_poly_12(RPM_2).*Z_R_12) + F_oce12_rpm2;
F_ceiling10_rpm2 = a_poly_10(RPM_2).*exp(b_poly_10(RPM_2).*Z_R_10) + F_oce10_rpm2;
F_ceiling12_rpm1 = a_poly_12(RPM_1).*exp(b_poly_12(RPM_1).*Z_R_12) + F_oce12_rpm1;
F_ceiling10_rpm1 = a_poly_10(RPM_1).*exp(b_poly_10(RPM_1).*Z_R_10) + F_oce10_rpm1;

% 
% figure()
% hold on;grid on;
% plot((D_R)./(R_12*100),F_12_RPM2,'x','color','k','lineWidth',2)
% plot(fit_12xrpm2,fit_12yrpm2,'r--');
% plot(x12_cheeserpm2,y12_cheeserpm2,'k--');
% plot(Z_R, F_ceiling12,'g','LineWidth',1.5)
% legend('Datapoints', 'Regression', 'Cheeseman', 'Model$_{Iris}$')
% xlabel('Z/R [-]')
% ylabel('F_{Ceiling} [N]')
% title('12"x5" @ 4000 RPM, 20\circ C and 260 m')

figure()
hold on;grid on;
plot((D_R)./(R_10*100),F_10_RPM2,'x','color','k','lineWidth',2)
plot(fit_10xrpm2,fit_10yrpm2,'r--','lineWidth',1.5);
plot(x10_cheeserpm2,y10_cheeserpm2,'k--');
plot(Z_R_10, F_ceiling10_rpm2,'g','LineWidth',1.5)
plot((D_R)./(R_12*100),F_12_RPM2,'x','color','k','lineWidth',2)
plot(fit_12xrpm2,fit_12yrpm2,'r--','lineWidth',1.5);
plot(x12_cheeserpm2,y12_cheeserpm2,'k--');
plot(Z_R_12, F_ceiling12_rpm2,'g','LineWidth',1.5)
legend('Datapoints', 'Regression', 'Cheeseman', 'Model$_{Iris}$')
xlabel('Z/R [-]')
ylabel('F_{Ceiling} [N]')
title('4000 RPM, 20\circ C and 260 m')
% caption = sprintf('F_z 12"x5"');
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z 10"x4.7"');
% gtext(caption, 'FontSize', 12, 'Color', 'k');

figure()
hold on;grid on;
plot((D_R)./(R_10*100),F_10_RPM1,'x','color','k','lineWidth',2)
plot(fit_10xrpm1,fit_10yrpm1,'r--','lineWidth',1.5);
plot(x10_cheeserpm1,y10_cheeserpm1,'k--');
plot(Z_R_10, F_ceiling10_rpm1,'g','LineWidth',1.5)
plot((D_R)./(R_12*100),F_12_RPM1,'x','color','k','lineWidth',2)
plot(fit_12xrpm1,fit_12yrpm1,'r--','lineWidth',1.5);
plot(x12_cheeserpm1,y12_cheeserpm1,'k--');
plot(Z_R_12, F_ceiling12_rpm1,'g','LineWidth',1.5)
legend('Datapoints', 'Regression', 'Cheeseman', 'Model$_{Iris}$')
xlabel('Z/R [-]')
ylabel('F_{Ceiling} [N]')
title('2000 RPM, 20\circ C and 260 m')
% caption = sprintf('F_z 12"x5"');
% gtext(caption, 'FontSize', 12, 'Color', 'k');
% caption = sprintf('F_z 10"x4.7"');
% gtext(caption, 'FontSize', 12, 'Color', 'k');


% normalized root mean squared error (NRMSE) 
cost_func = 'MSE';
%4000 rpm
fit_cheeseman10 = goodnessOfFit(y10_cheeserpm2',fit_10yrpm2,cost_func)
fit_model10 = goodnessOfFit(F_ceiling10_rpm2,fit_10yrpm2,cost_func)
fit_cheeseman12 = goodnessOfFit(y12_cheeserpm2',fit_12yrpm2,cost_func)
fit_model12 = goodnessOfFit(F_ceiling12_rpm2,fit_12yrpm2,cost_func)

%2000 rpm
fit_cheeseman10 = goodnessOfFit(y10_cheeserpm1',fit_10yrpm1,cost_func)
fit_model10 = goodnessOfFit(F_ceiling10_rpm1,fit_10yrpm1,cost_func)
fit_cheeseman12 = goodnessOfFit(y12_cheeserpm1',fit_12yrpm1,cost_func)
fit_model12 = goodnessOfFit(F_ceiling12_rpm1,fit_12yrpm1,cost_func)

%}