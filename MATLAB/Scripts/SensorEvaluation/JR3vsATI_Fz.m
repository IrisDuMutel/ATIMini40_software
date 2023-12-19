close all
%%%% File selection and loading of data
file3 = '../../LogFiles/SensorComparison/Individual/JR3_test500g_Fz.csv'; %LoadCell
file4 = '../../LogFiles/SensorComparison/Individual/ATI_test500g_Fz_test1.csv'; %LoadCell
file5 = '../../LogFiles/SensorComparison/Individual/JR3_test1000gcoma3_Fz.csv'; %LoadCell
file6 = '../../LogFiles/SensorComparison/Individual/ATI_test1000g_Fz_test1.csv'; %LoadCell
file7 = '../../LogFiles/SensorComparison/Individual/JR3_test1500g_Fz.csv'; %LoadCell
file8 = '../../LogFiles/SensorComparison/Individual/ATI_test1500g_Fz_test1.csv'; %LoadCell
weight= [500e-3,1000e-3, 1500e-3;500e-3,1000e-3,1500e-3];%kg
g = [9.80665;9.798]; %m/s² 
F_expected = -1*g.*weight; %N
dist = 99.95e-3; %m
M_expected = F_expected*dist;
Ts2 = 1/150;
f_cutoff = 0.5;
f_sampling = 1/Ts2;
w_n = f_cutoff/(f_sampling/2);  % Cutoff frequency
[b_5,a_5] = butter(5,w_n,'low');   % Create Butterworth filter of order 5
%%% Text for plots
Title = 'F_z static tests';

file1 = {file3, file5, file7};
file2 = {file4, file6, file8};

fx_column = 2;
fy_column = 3;
fz_column = 4;
mx_column = 5;
my_column = 6;
mz_column = 7;

for i=1:length(weight)

    loadCell_data1 = readtable(file1{i});
    loadCell_data2 = readtable(file2{i});

    indx1 = 1;
    indx2 = 1;

    time1 = loadCell_data1{1:end-indx1+1,1}./10;
    time2 =[0*Ts2:Ts2:Ts2*(length(loadCell_data2{:,2})-1)];


    %%%% Data processing %%%%

    adjusting = 0;

    fromm1=400;
    tooo1=800;
    fromm2=6000;
    tooo2=7000;
    timeRPMfactor = 7;
    offset1 = 21;
    offset2 = 1200;

    Fz1 = loadCell_data1{indx1:end,fz_column}  -loadCell_data1{offset1,fz_column};
    Fz2 = loadCell_data2{indx2:end,fz_column-1}-loadCell_data2{offset2,fz_column-1};
    Fz2 = filter(b_5, a_5,Fz2);

    Fz1_avg = mean(Fz1(fromm1:tooo1))  ;
    Fz2_avg = mean(Fz2(fromm2:tooo2));

    Mx1 = (loadCell_data1{indx1:end,mx_column}  -loadCell_data1{offset1,mx_column})/10;
    Mx2 = (loadCell_data2{indx2:end,mx_column-1}-loadCell_data2{offset2,mx_column-1})/10;
    Mx2 = filter(b_5, a_5,Mx2);

    My1 = (loadCell_data1{indx1:end,my_column}  -loadCell_data1{offset1,my_column})/10;
    My2 = (loadCell_data2{indx2:end,my_column-1}-loadCell_data2{offset2,my_column-1})/10;
    My2 = filter(b_5, a_5,My2);

    Mz1 = (loadCell_data1{indx1:end,mz_column}  -loadCell_data1{offset1,mz_column})/10;
    Mz2 = (loadCell_data2{indx2:end,mz_column-1}-loadCell_data2{offset2,mz_column-1})/10;
    Mz2 = filter(b_5, a_5,Mz2);


    Fx1 = loadCell_data1{indx1:end,fx_column}-loadCell_data1{offset1,fx_column};
    Fy1 = loadCell_data1{indx1:end,fy_column}-loadCell_data1{offset1,fy_column};
    F1tot = sqrt(abs(Fx1).^2+abs(Fy1).^2);
    Fx2 = loadCell_data2{indx2:end,fx_column}-loadCell_data2{offset2,fx_column-1};
    Fy2 = loadCell_data2{indx2:end,fy_column}-loadCell_data2{offset2,fy_column-1};
    Fy2 = filter(b_5, a_5,Fy2);
    Mx2 = filter(b_5, a_5,Mx2);

    F2tot = sqrt(abs(Fx2).^2+abs(Fy2).^2);

    Fz1_selection = Fz1(fromm1:tooo1)  ;
    Fz2_selection = Fz2(fromm2:tooo2);

    %%%%% Average
    Fx1_avg = mean(Fx1(fromm1:tooo1));
    Fy1_avg = mean(Fy1(fromm1:tooo1));
    F1tot_avg = sign(Fy1_avg)*sqrt(abs(Fx1_avg).^2+abs(Fy1_avg).^2);
    Fx2_avg = mean(Fx2(fromm2:tooo2));
    Fy2_avg = mean(Fy2(fromm2:tooo2));
    F2tot_avg = sign(Fy2_avg)*sqrt(abs(Fx2_avg).^2+abs(Fy2_avg).^2);
    Mx1_avg = mean(Mx1(fromm1:tooo1));
    My1_avg = mean(My1(fromm1:tooo1));
    Mx2_avg = mean(Mx2(fromm2:tooo2));
    My2_avg = mean(My2(fromm2:tooo2));
    Fz1_std = std(Fz1(fromm1:tooo1)  );
    Fz2_std = std(Fz2(fromm2:tooo2));

    Fzavg = [Fz1_avg;
        Fz2_avg];
    Fzstd = [Fz1_std;
        Fz2_std];

    


    rel_err1 = abs((Fz1_avg-F_expected(1,i))/F_expected(1,i))*100;
    rel_err2 = abs((Fz2_avg-F_expected(2,i))/F_expected(2,i))*100;

    fprintf('Values for a weight of: %f \n', weight(1,i))
    avg_relErr = mean([rel_err1,rel_err2]);
    fprintf('The relative error is: JR3 -> %f ATI -> %f \n', rel_err1,rel_err2)

    abs_err1 = abs((Fz1_avg-F_expected(1,i)));
    abs_err2 = abs((Fz2_avg-F_expected(2,i)));

    avg_absErr = mean([abs_err1,abs_err2]);
    fprintf('The absolute error is: JR3 -> %f ATI -> %f \n', abs_err1,abs_err2)


%     hold on
%     plot(Fz1,'lineWidth',2)
%     hold on;
%     % plot(time2, Fz2,'lineWidth',2)
%     plot(filtered_Fz2,'lineWidth',2)
%     % plot([0:length(time1)],F_expected(1)*ones(1,length(time1)+1),'-', 'linewidth',1.5)
%     ylabel('F_z [N]')
%     xlabel('Datapoints [-]')
%     legend('JR3', 'ATI', 'Expected value')
%     title(Title)
%     % xlim([0 50])
%     grid on
    hold on
    plot(F_expected(1,i),Fz1_avg,'o', 'lineWidth',2,'color','b')
    hold on
    plot(F_expected(2,i),Fz2_avg,'o', 'lineWidth',2,'Color','r')
    % plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
    ylabel('Measured value F_z [N]')
    xlabel('True Value F_z[N]')
    title(Title)
    legend('JR3','ATI')
    grid on

end

%% %% Type A uncertainty computation
%%%% Uncertainty = (estimated standard deviation)/sqrt(n); %With n the
%%%% number of measurements
%{
% UncA_Fz1_1 = std(Fz1_avg)/sqrt(length(Fz1_avg));
% UncA_Fz2_1 = std(Fz2_avg)/sqrt(length(Fz2_avg));
% UncA_Fz3_1 = std(Fz3_avg)/sqrt(length(Fz3_avg));
% UncA_Fz4_1 = std(Fz4_avg)/sqrt(length(Fz4_avg));
% UncA_Fz5_1 = std(Fz5_avg)/sqrt(length(Fz5_avg));
% UncA_Fz6_1 = std(Fz6_avg)/sqrt(length(Fz6_avg));
% UncA_Fz7_1 = std(Fz7_avg)/sqrt(length(Fz7_avg));
% UncA_Fz8_1 = std(Fz8_avg)/sqrt(length(Fz8_avg));
% 
% UncA_Fz1_2 = std(Fz1_selection)/sqrt(length(Fz1_selection));
% UncA_Fz2_2 = std(Fz2_selection)/sqrt(length(Fz2_selection));
% UncA_Fz3_2 = std(Fz3_selection)/sqrt(length(Fz3_selection));
% UncA_Fz4_2 = std(Fz4_selection)/sqrt(length(Fz4_selection));
% UncA_Fz5_2 = std(Fz5_selection)/sqrt(length(Fz5_selection));
% UncA_Fz6_2 = std(Fz6_selection)/sqrt(length(Fz6_selection));
% UncA_Fz7_2 = std(Fz7_selection)/sqrt(length(Fz7_selection));
% UncA_Fz8_2 = std(Fz8_selection)/sqrt(length(Fz8_selection));

UncA_Fz1_1 = std(Fz1_avg-F_expected(1))/sqrt(length(Fz1_avg));
UncA_Fz2_1 = std(Fz2_avg-F_expected(2))/sqrt(length(Fz2_avg));

UncA_Fz1_2 = std(Fz1_selection-F_expected(1))/sqrt(length(Fz1_selection));
UncA_Fz2_2 = std(Fz2_selection-F_expected(2))/sqrt(length(Fz2_selection));
%}

%% Type B uncertainty
%%% Uncertainty based on parameters found in the datasheet or throughout
%%% methods other than direct measurement
%{
Fxy_resol  = 0.025;
Fz_resol   = 0.05;
Mxyz_resol = 0.002;

UncB_Fxy   = (Fxy_resol/2)/sqrt(3);
UncB_Fz    = (Fz_resol/2)/sqrt(3);
UncB_Mxyz  = (Mxyz_resol/2)/sqrt(3);
%}
%% Combined standard uncertainty
%%%% CSU = sqrt(u1+...+un)
%%%% U = k*CSU; %with k = 2 for a 95% confidence interval
%{
k = 2;

CSU_Fz1_1 = sqrt(UncA_Fz1_1^2+UncB_Fz^2);
CSU_Fz2_1 = sqrt(UncA_Fz2_1^2+UncB_Fz^2);

CSU_Fz1_2 = sqrt(UncA_Fz1_2^2+UncB_Fz^2);
CSU_Fz2_2 = sqrt(UncA_Fz2_2^2+UncB_Fz^2);

U_Fz_1 = k*[CSU_Fz1_1;
            CSU_Fz2_1];

U_Fz_2 = k*[CSU_Fz1_2;
            CSU_Fz2_2];

U_F1 = mean(U_Fz_1);
U_F2 = mean(U_Fz_2);
fprintf('The average uncertainty method 1 is: %f \n', U_F1)
fprintf('The average uncertainty method 2 is: %f \n', U_F2)
%}

%% %% Plotting %%%%

figure()
plot(Fz1,'lineWidth',2)
hold on;
% plot(time2, Fz2,'lineWidth',2)
plot(filtered_Fz2,'lineWidth',2)
% plot([0:length(time1)],F_expected(1)*ones(1,length(time1)+1),'-', 'linewidth',1.5)
ylabel('F_z [N]')
xlabel('Datapoints [-]')
legend('JR3', 'ATI', 'Expected value')
title(Title)
% xlim([0 50])
grid on

%{
figure()
plot(time1, Fz1,'lineWidth',2)
hold on;
% plot(time2, Fz2,'lineWidth',2)
plot(time2, filtered_Fz2,'lineWidth',2)
plot([0:length(time1)],F_expected(1)*ones(1,length(time1)+1),'-', 'linewidth',1.5)
ylabel('F_z [N]')
xlabel('Time [s]')
legend('JR3', 'ATI', 'Expected value')
title(Title)
xlim([0 50])
grid on

figure()
colr = [0, 0.3, 0.3];
plot(time1, Fz1,'lineWidth',2,'color',colr)
hold on;
plot(time1, Fx1,'LineWidth',2,'color',colr);colr = colr + [0, 0.2, 0.2];
plot(time1, Fy1,'LineWidth',2,'color',colr);colr = colr + [0, 0.2, 0.2];
plot(time1, Mx1,'LineWidth',2,'color',colr);colr = colr + [0, 0.2, 0.2];
plot(time1, My1,'LineWidth',2,'color',colr);colr = [0.2, 0, 0.2];
plot(time2, Fz2,'lineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
plot(time2, Fx2,'LineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
plot(time2, Fy2,'LineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
plot(time2, Mx2,'LineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
plot(time2, My2,'LineWidth',2,'color',colr);
ylabel('F_z [N]')
xlabel('Time [s]')
% legend('0.0721KgFz','Fx','Fy','Mx','My','1.5KgFz','Fx','Fy','Mx','My')
title(Title)
grid on

figure()
plot(F_expected(1), Fz1_avg,'o', 'lineWidth',2)
hold on
plot(F_expected(2), Fz2_avg,'o', 'lineWidth',2)

plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
ylabel('Measured value Fz [N]')
xlabel('True Value [N]')
% N = [1:1:length(weight)];
% legendStrings = weight(N) + "Kg";
% legend(legendStrings)
title(Title)
grid on
%%% Relative error
% figure()
% plot(F_expected(1), rel_err1,'o', 'lineWidth',2)
% hold on
% plot(F_expected(2), rel_err2,'o', 'lineWidth',2)
% % plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
% N = [1:1:7];
% legendStrings = F_expected(N) + "N";
% legend(legendStrings)
% ylabel('Relative error [%]')
% xlabel('F expected [N]')
% title(Title)
% grid on

%%% Absolute error
% figure()
% plot(F_expected(1), abs_err1,'o', 'lineWidth',2)
% hold on
% plot(F_expected(2), abs_err2,'o', 'lineWidth',2)
% % plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
% N = [1:1:7];
% legendStrings = F_expected(N) + "N";
% legend(legendStrings)
% ylabel('Absolute error [N]')
% xlabel('F expected [N]')
% title(Title)
% grid on

%%%% Mean and std var
% figure()
% hold on
% errorbar(F_expected,Fzavg/10,Fzstd)
% ylabel('F_z (mean and std dev) [N]')
% xlabel('True Value [N]')
% % ylim([-0.09, -0.055])
% % xlim([-0.724, -0.706])
% % N = [1:1:length(weight)];
% % legendStrings = weight(N) + "Kg";
% % legend(legendStrings)
% title(Title)
% grid on

figure()
plot(time1,Fx1, 'lineWidth',2)
hold on
plot(time2,Fx2, 'lineWidth',2)
ylabel('Fx [N]')
xlabel('Time [s]')
title(Title)
grid on


figure()
plot(time1,Fy1, 'lineWidth',2)
hold on
plot(time2,Fy2, 'lineWidth',2)
ylabel('Fy [N]')
xlabel('Time [s]')
title(Title)
grid on

figure()
plot(F_expected(1), -Fz1_avg,'o', 'lineWidth',2)
hold on
plot(F_expected(2), -Fz2_avg,'o', 'lineWidth',2)
% plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
ylabel('Measured value Fy [N]')
xlabel('True Value [N]')
title(Title)
grid on

%}



