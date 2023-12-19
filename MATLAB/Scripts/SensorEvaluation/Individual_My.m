close all
clear variables
%%%% File selection and loading of data

file1 = '../../LogFiles/SensorComparison/Individual/ATI_test10g_My_test1.csv'; %LoadCell
file2 = '../../LogFiles/SensorComparison/Individual/ATI_test20g_My_test1.csv'; %LoadCell
file3 = '../../LogFiles/SensorComparison/Individual/ATI_test30g_My_test1.csv'; %LoadCell
file4 = '../../LogFiles/SensorComparison/Individual/ATI_test40g_My_test1.csv'; %LoadCell
file5 = '../../LogFiles/SensorComparison/Individual/ATI_test50g_My_test1.csv'; %LoadCell
file6 = '../../LogFiles/SensorComparison/Individual/ATI_test100g_My_test1.csv'; %LoadCell
file7 = '../../LogFiles/SensorComparison/Individual/ATI_test200g_My_test1.csv'; %LoadCell

weight= [10e-3;
         20e-3;
         30e-3;
         40e-3;
         50e-3;
         100e-3;
         200e-3];%kg


%%% Text for plots
Title = 'My individual tests';

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
loadCell_data7 = readtable(file7);

%%%% Data processing %%%%

adjusting = 0;

indx1 = 1; % Index for load cell test 1
indx2 = 1; % Index for RPM test 1
indx3 = 1;
indx4 = 1;
indx5 = 1;
indx6 = 1;
indx7 = 1;


g = 9.798; %m/s² 
F_expected = 1*g*weight; %N
dist = 314.6625e-3; %m
M_expected = F_expected*dist;
Ts1 = 1/150;
f_cutoff = 0.5;
f_sampling = 1/Ts1;
w_n = f_cutoff/(f_sampling/2);  % Cutoff frequency
[b_5,a_5] = butter(5,w_n,'low');   % Create Butterworth filter of order 5
fromm=10000;
tooo=14000;
offset1 = 2000;
offset2 = 2000;
offset3 = 2000;
offset4 = 2000;
offset5 = 2000;
offset6 = 2000;
offset7 = 2000;

Fx1 = filter(b_5, a_5,loadCell_data1{indx1:end,fx_column});
Fx2 = filter(b_5, a_5,loadCell_data2{indx2:end,fx_column});
Fx3 = filter(b_5, a_5,loadCell_data3{indx3:end,fx_column});
Fx4 = filter(b_5, a_5,loadCell_data4{indx4:end,fx_column});
Fx5 = filter(b_5, a_5,loadCell_data5{indx5:end,fx_column});
Fx6 = filter(b_5, a_5,loadCell_data6{indx6:end,fx_column});
Fx7 = filter(b_5, a_5,loadCell_data7{indx7:end,fx_column});
Fy1 = filter(b_5, a_5,loadCell_data1{indx1:end,fy_column});
Fy2 = filter(b_5, a_5,loadCell_data2{indx2:end,fy_column});
Fy3 = filter(b_5, a_5,loadCell_data3{indx3:end,fy_column});
Fy4 = filter(b_5, a_5,loadCell_data4{indx4:end,fy_column});
Fy5 = filter(b_5, a_5,loadCell_data5{indx5:end,fy_column});
Fy6 = filter(b_5, a_5,loadCell_data6{indx6:end,fy_column});
Fy7 = filter(b_5, a_5,loadCell_data7{indx7:end,fy_column});
Fz1 = filter(b_5, a_5,loadCell_data1{indx1:end,fz_column});
Fz2 = filter(b_5, a_5,loadCell_data2{indx2:end,fz_column});
Fz3 = filter(b_5, a_5,loadCell_data3{indx3:end,fz_column});
Fz4 = filter(b_5, a_5,loadCell_data4{indx4:end,fz_column});
Fz5 = filter(b_5, a_5,loadCell_data5{indx5:end,fz_column});
Fz6 = filter(b_5, a_5,loadCell_data6{indx6:end,fz_column});
Fz7 = filter(b_5, a_5,loadCell_data7{indx7:end,fz_column});

Fx1 = Fx1 - Fx1(offset1);
Fx2 = Fx2 - Fx2(offset2);
Fx3 = Fx3 - Fx3(offset3);
Fx4 = Fx4 - Fx4(offset4);
Fx5 = Fx5 - Fx5(offset5);
Fx6 = Fx6 - Fx6(offset6);
Fx7 = Fx7 - Fx7(offset7);
Fy1 = Fy1 - Fy1(offset1);
Fy2 = Fy2 - Fy2(offset2);
Fy3 = Fy3 - Fy3(offset3);
Fy4 = Fy4 - Fy4(offset4);
Fy5 = Fy5 - Fy5(offset5);
Fy6 = Fy6 - Fy6(offset6);
Fy7 = Fy7 - Fy7(offset7);
Fz1 = Fz1 - Fz1(offset1);
Fz2 = Fz2 - Fz2(offset2);
Fz3 = Fz3 - Fz3(offset3);
Fz4 = Fz4 - Fz4(offset4);
Fz5 = Fz5 - Fz5(offset5);
Fz6 = Fz6 - Fz6(offset6);
Fz7 = Fz7 - Fz7(offset7);


Mx1 = filter(b_5, a_5,loadCell_data1{indx1:end,mx_column});
Mx2 = filter(b_5, a_5,loadCell_data2{indx2:end,mx_column});
Mx3 = filter(b_5, a_5,loadCell_data3{indx3:end,mx_column});
Mx4 = filter(b_5, a_5,loadCell_data4{indx4:end,mx_column});
Mx5 = filter(b_5, a_5,loadCell_data5{indx5:end,mx_column});
Mx6 = filter(b_5, a_5,loadCell_data6{indx6:end,mx_column});
Mx7 = filter(b_5, a_5,loadCell_data7{indx7:end,mx_column});
My1 = filter(b_5, a_5,loadCell_data1{indx1:end,my_column});
My2 = filter(b_5, a_5,loadCell_data2{indx2:end,my_column});
My3 = filter(b_5, a_5,loadCell_data3{indx3:end,my_column});
My4 = filter(b_5, a_5,loadCell_data4{indx4:end,my_column});
My5 = filter(b_5, a_5,loadCell_data5{indx5:end,my_column});
My6 = filter(b_5, a_5,loadCell_data6{indx6:end,my_column});
My7 = filter(b_5, a_5,loadCell_data7{indx7:end,my_column});
Mz1 = filter(b_5, a_5,loadCell_data1{indx1:end,mz_column});
Mz2 = filter(b_5, a_5,loadCell_data2{indx2:end,mz_column});
Mz3 = filter(b_5, a_5,loadCell_data3{indx3:end,mz_column});
Mz4 = filter(b_5, a_5,loadCell_data4{indx4:end,mz_column});
Mz5 = filter(b_5, a_5,loadCell_data5{indx5:end,mz_column});
Mz6 = filter(b_5, a_5,loadCell_data6{indx6:end,mz_column});
Mz7 = filter(b_5, a_5,loadCell_data7{indx7:end,mz_column});

Mx1 = Mx1 - Mx1(offset1);
Mx2 = Mx2 - Mx2(offset2);
Mx3 = Mx3 - Mx3(offset3);
Mx4 = Mx4 - Mx4(offset4);
Mx5 = Mx5 - Mx5(offset5);
Mx6 = Mx6 - Mx6(offset6);
Mx7 = Mx7 - Mx7(offset7);
My1 = My1 - My1(offset1);
My2 = My2 - My2(offset2);
My3 = My3 - My3(offset3);
My4 = My4 - My4(offset4);
My5 = My5 - My5(offset5);
My6 = My6 - My6(offset6);
My7 = My7 - My7(offset7);
Mz1 = Mz1 - Mz1(offset1);
Mz2 = Mz2 - Mz2(offset2);
Mz3 = Mz3 - Mz3(offset3);
Mz4 = Mz4 - Mz4(offset4);
Mz5 = Mz5 - Mz5(offset5);
Mz6 = Mz6 - Mz6(offset6);
Mz7 = Mz7 - Mz7(offset7);

Fz1_avg = mean(Fz1(fromm:tooo));
Fz2_avg = mean(Fz2(fromm:tooo));
Fz3_avg = mean(Fz3(fromm:tooo));
Fz4_avg = mean(Fz4(fromm:tooo));
Fz5_avg = mean(Fz5(fromm:tooo));
Fz6_avg = mean(Fz6(fromm:tooo));
Fz7_avg = mean(Fz7(fromm:tooo));
Fx1_avg = mean(Fx1(fromm:tooo));
Fx2_avg = mean(Fx2(fromm:tooo));
Fx3_avg = mean(Fx3(fromm:tooo));
Fx4_avg = mean(Fx4(fromm:tooo));
Fx5_avg = mean(Fx5(fromm:tooo));
Fx6_avg = mean(Fx6(fromm:tooo));
Fx7_avg = mean(Fx7(fromm:tooo));
Fy1_avg = mean(Fy1(fromm:tooo));
Fy2_avg = mean(Fy2(fromm:tooo));
Fy3_avg = mean(Fy3(fromm:tooo));
Fy4_avg = mean(Fy4(fromm:tooo));
Fy5_avg = mean(Fy5(fromm:tooo));
Fy6_avg = mean(Fy6(fromm:tooo));
Fy7_avg = mean(Fy7(fromm:tooo));

Mz1_avg = mean(Mz1(fromm:tooo));
Mz2_avg = mean(Mz2(fromm:tooo));
Mz3_avg = mean(Mz3(fromm:tooo));
Mz4_avg = mean(Mz4(fromm:tooo));
Mz5_avg = mean(Mz5(fromm:tooo));
Mz6_avg = mean(Mz6(fromm:tooo));
Mz7_avg = mean(Mz7(fromm:tooo));
Mx1_avg = mean(Mx1(fromm:tooo));
Mx2_avg = mean(Mx2(fromm:tooo));
Mx3_avg = mean(Mx3(fromm:tooo));
Mx4_avg = mean(Mx4(fromm:tooo));
Mx5_avg = mean(Mx5(fromm:tooo));
Mx6_avg = mean(Mx6(fromm:tooo));
Mx7_avg = mean(Mx7(fromm:tooo));
My1_avg = mean(My1(fromm:tooo));
My2_avg = mean(My2(fromm:tooo));
My3_avg = mean(My3(fromm:tooo));
My4_avg = mean(My4(fromm:tooo));
My5_avg = mean(My5(fromm:tooo));
My6_avg = mean(My6(fromm:tooo));
My7_avg = mean(My7(fromm:tooo));

time1 =0*Ts1:Ts1:Ts1*(length(loadCell_data1{:,2})-1);
time2 =0*Ts1:Ts1:Ts1*(length(loadCell_data2{:,2})-1);
time3 =0*Ts1:Ts1:Ts1*(length(loadCell_data3{:,2})-1);
time4 =0*Ts1:Ts1:Ts1*(length(loadCell_data4{:,2})-1);
time5 =0*Ts1:Ts1:Ts1*(length(loadCell_data5{:,2})-1);
time6 =0*Ts1:Ts1:Ts1*(length(loadCell_data6{:,2})-1);
time7 =0*Ts1:Ts1:Ts1*(length(loadCell_data7{:,2})-1);


Fz1_selection = Fz1(fromm:tooo);
Fz2_selection = Fz2(fromm:tooo);
Fz3_selection = Fz3(fromm:tooo);
Fz4_selection = Fz4(fromm:tooo);
Fz5_selection = Fz5(fromm:tooo);
Fz6_selection = Fz6(fromm:tooo);
Fz7_selection = Fz7(fromm:tooo);
Fx1_selection = Fx1(fromm:tooo);
Fx2_selection = Fx2(fromm:tooo);
Fx3_selection = Fx3(fromm:tooo);
Fx4_selection = Fx4(fromm:tooo);
Fx5_selection = Fx5(fromm:tooo);
Fx6_selection = Fx6(fromm:tooo);
Fx7_selection = Fx7(fromm:tooo);
Fy1_selection = Fy1(fromm:tooo);
Fy2_selection = Fy2(fromm:tooo);
Fy3_selection = Fy3(fromm:tooo);
Fy4_selection = Fy4(fromm:tooo);
Fy5_selection = Fy5(fromm:tooo);
Fy6_selection = Fy6(fromm:tooo);
Fy7_selection = Fy7(fromm:tooo);

Mz1_selection = Mz1(fromm:tooo);
Mz2_selection = Mz2(fromm:tooo);
Mz3_selection = Mz3(fromm:tooo);
Mz4_selection = Mz4(fromm:tooo);
Mz5_selection = Mz5(fromm:tooo);
Mz6_selection = Mz6(fromm:tooo);
Mz7_selection = Mz7(fromm:tooo);
Mx1_selection = Mx1(fromm:tooo);
Mx2_selection = Mx2(fromm:tooo);
Mx3_selection = Mx3(fromm:tooo);
Mx4_selection = Mx4(fromm:tooo);
Mx5_selection = Mx5(fromm:tooo);
Mx6_selection = Mx6(fromm:tooo);
Mx7_selection = Mx7(fromm:tooo);
My1_selection = My1(fromm:tooo);
My2_selection = My2(fromm:tooo);
My3_selection = My3(fromm:tooo);
My4_selection = My4(fromm:tooo);
My5_selection = My5(fromm:tooo);
My6_selection = My6(fromm:tooo);
My7_selection = My7(fromm:tooo);

Fz1_std = std(Fz1(fromm:tooo));
Fz2_std = std(Fz2(fromm:tooo));
Fz3_std = std(Fz3(fromm:tooo));
Fz4_std = std(Fz4(fromm:tooo));
Fz5_std = std(Fz5(fromm:tooo));
Fz6_std = std(Fz6(fromm:tooo));
Fz7_std = std(Fz7(fromm:tooo));

Fzavg = [Fz1_avg;
    Fz2_avg;
    Fz3_avg;
    Fz4_avg;
    Fz5_avg;
    Fz6_avg;
    Fz7_avg];

Fxavg = [Fx1_avg;
         Fx2_avg;
         Fx3_avg;
         Fx4_avg;
         Fx5_avg;
         Fx6_avg;
         Fx7_avg];
Fyavg = [Fy1_avg;
         Fy2_avg;
         Fy3_avg;
         Fy4_avg;
         Fy5_avg;
         Fy6_avg;
         Fy7_avg];

Mxavg = [Mx1_avg;
         Mx2_avg;
         Mx3_avg;
         Mx4_avg;
         Mx5_avg;
         Mx6_avg;
         Mx7_avg];

Myavg = [My1_avg;
         My2_avg;
         My3_avg;
         My4_avg;
         My5_avg;
         My6_avg;
         My7_avg];

Mzavg = [Mz1_avg;
         Mz2_avg;
         Mz3_avg;
         Mz4_avg;
         Mz5_avg;
         Mz6_avg;
         Mz7_avg];


Fzstd = [Fz1_std;
    Fz2_std;
    Fz3_std;
    Fz4_std;
    Fz5_std;
    Fz6_std;
    Fz7_std];

rel_err1 = abs((My1_avg-M_expected(1))/M_expected(1))*100;
rel_err2 = abs((My2_avg-M_expected(2))/M_expected(2))*100;
rel_err3 = abs((My3_avg-M_expected(3))/M_expected(3))*100;
rel_err4 = abs((My4_avg-M_expected(4))/M_expected(4))*100;
rel_err5 = abs((My5_avg-M_expected(5))/M_expected(5))*100;
rel_err6 = abs((My6_avg-M_expected(6))/M_expected(6))*100;
rel_err7 = abs((My7_avg-M_expected(7))/M_expected(7))*100;
rel_err = [rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6,rel_err7]'
avg_relErr = mean([rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6,rel_err7]);
fprintf('The average relative error is: %f \n', avg_relErr)
abs_err1 = abs((My1_avg-M_expected(1)));
abs_err2 = abs((My2_avg-M_expected(2)));
abs_err3 = abs((My3_avg-M_expected(3)));
abs_err4 = abs((My4_avg-M_expected(4)));
abs_err5 = abs((My5_avg-M_expected(5)));
abs_err6 = abs((My6_avg-M_expected(6)));
abs_err7 = abs((My7_avg-M_expected(7)));
abs_err = [abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6,abs_err7]'
avg_absErr = mean([abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6,abs_err7]);
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

% UncA_Mx1_1 = std(Mx1_avg-M_expected(1))/sqrt(length(Mx1_avg));
% UncA_Mx2_1 = std(Mx2_avg-M_expected(2))/sqrt(length(Mx2_avg));
% UncA_Mx3_1 = std(Mx3_avg-M_expected(3))/sqrt(length(Mx3_avg));
% UncA_Mx4_1 = std(Mx4_avg-M_expected(4))/sqrt(length(Mx4_avg));
% UncA_Mx5_1 = std(Mx5_avg-M_expected(5))/sqrt(length(Mx5_avg));
% UncA_Mx6_1 = std(Mx6_avg-M_expected(6))/sqrt(length(Mx6_avg));
% UncA_Mx1_2 = std(Mx1_selection-M_expected(1))/sqrt(length(Mx1_selection));
% UncA_Mx2_2 = std(Mx2_selection-M_expected(2))/sqrt(length(Mx2_selection));
% UncA_Mx3_2 = std(Mx3_selection-M_expected(3))/sqrt(length(Mx3_selection));
% UncA_Mx4_2 = std(Mx4_selection-M_expected(4))/sqrt(length(Mx4_selection));
% UncA_Mx5_2 = std(Mx5_selection-M_expected(5))/sqrt(length(Mx5_selection));
% UncA_Mx6_2 = std(Mx6_selection-M_expected(6))/sqrt(length(Mx6_selection));

%% Type B uncertainty
%%% Uncertainty based on parameters found in the datasheet or throughout
%%% methods other than direct measurement

% Fxy_resol  = 0.025;
% Fz_resol   = 0.05;
% Mxyz_resol = 0.002;
% 
% UncB_Fxy   = (Fxy_resol/2)/sqrt(3);
% UncB_Fz    = (Fz_resol/2)/sqrt(3);
% UncB_Mxyz  = (Mxyz_resol/2)/sqrt(3);

%% Combined standard uncertainty
%%%% CSU = sqrt(u1+...+un)
%%%% U = k*CSU; %with k = 2 for a 95% confidence interval

% k = 2;
% 
% CSU_Mx1_1 = sqrt(UncA_Mx1_1^2+UncB_Mxyz^2);
% CSU_Mx2_1 = sqrt(UncA_Mx2_1^2+UncB_Mxyz^2);
% CSU_Mx3_1 = sqrt(UncA_Mx3_1^2+UncB_Mxyz^2);
% CSU_Mx4_1 = sqrt(UncA_Mx4_1^2+UncB_Mxyz^2);
% CSU_Mx5_1 = sqrt(UncA_Mx5_1^2+UncB_Mxyz^2);
% CSU_Mx6_1 = sqrt(UncA_Mx6_1^2+UncB_Mxyz^2);
% CSU_Mx1_2 = sqrt(UncA_Mx1_2^2+UncB_Mxyz^2);
% CSU_Mx2_2 = sqrt(UncA_Mx2_2^2+UncB_Mxyz^2);
% CSU_Mx3_2 = sqrt(UncA_Mx3_2^2+UncB_Mxyz^2);
% CSU_Mx4_2 = sqrt(UncA_Mx4_2^2+UncB_Mxyz^2);
% CSU_Mx5_2 = sqrt(UncA_Mx5_2^2+UncB_Mxyz^2);
% CSU_Mx6_2 = sqrt(UncA_Mx6_2^2+UncB_Mxyz^2);
% 
% U_Mx_1 = k*[CSU_Mx1_1;
%             CSU_Mx2_1;
%             CSU_Mx3_1;
%             CSU_Mx4_1;
%             CSU_Mx5_1;
%             CSU_Mx6_1];
% 
% U_Mx_2 = k*[CSU_Mx1_2;
%             CSU_Mx2_2;
%             CSU_Mx3_2;
%             CSU_Mx4_2;
%             CSU_Mx5_2;
%             CSU_Mx6_2];
% 
% U_M1 = mean(U_Mx_1);
% U_M2 = mean(U_Mx_2);
% fprintf('The average uncertainty method 1 is: %f \n', U_M1)
% fprintf('The average uncertainty method 2 is: %f \n', U_M2)

%% %% Plotting %%%%
figure()
hold on; grid on;
plot(My1,'lineWidth',2)
plot(My2,'lineWidth',2)
plot(My3,'lineWidth',2)
plot(My4,'lineWidth',2)
plot(My5,'lineWidth',2)
plot(My6,'lineWidth',2)
plot(My7,'lineWidth',2)
xlabel('Datapoints')
ylabel('My1 [Nm]')
legend

% figure()
% plot(time1, Fz1,'lineWidth',2)
% hold on;
% plot(time2, Fz2,'lineWidth',2)
% plot(time3, Fz3,'lineWidth',2)
% plot(time4, Fz4,'lineWidth',2)
% plot(time5, Fz5,'lineWidth',2)
% plot(time6, Fz6,'lineWidth',2)
% plot(time1,F_expected(1)*ones(1,length(time1)),'-','lineWidth',1.5,'color','k')
% plot(time2,F_expected(2)*ones(1,length(time2)),'-','lineWidth',1.5,'color','k')
% plot(time3,F_expected(3)*ones(1,length(time3)),'-','lineWidth',1.5,'color','k')
% plot(time4,F_expected(4)*ones(1,length(time4)),'-','lineWidth',1.5,'color','k')
% plot(time5,F_expected(5)*ones(1,length(time5)),'-','lineWidth',1.5,'color','k')
% plot(time6,F_expected(6)*ones(1,length(time6)),'-','lineWidth',1.5,'color','k')
% ylabel('F_z [N]')
% xlabel('Time [s]')
% N = [1:1:length(weight)];
% legendStrings = weight(N) + "Kg";
% legend(legendStrings)
% title(Title)
% grid on

figure()
hold on;
plot(time1, My1,'lineWidth',2)
plot(time2, My2,'lineWidth',2)
plot(time3, My3,'lineWidth',2)
plot(time4, My4,'lineWidth',2)
plot(time5, My5,'lineWidth',2)
plot(time6, My6,'lineWidth',2)
plot(time7, My7,'lineWidth',2)
plot(time1,M_expected(1)*ones(1,length(time1)),'-','lineWidth',1.5,'color','k')
plot(time2,M_expected(2)*ones(1,length(time2)),'-','lineWidth',1.5,'color','k')
plot(time3,M_expected(3)*ones(1,length(time3)),'-','lineWidth',1.5,'color','k')
plot(time4,M_expected(4)*ones(1,length(time4)),'-','lineWidth',1.5,'color','k')
plot(time5,M_expected(5)*ones(1,length(time5)),'-','lineWidth',1.5,'color','k')
plot(time6,M_expected(6)*ones(1,length(time6)),'-','lineWidth',1.5,'color','k')
plot(time7,M_expected(7)*ones(1,length(time7)),'-','lineWidth',1.5,'color','k')
ylabel('M_y [N]')
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
hold on
plot(M_expected(1), My1_avg,'o', 'lineWidth',2)
plot(M_expected(2), My2_avg,'o', 'lineWidth',2)
plot(M_expected(3), My3_avg,'o', 'lineWidth',2)
plot(M_expected(4), My4_avg,'o', 'lineWidth',2)
plot(M_expected(5), My5_avg,'o', 'lineWidth',2)
plot(M_expected(6), My6_avg,'o', 'lineWidth',2)
plot(M_expected(7), My7_avg,'o', 'lineWidth',2)
plot([M_expected],[M_expected],'-', 'lineWidth',1.5)
ylabel('Measured value My [Nm]')
xlabel('True Value [N]')
N = [1:1:length(weight)];
legendStrings = weight(N) + "Kg";
legend(legendStrings)
title(Title)
grid on

%%% Relative error
figure()
hold on
plot(M_expected(1), rel_err1,'o', 'lineWidth',2)
plot(M_expected(2), rel_err2,'o', 'lineWidth',2)
plot(M_expected(3), rel_err3,'o', 'lineWidth',2)
plot(M_expected(4), rel_err4,'o', 'lineWidth',2)
plot(M_expected(5), rel_err5,'o', 'lineWidth',2)
plot(M_expected(6), rel_err6,'o', 'lineWidth',2)
plot(M_expected(7), rel_err7,'o', 'lineWidth',2)
% N = [1:1:7];
% legendStrings = F_expected(N) + "N";
% legend(legendStrings)
ylabel('Relative error [%]')
xlabel('M expected [Nm]')
title(Title)
grid on

%%% Absolute error
figure()
hold on
plot(M_expected(1), abs_err1,'o', 'lineWidth',2)
plot(M_expected(2), abs_err2,'o', 'lineWidth',2)
plot(M_expected(3), abs_err3,'o', 'lineWidth',2)
plot(M_expected(4), abs_err4,'o', 'lineWidth',2)
plot(M_expected(5), abs_err5,'o', 'lineWidth',2)
plot(M_expected(6), abs_err6,'o', 'lineWidth',2)
plot(M_expected(7), abs_err7,'o', 'lineWidth',2)
% plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
% N = [1:1:7];
% legendStrings = F_expected(N) + "N";
% legend(legendStrings)
ylabel('Absolute error [Nm]')
xlabel('M expected [Nm]')
title(Title)
grid on

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
subplot(3,1,1)
plot(time1,Fx1, 'lineWidth',2)
hold on
plot(time2,Fx2, 'lineWidth',2)
plot(time3,Fx3, 'lineWidth',2)
plot(time4,Fx4, 'lineWidth',2)
plot(time5,Fx5, 'lineWidth',2)
plot(time6,Fx6, 'lineWidth',2)
plot(time7,Fx7, 'lineWidth',2)
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
plot(time7,Fy7, 'lineWidth',2)
ylabel('Fy [N]')
subplot(3,1,3)
plot(time1,Fz1, 'lineWidth',2)
hold on;grid on;
plot(time2,Fz2, 'lineWidth',2)
plot(time3,Fz3, 'lineWidth',2)
plot(time4,Fz4, 'lineWidth',2)
plot(time5,Fz5, 'lineWidth',2)
plot(time6,Fz6, 'lineWidth',2)
plot(time7,Fz7, 'lineWidth',2)
ylabel('Fz [N]')
xlabel('Time [s]')

figure()
subplot(3,1,1)
plot(time1,Mx1, 'lineWidth',2)
hold on
plot(time2,Mx2, 'lineWidth',2)
plot(time3,Mx3, 'lineWidth',2)
plot(time4,Mx4, 'lineWidth',2)
plot(time5,Mx5, 'lineWidth',2)
plot(time6,Mx6, 'lineWidth',2)
plot(time7,Mx7, 'lineWidth',2)
ylabel('Mx [Nm]')
grid on
subplot(3,1,2)
plot(time1,My1, 'lineWidth',2)
hold on;grid on;
plot(time2,My2, 'lineWidth',2)
plot(time3,My3, 'lineWidth',2)
plot(time4,My4, 'lineWidth',2)
plot(time5,My5, 'lineWidth',2)
plot(time6,My6, 'lineWidth',2)
plot(time7,My7, 'lineWidth',2)
ylabel('My [Nm]')
subplot(3,1,3)
plot(time1,Mz1, 'lineWidth',2)
hold on;grid on;
plot(time2,Mz2, 'lineWidth',2)
plot(time3,Mz3, 'lineWidth',2)
plot(time4,Mz4, 'lineWidth',2)
plot(time5,Mz5, 'lineWidth',2)
plot(time6,Mz6, 'lineWidth',2)
plot(time7,Mz7, 'lineWidth',2)
ylabel('Mz [Nm]')
xlabel('Time [s]')
