close all
%%%% File selection and loading of data

file1 = '../LogFiles/SensorComparison/Individual/JR3_test500g_Mx.csv'; %LoadCell
file2 = '../LogFiles/SensorComparison/Individual/ATI_test100g_Mx.csv'; %LoadCell

weight= [500e-3;100e-3];%kg
g = 9.798; %m/s² 
F_expected = -1*g*weight; %N
dist1 = 99.95e-3;
dist2 = 314.6625e-3;
dist = [dist1;dist2]; %m
M_expected = F_expected.*dist;
Ts2 = 1/150;
f_cutoff = 0.5;
f_sampling = 1/Ts2;
w_n = f_cutoff/(f_sampling/2);  % Cutoff frequency
[b_5,a_5] = butter(5,w_n,'low');   % Create Butterworth filter of order 5
%%% Text for plots
Title = 'Fz individual tests';

fx_column = 2;
fy_column = 3;
fz_column = 4;
mx_column = 5;
my_column = 6;
mz_column = 7;

loadCell_data1 = readtable(file1);
loadCell_data2 = readtable(file2);





%%%% Data processing %%%%

adjusting = 0;

indx1 = 1; % Index for load cell test 1
indx2 = 1; % Index for RPM test 1

time1 = loadCell_data1{1:end-indx1+1,1}./10;
time2 =[0*Ts2:Ts2:Ts2*(length(loadCell_data2{:,2})-1)];


fromm=400;
tooo=800;
timeRPMfactor = 7;
offset1 = 21;
offset2 = 21;

Fz1 = loadCell_data1{indx1:end,fz_column}-loadCell_data1{21,fz_column};
Fz2 = loadCell_data2{indx2:end,fz_column-1}-loadCell_data2{21,fz_column-1};


Fz1_avg = mean(loadCell_data1{fromm:tooo,fz_column})-loadCell_data1{21,fz_column};
Fz2_avg = mean(loadCell_data2{fromm:tooo,fz_column-1})-loadCell_data2{21,fz_column-1};

Mx1 = (loadCell_data1{indx1:end,mx_column}-loadCell_data1{offset1,mx_column})/10;
Mx2 = (loadCell_data2{indx2:end,mx_column-1});%-loadCell_data2{offset2,mx_column-1});

My1 = (loadCell_data1{indx1:end,my_column}-loadCell_data1{offset1,my_column})/10;
My2 = (loadCell_data2{indx2:end,my_column-1}-loadCell_data2{offset2,my_column-1});

Mz1 = (loadCell_data1{indx1:end,mz_column}-loadCell_data1{offset1,mz_column})/10;
Mz2 = (loadCell_data2{indx2:end,mz_column-1}-loadCell_data2{offset2,mz_column-1});


Fx1 = loadCell_data1{indx1:end,fx_column}-loadCell_data1{1,fx_column};
Fy1 = loadCell_data1{indx1:end,fy_column}-loadCell_data1{1,fy_column};
F1tot = sqrt(abs(Fx1).^2+abs(Fy1).^2);
Fx2 = loadCell_data2{indx2:end,fx_column}-loadCell_data2{1,fx_column-1};
Fy2 = loadCell_data2{indx2:end,fy_column}-loadCell_data2{1,fy_column-1};
F2tot = sqrt(abs(Fx2).^2+abs(Fy2).^2);

Fz1_selection = loadCell_data1{fromm:tooo,fz_column}-loadCell_data1{21,fz_column};
Fz2_selection = loadCell_data2{fromm:tooo,fz_column-1}-loadCell_data2{21,fz_column-1};

%%%%% Average
Fx1_avg = mean(loadCell_data1{fromm:tooo,fx_column}-loadCell_data1{1,fx_column});
Fy1_avg = mean(loadCell_data1{fromm:tooo,fy_column}-loadCell_data1{1,fy_column});
F1tot_avg = sign(Fy1_avg)*sqrt(abs(Fx1_avg).^2+abs(Fy1_avg).^2);
Fx2_avg = mean(loadCell_data2{fromm:tooo,fx_column-1}-loadCell_data2{1,fx_column-1});
Fy2_avg = mean(loadCell_data2{fromm:tooo,fy_column-1}-loadCell_data2{1,fy_column-1});
F2tot_avg = sign(Fy2_avg)*sqrt(abs(Fx2_avg).^2+abs(Fy2_avg).^2);

Fz1_std = std(loadCell_data1{fromm:tooo,fz_column}-loadCell_data1{21,fz_column});
Fz2_std = std(loadCell_data2{fromm:tooo,fz_column-1}-loadCell_data2{21,fz_column-1});

Fzavg = [Fz1_avg;
    Fz2_avg];
Fzstd = [Fz1_std;
    Fz2_std];

filtered_Fz2 = filter(b_5, a_5,Fz2);
filtered_Mx2 = -1*filter(b_5, a_5,Mx2);

rel_err1 = abs((Fz1_avg-F_expected(1))/F_expected(1))*100;
rel_err2 = abs((Fz2_avg-F_expected(2))/F_expected(2))*100;

avg_relErr = mean([rel_err1,rel_err2]);
fprintf('The average relative error is: %f \n', avg_relErr)
abs_err1 = abs((Fz1_avg-F_expected(1)));
abs_err2 = abs((Fz2_avg-F_expected(2)));

avg_absErr = mean([abs_err1,abs_err2]);
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

UncA_Fz1_2 = std(Fz1_selection-F_expected(1))/sqrt(length(Fz1_selection));
UncA_Fz2_2 = std(Fz2_selection-F_expected(2))/sqrt(length(Fz2_selection));


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

%% %% Plotting %%%%

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
plot(time1, Mx1,'lineWidth',2)
hold on;
% plot(time2, Fz2,'lineWidth',2)
plot(time2, filtered_Mx2,'lineWidth',2)
plot([0:length(time1)],M_expected(1)*ones(1,length(time1)+1),'-', 'linewidth',1.5)
plot([0:length(time2)],M_expected(2)*ones(1,length(time2)+1),'-', 'linewidth',1.5)
ylabel('M_x [N]')
xlabel('Time [s]')
legend('JR3', 'ATI', 'Expected value')
% title('M_x [N]')
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
figure()
plot(F_expected(1), rel_err1,'o', 'lineWidth',2)
hold on
plot(F_expected(2), rel_err2,'o', 'lineWidth',2)
% plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
N = [1:1:7];
legendStrings = F_expected(N) + "N";
legend(legendStrings)
ylabel('Relative error [%]')
xlabel('F expected [N]')
title(Title)
grid on

%%% Absolute error
figure()
plot(F_expected(1), abs_err1,'o', 'lineWidth',2)
hold on
plot(F_expected(2), abs_err2,'o', 'lineWidth',2)
% plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
N = [1:1:7];
legendStrings = F_expected(N) + "N";
legend(legendStrings)
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

% figure()
% plot(F_expected(1), -Fy1_avg,'o', 'lineWidth',2)
% hold on
% plot(F_expected(2), -Fy2_avg,'o', 'lineWidth',2)
% plot(F_expected(3), -Fy3_avg,'o', 'lineWidth',2)
% plot(F_expected(4), -Fy4_avg,'o', 'lineWidth',2)
% plot(F_expected(5), -Fy5_avg,'o', 'lineWidth',2)
% plot(F_expected(6), -Fy6_avg,'o', 'lineWidth',2)
% plot(F_expected(7), -Fy7_avg,'o', 'lineWidth',2)
% plot(F_expected(8), -Fy8_avg,'o', 'lineWidth',2)
% % plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
% ylabel('Measured value Fy [N]')
% xlabel('True Value [N]')
% title(Title)
% grid on


figure()
plot(time1,F1tot, 'lineWidth',2)
hold on
plot(time2,F2tot, 'lineWidth',2)
ylabel('F htal [N]')
xlabel('Time [s]')
hold on 
title(Title)
grid on


figure()
plot(1, F1tot_avg,'o', 'lineWidth',2)
hold on
plot(2, F2tot_avg,'o', 'lineWidth',2)
N = [1:1:length(weight)];
legendStrings = weight(N) + "Kg";
legend(legendStrings)
% plot([F_expected],[F_expected],'-', 'lineWidth',1.5)
ylabel('Measured value Ftot [N]')
xlabel('True Value [N]')
title(Title)
grid on


%Uncertainty
figure()
% plot(weight(1:end-1),U_Fx_1(1:end-1),'o','lineWidth',2)
% hold on;
% plot(weight(1:end-1),U_Fx_2(1:end-1),'o','lineWidth',2)
plot(weight(1:end),U_Fz_2(1:end),'o','lineWidth',2)
legend('Method 2');
title('Uncertainty estimation')
ylabel('Uncertainty value [\pm N]')
xlabel('Weight [kg]')
grid on

