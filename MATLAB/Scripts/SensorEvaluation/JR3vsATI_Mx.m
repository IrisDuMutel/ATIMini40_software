close all
clear variables
%%%% File selection and loading of data
%% ATI
file1 = '../../LogFiles/SensorComparison/Individual/ATI_test10g_Mx_test1.csv'; %LoadCell
file2 = '../../LogFiles/SensorComparison/Individual/ATI_test20g_Mx_test1.csv'; %LoadCell
file3 = '../../LogFiles/SensorComparison/Individual/ATI_test30g_Mx_test1.csv'; %LoadCell
file4 = '../../LogFiles/SensorComparison/Individual/ATI_test40g_Mx_test1.csv'; %LoadCell
file5 = '../../LogFiles/SensorComparison/Individual/ATI_test50g_Mx_test2.csv'; %LoadCell
file6 = '../../LogFiles/SensorComparison/Individual/ATI_test100g_Mx_test1.csv'; %LoadCell
file7 = '../../LogFiles/SensorComparison/Individual/ATI_test200g_Mx_test1.csv'; %LoadCell

weight= [10e-3;
         20e-3;
         30e-3;
         40e-3;
         50e-3;
         100e-3;
         200e-3];%kg


%%% Text for plots
Title = 'M_x static tests';

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
F_expected_ATI = 1*g*weight; %N
dist = 314.6625e-3; %m
M_expected_ATI = F_expected_ATI*dist;
Ts1 = 1/150;
f_cutoff = 0.5;
f_sampling = 1/Ts1;
w_n = f_cutoff/(f_sampling/2);  % Cutoff frequency
[b_5,a_5] = butter(5,w_n,'low');   % Create Butterworth filter of order 5
fromm=10000;
tooo=14000;
offset1 = 1;
offset2 = 1;
offset3 = 1;
offset4 = 1;
offset5 = 1;
offset6 = 1;
offset7 = 1;


Fx1_ATI = filter(b_5, a_5,loadCell_data1{indx1:end,fx_column});
Fx2_ATI = filter(b_5, a_5,loadCell_data2{indx2:end,fx_column});
Fx3_ATI = filter(b_5, a_5,loadCell_data3{indx3:end,fx_column});
Fx4_ATI = filter(b_5, a_5,loadCell_data4{indx4:end,fx_column});
Fx5_ATI = filter(b_5, a_5,loadCell_data5{indx5:end,fx_column});
Fx6_ATI = filter(b_5, a_5,loadCell_data6{indx6:end,fx_column});
Fx7_ATI = filter(b_5, a_5,loadCell_data7{indx7:end,fx_column});
Fy1_ATI = filter(b_5, a_5,loadCell_data1{indx1:end,fy_column});
Fy2_ATI = filter(b_5, a_5,loadCell_data2{indx2:end,fy_column});
Fy3_ATI = filter(b_5, a_5,loadCell_data3{indx3:end,fy_column});
Fy4_ATI = filter(b_5, a_5,loadCell_data4{indx4:end,fy_column});
Fy5_ATI = filter(b_5, a_5,loadCell_data5{indx5:end,fy_column});
Fy6_ATI = filter(b_5, a_5,loadCell_data6{indx6:end,fy_column});
Fy7_ATI = filter(b_5, a_5,loadCell_data7{indx7:end,fy_column});
Fz1_ATI = filter(b_5, a_5,loadCell_data1{indx1:end,fz_column});
Fz2_ATI = filter(b_5, a_5,loadCell_data2{indx2:end,fz_column});
Fz3_ATI = filter(b_5, a_5,loadCell_data3{indx3:end,fz_column});
Fz4_ATI = filter(b_5, a_5,loadCell_data4{indx4:end,fz_column});
Fz5_ATI = filter(b_5, a_5,loadCell_data5{indx5:end,fz_column});
Fz6_ATI = filter(b_5, a_5,loadCell_data6{indx6:end,fz_column});
Fz7_ATI = filter(b_5, a_5,loadCell_data7{indx7:end,fz_column});

Fx1_ATI = Fx1_ATI - Fx1_ATI(offset1);
Fx2_ATI = Fx2_ATI - Fx2_ATI(offset2);
Fx3_ATI = Fx3_ATI - Fx3_ATI(offset3);
Fx4_ATI = Fx4_ATI - Fx4_ATI(offset4);
Fx5_ATI = Fx5_ATI - Fx5_ATI(offset5);
Fx6_ATI = Fx6_ATI - Fx6_ATI(offset6);
Fx7_ATI = Fx7_ATI - Fx7_ATI(offset7);
Fy1_ATI = Fy1_ATI - Fy1_ATI(offset1);
Fy2_ATI = Fy2_ATI - Fy2_ATI(offset2);
Fy3_ATI = Fy3_ATI - Fy3_ATI(offset3);
Fy4_ATI = Fy4_ATI - Fy4_ATI(offset4);
Fy5_ATI = Fy5_ATI - Fy5_ATI(offset5);
Fy6_ATI = Fy6_ATI - Fy6_ATI(offset6);
Fy7_ATI = Fy7_ATI - Fy7_ATI(offset7);
Fz1_ATI = Fz1_ATI - Fz1_ATI(offset1);
Fz2_ATI = Fz2_ATI - Fz2_ATI(offset2);
Fz3_ATI = Fz3_ATI - Fz3_ATI(offset3);
Fz4_ATI = Fz4_ATI - Fz4_ATI(offset4);
Fz5_ATI = Fz5_ATI - Fz5_ATI(offset5);
Fz6_ATI = Fz6_ATI - Fz6_ATI(offset6);
Fz7_ATI = Fz7_ATI - Fz7_ATI(offset7);

figure()
plot(Fz1_ATI,'linewidth',2)
hold on
plot(Fz2_ATI,'linewidth',2)
plot(Fz3_ATI,'linewidth',2)
plot(Fz4_ATI,'linewidth',2)
plot(Fz5_ATI,'linewidth',2)
plot(Fz6_ATI,'linewidth',2)
plot(Fz7_ATI,'linewidth',2)
legend()
xlabel('Datapoints [-]')
ylabel('F_z [N]')

Mx1_ATI = filter(b_5, a_5,loadCell_data1{indx1:end,mx_column});
Mx2_ATI = filter(b_5, a_5,loadCell_data2{indx2:end,mx_column});
Mx3_ATI = filter(b_5, a_5,loadCell_data3{indx3:end,mx_column});
Mx4_ATI = filter(b_5, a_5,loadCell_data4{indx4:end,mx_column});
Mx5_ATI = filter(b_5, a_5,loadCell_data5{indx5:end,mx_column});
Mx6_ATI = filter(b_5, a_5,loadCell_data6{indx6:end,mx_column});
Mx7_ATI = filter(b_5, a_5,loadCell_data7{indx7:end,mx_column});
My1_ATI = filter(b_5, a_5,loadCell_data1{indx1:end,my_column});
My2_ATI = filter(b_5, a_5,loadCell_data2{indx2:end,my_column});
My3_ATI = filter(b_5, a_5,loadCell_data3{indx3:end,my_column});
My4_ATI = filter(b_5, a_5,loadCell_data4{indx4:end,my_column});
My5_ATI = filter(b_5, a_5,loadCell_data5{indx5:end,my_column});
My6_ATI = filter(b_5, a_5,loadCell_data6{indx6:end,my_column});
My7_ATI = filter(b_5, a_5,loadCell_data7{indx7:end,my_column});
Mz1_ATI = filter(b_5, a_5,loadCell_data1{indx1:end,mz_column});
Mz2_ATI = filter(b_5, a_5,loadCell_data2{indx2:end,mz_column});
Mz3_ATI = filter(b_5, a_5,loadCell_data3{indx3:end,mz_column});
Mz4_ATI = filter(b_5, a_5,loadCell_data4{indx4:end,mz_column});
Mz5_ATI = filter(b_5, a_5,loadCell_data5{indx5:end,mz_column});
Mz6_ATI = filter(b_5, a_5,loadCell_data6{indx6:end,mz_column});
Mz7_ATI = filter(b_5, a_5,loadCell_data7{indx7:end,mz_column});

Mx1_ATI = Mx1_ATI - Mx1_ATI(offset1);
Mx2_ATI = Mx2_ATI - Mx2_ATI(offset2);
Mx3_ATI = Mx3_ATI - Mx3_ATI(offset3);
Mx4_ATI = Mx4_ATI - Mx4_ATI(offset4);
Mx5_ATI = Mx5_ATI - Mx5_ATI(offset5);
Mx6_ATI = Mx6_ATI - Mx6_ATI(offset6);
Mx7_ATI = Mx7_ATI - Mx7_ATI(offset7);
My1_ATI = My1_ATI - My1_ATI(offset1);
My2_ATI = My2_ATI - My2_ATI(offset2);
My3_ATI = My3_ATI - My3_ATI(offset3);
My4_ATI = My4_ATI - My4_ATI(offset4);
My5_ATI = My5_ATI - My5_ATI(offset5);
My6_ATI = My6_ATI - My6_ATI(offset6);
My7_ATI = My7_ATI - My7_ATI(offset7);
Mz1_ATI = Mz1_ATI - Mz1_ATI(offset1);
Mz2_ATI = Mz2_ATI - Mz2_ATI(offset2);
Mz3_ATI = Mz3_ATI - Mz3_ATI(offset3);
Mz4_ATI = Mz4_ATI - Mz4_ATI(offset4);
Mz5_ATI = Mz5_ATI - Mz5_ATI(offset5);
Mz6_ATI = Mz6_ATI - Mz6_ATI(offset6);
Mz7_ATI = Mz7_ATI - Mz7_ATI(offset7);

Fz1_avg_ATI = mean(Fz1_ATI(fromm:tooo));
Fz2_avg_ATI = mean(Fz2_ATI(fromm:tooo));
Fz3_avg_ATI = mean(Fz3_ATI(fromm:tooo));
Fz4_avg_ATI = mean(Fz4_ATI(fromm:tooo));
Fz5_avg_ATI = mean(Fz5_ATI(fromm:tooo));
Fz6_avg_ATI = mean(Fz6_ATI(fromm:tooo));
Fz7_avg_ATI = mean(Fz7_ATI(fromm:tooo));
Fx1_avg_ATI = mean(Fx1_ATI(fromm:tooo));
Fx2_avg_ATI = mean(Fx2_ATI(fromm:tooo));
Fx3_avg_ATI = mean(Fx3_ATI(fromm:tooo));
Fx4_avg_ATI = mean(Fx4_ATI(fromm:tooo));
Fx5_avg_ATI = mean(Fx5_ATI(fromm:tooo));
Fx6_avg_ATI = mean(Fx6_ATI(fromm:tooo));
Fx7_avg_ATI = mean(Fx7_ATI(fromm:tooo));
Fy1_avg_ATI = mean(Fy1_ATI(fromm:tooo));
Fy2_avg_ATI = mean(Fy2_ATI(fromm:tooo));
Fy3_avg_ATI = mean(Fy3_ATI(fromm:tooo));
Fy4_avg_ATI = mean(Fy4_ATI(fromm:tooo));
Fy5_avg_ATI = mean(Fy5_ATI(fromm:tooo));
Fy6_avg_ATI = mean(Fy6_ATI(fromm:tooo));
Fy7_avg_ATI = mean(Fy7_ATI(fromm:tooo));

Mz1_avg_ATI = mean(Mz1_ATI(fromm:tooo));
Mz2_avg_ATI = mean(Mz2_ATI(fromm:tooo));
Mz3_avg_ATI = mean(Mz3_ATI(fromm:tooo));
Mz4_avg_ATI = mean(Mz4_ATI(fromm:tooo));
Mz5_avg_ATI = mean(Mz5_ATI(fromm:tooo));
Mz6_avg_ATI = mean(Mz6_ATI(fromm:tooo));
Mz7_avg_ATI = mean(Mz7_ATI(fromm:tooo));
Mx1_avg_ATI = mean(Mx1_ATI(fromm:tooo));
Mx2_avg_ATI = mean(Mx2_ATI(fromm:tooo));
Mx3_avg_ATI = mean(Mx3_ATI(fromm:tooo));
Mx4_avg_ATI = mean(Mx4_ATI(fromm:tooo));
Mx5_avg_ATI = mean(Mx5_ATI(fromm:tooo));
Mx6_avg_ATI = mean(Mx6_ATI(fromm:tooo));
Mx7_avg_ATI = mean(Mx7_ATI(fromm:tooo));
My1_avg_ATI = mean(My1_ATI(fromm:tooo));
My2_avg_ATI = mean(My2_ATI(fromm:tooo));
My3_avg_ATI = mean(My3_ATI(fromm:tooo));
My4_avg_ATI = mean(My4_ATI(fromm:tooo));
My5_avg_ATI = mean(My5_ATI(fromm:tooo));
My6_avg_ATI = mean(My6_ATI(fromm:tooo));
My7_avg_ATI = mean(My7_ATI(fromm:tooo));

time1 =0*Ts1:Ts1:Ts1*(length(loadCell_data1{:,2})-1);
time2 =0*Ts1:Ts1:Ts1*(length(loadCell_data2{:,2})-1);
time3 =0*Ts1:Ts1:Ts1*(length(loadCell_data3{:,2})-1);
time4 =0*Ts1:Ts1:Ts1*(length(loadCell_data4{:,2})-1);
time5 =0*Ts1:Ts1:Ts1*(length(loadCell_data5{:,2})-1);
time6 =0*Ts1:Ts1:Ts1*(length(loadCell_data6{:,2})-1);
time7 =0*Ts1:Ts1:Ts1*(length(loadCell_data7{:,2})-1);

rel_err1 = abs((Mx1_avg_ATI-M_expected_ATI(1))/M_expected_ATI(1))*100;
rel_err2 = abs((Mx2_avg_ATI-M_expected_ATI(2))/M_expected_ATI(2))*100;
rel_err3 = abs((Mx3_avg_ATI-M_expected_ATI(3))/M_expected_ATI(3))*100;
rel_err4 = abs((Mx4_avg_ATI-M_expected_ATI(4))/M_expected_ATI(4))*100;
rel_err5 = abs((Mx5_avg_ATI-M_expected_ATI(5))/M_expected_ATI(5))*100;
rel_err6 = abs((Mx6_avg_ATI-M_expected_ATI(6))/M_expected_ATI(6))*100;
rel_err7 = abs((Mx7_avg_ATI-M_expected_ATI(7))/M_expected_ATI(7))*100;
rel_err = [rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6,rel_err7]'
avg_relErr = mean([rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6,rel_err7]);
fprintf('The ATI average relative error is: %f \n', avg_relErr)
abs_err1 = abs((Mx1_avg_ATI-M_expected_ATI(1)));
abs_err2 = abs((Mx2_avg_ATI-M_expected_ATI(2)));
abs_err3 = abs((Mx3_avg_ATI-M_expected_ATI(3)));
abs_err4 = abs((Mx4_avg_ATI-M_expected_ATI(4)));
abs_err5 = abs((Mx5_avg_ATI-M_expected_ATI(5)));
abs_err6 = abs((Mx6_avg_ATI-M_expected_ATI(6)));
abs_err7 = abs((Mx7_avg_ATI-M_expected_ATI(7)));
abs_err = [abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6,abs_err7]'
avg_absErr = mean([abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6,abs_err7]);
fprintf('The average ATI absolute error is: %f \n', avg_absErr)

%% JR3
file1 = '../../LogFiles/SensorComparison/Individual/log20221012_test72g1mg_Mx.csv'; %LoadCell
file2 = '../../LogFiles/SensorComparison/Individual/log20221012_test72g3mg_Mx.csv'; %LoadCell
file3 = '../../LogFiles/SensorComparison/Individual/log20221012_test72g6mg_Mx.csv'; %LoadCell
file4 = '../../LogFiles/SensorComparison/Individual/log20221012_test73g2mg_Mx.csv'; %LoadCell
file5 = '../../LogFiles/SensorComparison/Individual/log20221012_test73g5mg_Mx.csv'; %LoadCell
file6 = '../../LogFiles/SensorComparison/Individual/log20221012_test73g7mg_Mx.csv'; %LoadCell
file7 = '../../LogFiles/SensorComparison/Individual/log20221012_test500g_Mx.csv'; %LoadCell

weight= [72.1e-3;
         72.3e-3;
         72.6e-3;
         73.2e-3;
         73.5e-3;
         73.7e-3;
         500e-3];%kg


%%% Text for plots
Title = 'Mx individual tests';

fx_column = 2;
fy_column = 3;
fz_column = 4;
mx_column = 5;
my_column = 6;
mz_column = 7;

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


g = 9.80665; %m/s² 
F_expected_JR3 = 1*g*weight; %N
dist = 99.95e-3; %m
M_expected_JR3 = F_expected_JR3*dist;
fromm=400;
tooo=800;
offset1 = 1;
offset2 = 1;
offset3 = 1;
offset4 = 1;
offset5 = 1;
offset6 = 1;
offset7 = 1;

Fx1_JR3 = loadCell_data1{indx1:end,fx_column};
Fx2_JR3 = loadCell_data2{indx2:end,fx_column};
Fx3_JR3 = loadCell_data3{indx3:end,fx_column};
Fx4_JR3 = loadCell_data4{indx4:end,fx_column};
Fx5_JR3 = loadCell_data5{indx5:end,fx_column};
Fx6_JR3 = loadCell_data6{indx6:end,fx_column};
Fx7_JR3 = loadCell_data7{indx7:end,fx_column};
Fy1_JR3 = loadCell_data1{indx1:end,fy_column};
Fy2_JR3 = loadCell_data2{indx2:end,fy_column};
Fy3_JR3 = loadCell_data3{indx3:end,fy_column};
Fy4_JR3 = loadCell_data4{indx4:end,fy_column};
Fy5_JR3 = loadCell_data5{indx5:end,fy_column};
Fy6_JR3 = loadCell_data6{indx6:end,fy_column};
Fy7_JR3 = loadCell_data7{indx7:end,fy_column};
Fz1_JR3 = loadCell_data1{indx1:end,fz_column};
Fz2_JR3 = loadCell_data2{indx2:end,fz_column};
Fz3_JR3 = loadCell_data3{indx3:end,fz_column};
Fz4_JR3 = loadCell_data4{indx4:end,fz_column};
Fz5_JR3 = loadCell_data5{indx5:end,fz_column};
Fz6_JR3 = loadCell_data6{indx6:end,fz_column};
Fz7_JR3 = loadCell_data7{indx7:end,fz_column};

Fx1_JR3 = Fx1_JR3 - Fx1_JR3(offset1);
Fx2_JR3 = Fx2_JR3 - Fx2_JR3(offset2);
Fx3_JR3 = Fx3_JR3 - Fx3_JR3(offset3);
Fx4_JR3 = Fx4_JR3 - Fx4_JR3(offset4);
Fx5_JR3 = Fx5_JR3 - Fx5_JR3(offset5);
Fx6_JR3 = Fx6_JR3 - Fx6_JR3(offset6);
Fx7_JR3 = Fx7_JR3 - Fx7_JR3(offset7);
Fy1_JR3 = Fy1_JR3 - Fy1_JR3(offset1);
Fy2_JR3 = Fy2_JR3 - Fy2_JR3(offset2);
Fy3_JR3 = Fy3_JR3 - Fy3_JR3(offset3);
Fy4_JR3 = Fy4_JR3 - Fy4_JR3(offset4);
Fy5_JR3 = Fy5_JR3 - Fy5_JR3(offset5);
Fy6_JR3 = Fy6_JR3 - Fy6_JR3(offset6);
Fy7_JR3 = Fy7_JR3 - Fy7_JR3(offset7);
Fz1_JR3 = Fz1_JR3 - Fz1_JR3(offset1);
Fz2_JR3 = Fz2_JR3 - Fz2_JR3(offset2);
Fz3_JR3 = Fz3_JR3 - Fz3_JR3(offset3);
Fz4_JR3 = Fz4_JR3 - Fz4_JR3(offset4);
Fz5_JR3 = Fz5_JR3 - Fz5_JR3(offset5);
Fz6_JR3 = Fz6_JR3 - Fz6_JR3(offset6);
Fz7_JR3 = Fz7_JR3 - Fz7_JR3(offset7);


Mx1_JR3 = -loadCell_data1{indx1:end,mx_column}/10;
Mx2_JR3 = -loadCell_data2{indx2:end,mx_column}/10;
Mx3_JR3 = -loadCell_data3{indx3:end,mx_column}/10;
Mx4_JR3 = -loadCell_data4{indx4:end,mx_column}/10;
Mx5_JR3 = -loadCell_data5{indx5:end,mx_column}/10;
Mx6_JR3 = -loadCell_data6{indx6:end,mx_column}/10;
Mx7_JR3 = -loadCell_data7{indx7:end,mx_column}/10;
My1_JR3 = -loadCell_data1{indx1:end,my_column}/10;
My2_JR3 = -loadCell_data2{indx2:end,my_column}/10;
My3_JR3 = -loadCell_data3{indx3:end,my_column}/10;
My4_JR3 = -loadCell_data4{indx4:end,my_column}/10;
My5_JR3 = -loadCell_data5{indx5:end,my_column}/10;
My6_JR3 = -loadCell_data6{indx6:end,my_column}/10;
My7_JR3 = -loadCell_data7{indx7:end,my_column}/10;
Mz1_JR3 = -loadCell_data1{indx1:end,mz_column}/10;
Mz2_JR3 = -loadCell_data2{indx2:end,mz_column}/10;
Mz3_JR3 = -loadCell_data3{indx3:end,mz_column}/10;
Mz4_JR3 = -loadCell_data4{indx4:end,mz_column}/10;
Mz5_JR3 = -loadCell_data5{indx5:end,mz_column}/10;
Mz6_JR3 = -loadCell_data6{indx6:end,mz_column}/10;
Mz7_JR3 = -loadCell_data7{indx7:end,mz_column}/10;

Mx1_JR3 = Mx1_JR3 - Mx1_JR3(offset1);
Mx2_JR3 = Mx2_JR3 - Mx2_JR3(offset2);
Mx3_JR3 = Mx3_JR3 - Mx3_JR3(offset3);
Mx4_JR3 = Mx4_JR3 - Mx4_JR3(offset4);
Mx5_JR3 = Mx5_JR3 - Mx5_JR3(offset5);
Mx6_JR3 = Mx6_JR3 - Mx6_JR3(offset6);
Mx7_JR3 = Mx7_JR3 - Mx7_JR3(offset7);
My1_JR3 = My1_JR3 - My1_JR3(offset1);
My2_JR3 = My2_JR3 - My2_JR3(offset2);
My3_JR3 = My3_JR3 - My3_JR3(offset3);
My4_JR3 = My4_JR3 - My4_JR3(offset4);
My5_JR3 = My5_JR3 - My5_JR3(offset5);
My6_JR3 = My6_JR3 - My6_JR3(offset6);
My7_JR3 = My7_JR3 - My7_JR3(offset7);
Mz1_JR3 = Mz1_JR3 - Mz1_JR3(offset1);
Mz2_JR3 = Mz2_JR3 - Mz2_JR3(offset2);
Mz3_JR3 = Mz3_JR3 - Mz3_JR3(offset3);
Mz4_JR3 = Mz4_JR3 - Mz4_JR3(offset4);
Mz5_JR3 = Mz5_JR3 - Mz5_JR3(offset5);
Mz6_JR3 = Mz6_JR3 - Mz6_JR3(offset6);
Mz7_JR3 = Mz7_JR3 - Mz7_JR3(offset7);

Fz1_avg_JR3 = mean(Fz1_JR3(fromm:tooo));
Fz2_avg_JR3 = mean(Fz2_JR3(fromm:tooo));
Fz3_avg_JR3 = mean(Fz3_JR3(fromm:tooo));
Fz4_avg_JR3 = mean(Fz4_JR3(fromm:tooo));
Fz5_avg_JR3 = mean(Fz5_JR3(fromm:tooo));
Fz6_avg_JR3 = mean(Fz6_JR3(fromm:tooo));
Fz7_avg_JR3 = mean(Fz7_JR3(fromm:tooo));
Fx1_avg_JR3 = mean(Fx1_JR3(fromm:tooo));
Fx2_avg_JR3 = mean(Fx2_JR3(fromm:tooo));
Fx3_avg_JR3 = mean(Fx3_JR3(fromm:tooo));
Fx4_avg_JR3 = mean(Fx4_JR3(fromm:tooo));
Fx5_avg_JR3 = mean(Fx5_JR3(fromm:tooo));
Fx6_avg_JR3 = mean(Fx6_JR3(fromm:tooo));
Fx7_avg_JR3 = mean(Fx7_JR3(fromm:tooo));
Fy1_avg_JR3 = mean(Fy1_JR3(fromm:tooo));
Fy2_avg_JR3 = mean(Fy2_JR3(fromm:tooo));
Fy3_avg_JR3 = mean(Fy3_JR3(fromm:tooo));
Fy4_avg_JR3 = mean(Fy4_JR3(fromm:tooo));
Fy5_avg_JR3 = mean(Fy5_JR3(fromm:tooo));
Fy6_avg_JR3 = mean(Fy6_JR3(fromm:tooo));
Fy7_avg_JR3 = mean(Fy7_JR3(fromm:tooo));

Mz1_avg_JR3 = mean(Mz1_JR3(fromm:tooo));
Mz2_avg_JR3 = mean(Mz2_JR3(fromm:tooo));
Mz3_avg_JR3 = mean(Mz3_JR3(fromm:tooo));
Mz4_avg_JR3 = mean(Mz4_JR3(fromm:tooo));
Mz5_avg_JR3 = mean(Mz5_JR3(fromm:tooo));
Mz6_avg_JR3 = mean(Mz6_JR3(fromm:tooo));
Mz7_avg_JR3 = mean(Mz7_JR3(fromm:tooo));
Mx1_avg_JR3 = mean(Mx1_JR3(fromm:tooo));
Mx2_avg_JR3 = mean(Mx2_JR3(fromm:tooo));
Mx3_avg_JR3 = mean(Mx3_JR3(fromm:tooo));
Mx4_avg_JR3 = mean(Mx4_JR3(fromm:tooo));
Mx5_avg_JR3 = mean(Mx5_JR3(fromm:tooo));
Mx6_avg_JR3 = mean(Mx6_JR3(fromm:tooo));
Mx7_avg_JR3 = mean(Mx7_JR3(fromm:tooo));
My1_avg_JR3 = mean(My1_JR3(fromm:tooo));
My2_avg_JR3 = mean(My2_JR3(fromm:tooo));
My3_avg_JR3 = mean(My3_JR3(fromm:tooo));
My4_avg_JR3 = mean(My4_JR3(fromm:tooo));
My5_avg_JR3 = mean(My5_JR3(fromm:tooo));
My6_avg_JR3 = mean(My6_JR3(fromm:tooo));
My7_avg_JR3 = mean(My7_JR3(fromm:tooo));

% Mx1_avg_JR3 = mean((loadCell_data1{fromm:tooo,mx_column}-loadCell_data1{1,mx_column})/10);
% Mx2_avg_JR3 = mean((loadCell_data2{fromm:tooo,mx_column}-loadCell_data2{1,mx_column})/10);
% Mx3_avg_JR3 = mean((loadCell_data3{fromm:tooo,mx_column}-loadCell_data3{1,mx_column})/10);
% Mx4_avg_JR3 = mean((loadCell_data4{fromm:tooo,mx_column}-loadCell_data4{1,mx_column})/10);
% Mx5_avg_JR3 = mean((loadCell_data5{fromm:tooo,mx_column}-loadCell_data5{1,mx_column})/10);
% Mx6_avg_JR3 = mean((loadCell_data6{fromm:tooo,mx_column}-loadCell_data6{1,mx_column})/10);
% Mx7_avg_JR3 = mean((loadCell_data7{fromm:tooo,mx_column}-loadCell_data7{1,mx_column})/10);
time1 = loadCell_data1{1:end-indx1+1,1}./10;
time2 = loadCell_data2{1:end-indx2+1,1}./10;
time3 = loadCell_data3{1:end-indx3+1,1}./10;
time4 = loadCell_data4{1:end-indx4+1,1}./10;
time5 = loadCell_data5{1:end-indx5+1,1}./10;
time6 = loadCell_data6{1:end-indx6+1,1}./10;
time7 = loadCell_data7{1:end-indx7+1,1}./10;



figure()
plot(Fz1_JR3,'linewidth',2)
hold on
plot(Fz2_JR3,'linewidth',2)
plot(Fz3_JR3,'linewidth',2)
plot(Fz4_JR3,'linewidth',2)
plot(Fz5_JR3,'linewidth',2)
plot(Fz6_JR3,'linewidth',2)
plot(Fz7_JR3,'linewidth',2)
xlabel('Datapoints [-]')
ylabel('F_z [N]')

rel_err1 = abs((Mx1_avg_JR3-M_expected_JR3(1))/M_expected_JR3(1))*100;
rel_err2 = abs((Mx2_avg_JR3-M_expected_JR3(2))/M_expected_JR3(2))*100;
rel_err3 = abs((Mx3_avg_JR3-M_expected_JR3(3))/M_expected_JR3(3))*100;
rel_err4 = abs((Mx4_avg_JR3-M_expected_JR3(4))/M_expected_JR3(4))*100;
rel_err5 = abs((Mx5_avg_JR3-M_expected_JR3(5))/M_expected_JR3(5))*100;
rel_err6 = abs((Mx6_avg_JR3-M_expected_JR3(6))/M_expected_JR3(6))*100;
rel_err7 = abs((Mx7_avg_JR3-M_expected_JR3(7))/M_expected_JR3(7))*100;
rel_err = [rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6,rel_err7]'
avg_relErr = mean([rel_err1,rel_err2,rel_err3,rel_err4,rel_err5,rel_err6,rel_err7]);
fprintf('The JR3 average relative error is: %f \n', avg_relErr)
abs_err1 = abs((Mx1_avg_JR3-M_expected_JR3(1)));
abs_err2 = abs((Mx2_avg_JR3-M_expected_JR3(2)));
abs_err3 = abs((Mx3_avg_JR3-M_expected_JR3(3)));
abs_err4 = abs((Mx4_avg_JR3-M_expected_JR3(4)));
abs_err5 = abs((Mx5_avg_JR3-M_expected_JR3(5)));
abs_err6 = abs((Mx6_avg_JR3-M_expected_JR3(6)));
abs_err7 = abs((Mx7_avg_JR3-M_expected_JR3(7)));
abs_err = [abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6,abs_err7]'
avg_absErr = mean([abs_err1,abs_err2,abs_err3,abs_err4,abs_err5,abs_err6,abs_err7]);
fprintf('The average JR3 absolute error is: %f \n', avg_absErr)

figure()
t = tiledlayout(1,1);
ax1 = axes(t);
plot(ax1,M_expected_ATI(1), Mx1_avg_ATI,'o', 'lineWidth',2,'color','b')
hold on
plot(ax1,M_expected_ATI(2), Mx2_avg_ATI,'o', 'lineWidth',2,'color','b')
plot(ax1,M_expected_ATI(3), Mx3_avg_ATI,'o', 'lineWidth',2,'color','b')
plot(ax1,M_expected_ATI(4), Mx4_avg_ATI,'o', 'lineWidth',2,'color','b')
plot(ax1,M_expected_ATI(5), Mx5_avg_ATI,'o', 'lineWidth',2,'color','b')
plot(ax1,M_expected_ATI(6), Mx6_avg_ATI,'o', 'lineWidth',2,'color','b')
plot(ax1,M_expected_ATI(7), Mx7_avg_ATI,'o', 'lineWidth',2,'color','b')
ax1.XAxisLocation = 'bottom';
ax1.YAxisLocation = 'left';
ylabel('Measured ATI value M_x [N\cdot m]')
xlabel('True Value [N\cdot m]')
% legend('','','','','','','ATI')
ax1.XColor = 'b';
ax1.YColor = 'b';
ax2 = axes(t);
plot(ax2, M_expected_JR3(1), Mx1_avg_JR3,'o', 'lineWidth',2,'color','k')
hold on
plot(ax2, M_expected_JR3(2), Mx2_avg_JR3,'o', 'lineWidth',2,'color','k')
plot(ax2, M_expected_JR3(3), Mx3_avg_JR3,'o', 'lineWidth',2,'color','k')
plot(ax2, M_expected_JR3(4), Mx4_avg_JR3,'o', 'lineWidth',2,'color','k')
plot(ax2, M_expected_JR3(5), Mx5_avg_JR3,'o', 'lineWidth',2,'color','k')
plot(ax2, M_expected_JR3(6), Mx6_avg_JR3,'o', 'lineWidth',2,'color','k')
plot(ax2, M_expected_JR3(7), Mx7_avg_JR3,'o', 'lineWidth',2,'color','r')
ax2.XAxisLocation = 'top';
ax2.YAxisLocation = 'right';
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
ylabel('Measured JR3 value M_x [N\cdot m]')
% legend('','','','','','JR3')
% xlabel('True Value [N\cdot m]')
title(Title)
grid on

