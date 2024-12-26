clear variables;close all;
load('Files_in_matfiles.mat');

for file_n = 69:length(files_in_folder{1,1}(:))

    clearvars -except files_in_folder file_n
%     close all

    % This file averages TWO equivalent data logs

    %%%% For extended files containing voltages and time vector
    ft_path  = '../LogFiles/Used_data/FT/';
    rpm_path = '../LogFiles/Used_data/RPM/';
    filename = files_in_folder{1,1}(file_n).name;
    motherfile = strcat('../LogFiles/matfiles/',filename);%'../LogFiles/matfiles/log_20231018_10inch_R125_0deg.mat';
    aaa = load(motherfile);

    file1 = aaa.result.files{1,1};
    file2 = aaa.result.files{1,2};
    file3 = aaa.result.files{1,3};
    file4 = aaa.result.files{1,4};

    % file1 = 'log_20231018_10inch_R3_test2_270deg.csv';
    % file2 = 'log_20231018_10inch_R3_test3_270deg.csv';
    % file3 = 'log_20231018_10inch_R3_test4_270deg.csv';
    % file4 = 'log_20231018_10inch_R3_test5_270deg.csv';

    % file1 = 'log_2023102513inch_Rinf_test6.csv';
    % file2 = 'log_2023102513inch_Rinf_test7.csv';
    % file3 = 'log_2023102513inch_Rinf_test8.csv';
    % file4 = 'log_2023102513inch_Rinf_test9.csv';

    % filename = "log_20231025_13inch_Rinf.mat";
    % filename = "log_20231018_10inch_R3_270deg.mat";

    % save_file = strcat('../LogFiles/matfiles/',filename);
    save_file = motherfile;
    title_size = 6;
    points_to_avg = 100;

    filepath1 = strcat(ft_path,file1);
    filepath2 = strcat(ft_path,file2);
    filepath3 = strcat(ft_path,file3);
    filepath4 = strcat(ft_path,file4);

    filepath1_rpm = strcat(rpm_path,file1);
    filepath2_rpm = strcat(rpm_path,file2);
    filepath3_rpm = strcat(rpm_path,file3);
    filepath4_rpm = strcat(rpm_path,file4);

    test1 = readtable(filepath1);
    test2 = readtable(filepath2);
    test3 = readtable(filepath3);
    test4 = readtable(filepath4);

    sampl_f1 = test1{1,1};                                                      % Sampling frequency of the signal
    sampl_f2 = test2{1,1};                                                      % Sampling frequency of the signal
    sampl_f3 = test3{1,1};                                                      % Sampling frequency of the signal
    sampl_f4 = test4{1,1};                                                      % Sampling frequency of the signal
    Ts1 = 1/sampl_f1;
    Ts2 = 1/sampl_f2;
    Ts3 = 1/sampl_f3;
    Ts4 = 1/sampl_f4;



    step_dur_insecs = 15;                                                       % Step duration in seconds (as specified in the arduino file)
    aver_points = 0.7;                                                          % Percentage of each step to be taken for average
    step_duration = step_dur_insecs/Ts1;                                        % Actual number of data points that make a step
    segment_points = aver_points*step_duration;                                 % Number of points used for aveaging
    offset_points  = 250;                                                       % points to be ignored from last step backward
    steps_per_stair = 6;                                                        % How many steps is each stair


    offset    = 1000;  % 3000 is 20s (offset*Ts = seconds)
    fx_column = 1;
    fy_column = 2;
    fz_column = 3;
    mx_column = 4;
    my_column = 5;
    mz_column = 6;

    time1 = 0*Ts1:Ts1:Ts1*(length(test1{:,2})-2);
    time2 = 0*Ts2:Ts2:Ts2*(length(test2{:,2})-2);
    time3 = 0*Ts3:Ts3:Ts3*(length(test3{:,2})-2);
    time4 = 0*Ts4:Ts4:Ts4*(length(test4{:,2})-2);

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
    Fx3 = (test3{2:end,fx_column});
    Fy3 = (test3{2:end,fy_column});
    Fz3 = (test3{2:end,fz_column});
    Mx3 = (test3{2:end,mx_column});
    My3 = (test3{2:end,my_column});
    Mz3 = (test3{2:end,mz_column});
    Fx4 = (test4{2:end,fx_column});
    Fy4 = (test4{2:end,fy_column});
    Fz4 = (test4{2:end,fz_column});
    Mx4 = (test4{2:end,mx_column});
    My4 = (test4{2:end,my_column});
    Mz4 = (test4{2:end,mz_column});


    %% FFT and filtering

    wpass_fx = 0.5;
    wpass_fy = 0.5;
    wpass_fz = 0.2;
    wpass_mx = 0.5;
    wpass_my = 0.5;
    wpass_mz = 0.5;

    f_cutoff = 0.5;
    f_sampling = sampl_f1;
    w_n = f_cutoff/(f_sampling/2);  % Cutoff frequency

    [b_5,a_5] = butter(5,w_n,'low');   % Create Butterworth filter of order 5


    filtered_Fx1 = filter(b_5, a_5,Fx1);
    filtered_Fy1 = filter(b_5, a_5,Fy1);
    filtered_Fz1 = filter(b_5, a_5,Fz1);
    filtered_Mx1 = filter(b_5, a_5,Mx1);
    filtered_My1 = filter(b_5, a_5,My1);
    filtered_Mz1 = filter(b_5, a_5,Mz1);

    filtered_Fx2 = filter(b_5, a_5,Fx2);
    filtered_Fy2 = filter(b_5, a_5,Fy2);
    filtered_Fz2 = filter(b_5, a_5,Fz2);
    filtered_Mx2 = filter(b_5, a_5,Mx2);
    filtered_My2 = filter(b_5, a_5,My2);
    filtered_Mz2 = filter(b_5, a_5,Mz2);

    filtered_Fx3 = filter(b_5, a_5,Fx3);
    filtered_Fy3 = filter(b_5, a_5,Fy3);
    filtered_Fz3 = filter(b_5, a_5,Fz3);
    filtered_Mx3 = filter(b_5, a_5,Mx3);
    filtered_My3 = filter(b_5, a_5,My3);
    filtered_Mz3 = filter(b_5, a_5,Mz3);

    filtered_Fx4 = filter(b_5, a_5,Fx4);
    filtered_Fy4 = filter(b_5, a_5,Fy4);
    filtered_Fz4 = filter(b_5, a_5,Fz4);
    filtered_Mx4 = filter(b_5, a_5,Mx4);
    filtered_My4 = filter(b_5, a_5,My4);
    filtered_Mz4 = filter(b_5, a_5,Mz4);


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

    filtered_Fx3 = filtered_Fx3(1:end) - filtered_Fx3(offset);
    filtered_Fy3 = filtered_Fy3(1:end) - filtered_Fy3(offset);
    filtered_Fz3 = filtered_Fz3(1:end) - filtered_Fz3(offset);
    filtered_Mx3 = filtered_Mx3(1:end) - filtered_Mx3(offset);
    filtered_My3 = filtered_My3(1:end) - filtered_My3(offset);
    filtered_Mz3 = filtered_Mz3(1:end) - filtered_Mz3(offset);

    filtered_Fx4 = filtered_Fx4(1:end) - filtered_Fx4(offset);
    filtered_Fy4 = filtered_Fy4(1:end) - filtered_Fy4(offset);
    filtered_Fz4 = filtered_Fz4(1:end) - filtered_Fz4(offset);
    filtered_Mx4 = filtered_Mx4(1:end) - filtered_Mx4(offset);
    filtered_My4 = filtered_My4(1:end) - filtered_My4(offset);
    filtered_Mz4 = filtered_Mz4(1:end) - filtered_Mz4(offset);

    rpm1  = readtable(filepath1_rpm);
    rpm2  = readtable(filepath2_rpm);
    rpm3  = readtable(filepath3_rpm);
    rpm4  = readtable(filepath4_rpm);

    temp1 = test1{1,4};                                                         % Temperature
    temp2 = test2{1,4};
    temp3 = test3{1,4};
    temp4 = test4{1,4};
    avg_temp = mean([temp1,temp2,temp3,temp4]);
    pres1 = test1{1,5};                                                         % Pressure
    pres2 = test2{1,5};
    pres3 = test3{1,5};
    pres4 = test4{1,5};
    avg_pres = mean([pres1,pres2,pres3,pres4]);

    %%%% Data without base offsets (Check point that everything is fine)

    % FORCES
    %{
figure()
subplot(3,1,1)
hold on
title(strcat(file1,' ---vs--- ',file2),'FontSize',title_size,'Interpreter','none')
plot(time1,filtered_Fx1,'linewidth',1.5)
plot(time2,filtered_Fx2,'linewidth',1.5)
plot(time3,filtered_Fx3,'linewidth',1.5)
plot(time4,filtered_Fx4,'linewidth',1.5)
ylim([-3 3])
grid on
ylabel('Fx [N]')
subplot(3,1,2)
hold on
plot(time1,filtered_Fy1,'linewidth',1.5)
plot(time2,filtered_Fy2,'linewidth',1.5)
plot(time3,filtered_Fy3,'linewidth',1.5)
plot(time4,filtered_Fy4,'linewidth',1.5)
ylim([-3 3])
grid on
ylabel('Fy [N]')
subplot(3,1,3)
hold on
plot(time1,filtered_Fz1,'linewidth',1.5)
plot(time2,filtered_Fz2,'linewidth',1.5)
plot(time3,filtered_Fz3,'linewidth',1.5)
plot(time4,filtered_Fz4,'linewidth',1.5)
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
plot(time3,filtered_Mx3,'linewidth',1.5)
plot(time4,filtered_Mx4,'linewidth',1.5)
ylim([-0.1 0.15])
grid on
ylabel('Mx [N·m]')
subplot(3,1,2)
hold on
plot(time1,filtered_My1,'linewidth',1.5)
plot(time2,filtered_My2,'linewidth',1.5)
plot(time3,filtered_My3,'linewidth',1.5)
plot(time4,filtered_My4,'linewidth',1.5)
ylim([-0.1 0.15])
grid on
ylabel('My [N·m]')
subplot(3,1,3)
hold on
plot(time1,filtered_Mz1,'linewidth',1.5)
plot(time2,filtered_Mz2,'linewidth',1.5)
plot(time3,filtered_Mz3,'linewidth',1.5)
plot(time4,filtered_Mz4,'linewidth',1.5)
ylim([-0.1 0.15])
grid on
ylabel('Mz [N·m]')
xlabel('Time [s]')
grid on

figure()
subplot(4,1,1)
hold on;grid on;
plot(rpm1{:,1}/2)
plot(rpm1{:,2}/2)
plot(rpm1{:,3}/2)
plot(rpm1{:,4}/2)
subplot(4,1,2)
hold on;grid on;
plot(rpm2{:,1}/2)
plot(rpm2{:,2}/2)
plot(rpm2{:,3}/2)
plot(rpm2{:,4}/2)
subplot(4,1,3)
hold on;grid on;
plot(rpm3{:,1}/2)
plot(rpm3{:,2}/2)
plot(rpm3{:,3}/2)
plot(rpm3{:,4}/2)
subplot(4,1,4)
hold on;grid on;
plot(rpm4{:,1}/2)
plot(rpm4{:,2}/2)
plot(rpm4{:,3}/2)
plot(rpm4{:,4}/2)
xlabel('Time [s]')
ylabel('RPM')
    %}

    %% %%% Automatic point selection for multiple files

    Fx1 = filtered_Fx1;
    Fx2 = filtered_Fx2;
    Fx3 = filtered_Fx3;
    Fx4 = filtered_Fx4;
    Fy1 = filtered_Fy1;
    Fy2 = filtered_Fy2;
    Fy3 = filtered_Fy3;
    Fy4 = filtered_Fy4;
    Mx1 = filtered_Mx1;
    Mx2 = filtered_Mx2;
    Mx3 = filtered_Mx3;
    Mx4 = filtered_Mx4;
    My1 = filtered_My1;
    My2 = filtered_My2;
    My3 = filtered_My3;
    My4 = filtered_My4;
    Mz1 = filtered_Mz1;
    Mz2 = filtered_Mz2;
    Mz3 = filtered_Mz3;
    Mz4 = filtered_Mz4;
    ti1 = time1;
    ti2 = time2;
    ti3 = time3;
    ti4 = time4;


    Fz1 = filtered_Fz1;
    Fz2 = filtered_Fz2;
    Fz3 = filtered_Fz3;
    Fz4 = filtered_Fz4;

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

    std_uncert1  = [];
    std_uncert2  = [];
    std_uncert3  = [];
    std_uncert4  = [];

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

    %{
figure()
title('Check that derivative selection is right')
hold on;grid on;
plot(time2/Ts1, filtered_Fz2,'linewidth',2)
plot(time2/Ts1, diff2)
legend('Filtered data', 'Derivative')
xlabel('Datapoints')
ylabel('Data value')
    %}

    % [~,C1] = maxk(abs(diff1),10);                                               % get the 10 maximum values in the gradient
    % [~,C2] = maxk(abs(diff2),10);
    % [~,C3] = maxk(abs(diff3),10);
    % [~,C4] = maxk(abs(diff4),10);
    [A1,C1] = find(abs(diff1)>8);                                               % get the 10 maximum values in the gradient
    [A2,C2] = find(abs(diff2)>8);
    [A3,C3] = find(abs(diff3)>8);
    [A4,C4] = find(abs(diff4)>8);

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

    while length(timestamp1)>26
        timestamp1 = timestamp1(3:end);
    end
    while length(timestamp2)>26
        timestamp2 = timestamp2(3:end);
    end
    while length(timestamp3)>26
        timestamp3 = timestamp3(3:end);
    end
    while length(timestamp4)>26
        timestamp4 = timestamp4(3:end);
    end


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
        std_uncert1 = [std_uncert1; 2*std([F_z_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)])/sqrt(length([F_z_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)]))];
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
        std_uncert2 = [std_uncert2; 2*std([F_z_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)])/sqrt(length([F_z_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)]))];
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
        std_uncert3 = [std_uncert3; 2*std([F_z_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)])/sqrt(length([F_z_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)]))];
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
        std_uncert4 = [std_uncert4; 2*std([F_z_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)])/sqrt(length([F_z_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)]))];
    end


    while length(Force_z1_off)<=11
        Force_z1_off = [0;Force_z1_off];
        timing1  = [points_to_avg+1;timing1];
        std_uncert1 = [0;std_uncert1];
    end
    while length(Force_z2_off)<=11
        Force_z2_off = [0;Force_z2_off];
        timing2  = [points_to_avg+1;timing2];
        std_uncert2 = [0;std_uncert2];
    end
    while length(Force_z3_off)<=11
        Force_z3_off = [0;Force_z3_off];
        timing3  = [points_to_avg+1;timing3];
        std_uncert3 = [0;std_uncert3];
    end
    while length(Force_z4_off)<=11
        Force_z4_off = [0;Force_z4_off];
        timing4  = [points_to_avg+1;timing4];
        std_uncert4 = [0;std_uncert4];
    end

    F_z1_off = Force_z1_off;
    F_z2_off = Force_z2_off;
    F_z3_off = Force_z3_off;
    F_z4_off = Force_z4_off;

    i=1;
    while length(F_z1_off)<=12
        F_z1_off = [0;F_z1_off];
        std_uncert1 = [0;std_uncert1];
    end
    while length(F_z2_off)<=12
        F_z2_off = [0;F_z2_off];
        std_uncert2 = [0;std_uncert2];
    end
    while length(F_z3_off)<=12
        F_z3_off = [0;F_z3_off];
        std_uncert3 = [0;std_uncert3];
    end
    while length(F_z4_off)<=12
        F_z4_off = [0;F_z4_off];
        std_uncert4 = [0;std_uncert4];
    end

    while length(F_z1_off)>13
        F_z1_off = F_z1_off(2:end);
        std_uncert1(i) = std_uncert1(2:end);
    end
    while length(F_z2_off)>13
        F_z2_off = F_z2_off(2:end);
        std_uncert2(i) = std_uncert2(2:end);
    end
    while length(F_z3_off)>13
        F_z3_off = F_z3_off(2:end);
        std_uncert3(i) = std_uncert3(2:end);
    end
    while length(F_z4_off)>13
        F_z4_off = F_z4_off(2:end);
        std_uncert4(i) = std_uncert4(2:end);
    end

    u_Fz1 = std_uncert1;
    u_Fz2 = std_uncert2;
    u_Fz3 = std_uncert3;
    u_Fz4 = std_uncert4;

    %%%%% Fx. Force %%%%%
    Force_x1 = [];
    Force_x2 = [];
    Force_x3 = [];
    Force_x4 = [];
    Force_x1_off = [];
    Force_x2_off = [];
    Force_x3_off = [];
    Force_x4_off = [];
    std_uncert1  = [];
    std_uncert2  = [];
    std_uncert3  = [];
    std_uncert4  = [];

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
        std_uncert1 = [std_uncert1; 2*std([F_x1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)])/sqrt(length([F_x1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)]))];
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
        std_uncert2 = [std_uncert2; 2*std([F_x2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)])/sqrt(length([F_x2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)]))];
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
        std_uncert3 = [std_uncert3; 2*std([F_x3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)])/sqrt(length([F_x3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)]))];
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
        std_uncert4 = [std_uncert4; 2*std([F_x4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)])/sqrt(length([F_x4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)]))];
    end


    while length(Force_x1_off)<=12
        Force_x1_off = [0;Force_x1_off];
        std_uncert1 = [0;std_uncert1];
    end
    while length(Force_x2_off)<=12
        Force_x2_off = [0;Force_x2_off];
        std_uncert2 = [0;std_uncert2];
    end
    while length(Force_x3_off)<=12
        Force_x3_off = [0;Force_x3_off];
        std_uncert3 = [0;std_uncert3];
    end
    while length(Force_x4_off)<=12
        Force_x4_off = [0;Force_x4_off];
        std_uncert4 = [0;std_uncert4];
    end

    while length(Force_x1_off)>13
        Force_x1_off = Force_x1_off(2:end);
        std_uncert1 = std_uncert1(2:end);
    end
    while length(Force_x2_off)>13
        Force_x2_off = Force_x2_off(2:end);
        std_uncert2 = std_uncert2(2:end);
    end
    while length(Force_x3_off)>13
        Force_x3_off = Force_x3_off(2:end);
        std_uncert3 = std_uncert3(2:end);
    end
    while length(Force_x4_off)>13
        Force_x4_off = Force_x4_off(2:end);
        std_uncert4 = std_uncert4(2:end);
    end

    u_Fx1 = std_uncert1;
    u_Fx2 = std_uncert2;
    u_Fx3 = std_uncert3;
    u_Fx4 = std_uncert4;


    %%%%% Fy. Force %%%%%
    Force_y1 = [];
    Force_y2 = [];
    Force_y3 = [];
    Force_y4 = [];
    Force_y1_off = [];
    Force_y2_off = [];
    Force_y3_off = [];
    Force_y4_off = [];
    std_uncert1  = [];
    std_uncert2  = [];
    std_uncert3  = [];
    std_uncert4  = [];

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
        std_uncert1 = [std_uncert1; 2*std([F_y1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)])/sqrt(length([F_y1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)]))];
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
        std_uncert2 = [std_uncert2; 2*std([F_y2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)])/sqrt(length([F_y2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)]))];
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
        std_uncert3 = [std_uncert3; 2*std([F_y3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)])/sqrt(length([F_y3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)]))];
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
        std_uncert4 = [std_uncert4; 2*std([F_y4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)])/sqrt(length([F_y4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)]))];
    end



    while length(Force_y1_off)<=12
        Force_y1_off = [0;Force_y1_off];
        std_uncert1 = [0;std_uncert1];
    end
    while length(Force_y2_off)<=12
        Force_y2_off = [0;Force_y2_off];
        std_uncert2 = [0;std_uncert2];
    end
    while length(Force_y3_off)<=12
        Force_y3_off = [0;Force_y3_off];
        std_uncert3 = [0;std_uncert3];
    end
    while length(Force_y4_off)<=12
        Force_y4_off = [0;Force_y4_off];
        std_uncert4 = [0;std_uncert4];
    end

    while length(Force_y1_off)>13
        Force_y1_off = Force_y1_off(2:end);
        std_uncert1 = std_uncert1(2:end);
    end
    while length(Force_y2_off)>13
        Force_y2_off = Force_y2_off(2:end);
        std_uncert2 = std_uncert2(2:end);
    end
    while length(Force_y3_off)>13
        Force_y3_off = Force_y3_off(2:end);
        std_uncert3 = std_uncert3(2:end);
    end
    while length(Force_y4_off)>13
        Force_y4_off = Force_y4_off(2:end);
        std_uncert4 = std_uncert4(2:end);
    end

    u_Fy1 = std_uncert1;
    u_Fy2 = std_uncert2;
    u_Fy3 = std_uncert3;
    u_Fy4 = std_uncert4;

    %%%%% Torque x %%%%%
    Torquex1 = [];
    Torquex2 = [];
    Torquex3 = [];
    Torquex4 = [];
    Torque_x1_off = [];
    Torque_x2_off = [];
    Torque_x3_off = [];
    Torque_x4_off = [];
    std_uncert1  = [];
    std_uncert2  = [];
    std_uncert3  = [];
    std_uncert4  = [];

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
        std_uncert1 = [std_uncert1; 2*std([M_x_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)])/sqrt(length([M_x_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)]))];
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
        std_uncert2 = [std_uncert2; 2*std([M_x_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)])/sqrt(length([M_x_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)]))];
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
        std_uncert3 = [std_uncert3; 2*std([M_x_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)])/sqrt(length([M_x_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)]))];
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
        std_uncert4 = [std_uncert4; 2*std([M_x_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)])/sqrt(length([M_x_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)]))];
    end



    while length(Torque_x1_off)<=12
        Torque_x1_off = [0;Torque_x1_off];
        std_uncert1 = [0;std_uncert1];
    end
    while length(Torque_x2_off)<=12
        Torque_x2_off = [0;Torque_x2_off];
        std_uncert2 = [0;std_uncert2];
    end
    while length(Torque_x3_off)<=12
        Torque_x3_off = [0;Torque_x3_off];
        std_uncert3 = [0;std_uncert3];
    end
    while length(Torque_x4_off)<=12
        Torque_x4_off = [0;Torque_x4_off];
        std_uncert4 = [0;std_uncert4];
    end

    while length(Torque_x1_off)>13
        Torque_x1_off = Torque_x1_off(2:end);
        std_uncert1 = std_uncert1(2:end);
    end
    while length(Torque_x2_off)>13
        Torque_x2_off = Torque_x2_off(2:end);
        std_uncert2 = std_uncert2(2:end);
    end
    while length(Torque_x3_off)>13
        Torque_x3_off = Torque_x3_off(2:end);
        std_uncert3 = std_uncert3(2:end);
    end
    while length(Torque_x4_off)>13
        Torque_x4_off = Torque_x4_off(2:end);
        std_uncert4 = std_uncert4(2:end);
    end

    u_Mx1 = std_uncert1;
    u_Mx2 = std_uncert2;
    u_Mx3 = std_uncert3;
    u_Mx4 = std_uncert4;

    %%%%% Torque y %%%%%
    Torquey1 = [];
    Torquey2 = [];
    Torquey3 = [];
    Torquey4 = [];
    Torque_y1_off = [];
    Torque_y2_off = [];
    Torque_y3_off = [];
    Torque_y4_off = [];
    std_uncert1  = [];
    std_uncert2  = [];
    std_uncert3  = [];
    std_uncert4  = [];

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
        std_uncert1 = [std_uncert1; 2*std([M_y_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)])/sqrt(length([M_y_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)]))];
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
        std_uncert2 = [std_uncert2; 2*std([M_y_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)])/sqrt(length([M_y_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)]))];
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
        std_uncert3 = [std_uncert3; 2*std([M_y_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)])/sqrt(length([M_y_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)]))];
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
        std_uncert4 = [std_uncert4; 2*std([M_y_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)])/sqrt(length([M_y_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)]))];
    end



    while length(Torque_y1_off)<=12
        Torque_y1_off = [0;Torque_y1_off];
        std_uncert1 = [0;std_uncert1];
    end
    while length(Torque_y2_off)<=12
        Torque_y2_off = [0;Torque_y2_off];
        std_uncert2 = [0;std_uncert2];
    end
    while length(Torque_y3_off)<=12
        Torque_y3_off = [0;Torque_y3_off];
        std_uncert3 = [0;std_uncert3];
    end
    while length(Torque_y4_off)<=12
        Torque_y4_off = [0;Torque_y4_off];
        std_uncert4 = [0;std_uncert4];
    end

    while length(Torque_y1_off)>13
        Torque_y1_off = Torque_y1_off(2:end);
        std_uncert1 = std_uncert1(2:end);
    end
    while length(Torque_y2_off)>13
        Torque_y2_off = Torque_y2_off(2:end);
        std_uncert2 = std_uncert2(2:end);
    end
    while length(Torque_y3_off)>13
        Torque_y3_off = Torque_y3_off(2:end);
        std_uncert3 = std_uncert3(2:end);
    end
    while length(Torque_y4_off)>13
        Torque_y4_off = Torque_y4_off(2:end);
        std_uncert4 = std_uncert4(2:end);
    end


    u_My1 = std_uncert1;
    u_My2 = std_uncert2;
    u_My3 = std_uncert3;
    u_My4 = std_uncert4;


    %%%%% Torque z %%%%%
    Torquez1 = [];
    Torquez2 = [];
    Torquez3 = [];
    Torquez4 = [];
    Torque_z1_off = [];
    Torque_z2_off = [];
    Torque_z3_off = [];
    Torque_z4_off = [];
    std_uncert1  = [];
    std_uncert2  = [];
    std_uncert3  = [];
    std_uncert4  = [];

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
        std_uncert1 = [std_uncert1; 2*std([M_z_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)])/sqrt(length([M_z_1(timing1(i)-points_to_avg/2:timing1(i)+points_to_avg/2)]))];
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
        std_uncert2 = [std_uncert2; 2*std([M_z_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)])/sqrt(length([M_z_2(timing2(i)-points_to_avg/2:timing2(i)+points_to_avg/2)]))];
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
        std_uncert3 = [std_uncert3; 2*std([M_z_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)])/sqrt(length([M_z_3(timing3(i)-points_to_avg/2:timing3(i)+points_to_avg/2)]))];
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
        std_uncert4 = [std_uncert4; 2*std([M_z_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)])/sqrt(length([M_z_4(timing4(i)-points_to_avg/2:timing4(i)+points_to_avg/2)]))];
    end


    while length(Torque_z1_off)<=12
        Torque_z1_off = [0;Torque_z1_off];
        std_uncert1 = [0;std_uncert1];
    end
    while length(Torque_z2_off)<=12
        Torque_z2_off = [0;Torque_z2_off];
        std_uncert2 = [0;std_uncert2];
    end
    while length(Torque_z3_off)<=12
        Torque_z3_off = [0;Torque_z3_off];
        std_uncert3 = [0;std_uncert3];
    end
    while length(Torque_z4_off)<=12
        Torque_z4_off = [0;Torque_z4_off];
        std_uncert4 = [0;std_uncert4];
    end

    while length(Torque_z1_off)>13
        Torque_z1_off = Torque_z1_off(2:end);
        std_uncert1 = std_uncert1(2:end);
    end
    while length(Torque_z2_off)>13
        Torque_z2_off = Torque_z2_off(2:end);
        std_uncert2 = std_uncert2(2:end);
    end
    while length(Torque_z3_off)>13
        Torque_z3_off = Torque_z3_off(2:end);
        std_uncert3 = std_uncert3(2:end);
    end
    while length(Torque_z4_off)>13
        Torque_z4_off = Torque_z4_off(2:end);
        std_uncert4 = std_uncert4(2:end);
    end

    u_Mz1 = std_uncert1;
    u_Mz2 = std_uncert2;
    u_Mz3 = std_uncert3;
    u_Mz4 = std_uncert4;


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
    % figure()
    % hold on
    % plot(time1,diff1);
    % plot(time2,diff2);
    % plot(time3,diff3);
    % plot(time4,diff4);
    % plot(ti1,filtered_Fz1,'lineWidth',1.5)
    % plot(ti2,filtered_Fz2,'lineWidth',1.5)
    % plot(ti3,filtered_Fz3,'lineWidth',1.5)
    % plot(ti4,filtered_Fz4,'lineWidth',1.5)
    % plot(timestamp1*Ts1,ones(length(timestamp1),1),'x','lineWidth',2,'MarkerSize',8)
    % plot(timestamp2*Ts2,ones(length(timestamp2),1),'x','lineWidth',2,'MarkerSize',8)
    % plot(timestamp3*Ts3,ones(length(timestamp3),1),'x','lineWidth',2,'MarkerSize',8)
    % plot(timestamp4*Ts4,ones(length(timestamp4),1),'x','lineWidth',2,'MarkerSize',8)
    % grid on
    % plot(timing1*Ts1,Force_z1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
    % plot(timing2*Ts2,Force_z2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
    % plot(timing3*Ts3,Force_z3_off,'x','color','r','lineWidth',2,'MarkerSize',6)
    % plot(timing4*Ts4,Force_z4_off,'x','color','g','lineWidth',2,'MarkerSize',6)
    % ylabel('Fz no offsets [N] ')
    % legend("Data 1", "Data 2", "Data 3", "Data 4")
    % title("Interval selection and averaging")
    % xlabel('Time [s]')
    % hold off

    %{
figure()
hold on; grid on;
plot(ti1,filtered_Fy1,'lineWidth',1.5)
plot(ti2,filtered_Fy2,'lineWidth',1.5)
plot(ti3,filtered_Fy3,'lineWidth',1.5)
plot(ti4,filtered_Fy4,'lineWidth',1.5)
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
plot(ti1,filtered_Mx1,'lineWidth',1.5)
plot(ti2,filtered_Mx2,'lineWidth',1.5)
plot(ti3,filtered_Mx3,'lineWidth',1.5)
plot(ti4,filtered_Mx4,'lineWidth',1.5)
plot(timing1*Ts1,Torque_x1_off,'x','color','k','lineWidth',2,'MarkerSize',6)
plot(timing2*Ts2,Torque_x2_off,'x','color','b','lineWidth',2,'MarkerSize',6)
plot(timing3*Ts3,Torque_x3_off,'x','color','b','lineWidth',2,'MarkerSize',6)
plot(timing4*Ts4,Torque_x4_off,'x','color','b','lineWidth',2,'MarkerSize',6)
ylabel('Mx no offsets [Nm]')
legend("Data 1", "Data 2", "Data 3", "Data 4")
title("Interval selection and averaging")
xlabel('Time [s]')
hold off
    %}

    for i=1:length(rpm1{:,1})
        mytachs.rpm1(i) = mean([rpm1{i,1}/2,rpm1{i,2}/2,rpm1{i,3}/2,rpm1{i,4}/2]);
    end
    for i=1:length(rpm2{:,1})
        mytachs.rpm2(i) = mean([rpm2{i,1}/2,rpm2{i,2}/2,rpm2{i,3}/2,rpm2{i,4}/2]);
    end
    for i=1:length(rpm3{:,1})
        mytachs.rpm3(i) = mean([rpm3{i,1}/2,rpm3{i,2}/2,rpm3{i,3}/2,rpm3{i,4}/2]);
    end
    for i=1:length(rpm4{:,1})
        mytachs.rpm4(i) = mean([rpm4{i,1}/2,rpm4{i,2}/2,rpm4{i,3}/2,rpm4{i,4}/2]);
    end

    for i=1:length(rpm1{:,1})
        mytachs.rpm1(i) = mean([rpm1{i,1}/2,rpm1{i,2}/2,rpm1{i,3}/2,rpm1{i,4}/2]);
    end
    for i=1:length(rpm2{:,1})
        mytachs.rpm2(i) = mean([rpm2{i,1}/2,rpm2{i,2}/2,rpm2{i,3}/2,rpm2{i,4}/2]);
    end
    for i=1:length(rpm3{:,1})
        mytachs.rpm3(i) = mean([rpm3{i,1}/2,rpm3{i,2}/2,rpm3{i,3}/2,rpm3{i,4}/2]);
    end
    for i=1:length(rpm4{:,1})
        mytachs.rpm4(i) = mean([rpm4{i,1}/2,rpm4{i,2}/2,rpm4{i,3}/2,rpm4{i,4}/2]);
    end

    mytachs.rpm1 = mytachs.rpm1';
    mytachs.rpm2 = mytachs.rpm2';
    mytachs.rpm3 = mytachs.rpm3';
    mytachs.rpm4 = mytachs.rpm4';

    diff1 = 0;
    diff2 = 0;
    diff3 = 0;
    diff4 = 0;

    for i=1:1:length(mytachs.rpm1)-1
        diff1 = [diff1; (mytachs.rpm1(i)-mytachs.rpm1(i+1))/Ts1];                                 % compute the gradient at Ts1
    end
    for i=1:1:length(mytachs.rpm2)-1
        diff2 = [diff2; (mytachs.rpm2(i)-mytachs.rpm2(i+1))/Ts2];                                 % compute the gradient at Ts2
    end
    for i=1:1:length(mytachs.rpm3)-1
        diff3 = [diff3; (mytachs.rpm3(i)-mytachs.rpm3(i+1))/Ts3];                                 % compute the gradient at Ts2
    end
    for i=1:1:length(mytachs.rpm4)-1
        diff4 = [diff4; (mytachs.rpm4(i)-mytachs.rpm4(i+1))/Ts4];                                 % compute the gradient at Ts2
    end

    
% figure()
% hold on; grid on;
% plot(mytachs.rpm4)
% plot(diff4)
[A1,C1] = find(abs(diff1)>1.5e5);                                               % get the 10 maximum values in the gradient
[A2,C2] = find(abs(diff2)>1.5e5);
[A3,C3] = find(abs(diff3)>1.5e5);
[A4,C4] = find(abs(diff4)>1.5e5);
offset_points_rpm = 1;
step_duration_rpm = 15;
segment_points_rpm = 10;
points_to_avg_rpm = 10;
time_stamp1 = maxk(A1,1):-step_duration_rpm:1;                                  % adjust timestamp depending on step duration
time_stamp2 = maxk(A2,1):-step_duration_rpm:1;                                  % adjust timestamp depending on step duration
time_stamp3 = maxk(A3,1):-step_duration_rpm:1;                                  % adjust timestamp depending on step duration
time_stamp4 = maxk(A4,1):-step_duration_rpm:1;                                  % adjust timestamp depending on step duration
    


    timestamp1 = [];
    for i=1:1:length(time_stamp1)                                              % Create timestamp vector of smaller segments
        time_stamp1(i) = time_stamp1(i)-offset_points_rpm;
        ending = time_stamp1(i)-segment_points_rpm;
        timestamp1 = [timestamp1;time_stamp1(i);ending];
    end


    timestamp2 = [];
    for i=1:1:length(time_stamp2)                                              % Create timestamp vector of smaller segments
        time_stamp2(i) = time_stamp2(i)-offset_points_rpm;
        ending = time_stamp2(i)-segment_points_rpm;
        timestamp2 = [timestamp2;time_stamp2(i);ending];
    end

    timestamp3 = [];
    for i=1:1:length(time_stamp3)                                              % Create timestamp vector of smaller segments
        time_stamp3(i) = time_stamp3(i)-offset_points_rpm;
        ending = time_stamp3(i)-segment_points_rpm;
        timestamp3 = [timestamp3;time_stamp3(i);ending];
    end

    timestamp4 = [];
    for i=1:1:length(time_stamp4)                                             % Create timestamp vector of smaller segments
        time_stamp4(i) = time_stamp4(i)-offset_points_rpm;
        ending = time_stamp4(i)-segment_points_rpm;
        timestamp4 = [timestamp4;time_stamp4(i);ending];
    end

    timestamp1 = sort(timestamp1);
    timestamp2 = sort(timestamp2);
    timestamp3 = sort(timestamp3);
    timestamp4 = sort(timestamp4);

    RPM_1 = [];
    RPM_2 = [];
    RPM_3 = [];
    RPM_4 = [];

    timing1 = [];
    timing2 = [];
    timing3 = [];
    timing4 = [];

    RPM1_off = [];
    RPM2_off = [];
    RPM3_off = [];
    RPM4_off = [];

    % Finding the average position in time
    for i = 1:2:length(timestamp1)-1
        timing1  = [timing1;mean(abs(timestamp1(i:i+1)))];
    end
    if timing1(1)<=5
        timing1(1)=6;
    end
    % Compute the average of the force of points_to_avg centered in timing(i)
    for i=1:length(timing1)
        RPM_1 = [RPM_1; mean(mytachs.rpm1(timing1(i)-points_to_avg_rpm/2:timing1(i)+points_to_avg_rpm/2))] ;
    end
    % Finding offsets and removing them
    D1 = find(RPM_1==RPM_1(end-steps_per_stair+1));
    D1 = max(D1);
    E1 = [D1:-steps_per_stair:1];
    positions1 = sort(E1);
    RPM_int_1 =[mytachs.rpm1(1:timing1(positions1(1)))];
    for i = 1:length(positions1)-1
        RPM_int_1 = [RPM_int_1;mytachs.rpm1(timing1(positions1(i))+1:timing1(positions1(i+1)))];
    end
    RPM_int_1 = [RPM_int_1;mytachs.rpm1(timing1(positions1(end))+1:end)];
    % We compute again the average values of the segments

    for i = 1:length(timing1)             % Compute average of force in such timestamp
        RPM1_off = [RPM1_off;mean(RPM_int_1(timing1(i)-points_to_avg_rpm/2:timing1(i)+points_to_avg_rpm/2))];
    end


    % Finding the average position in time
    for i = 1:2:length(timestamp2)-1
        timing2  = [timing2;mean(abs(timestamp2(i:i+1)))];
    end
    if timing2(1)<=5
        timing2(1)=6;
    end
    % Compute the average of the force of points_to_avg centered in timing(i)
    for i=1:length(timing2)
        RPM_2 = [RPM_2; mean(mytachs.rpm2(timing2(i)-points_to_avg_rpm/2:timing2(i)+points_to_avg_rpm/2))] ;
    end
    % Finding offsets and removing them
    D2 = find(RPM_2==RPM_2(end-steps_per_stair+1));
    D2 = max(D2);
    E2 = [D2:-steps_per_stair:1];
    positions2 = sort(E2);
    RPM_int_2 =[mytachs.rpm2(1:timing2(positions2(1)))];
    for i = 1:length(positions2)-1
        RPM_int_2 = [RPM_int_2;mytachs.rpm2(timing2(positions2(i))+1:timing2(positions2(i+1)))];
    end
    RPM_int_2 = [RPM_int_2;mytachs.rpm2(timing2(positions2(end))+1:end)];
    % We compute again the average values of the segments
    for i = 1:length(timing2)             % Compute average of force in such timestamp
        RPM2_off = [RPM2_off;mean(RPM_int_2(timing2(i)-points_to_avg_rpm/2:timing2(i)+points_to_avg_rpm/2))];
    end

    % Finding the average position in time
    for i = 1:2:length(timestamp3)-1
        timing3  = [timing3;mean(abs(timestamp3(i:i+1)))];
    end
    if timing3(1)<=5
        timing3(1)=6;
    end
    % Compute the average of the force of points_to_avg centered in timing(i)
    for i=1:length(timing3)
        RPM_3 = [RPM_3; mean(mytachs.rpm3(timing3(i)-points_to_avg_rpm/2:timing3(i)+points_to_avg_rpm/2))] ;
    end
    % Finding offsets and removing them
    D3 = find(RPM_3==RPM_3(end-steps_per_stair+1));
    D3 = max(D3);
    E3 = [D3:-steps_per_stair:1];
    positions3 = sort(E3);
    RPM_int_3 =[mytachs.rpm3(1:timing3(positions3(1)))];
    for i = 1:length(positions3)-1
        RPM_int_3 = [RPM_int_3;mytachs.rpm3(timing3(positions3(i))+1:timing3(positions3(i+1)))];
    end
    RPM_int_3 = [RPM_int_3;mytachs.rpm3(timing3(positions3(end))+1:end)];
    % We compute again the average values of the segments
    for i = 1:length(timing3)             % Compute average of force in such timestamp
        RPM3_off = [RPM3_off;mean(RPM_int_3(timing3(i)-points_to_avg_rpm/2:timing3(i)+points_to_avg_rpm/2))];
    end

    % Finding the average position in time
    for i = 1:2:length(timestamp4)-1
        timing4  = [timing4;mean(abs(timestamp4(i:i+1)))];
    end
    if timing4(1)<=5
        timing4(1)=6;
    end
    % Compute the average of the force of points_to_avg centered in timing(i)
    for i=1:length(timing4)
        RPM_4 = [RPM_4; mean(mytachs.rpm4(timing4(i)-points_to_avg_rpm/2:timing4(i)+points_to_avg_rpm/2))] ;
    end
    % Finding offsets and removing them
    D4 = find(RPM_4==RPM_4(end-steps_per_stair+1));
    D4 = max(D4);
    E4 = [D4:-steps_per_stair:1];
    positions4 = sort(E4);
    RPM_int_4 =[mytachs.rpm4(1:timing4(positions4(1)))];
    for i = 1:length(positions4)-1
        RPM_int_4 = [RPM_int_4;mytachs.rpm4(timing4(positions4(i))+1:timing4(positions4(i+1)))];
    end
    RPM_int_4 = [RPM_int_4;mytachs.rpm4(timing4(positions4(end))+1:end)];
    % We compute again the average values of the segments
    for i = 1:length(timing4)             % Compute average of force in such timestamp
        RPM4_off = [RPM4_off;mean(RPM_int_4(timing4(i)-points_to_avg_rpm/2:timing4(i)+points_to_avg_rpm/2))];
    end


    while length(RPM1_off)>13
        RPM1_off = RPM1_off(2:end);
        timing1  = timing1(2:end);
    end
    while length(RPM2_off)>13
        RPM2_off = RPM2_off(2:end);
        timing2  = timing2(2:end);
    end
    while length(RPM3_off)>13
        RPM3_off = RPM3_off(2:end);
        timing3  = timing3(2:end);
    end
    while length(RPM4_off)>13
        RPM4_off = RPM4_off(2:end);
        timing4  = timing4(2:end);
    end


    % figure()
    % hold on;grid on;
    % plot(RPM_int_3)
    % plot(diff2)
    % plot(timing3,RPM3_off,'o')

    autotachs.timestamp{1} = timestamp1;
    autotachs.timestamp{2} = timestamp2;
    autotachs.timestamp{3} = timestamp3;
    autotachs.timestamp{4} = timestamp4;
    autotachs.timing{1} = timing1;
    autotachs.timing{2} = timing2;
    autotachs.timing{3} = timing3;
    autotachs.timing{4} = timing4;

    mytachs.rpm{1} = RPM_int_1;
    mytachs.rpm{2} = RPM_int_2;
    mytachs.rpm{3} = RPM_int_3;
    mytachs.rpm{4} = RPM_int_4;

    mytachs.rpm_lvls{1} = RPM1_off;
    mytachs.rpm_lvls{2} = RPM2_off;
    mytachs.rpm_lvls{3} = RPM3_off;
    mytachs.rpm_lvls{4} = RPM4_off;

    mytachs.t{1} = [0:1:length(RPM_int_1)]';
    mytachs.t{2} = [0:1:length(RPM_int_2)]';
    mytachs.t{3} = [0:1:length(RPM_int_3)]';
    mytachs.t{4} = [0:1:length(RPM_int_4)]';

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
    %{
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


figure()
subplot(3,1,1)
title("Alignment check")
hold on; grid on;
plot(myvars.t{1},myvars.My{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.My{2},'lineWidth',1.5)
plot(myvars.t{3},myvars.My{3},'lineWidth',1.5)
plot(myvars.t{4},myvars.My{4},'lineWidth',1.5)
ylabel("M_y [N]")
subplot(3,1,2)
hold on; grid on;
plot(myvars.t{1},myvars.Fx{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Fx{2},'lineWidth',1.5)
plot(myvars.t{3},myvars.Fx{3},'lineWidth',1.5)
plot(myvars.t{4},myvars.Fx{4},'lineWidth',1.5)
ylabel("F_x [N]")
subplot(3,1,3)
hold on; grid on;
plot(myvars.t{1},myvars.Mz{1},'lineWidth',1.5)
plot(myvars.t{2},myvars.Mz{2},'lineWidth',1.5)
plot(myvars.t{3},myvars.Mz{3},'lineWidth',1.5)
plot(myvars.t{4},myvars.Mz{4},'lineWidth',1.5)
xlabel("Time [s]")
ylabel("M_z [N]")

    %}

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
    %{
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
    %}

    %% Alignment of the tachs

    timestamps = zeros(1,length(autotachs.timestamp));
    KJ = 1;
    timelength = length(mytachs.t{1});
    for i = 1:length(autotachs.timestamp)
        timestamps(i) = autotachs.timestamp{i}(end);                                % Store all timestamp ends on one vector
        if length(mytachs.t{i}) < timelength
            timelength = length(mytachs.t{i});
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


    % fn = fieldnames(mytachs);
    for i=1:4

        mytachs.rpm{i} = mytachs.rpm{i}(timestamps(i):end,:);

    end

    for i = 1:length(timestamps)
        mytachs.t{i} = mytachs.t{i}(timestamps(i):end-1,:);
    end

    for j = 1:length(timestamps)
        mytachs.t{j} = mytachs.t{j} - mytachs.t{j}(1,1);
    end

    % Finding shortest data vector
    vector_lengths = zeros(1,length(timestamps));
    for i =1:length(timestamps)
        vector_lengths(1,i) = length(mytachs.rpm{i});
    end
    [~,KL] = maxk(vector_lengths,1);

    % figure()
    % hold on; grid on;
    % plot(myvars.t{1},myvars.Fz{1},'linewidth',2)
    % plot(myvars.t{2},myvars.Fz{2},'linewidth',2)
    % plot(myvars.t{3},myvars.Fz{3},'linewidth',2)
    % plot(myvars.t{4},myvars.Fz{4},'linewidth',2)


    % Forcing equal lengths
    for i=1:4
        mytachs.rpm{i} = [mytachs.rpm{i}(1:end);zeros(vector_lengths(KL)-vector_lengths(i),1)];
    end

    for i = 1:length(timestamps)
        mytachs.t{i} = [0:1:(vector_lengths(KL)-1)*1]';
    end


    % figure()
    % hold on;
    % grid on;
    % plot(mytachs.t{1},mytachs.rpm{1},'lineWidth',1.5)
    % plot(mytachs.t{2},mytachs.rpm{2},'lineWidth',1.5)
    % plot(mytachs.t{3},mytachs.rpm{3},'lineWidth',1.5)
    % plot(mytachs.t{4},mytachs.rpm{4},'lineWidth',1.5)
    % xlabel("Time [s]")
    % ylabel("RPM")

    %% Averaging the final result
    mytachs.totrpm = zeros(vector_lengths(KL),1);
    for i = 1:length(timestamps)
        mytachs.totrpm = mytachs.totrpm + mytachs.rpm{i};
    end
    mytachs.totrpm = mytachs.totrpm/i;

    % figure()
    % hold on;
    % grid on;
    % plot(mytachs.t{1},mytachs.rpm{1},'lineWidth',1.5)
    % plot(mytachs.t{2},mytachs.rpm{2},'lineWidth',1.5)
    % plot(mytachs.t{3},mytachs.rpm{3},'lineWidth',1.5)
    % plot(mytachs.t{4},mytachs.rpm{4},'lineWidth',1.5)
    % plot(mytachs.t{1},mytachs.totrpm,'color','k','lineWidth',1.5)
    % xlabel("Time [s]")
    % ylabel("RPM")

    %% Saving the data into a csv file that can be later on used

    result.files{1} = file1;
    result.files{2} = file2;
    result.files{3} = file3;
    result.files{4} = file4;

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

    result.u_Fx = sqrt((1/4*u_Fx1).^2+(1/4*u_Fx2).^2+(1/4*u_Fx3).^2+(1/4*u_Fx4).^2);
    result.u_Fy = sqrt((1/4*u_Fy1).^2+(1/4*u_Fy2).^2+(1/4*u_Fy3).^2+(1/4*u_Fy4).^2);
    result.u_Fz = sqrt((1/4*u_Fz1).^2+(1/4*u_Fz2).^2+(1/4*u_Fz3).^2+(1/4*u_Fz4).^2);
    result.u_Mx = sqrt((1/4*u_Mx1).^2+(1/4*u_Mx2).^2+(1/4*u_Mx3).^2+(1/4*u_Mx4).^2);
    result.u_My = sqrt((1/4*u_My1).^2+(1/4*u_My2).^2+(1/4*u_My3).^2+(1/4*u_My4).^2);
    result.u_Mz = sqrt((1/4*u_Mz1).^2+(1/4*u_Mz2).^2+(1/4*u_Mz3).^2+(1/4*u_Mz4).^2);

    result.rpm = mytachs.totrpm;
    result.rpm_all = mytachs;
    result.temp = avg_temp;
    result.pres = avg_pres;

    save(save_file, 'result');

end