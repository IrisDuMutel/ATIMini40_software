close all
clear variables
%%%% File selection and loading of data

file1 = '../../LogFiles/SensorComparison/Individual/ATI_test10g_Fz_test1.csv'; %LoadCell
file2 = '../../LogFiles/SensorComparison/Individual/ATI_test50g_Fz_test1.csv'; %LoadCell
file3 = '../../LogFiles/SensorComparison/Individual/ATI_test100g_Fz_test1.csv'; %LoadCell
file4 = '../../LogFiles/SensorComparison/Individual/ATI_test500g_Fz_test1.csv'; %LoadCell
file5 = '../../LogFiles/SensorComparison/Individual/ATI_test1000g_Fz_test1.csv'; %LoadCell
file6 = '../../LogFiles/SensorComparison/Individual/ATI_test1500g_Fz_test1.csv'; %LoadCell

weight= [10e-3;
         50e-3;
         100e-3;
         500e-3;
         1000e-3;
         1500e-3];%kg


%%% Text for plots
Title = 'Fz individual tests';

fx_column = 1;
fy_column = 2;
fz_column = 3;
mx_column = 4;
my_column = 5;
mz_column = 6;

loadCell_data1 = readtable(file1);
loadCell_data2 = readtable(file2);
loadCell_data3 = readtable(file3);
loadCell_data4 = readtable(file4);
loadCell_data5 = readtable(file5);
loadCell_data6 = readtable(file6);

%%%% Data processing %%%%

adjusting = 0;

indx1 = 1; % Index for load cell test 1
indx2 = 1; % Index for RPM test 1
indx3 = 1;
indx4 = 1;
indx5 = 1;
indx6 = 1;


g = 9.798; %m/s² 
F_expected = -1*g*weight; %N
dist = 99.95e-3; %m
M_expected = F_expected*dist;
Ts1 = 1/150;
f_cutoff = 0.5;
f_sampling = 1/Ts1;
w_n = f_cutoff/(f_sampling/2);  % Cutoff frequency
[b_5,a_5] = butter(5,w_n,'low');   % Create Butterworth filter of order 5
fromm=10000;
tooo=13700;
offset1 = 1496;
offset2 = 1496;
offset3 = 1496;
offset4 = 1496;
offset5 = 1496;
offset6 = 1496;

Fx1 = filter(b_5, a_5,loadCell_data1{indx1:end,fx_column});
Fx2 = filter(b_5, a_5,loadCell_data2{indx2:end,fx_column});
Fx3 = filter(b_5, a_5,loadCell_data3{indx3:end,fx_column});
Fx4 = filter(b_5, a_5,loadCell_data4{indx4:end,fx_column});
Fx5 = filter(b_5, a_5,loadCell_data5{indx5:end,fx_column});
Fx6 = filter(b_5, a_5,loadCell_data6{indx6:end,fx_column});
Fy1 = filter(b_5, a_5,loadCell_data1{indx1:end,fy_column});
Fy2 = filter(b_5, a_5,loadCell_data2{indx2:end,fy_column});
Fy3 = filter(b_5, a_5,loadCell_data3{indx3:end,fy_column});
Fy4 = filter(b_5, a_5,loadCell_data4{indx4:end,fy_column});
Fy5 = filter(b_5, a_5,loadCell_data5{indx5:end,fy_column});
Fy6 = filter(b_5, a_5,loadCell_data6{indx6:end,fy_column});
Fz1 = filter(b_5, a_5,loadCell_data1{indx1:end,fz_column});
Fz2 = filter(b_5, a_5,loadCell_data2{indx2:end,fz_column});
Fz3 = filter(b_5, a_5,loadCell_data3{indx3:end,fz_column});
Fz4 = filter(b_5, a_5,loadCell_data4{indx4:end,fz_column});
Fz5 = filter(b_5, a_5,loadCell_data5{indx5:end,fz_column});
Fz6 = filter(b_5, a_5,loadCell_data6{indx6:end,fz_column});

Fx1 = Fx1 - Fx1(offset1);
Fx2 = Fx2 - Fx2(offset2);
Fx3 = Fx3 - Fx3(offset3);
Fx4 = Fx4 - Fx4(offset4);
Fx5 = Fx5 - Fx5(offset5);
Fx6 = Fx6 - Fx6(offset6);
Fy1 = Fy1 - Fy1(offset1);
Fy2 = Fy2 - Fy2(offset2);
Fy3 = Fy3 - Fy3(offset3);
Fy4 = Fy4 - Fy4(offset4);
Fy5 = Fy5 - Fy5(offset5);
Fy6 = Fy6 - Fy6(offset6);
Fz1 = Fz1 - Fz1(offset1);
Fz2 = Fz2 - Fz2(offset2);
Fz3 = Fz3 - Fz3(offset3);
Fz4 = Fz4 - Fz4(offset4);
Fz5 = Fz5 - Fz5(offset5);
Fz6 = Fz6 - Fz6(offset6);


Mx1 = filter(b_5, a_5,loadCell_data1{indx1:end,mx_column});
Mx2 = filter(b_5, a_5,loadCell_data2{indx2:end,mx_column});
Mx3 = filter(b_5, a_5,loadCell_data3{indx3:end,mx_column});
Mx4 = filter(b_5, a_5,loadCell_data4{indx4:end,mx_column});
Mx5 = filter(b_5, a_5,loadCell_data5{indx5:end,mx_column});
Mx6 = filter(b_5, a_5,loadCell_data6{indx6:end,mx_column});
My1 = filter(b_5, a_5,loadCell_data1{indx1:end,my_column});
My2 = filter(b_5, a_5,loadCell_data2{indx2:end,my_column});
My3 = filter(b_5, a_5,loadCell_data3{indx3:end,my_column});
My4 = filter(b_5, a_5,loadCell_data4{indx4:end,my_column});
My5 = filter(b_5, a_5,loadCell_data5{indx5:end,my_column});
My6 = filter(b_5, a_5,loadCell_data6{indx6:end,my_column});
Mz1 = filter(b_5, a_5,loadCell_data1{indx1:end,mz_column});
Mz2 = filter(b_5, a_5,loadCell_data2{indx2:end,mz_column});
Mz3 = filter(b_5, a_5,loadCell_data3{indx3:end,mz_column});
Mz4 = filter(b_5, a_5,loadCell_data4{indx4:end,mz_column});
Mz5 = filter(b_5, a_5,loadCell_data5{indx5:end,mz_column});
Mz6 = filter(b_5, a_5,loadCell_data6{indx6:end,mz_column});

Mx1 = Mx1 - Mx1(offset1);
Mx2 = Mx2 - Mx2(offset2);
Mx3 = Mx3 - Mx3(offset3);
Mx4 = Mx4 - Mx4(offset4);
Mx5 = Mx5 - Mx5(offset5);
Mx6 = Mx6 - Mx6(offset6);
My1 = My1 - My1(offset1);
My2 = My2 - My2(offset2);
My3 = My3 - My3(offset3);
My4 = My4 - My4(offset4);
My5 = My5 - My5(offset5);
My6 = My6 - My6(offset6);
Mz1 = Mz1 - Mz1(offset1);
Mz2 = Mz2 - Mz2(offset2);
Mz3 = Mz3 - Mz3(offset3);
Mz4 = Mz4 - Mz4(offset4);
Mz5 = Mz5 - Mz5(offset5);
Mz6 = Mz6 - Mz6(offset6);

figure()
hold on; grid on;
plot(Fz1,'lineWidth',2)
plot(Fz2,'lineWidth',2)
plot(Fz3,'lineWidth',2)
plot(Fz4,'lineWidth',2)
plot(Fz5,'lineWidth',2)
plot(Fz6,'lineWidth',2)
xlabel('Datapoints')
ylabel('Fz1 [N]')



Fz1_avg = mean(Fz1(fromm:tooo));
Fz2_avg = mean(Fz2(fromm:tooo));
Fz3_avg = mean(Fz3(fromm:tooo));
Fz4_avg = mean(Fz4(fromm:tooo));
Fz5_avg = mean(Fz5(fromm:tooo));
Fz6_avg = mean(Fz6(fromm:tooo));


time1 =0*Ts1:Ts1:Ts1*(length(loadCell_data1{:,2})-1);
time2 =0*Ts1:Ts1:Ts1*(length(loadCell_data2{:,2})-1);
time3 =0*Ts1:Ts1:Ts1*(length(loadCell_data3{:,2})-1);
time4 =0*Ts1:Ts1:Ts1*(length(loadCell_data4{:,2})-1);
time5 =0*Ts1:Ts1:Ts1*(length(loadCell_data5{:,2})-1);
time6 =0*Ts1:Ts1:Ts1*(length(loadCell_data6{:,2})-1);


Fz1_selection = Fz1(fromm:tooo);
Fz2_selection = Fz2(fromm:tooo);
Fz3_selection = Fz3(fromm:tooo);
Fz4_selection = Fz4(fromm:tooo);
Fz5_selection = Fz5(fromm:tooo);
Fz6_selection = Fz6(fromm:tooo);

%%%%% Average
Fx1_avg = mean(Fx1(fromm:tooo));
Fy1_avg = mean(Fy1(fromm:tooo));
F1tot_avg = sign(Fy1_avg)*sqrt(abs(Fx1_avg).^2+abs(Fy1_avg).^2);
Fx2_avg = mean(Fx2(fromm:tooo));
Fy2_avg = mean(Fy2(fromm:tooo));
F2tot_avg = sign(Fy2_avg)*sqrt(abs(Fx2_avg).^2+abs(Fy2_avg).^2);
Fx3_avg = mean(Fx3(fromm:tooo));
Fy3_avg = mean(Fy3(fromm:tooo));
F3tot_avg = sign(Fy3_avg)*sqrt(abs(Fx3_avg).^2+abs(Fy3_avg).^2);
Fx4_avg = mean(Fx4(fromm:tooo));
Fy4_avg = mean(Fy4(fromm:tooo));
F4tot_avg = sign(Fy4_avg)*sqrt(abs(Fx4_avg).^2+abs(Fy4_avg).^2);
Fx5_avg = mean(Fx5(fromm:tooo));
Fy5_avg = mean(Fy5(fromm:tooo));
F5tot_avg = sign(Fy5_avg)*sqrt(abs(Fx5_avg).^2+abs(Fy5_avg).^2);
Fx6_avg = mean(Fx6(fromm:tooo));
Fy6_avg = mean(Fy6(fromm:tooo));


Fz1_std = std(Fz1(fromm:tooo));
Fz2_std = std(Fz2(fromm:tooo));
Fz3_std = std(Fz3(fromm:tooo));
Fz4_std = std(Fz4(fromm:tooo));
Fz5_std = std(Fz5(fromm:tooo));
Fz6_std = std(Fz6(fromm:tooo));

Fzavg = [Fz1_avg;
    Fz2_avg;
    Fz3_avg;
    Fz4_avg;
    Fz5_avg;
    Fz6_avg];
Fzstd = [Fz1_std;
    Fz2_std;
    Fz3_std;
    Fz4_std;
    Fz5_std;
    Fz6_std];

rel_err1 = abs((Fz1_avg-F_expected(1))/F_expected(1))*100;
rel_err2 = abs((Fz2_avg-F_expected(2))/F_expected(2))*100;
rel_err3 = abs((Fz3_avg-F_expected(3))/F_expected(3))*100;
rel_err4 = abs((Fz4_avg-F_expected(4))/F_expected(4))*100;
rel_err5 = abs((Fz5_avg-F_expected(5))/F_expected(5))*100;
rel_err6 = abs((Fz6_avg-F_expected(6))/F_expected(6))*100;
rel_err = [rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6]';
avg_relErr = mean([rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6]);
fprintf('The average relative error is: %f \n', avg_relErr)
abs_err1 = abs((Fz1_avg-F_expected(1)));
abs_err2 = abs((Fz2_avg-F_expected(2)));
abs_err3 = abs((Fz3_avg-F_expected(3)));
abs_err4 = abs((Fz4_avg-F_expected(4)));
abs_err5 = abs((Fz5_avg-F_expected(5)));
abs_err6 = abs((Fz6_avg-F_expected(6)));
abs_err = [abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6]';
avg_absErr = mean([abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6]);
fprintf('The average absolute error is: %f \n', avg_absErr)
%% %% Type A uncertainty computation
%%%% Uncertainty = (estimated standard deviation)/sqrt(n); %With n the
%%%% number of measurements

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
UncA_Fz3_1 = std(Fz3_avg-F_expected(3))/sqrt(length(Fz3_avg));
UncA_Fz4_1 = std(Fz4_avg-F_expected(4))/sqrt(length(Fz4_avg));
UncA_Fz5_1 = std(Fz5_avg-F_expected(5))/sqrt(length(Fz5_avg));
UncA_Fz6_1 = std(Fz6_avg-F_expected(6))/sqrt(length(Fz6_avg));
UncA_Fz1_2 = std(Fz1_selection-F_expected(1))/sqrt(length(Fz1_selection));
UncA_Fz2_2 = std(Fz2_selection-F_expected(2))/sqrt(length(Fz2_selection));
UncA_Fz3_2 = std(Fz3_selection-F_expected(3))/sqrt(length(Fz3_selection));
UncA_Fz4_2 = std(Fz4_selection-F_expected(4))/sqrt(length(Fz4_selection));
UncA_Fz5_2 = std(Fz5_selection-F_expected(5))/sqrt(length(Fz5_selection));
UncA_Fz6_2 = std(Fz6_selection-F_expected(6))/sqrt(length(Fz6_selection));

%% Type B uncertainty
%%% Uncertainty based on parameters found in the datasheet or throughout
%%% methods other than direct measurement

Fxy_resol  = 0.025;
Fz_resol   = 0.05;
Mxyz_resol = 0.002;

UncB_Fxy   = (Fxy_resol/2)/sqrt(3);
UncB_Fz    = (Fz_resol/2)/sqrt(3);
UncB_Mxyz  = (Mxyz_resol/2)/sqrt(3);

%% Combined standard uncertainty
%%%% CSU = sqrt(u1+...+un)
%%%% U = k*CSU; %with k = 2 for a 95% confidence interval

k = 2;

CSU_Fz1_1 = sqrt(UncA_Fz1_1^2+UncB_Fz^2);
CSU_Fz2_1 = sqrt(UncA_Fz2_1^2+UncB_Fz^2);
CSU_Fz3_1 = sqrt(UncA_Fz3_1^2+UncB_Fz^2);
CSU_Fz4_1 = sqrt(UncA_Fz4_1^2+UncB_Fz^2);
CSU_Fz5_1 = sqrt(UncA_Fz5_1^2+UncB_Fz^2);
CSU_Fz6_1 = sqrt(UncA_Fz6_1^2+UncB_Fz^2);
CSU_Fz1_2 = sqrt(UncA_Fz1_2^2+UncB_Fz^2);
CSU_Fz2_2 = sqrt(UncA_Fz2_2^2+UncB_Fz^2);
CSU_Fz3_2 = sqrt(UncA_Fz3_2^2+UncB_Fz^2);
CSU_Fz4_2 = sqrt(UncA_Fz4_2^2+UncB_Fz^2);
CSU_Fz5_2 = sqrt(UncA_Fz5_2^2+UncB_Fz^2);
CSU_Fz6_2 = sqrt(UncA_Fz6_2^2+UncB_Fz^2);

U_Fz_1 = k*[CSU_Fz1_1;
            CSU_Fz2_1;
            CSU_Fz3_1;
            CSU_Fz4_1;
            CSU_Fz5_1;
            CSU_Fz6_1];

U_Fz_2 = k*[CSU_Fz1_2;
            CSU_Fz2_2;
            CSU_Fz3_2;
            CSU_Fz4_2;
            CSU_Fz5_2;
            CSU_Fz6_2];

U_F1 = mean(U_Fz_1);
U_F2 = mean(U_Fz_2);
fprintf('The average uncertainty method 1 is: %f \n', U_F1)
fprintf('The average uncertainty method 2 is: %f \n', U_F2)

%% %% Plotting %%%%
figure()
hold on; grid on;
plot(Fz1,'lineWidth',2)
plot(Fz2,'lineWidth',2)
plot(Fz3,'lineWidth',2)
plot(Fz4,'lineWidth',2)
plot(Fz5,'lineWidth',2)
plot(Fz6,'lineWidth',2)
xlabel('Datapoints')
ylabel('Fz1 [N]')

figure()
plot(time1, Fz1,'lineWidth',2)
hold on;
plot(time2, Fz2,'lineWidth',2)
plot(time3, Fz3,'lineWidth',2)
plot(time4, Fz4,'lineWidth',2)
plot(time5, Fz5,'lineWidth',2)
plot(time6, Fz6,'lineWidth',2)
plot(time1,F_expected(1)*ones(1,length(time1)),'-','lineWidth',1.5,'color','k')
plot(time2,F_expected(2)*ones(1,length(time2)),'-','lineWidth',1.5,'color','k')
plot(time3,F_expected(3)*ones(1,length(time3)),'-','lineWidth',1.5,'color','k')
plot(time4,F_expected(4)*ones(1,length(time4)),'-','lineWidth',1.5,'color','k')
plot(time5,F_expected(5)*ones(1,length(time5)),'-','lineWidth',1.5,'color','k')
plot(time6,F_expected(6)*ones(1,length(time6)),'-','lineWidth',1.5,'color','k')
ylabel('F_z [N]')
xlabel('Time [s]')
N = [1:1:length(weight)];
legendStrings = weight(N) + "Kg";
legend(legendStrings)
title(Title)
grid on

% figure()
% colr = [0, 0.3, 0.3];
% plot(time1, Fz1,'lineWidth',2,'color',colr)
% hold on;
% plot(time1, Fx1,'LineWidth',2,'color',colr);colr = colr + [0, 0.2, 0.2];
% plot(time1, Fy1,'LineWidth',2,'color',colr);colr = colr + [0, 0.2, 0.2];
% plot(time1, Mx1,'LineWidth',2,'color',colr);colr = colr + [0, 0.2, 0.2];
% plot(time1, My1,'LineWidth',2,'color',colr);colr = [0.2, 0, 0.2];
% plot(time5, Fz5,'lineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
% plot(time5, Fx5,'LineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
% plot(time5, Fy5,'LineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
% plot(time5, Mx5,'LineWidth',2,'color',colr);colr = colr + [ 0.2, 0, 0.2];
% plot(time5, My5,'LineWidth',2,'color',colr);
% ylabel('F_z [N]')
% xlabel('Time [s]')
% legend('0.0721KgFz','Fx','Fy','Mx','My','1.5KgFz','Fx','Fy','Mx','My')
% title(Title)
% grid on

figure()
plot(F_expected(1), Fz1_avg,'o', 'lineWidth',2)
hold on
plot(F_expected(2), Fz2_avg,'o', 'lineWidth',2)
plot(F_expected(3), Fz3_avg,'o', 'lineWidth',2)
plot(F_expected(4), Fz4_avg,'o', 'lineWidth',2)
plot(F_expected(5), Fz5_avg,'o', 'lineWidth',2)
plot(F_expected(6), Fz6_avg,'o', 'lineWidth',2)
plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
ylabel('Measured value Fz [N]')
xlabel('True Value [N]')
N = [1:1:length(weight)];
legendStrings = weight(N) + "Kg";
legend(legendStrings)
title(Title)
grid on
%%% Relative error
figure()
plot(F_expected(1), rel_err1,'o', 'lineWidth',2)
hold on
plot(F_expected(2), rel_err2,'o', 'lineWidth',2)
plot(F_expected(3), rel_err3,'o', 'lineWidth',2)
plot(F_expected(4), rel_err4,'o', 'lineWidth',2)
plot(F_expected(5), rel_err5,'o', 'lineWidth',2)
plot(F_expected(6), rel_err6,'o', 'lineWidth',2)
% N = [1:1:7];
% legendStrings = F_expected(N) + "N";
% legend(legendStrings)
ylabel('Relative error [%]')
xlabel('F expected [N]')
title(Title)
grid on

%%% Absolute error
figure()
plot(F_expected(1), abs_err1,'o', 'lineWidth',2)
hold on
plot(F_expected(2), abs_err2,'o', 'lineWidth',2)
plot(F_expected(3), abs_err3,'o', 'lineWidth',2)
plot(F_expected(4), abs_err4,'o', 'lineWidth',2)
plot(F_expected(5), abs_err5,'o', 'lineWidth',2)
plot(F_expected(6), abs_err6,'o', 'lineWidth',2)
% plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
% N = [1:1:7];
% legendStrings = F_expected(N) + "N";
% legend(legendStrings)
ylabel('Absolute error [N]')
xlabel('F expected [N]')
title(Title)
grid on

%%%% Mean and std var
figure()
hold on
errorbar(F_expected,Fzavg/10,Fzstd)
ylabel('F_z (mean and std dev) [N]')
xlabel('True Value [N]')
% ylim([-0.09, -0.055])
% xlim([-0.724, -0.706])
% N = [1:1:length(weight)];
% legendStrings = weight(N) + "Kg";
% legend(legendStrings)
title(Title)
grid on

figure()
subplot(3,1,1)
plot(time1,Fx1, 'lineWidth',2)
hold on
plot(time2,Fx2, 'lineWidth',2)
plot(time3,Fx3, 'lineWidth',2)
plot(time4,Fx4, 'lineWidth',2)
plot(time5,Fx5, 'lineWidth',2)
plot(time6,Fx6, 'lineWidth',2)
ylabel('Fx [N]')
grid on
subplot(3,1,2)
plot(time1,Fy1, 'lineWidth',2)
hold on;grid on;
plot(time2,Fy2, 'lineWidth',2)
plot(time3,Fy3, 'lineWidth',2)
plot(time4,Fy4, 'lineWidth',2)
plot(time5,Fy5, 'lineWidth',2)
plot(time6,Fy6, 'lineWidth',2)
ylabel('Fy [N]')
subplot(3,1,3)
plot(time1,Fz1, 'lineWidth',2)
hold on;grid on;
plot(time2,Fz2, 'lineWidth',2)
plot(time3,Fz3, 'lineWidth',2)
plot(time4,Fz4, 'lineWidth',2)
plot(time5,Fz5, 'lineWidth',2)
plot(time6,Fz6, 'lineWidth',2)
ylabel('Fz [N]')
xlabel('Time [s]')


