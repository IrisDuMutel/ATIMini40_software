close all
clear all
% This script shows results comparing 8" and 10" propellers

%%%% 8" propellers
%%%% Order of the script:
%%%% Results at H0
% Problem parameters
L          = 0.20;     %m
numBlades  = 2;
Radius     = 0.2032/2; %m (diameter if 0.2 is used
R_constant = 287.04; % m^2 /°Ksec^2
toKelvin   = 273.15;

%%%% File selection and loading of data

LC1 = '20221026/LoadCell/log_20221026_164256_8inch_H0_R1_14.csv';
LC2 = '20221025/LoadCell/log_20221025_110707_H0_R2_4.csv';
LC3 = '20221025/LoadCell/log_20221025_133753_H0_R3_7.csv';
LC4 = '20221025/LoadCell/log_20221025_135935_H0_R4_8.csv';
LC5 = '20221025/LoadCell/log_20221025_152800_H0_R5_11.csv';
LC6 = '20221025/LoadCell/log_20221025_161654_H0_Rinf_12.csv';

Ti_1 = '20221026/TachometerI/20221026_8inch_H0_R1_14.csv';
Tr_1 = '20221026/TachometerR/20221026_8inch_H0_R1_14.csv';
Tp_1 = '20221026/Tachometer3/20221026_8inch_H0_R1_14.csv';

Ti_2 = '20221025/TachometerI/20221025_H0_R2_TEST4.csv';
Tr_2 = '20221025/TachometerR/20221025_H0_R2_TEST4.csv';
Tp_2 = '20221025/Tachometer3/20221025_H0_R2_TEST4.csv';

Ti_3 = '20221025/TachometerI/20221025_H0_R3_TEST7.csv';
Tr_3 = '20221025/TachometerR/20221025_H0_R3_TEST7.csv';
Tp_3 = '20221025/Tachometer3/20221025_H0_R3_TEST7.csv';

Ti_4 = '20221025/TachometerI/20221025_H0_R4_TEST8.csv';
Tr_4 = '20221025/TachometerR/20221025_H0_R4_TEST8.csv';
Tp_4 = '20221025/Tachometer3/20221025_H0_R4_TEST8.csv';

Ti_5 = '20221025/TachometerI/20221025_H0_R5_TEST11.csv';
Tr_5 = '20221025/TachometerR/20221025_H0_R5_TEST11.csv';
Tp_5 = '20221025/Tachometer3/20221025_H0_R5_TEST11.csv';

Ti_6 = '20221025/TachometerI/20221025_H0_Rinf_TEST12.csv';
Tr_6 = '20221025/TachometerR/20221025_H0_Rinf_TEST12.csv';
Tp_6 = '20221025/Tachometer3/20221025_H0_Rinf_TEST12.csv';

fx_column = 2;
fy_column = 3;
fz_column = 4;
mx_column = 5;
my_column = 6;
mz_column = 7;

offset1 = 300;
offset2 = 413;
offset3 = 391;
offset4 = 300;
offset5 = 391;
offset6 = 439;
add_points = 25;

Matrix_1 = 10*[    1+add_points	74.7
               299.1+add_points	333.3
               560.1+add_points	590.4
                82.7+add_points 125.9
               339.1+add_points	386.1
                 599+add_points	644.7
               139.2+add_points	180.1
               398.5+add_points	437.9
               653.6+add_points	696.8
               189.5+add_points	231.5
               454.3+add_points	490.5
               706.3+add_points	745.4
               244.9+add_points	282.7
               503.4+add_points	542.7
               747.9+add_points	802.7];

Matrix_2 = 10*[    1+add_points	69.6
               290.8+add_points	330.9
               553.1+add_points	588.5
               	77.7+add_points	126.2
               338.4+add_points	379.5
               594.9+add_points	639.7
               132.2+add_points	177.7
               390.6+add_points	432.5
               646.7+add_points	692.2
               188.7+add_points	229.1
               443.5+add_points	484.2
                 700+add_points	743.4
               239.7+add_points	280
               497.1+add_points	536.8
               750.4+add_points	798.1];

Matrix_3 = 10*[     1+add_points	79.3
                  298+add_points	337.4
                560.8+add_points	596.4
               	 84.8+add_points	132.6
               	343.3+add_points	390.1
               	602.8+add_points	647.8
               	137.5+add_points	183.5
               	397.9+add_points	441.9
               	653.1+add_points	698.9
               	191.4+add_points	235.9
               	450.4+add_points	492.9
               	705.9+add_points	751
               	243.3+add_points	285.8
               	500.7+add_points	544.2
               	759.8+add_points	805.3];

Matrix_4 = 10*[     1+add_points	67.2
                293.4+add_points	327.6
                574.2+add_points	585.3
               	   74+add_points	118
               	329.3+add_points	378.9
               	587.9+add_points	636.1
               	126.1+add_points	171.6
               	388.6+add_points	428.4
               	640.5+add_points	688.3
               	183.4+add_points	223
               	437.4+add_points	479.5
               	692.8+add_points	739.7
               	232.9+add_points	274.6
               	491.2+add_points	531.4
               	745.3+add_points	790.4];

Matrix_5 = 10*[	    1+add_points	80.1
                296.6+add_points	336.7
                562.1+add_points	597.5
                 83.9+add_points	131.7
                342.3+add_points	391
               	604.9+add_points	646.8
               	136.1+add_points	183.5
               	395.6+add_points	440.8
               	655.2+add_points	700.3
               	187.7+add_points	234.5
               	  450+add_points	492.3
               	711.2+add_points	750.5
               	241.1+add_points	287.8
               	504.1+add_points	544.8
               	758.7+add_points	805];

Matrix_6 = 10*[	    1+add_points	63.9
                282.7+add_points	324.4
                541.4+add_points	582.1
            	 69.2+add_points	117.8
            	328.3+add_points	375.2
            	583.9+add_points	631.3
            	125.1+add_points	169.2
            	379.2+add_points	427
            	639.1+add_points	683.9
            	176.4+add_points	219.6
            	436.9+add_points	479.8
            	690.5+add_points	735.2
            	225.8+add_points	271.8
            	484.4+add_points	529.9
            	743.1+add_points	789];

%%%% Thacometers are writtern as 
%%%% T_R1 = [T1_start T1_end T2_start T2_end T3_start T3_end]

Tach_R1 = [1    450	  1	    520	  1     475
           2016	2262  2060  2290  2004	2301
           3780	4060  3569  3776  3800	4098
           498	826	  549	891   536	852
           2285	2627  2345  2585  2329	2649
           4095	4427  3803  4073  4119	4457
           825	1189  909	1251  873	1212
           2658	2981  2636  2895  2673	3008
           4453	4782  4090  4369  4468	4816
           1204	1539  1257  1601  1242	1566
           3008	3343  2928  3184  3029	3373
           4798	5146  4385  4655  4822	5174
           1567	1896  1619  1958  1592	1930
           3380	3696  3198  3473  3385	3736
           5178	5517  4682  4971  5190	5546];

Tach_R2 = [402	616	  402	616	  402	616
           2218	245	  2218	245	  2218	245
           4013	4248  4013	4248  4013	4248
           729	1004  729	1004  729	1004
           2504	2808  2504	2808  2504	2808
           4320	4599  4320	4599  4320	4599
           1070	1364  1070	1364  1070	1364
           2873	3168  2873	3168  2873	3168
           4664	4956  4664	4956  4664	4956
           1439	1724  1439	1724  1439	1724
           3229	3527  3229	3527  3229	3527
           5023	5322  5023	5322  5023	5322
           1799	2083  1799	2083  1799	2083
           3581	3888  3581	3888  3581	3888
           5389	5701  5389	5701  5389	5701];

Tach_R3 = [447	720	  1	    696	  447	720
           2253	2519  1990	2208  2253	2519
           4035	4311  3462	3693  4035	4311
           773	1075  753	1016  773	1075
           2559	2870  2239	2486  2559	2870
           4359	4672  3717	3986  4359	4672
           1117	1429  1037	1309  1117	1429
           2918	3237  2516	2778  2918	3237
           4725	5031  4015	4284  4725	5031
           1479	1789  1323	1619  1479	1789
           3281	3596  2806	3095  3281	3596
           5079	5383  4296	4563  5079	5383
           1858	2145  1627	1900  1858	2145
           3639	3952  3105	3388  3639	3952
           5438	5767  4599	4888  5438	5767];

Tach_R4 = [1	523	  1	    538	  1	    523
           2075	2317  1919	2183  2075	2317
           3863	4113  3698	3984  3863	4113
           599	873	  587	835	  599	873
           2395	2673  2234	2531  2395	2673
           4201	4478  4007	4342  4201	4478
           947	1242  863	1133  947	1242
           2751	3031  2574	2891  2751	3031
           4551	4833  4372	4700  4551	4833
           1302	1597  1151	1461  1302	1597
           3103	3379  2936	3264  3103	3379
           4901	5185  4722	5053  4901	5185
           1664	1940  1493	1816  1664	1940
           3470	3744  3292	3620  3470	3744
           5253	5569  5088	5438  5253	5569];

Tach_R5 = [1 	478	  1	    478	  1	    478
           2056	2304  2056	2304  2056	2304
           3835	4106  3548	3785  3835	4106
           5162	865	  5162	865	  5162	865
           2369	2657  2361	2596  2369	2657
           4167	4465  3811	4067  4167	4465
           925	1226  925	1226  925	1226
           2728	3017  2612	2896  2728	3017
           4520	4825  4091	4371  4520	4825
           1272	1588  1272	1588  1272	1588
           3089	3368  2907	3193  3089	3368
           4875	5184  4385	4661  4875	5184
           1637	1940  1637	1940  1637	1940
           3439	3730  3206	3490  3439	3730
           5227	5541  4675	4968  5227	5541];

Tach_R6 =   [1   	527
            2072	2329
            3872	4162
            586 	902
            2399	2690
            4184	4497
            933	    1258
            2730	3062
            4529	4861
            1303	1627
            3115	3441
            4903	5211
            1660	1995
            3471	3790
            5257	5598];



%%% Chamber conditions of each test
P_1 = 993.1e2; % Pa = N/m^2 
P_2 = 992.7e2; % Pa = N/m^2 
P_3 = 991.5e2; % Pa = N/m^2 
P_4 = 991.2e2; % Pa = N/m^2 
P_5 = 990.4e2; % Pa = N/m^2 
P_6 = 990.2e2; % Pa = N/m^2 

T_1 = 20.4;    % ºC
T_2 = 21.5;    % ºC
T_3 = 22.4;    % ºC
T_4 = 22.7;    % ºC
T_5 = 24.4;    % ºC
T_6 = 20.9;    % ºC


rho_1 = P_1/(R_constant*(T_1+toKelvin));
rho_2 = P_2/(R_constant*(T_2+toKelvin));
rho_3 = P_3/(R_constant*(T_3+toKelvin));
rho_4 = P_4/(R_constant*(T_4+toKelvin));
rho_5 = P_5/(R_constant*(T_5+toKelvin));
rho_6 = P_6/(R_constant*(T_6+toKelvin));

loadCell_data1 = readtable(LC1);
loadCell_data2 = readtable(LC2);
loadCell_data3 = readtable(LC3);
loadCell_data4 = readtable(LC4);
loadCell_data5 = readtable(LC5);
loadCell_data6 = readtable(LC6);

RPM_data1i = readtable(Ti_1);
RPM_data1r = readtable(Tr_1);
RPM_data1p = readtable(Tp_1);

RPM_data2i = readtable(Ti_2);
RPM_data2r = readtable(Tr_2);
RPM_data2p = readtable(Tp_2);

RPM_data3i = readtable(Ti_3);
RPM_data3r = readtable(Tr_3);
RPM_data3p = readtable(Tp_3);

RPM_data4i = readtable(Ti_4);
RPM_data4r = readtable(Tr_4);
RPM_data4p = readtable(Tp_4);

RPM_data5i = readtable(Ti_5);
RPM_data5r = readtable(Tr_5);
RPM_data5p = readtable(Tp_5);

RPM_data6i = readtable(Ti_6);
RPM_data6r = readtable(Tr_6);
RPM_data6p = readtable(Tp_6);


indx1 = 1; % Index for load cell test 1
indx2 = 1; % Index for load cell test 2
indx3 = 1; % Index for load cell test 3
indx4 = 1; % Index for load cell test 4
indx5 = 1; % Index for load cell test 5
indx6 = 1; % Index for load cell test 6

indx10 = 1; % Index for RPM test 1
indx11 = 1; % Index for RPM test 2
indx12 = 1; % Index for RPM test 3
indx13 = 1; % Index for RPM test 4
indx14 = 1; % Index for RPM test 5
indx15 = 1; % Index for RPM test 6

Fz1_8inch = loadCell_data1{indx1:end,fz_column}-loadCell_data1{offset1,fz_column};
Fz2_8inch = loadCell_data2{indx2:end,fz_column}-loadCell_data2{offset2,fz_column};
Fz3_8inch = loadCell_data3{indx3:end,fz_column}-loadCell_data3{offset3,fz_column};
Fz4_8inch = loadCell_data4{indx4:end,fz_column}-loadCell_data4{offset4,fz_column};
Fz5_8inch = loadCell_data5{indx5:end,fz_column}-loadCell_data5{offset5,fz_column};
Fz6_8inch = loadCell_data6{indx6:end,fz_column}-loadCell_data6{offset6,fz_column};

time1_8inch = loadCell_data1{1:end-indx1+1,1}./10;
time2_8inch = loadCell_data2{1:end-indx2+1,1}./10;
time3_8inch = loadCell_data3{1:end-indx3+1,1}./10;
time4_8inch = loadCell_data4{1:end-indx4+1,1}./10;
time5_8inch = loadCell_data5{1:end-indx5+1,1}./10;
time6_8inch = loadCell_data6{1:end-indx6+1,1}./10;


test_orient = pi/4;
Fx1_8inch = loadCell_data1{indx1:end,fx_column}-loadCell_data1{offset1,fx_column};
Fy1_8inch = loadCell_data1{indx1:end,fy_column}-loadCell_data1{offset1,fy_column};
Fx2_8inch = loadCell_data2{indx2:end,fx_column}-loadCell_data2{offset2,fx_column};
Fy2_8inch = loadCell_data2{indx2:end,fy_column}-loadCell_data2{offset2,fy_column};
Fx3_8inch = loadCell_data3{indx3:end,fx_column}-loadCell_data3{offset3,fx_column};
Fy3_8inch = loadCell_data3{indx3:end,fy_column}-loadCell_data3{offset3,fy_column};
Fx4_8inch = loadCell_data4{indx4:end,fx_column}-loadCell_data4{offset4,fx_column};
Fy4_8inch = loadCell_data4{indx4:end,fy_column}-loadCell_data4{offset4,fy_column};
Fx5_8inch = loadCell_data5{indx5:end,fx_column}-loadCell_data5{offset5,fx_column};
Fy5_8inch = loadCell_data5{indx5:end,fy_column}-loadCell_data5{offset5,fy_column};
Fx6_8inch = loadCell_data6{indx6:end,fx_column}-loadCell_data6{offset6,fx_column};
Fy6_8inch = loadCell_data6{indx6:end,fy_column}-loadCell_data6{offset6,fy_column};

Mx1_8inch = (loadCell_data1{indx1:end,mx_column}-loadCell_data1{offset1,mx_column})/10;
Mx2_8inch = (loadCell_data2{indx2:end,mx_column}-loadCell_data2{offset2,mx_column})/10;
Mx3_8inch = (loadCell_data3{indx3:end,mx_column}-loadCell_data3{offset3,mx_column})/10;
Mx4_8inch = (loadCell_data4{indx4:end,mx_column}-loadCell_data4{offset4,mx_column})/10;
Mx5_8inch = (loadCell_data5{indx5:end,mx_column}-loadCell_data5{offset5,mx_column})/10;
Mx6_8inch = (loadCell_data6{indx6:end,mx_column}-loadCell_data6{offset6,mx_column})/10;
My1_8inch = (loadCell_data1{indx1:end,my_column}-loadCell_data1{offset1,my_column})/10;
My2_8inch = (loadCell_data2{indx2:end,my_column}-loadCell_data2{offset2,my_column})/10;
My3_8inch = (loadCell_data3{indx3:end,my_column}-loadCell_data3{offset3,my_column})/10;
My4_8inch = (loadCell_data4{indx4:end,my_column}-loadCell_data4{offset4,my_column})/10;
My5_8inch = (loadCell_data5{indx5:end,my_column}-loadCell_data5{offset5,my_column})/10;
My6_8inch = (loadCell_data6{indx6:end,my_column}-loadCell_data6{offset6,my_column})/10;
Mz1_8inch = (loadCell_data1{indx1:end,mz_column}-loadCell_data1{offset1,mz_column})/10;
Mz2_8inch = (loadCell_data2{indx2:end,mz_column}-loadCell_data2{offset2,mz_column})/10;
Mz3_8inch = (loadCell_data3{indx3:end,mz_column}-loadCell_data3{offset3,mz_column})/10;
Mz4_8inch = (loadCell_data4{indx4:end,mz_column}-loadCell_data4{offset4,mz_column})/10;
Mz5_8inch = (loadCell_data5{indx5:end,mz_column}-loadCell_data5{offset5,mz_column})/10;
Mz6_8inch = (loadCell_data6{indx6:end,mz_column}-loadCell_data6{offset6,mz_column})/10;

%%%% Offset removal from segments 2 and 3
Fx1_8inch = [Fx1_8inch(1:Matrix_1(2,1)); Fx1_8inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Fx1_8inch(Matrix_1(2,2)); Fx1_8inch(Matrix_1(3,1)+1:end)-Fx1_8inch(Matrix_1(3,2))];
Fy1_8inch = [Fy1_8inch(1:Matrix_1(2,1)); Fy1_8inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Fy1_8inch(Matrix_1(2,2)); Fy1_8inch(Matrix_1(3,1)+1:end)-Fy1_8inch(Matrix_1(3,2))]; 
Fx2_8inch = [Fx2_8inch(1:Matrix_2(2,1)); Fx2_8inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Fx2_8inch(Matrix_2(2,2)); Fx2_8inch(Matrix_2(3,1)+1:end)-Fx2_8inch(Matrix_2(3,2))];
Fy2_8inch = [Fy2_8inch(1:Matrix_2(2,1)); Fy2_8inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Fy2_8inch(Matrix_2(2,2)); Fy2_8inch(Matrix_2(3,1)+1:end)-Fy2_8inch(Matrix_2(3,2))];
Fx3_8inch = [Fx3_8inch(1:Matrix_3(2,1)); Fx3_8inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Fx3_8inch(Matrix_3(2,2)); Fx3_8inch(Matrix_3(3,1)+1:end)-Fx3_8inch(Matrix_3(3,2))];
Fy3_8inch = [Fy3_8inch(1:Matrix_3(2,1)); Fy3_8inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Fy3_8inch(Matrix_3(2,2)); Fy3_8inch(Matrix_3(3,1)+1:end)-Fy3_8inch(Matrix_3(3,2))];
Fx4_8inch = [Fx4_8inch(1:Matrix_4(2,1)); Fx4_8inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Fx4_8inch(Matrix_4(2,2)); Fx4_8inch(Matrix_4(3,1)+1:end)-Fx4_8inch(Matrix_4(3,2))];
Fy4_8inch = [Fy4_8inch(1:Matrix_4(2,1)); Fy4_8inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Fy4_8inch(Matrix_4(2,2)); Fy4_8inch(Matrix_4(3,1)+1:end)-Fy4_8inch(Matrix_4(3,2))];
Fx5_8inch = [Fx5_8inch(1:Matrix_5(2,1)); Fx5_8inch(Matrix_5(2,1)+1:Matrix_5(3,1))-Fx5_8inch(Matrix_5(2,2)); Fx5_8inch(Matrix_5(3,1)+1:end)-Fx5_8inch(Matrix_5(3,2))];
Fy5_8inch = [Fy5_8inch(1:Matrix_5(2,1)); Fy5_8inch(Matrix_5(2,1)+1:Matrix_5(3,1))-Fy5_8inch(Matrix_5(2,2)); Fy5_8inch(Matrix_5(3,1)+1:end)-Fy5_8inch(Matrix_5(3,2))];
Fx6_8inch = [Fx6_8inch(1:Matrix_6(2,1)); Fx6_8inch(Matrix_6(2,1)+1:Matrix_6(3,1))-Fx6_8inch(Matrix_6(2,2)); Fx6_8inch(Matrix_6(3,1)+1:end)-Fx6_8inch(Matrix_6(3,2))];
Fy6_8inch = [Fy6_8inch(1:Matrix_6(2,1)); Fy6_8inch(Matrix_6(2,1)+1:Matrix_6(3,1))-Fy6_8inch(Matrix_6(2,2)); Fy6_8inch(Matrix_6(3,1)+1:end)-Fy6_8inch(Matrix_6(3,2))];
Fz1_8inch = [Fz1_8inch(1:Matrix_1(2,1)); Fz1_8inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Fz1_8inch(Matrix_1(2,2)); Fz1_8inch(Matrix_1(3,1)+1:end)-Fz1_8inch(Matrix_1(3,2))];
Fz2_8inch = [Fz2_8inch(1:Matrix_2(2,1)); Fz2_8inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Fz2_8inch(Matrix_2(2,2)); Fz2_8inch(Matrix_2(3,1)+1:end)-Fz2_8inch(Matrix_2(3,2))];
Fz3_8inch = [Fz3_8inch(1:Matrix_3(2,1)); Fz3_8inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Fz3_8inch(Matrix_3(2,2)); Fz3_8inch(Matrix_3(3,1)+1:end)-Fz3_8inch(Matrix_3(3,2))];
Fz4_8inch = [Fz4_8inch(1:Matrix_4(2,1)); Fz4_8inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Fz4_8inch(Matrix_4(2,2)); Fz4_8inch(Matrix_4(3,1)+1:end)-Fz4_8inch(Matrix_4(3,2))];
Fz5_8inch = [Fz5_8inch(1:Matrix_5(2,1)); Fz5_8inch(Matrix_5(2,1)+1:Matrix_5(3,1))-Fz5_8inch(Matrix_5(2,2)); Fz5_8inch(Matrix_5(3,1)+1:end)-Fz5_8inch(Matrix_5(3,2))];
Fz6_8inch = [Fz6_8inch(1:Matrix_6(2,1)); Fz6_8inch(Matrix_6(2,1)+1:Matrix_6(3,1))-Fz6_8inch(Matrix_6(2,2)); Fz6_8inch(Matrix_6(3,1)+1:end)-Fz6_8inch(Matrix_6(3,2))];
Mx1_8inch = [Mx1_8inch(1:Matrix_1(2,1)); Mx1_8inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Mx1_8inch(Matrix_1(2,2)); Mx1_8inch(Matrix_1(3,1)+1:end)-Mx1_8inch(Matrix_1(3,2))];
My1_8inch = [My1_8inch(1:Matrix_1(2,1)); My1_8inch(Matrix_1(2,1)+1:Matrix_1(3,1))-My1_8inch(Matrix_1(2,2)); My1_8inch(Matrix_1(3,1)+1:end)-My1_8inch(Matrix_1(3,2))];
Mx2_8inch = [Mx2_8inch(1:Matrix_2(2,1)); Mx2_8inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Mx2_8inch(Matrix_2(2,2)); Mx2_8inch(Matrix_2(3,1)+1:end)-Mx2_8inch(Matrix_2(3,2))];
My2_8inch = [My2_8inch(1:Matrix_2(2,1)); My2_8inch(Matrix_2(2,1)+1:Matrix_2(3,1))-My2_8inch(Matrix_2(2,2)); My2_8inch(Matrix_2(3,1)+1:end)-My2_8inch(Matrix_2(3,2))];
Mx3_8inch = [Mx3_8inch(1:Matrix_3(2,1)); Mx3_8inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Mx3_8inch(Matrix_3(2,2)); Mx3_8inch(Matrix_3(3,1)+1:end)-Mx3_8inch(Matrix_3(3,2))];
My3_8inch = [My3_8inch(1:Matrix_3(2,1)); My3_8inch(Matrix_3(2,1)+1:Matrix_3(3,1))-My3_8inch(Matrix_3(2,2)); My3_8inch(Matrix_3(3,1)+1:end)-My3_8inch(Matrix_3(3,2))];
Mx4_8inch = [Mx4_8inch(1:Matrix_4(2,1)); Mx4_8inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Mx4_8inch(Matrix_4(2,2)); Mx4_8inch(Matrix_4(3,1)+1:end)-Mx4_8inch(Matrix_4(3,2))];
My4_8inch = [My4_8inch(1:Matrix_4(2,1)); My4_8inch(Matrix_4(2,1)+1:Matrix_4(3,1))-My4_8inch(Matrix_4(2,2)); My4_8inch(Matrix_4(3,1)+1:end)-My4_8inch(Matrix_4(3,2))];
Mx5_8inch = [Mx5_8inch(1:Matrix_5(2,1)); Mx5_8inch(Matrix_5(2,1)+1:Matrix_5(3,1))-Mx5_8inch(Matrix_5(2,2)); Mx5_8inch(Matrix_5(3,1)+1:end)-Mx5_8inch(Matrix_5(3,2))];
My5_8inch = [My5_8inch(1:Matrix_5(2,1)); My5_8inch(Matrix_5(2,1)+1:Matrix_5(3,1))-My5_8inch(Matrix_5(2,2)); My5_8inch(Matrix_5(3,1)+1:end)-My5_8inch(Matrix_5(3,2))];
Mx6_8inch = [Mx6_8inch(1:Matrix_6(2,1)); Mx6_8inch(Matrix_6(2,1)+1:Matrix_6(3,1))-Mx6_8inch(Matrix_6(2,2)); Mx6_8inch(Matrix_6(3,1)+1:end)-Mx6_8inch(Matrix_6(3,2))];
My6_8inch = [My6_8inch(1:Matrix_6(2,1)); My6_8inch(Matrix_6(2,1)+1:Matrix_6(3,1))-My6_8inch(Matrix_6(2,2)); My6_8inch(Matrix_6(3,1)+1:end)-My6_8inch(Matrix_6(3,2))];
Mz1_8inch = [Mz1_8inch(1:Matrix_1(2,1)); Mz1_8inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Mz1_8inch(Matrix_1(2,2)); Mz1_8inch(Matrix_1(3,1)+1:end)-Mz1_8inch(Matrix_1(3,2))];
Mz2_8inch = [Mz2_8inch(1:Matrix_2(2,1)); Mz2_8inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Mz2_8inch(Matrix_2(2,2)); Mz2_8inch(Matrix_2(3,1)+1:end)-Mz2_8inch(Matrix_2(3,2))];
Mz3_8inch = [Mz3_8inch(1:Matrix_3(2,1)); Mz3_8inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Mz3_8inch(Matrix_3(2,2)); Mz3_8inch(Matrix_3(3,1)+1:end)-Mz3_8inch(Matrix_3(3,2))];
Mz4_8inch = [Mz4_8inch(1:Matrix_4(2,1)); Mz4_8inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Mz4_8inch(Matrix_4(2,2)); Mz4_8inch(Matrix_4(3,1)+1:end)-Mz4_8inch(Matrix_4(3,2))];
Mz5_8inch = [Mz5_8inch(1:Matrix_5(2,1)); Mz5_8inch(Matrix_5(2,1)+1:Matrix_5(3,1))-Mz5_8inch(Matrix_5(2,2)); Mz5_8inch(Matrix_5(3,1)+1:end)-Mz5_8inch(Matrix_5(3,2))];
Mz6_8inch = [Mz6_8inch(1:Matrix_6(2,1)); Mz6_8inch(Matrix_6(2,1)+1:Matrix_6(3,1))-Mz6_8inch(Matrix_6(2,2)); Mz6_8inch(Matrix_6(3,1)+1:end)-Mz6_8inch(Matrix_6(3,2))];


RPM1i_8inch = RPM_data1i{indx10:end,3}./numBlades;
RPM2i_8inch = RPM_data2i{indx11:end,3}./numBlades;
RPM3i_8inch = RPM_data3i{indx12:end,3}./numBlades;
RPM4i_8inch = RPM_data4i{indx13:end,3}./numBlades;
RPM5i_8inch = RPM_data5i{indx14:end,3}./numBlades;
RPM6i_8inch = RPM_data6i{indx15:end,3}./numBlades;

RPM1p_8inch = RPM_data1p{indx10:end,3}./numBlades;
RPM2p_8inch = RPM_data2p{indx11:end,3}./numBlades;
RPM3p_8inch = RPM_data3p{indx12:end,3}./numBlades;
RPM4p_8inch = RPM_data4p{indx13:end,3}./numBlades;
RPM5p_8inch = RPM_data5p{indx14:end,3}./numBlades;
RPM6p_8inch = RPM_data6p{indx15:end,3}./numBlades;

RPM1r_8inch = str2double(RPM_data1r{indx10:end,3})./numBlades/10;
RPM2r_8inch = str2double(RPM_data2r{indx11:end,3})./numBlades/10;
RPM3r_8inch = str2double(RPM_data3r{indx12:end,3})./numBlades/10;
RPM4r_8inch = str2double(RPM_data4r{indx13:end,3})./numBlades/10;
RPM5r_8inch = str2double(RPM_data5r{indx14:end,3})./numBlades/10;
RPM6r_8inch = str2double(RPM_data6r{indx15:end,3})./numBlades/10;

timeRPMfactor = 1;
time_RPM1i_8inch = RPM_data1i{1:end-indx10+1,1}./timeRPMfactor;
time_RPM1r_8inch = RPM_data1r{1:end-indx10+1,1}./timeRPMfactor;
time_RPM1p_8inch = RPM_data1p{1:end-indx10+1,1}./timeRPMfactor;

time_RPM2i_8inch = RPM_data2i{1:end-indx11+1,1}./timeRPMfactor;
time_RPM2r_8inch = RPM_data2r{1:end-indx11+1,1}./timeRPMfactor;
time_RPM2p_8inch = RPM_data2p{1:end-indx11+1,1}./timeRPMfactor;

time_RPM3i_8inch = RPM_data3i{1:end-indx12+1,1}./timeRPMfactor;
time_RPM3r_8inch = RPM_data3r{1:end-indx12+1,1}./timeRPMfactor;
time_RPM3p_8inch = RPM_data3p{1:end-indx12+1,1}./timeRPMfactor;

time_RPM4i_8inch = RPM_data4i{1:end-indx13+1,1}./timeRPMfactor;
time_RPM4r_8inch = RPM_data4r{1:end-indx13+1,1}./timeRPMfactor;
time_RPM4p_8inch = RPM_data4p{1:end-indx13+1,1}./timeRPMfactor;

time_RPM5i_8inch = RPM_data5i{1:end-indx14+1,1}./timeRPMfactor;
time_RPM5r_8inch = RPM_data5r{1:end-indx14+1,1}./timeRPMfactor;
time_RPM5p_8inch = RPM_data5p{1:end-indx14+1,1}./timeRPMfactor;

time_RPM6i_8inch = RPM_data6i{1:end-indx15+1,1}./timeRPMfactor;
time_RPM6r_8inch = RPM_data6r{1:end-indx15+1,1}./timeRPMfactor;
time_RPM6p_8inch = RPM_data6p{1:end-indx15+1,1}./timeRPMfactor;

%%%%% Adimensionalizing
%%% Load cell data
test_orient = pi/4;

Mx1_avg_8inch = [mean(Mx1_8inch(Matrix_1(1,1):Matrix_1(1,2)))
           mean(Mx1_8inch(Matrix_1(2,1):Matrix_1(2,2)))
           mean(Mx1_8inch(Matrix_1(3,1):Matrix_1(3,2)))
           mean(Mx1_8inch(Matrix_1(4,1):Matrix_1(4,2)))
           mean(Mx1_8inch(Matrix_1(5,1):Matrix_1(5,2)))
           mean(Mx1_8inch(Matrix_1(6,1):Matrix_1(6,2)))
           mean(Mx1_8inch(Matrix_1(7,1):Matrix_1(7,2)))
           mean(Mx1_8inch(Matrix_1(8,1):Matrix_1(8,2)))
           mean(Mx1_8inch(Matrix_1(9,1):Matrix_1(9,2)))
           mean(Mx1_8inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(Mx1_8inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(Mx1_8inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(Mx1_8inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(Mx1_8inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(Mx1_8inch(Matrix_1(15,1):Matrix_1(15,2)))];
My1_avg_8inch = [mean(My1_8inch(Matrix_1(1,1):Matrix_1(1,2)))
           mean(My1_8inch(Matrix_1(2,1):Matrix_1(2,2)))
           mean(My1_8inch(Matrix_1(3,1):Matrix_1(3,2)))
           mean(My1_8inch(Matrix_1(4,1):Matrix_1(4,2)))
           mean(My1_8inch(Matrix_1(5,1):Matrix_1(5,2)))
           mean(My1_8inch(Matrix_1(6,1):Matrix_1(6,2)))
           mean(My1_8inch(Matrix_1(7,1):Matrix_1(7,2)))
           mean(My1_8inch(Matrix_1(8,1):Matrix_1(8,2)))
           mean(My1_8inch(Matrix_1(9,1):Matrix_1(9,2)))
           mean(My1_8inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(My1_8inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(My1_8inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(My1_8inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(My1_8inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(My1_8inch(Matrix_1(15,1):Matrix_1(15,2)))];
Fx1_avg_8inch = [mean(Fx1_8inch(Matrix_1(1,1):Matrix_1(1,2))) 
           mean(Fx1_8inch(Matrix_1(2,1):Matrix_1(2,2))) 
           mean(Fx1_8inch(Matrix_1(3,1):Matrix_1(3,2))) 
           mean(Fx1_8inch(Matrix_1(4,1):Matrix_1(4,2))) 
           mean(Fx1_8inch(Matrix_1(5,1):Matrix_1(5,2))) 
           mean(Fx1_8inch(Matrix_1(6,1):Matrix_1(6,2))) 
           mean(Fx1_8inch(Matrix_1(7,1):Matrix_1(7,2))) 
           mean(Fx1_8inch(Matrix_1(8,1):Matrix_1(8,2))) 
           mean(Fx1_8inch(Matrix_1(9,1):Matrix_1(9,2))) 
           mean(Fx1_8inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(Fx1_8inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(Fx1_8inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(Fx1_8inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(Fx1_8inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(Fx1_8inch(Matrix_1(15,1):Matrix_1(15,2)))];
Fy1_avg_8inch = [mean(Fy1_8inch(Matrix_1(1,1):Matrix_1(1,2))) 
           mean(Fy1_8inch(Matrix_1(2,1):Matrix_1(2,2))) 
           mean(Fy1_8inch(Matrix_1(3,1):Matrix_1(3,2))) 
           mean(Fy1_8inch(Matrix_1(4,1):Matrix_1(4,2))) 
           mean(Fy1_8inch(Matrix_1(5,1):Matrix_1(5,2))) 
           mean(Fy1_8inch(Matrix_1(6,1):Matrix_1(6,2))) 
           mean(Fy1_8inch(Matrix_1(7,1):Matrix_1(7,2))) 
           mean(Fy1_8inch(Matrix_1(8,1):Matrix_1(8,2))) 
           mean(Fy1_8inch(Matrix_1(9,1):Matrix_1(9,2))) 
           mean(Fy1_8inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(Fy1_8inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(Fy1_8inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(Fy1_8inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(Fy1_8inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(Fy1_8inch(Matrix_1(15,1):Matrix_1(15,2)))];


Mx2_avg_8inch = [mean(Mx2_8inch(Matrix_2(1,1):Matrix_2(1,2))) 
           mean(Mx2_8inch(Matrix_2(2,1):Matrix_2(2,2))) 
           mean(Mx2_8inch(Matrix_2(3,1):Matrix_2(3,2))) 
           mean(Mx2_8inch(Matrix_2(4,1):Matrix_2(4,2))) 
           mean(Mx2_8inch(Matrix_2(5,1):Matrix_2(5,2))) 
           mean(Mx2_8inch(Matrix_2(6,1):Matrix_2(6,2))) 
           mean(Mx2_8inch(Matrix_2(7,1):Matrix_2(7,2))) 
           mean(Mx2_8inch(Matrix_2(8,1):Matrix_2(8,2))) 
           mean(Mx2_8inch(Matrix_2(9,1):Matrix_2(9,2))) 
           mean(Mx2_8inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(Mx2_8inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(Mx2_8inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(Mx2_8inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(Mx2_8inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(Mx2_8inch(Matrix_2(15,1):Matrix_2(15,2)))];
My2_avg_8inch = [mean(My2_8inch(Matrix_2(1,1):Matrix_2(1,2))) 
           mean(My2_8inch(Matrix_2(2,1):Matrix_2(2,2))) 
           mean(My2_8inch(Matrix_2(3,1):Matrix_2(3,2))) 
           mean(My2_8inch(Matrix_2(4,1):Matrix_2(4,2))) 
           mean(My2_8inch(Matrix_2(5,1):Matrix_2(5,2))) 
           mean(My2_8inch(Matrix_2(6,1):Matrix_2(6,2))) 
           mean(My2_8inch(Matrix_2(7,1):Matrix_2(7,2))) 
           mean(My2_8inch(Matrix_2(8,1):Matrix_2(8,2))) 
           mean(My2_8inch(Matrix_2(9,1):Matrix_2(9,2))) 
           mean(My2_8inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(My2_8inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(My2_8inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(My2_8inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(My2_8inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(My2_8inch(Matrix_2(15,1):Matrix_2(15,2)))];
Fx2_avg_8inch = [mean(Fx2_8inch(Matrix_2(1,1):Matrix_2(1,2))) 
           mean(Fx2_8inch(Matrix_2(2,1):Matrix_2(2,2))) 
           mean(Fx2_8inch(Matrix_2(3,1):Matrix_2(3,2))) 
           mean(Fx2_8inch(Matrix_2(4,1):Matrix_2(4,2))) 
           mean(Fx2_8inch(Matrix_2(5,1):Matrix_2(5,2))) 
           mean(Fx2_8inch(Matrix_2(6,1):Matrix_2(6,2))) 
           mean(Fx2_8inch(Matrix_2(7,1):Matrix_2(7,2))) 
           mean(Fx2_8inch(Matrix_2(8,1):Matrix_2(8,2))) 
           mean(Fx2_8inch(Matrix_2(9,1):Matrix_2(9,2))) 
           mean(Fx2_8inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(Fx2_8inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(Fx2_8inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(Fx2_8inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(Fx2_8inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(Fx2_8inch(Matrix_2(15,1):Matrix_2(15,2)))];
Fy2_avg_8inch = [mean(Fy2_8inch(Matrix_2(1,1):Matrix_2(1,2)))
           mean(Fy2_8inch(Matrix_2(2,1):Matrix_2(2,2)))
           mean(Fy2_8inch(Matrix_2(3,1):Matrix_2(3,2)))
           mean(Fy2_8inch(Matrix_2(4,1):Matrix_2(4,2)))
           mean(Fy2_8inch(Matrix_2(5,1):Matrix_2(5,2)))
           mean(Fy2_8inch(Matrix_2(6,1):Matrix_2(6,2)))
           mean(Fy2_8inch(Matrix_2(7,1):Matrix_2(7,2)))
           mean(Fy2_8inch(Matrix_2(8,1):Matrix_2(8,2)))
           mean(Fy2_8inch(Matrix_2(9,1):Matrix_2(9,2)))
           mean(Fy2_8inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(Fy2_8inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(Fy2_8inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(Fy2_8inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(Fy2_8inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(Fy2_8inch(Matrix_2(15,1):Matrix_2(15,2)))];

Mx3_avg_8inch = [mean(Mx3_8inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(Mx3_8inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(Mx3_8inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(Mx3_8inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(Mx3_8inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(Mx3_8inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(Mx3_8inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(Mx3_8inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(Mx3_8inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(Mx3_8inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(Mx3_8inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(Mx3_8inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(Mx3_8inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(Mx3_8inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(Mx3_8inch(Matrix_3(15,1):Matrix_3(15,2)))];
My3_avg_8inch = [mean(My3_8inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(My3_8inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(My3_8inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(My3_8inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(My3_8inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(My3_8inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(My3_8inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(My3_8inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(My3_8inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(My3_8inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(My3_8inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(My3_8inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(My3_8inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(My3_8inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(My3_8inch(Matrix_3(15,1):Matrix_3(15,2)))];
Fx3_avg_8inch = [mean(Fx3_8inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(Fx3_8inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(Fx3_8inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(Fx3_8inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(Fx3_8inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(Fx3_8inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(Fx3_8inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(Fx3_8inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(Fx3_8inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(Fx3_8inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(Fx3_8inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(Fx3_8inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(Fx3_8inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(Fx3_8inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(Fx3_8inch(Matrix_3(15,1):Matrix_3(15,2)))];
Fy3_avg_8inch = [mean(Fy3_8inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(Fy3_8inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(Fy3_8inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(Fy3_8inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(Fy3_8inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(Fy3_8inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(Fy3_8inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(Fy3_8inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(Fy3_8inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(Fy3_8inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(Fy3_8inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(Fy3_8inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(Fy3_8inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(Fy3_8inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(Fy3_8inch(Matrix_3(15,1):Matrix_3(15,2)))];

Mx4_avg_8inch = [mean(Mx4_8inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(Mx4_8inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(Mx4_8inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(Mx4_8inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(Mx4_8inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(Mx4_8inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(Mx4_8inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(Mx4_8inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(Mx4_8inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(Mx4_8inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(Mx4_8inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(Mx4_8inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(Mx4_8inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(Mx4_8inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(Mx4_8inch(Matrix_4(15,1):Matrix_4(15,2)))];
My4_avg_8inch = [mean(My4_8inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(My4_8inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(My4_8inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(My4_8inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(My4_8inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(My4_8inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(My4_8inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(My4_8inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(My4_8inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(My4_8inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(My4_8inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(My4_8inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(My4_8inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(My4_8inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(My4_8inch(Matrix_4(15,1):Matrix_4(15,2)))];
Fx4_avg_8inch = [mean(Fx4_8inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(Fx4_8inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(Fx4_8inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(Fx4_8inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(Fx4_8inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(Fx4_8inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(Fx4_8inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(Fx4_8inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(Fx4_8inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(Fx4_8inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(Fx4_8inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(Fx4_8inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(Fx4_8inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(Fx4_8inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(Fx4_8inch(Matrix_4(15,1):Matrix_4(15,2)))];
Fy4_avg_8inch = [mean(Fy4_8inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(Fy4_8inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(Fy4_8inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(Fy4_8inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(Fy4_8inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(Fy4_8inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(Fy4_8inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(Fy4_8inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(Fy4_8inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(Fy4_8inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(Fy4_8inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(Fy4_8inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(Fy4_8inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(Fy4_8inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(Fy4_8inch(Matrix_4(15,1):Matrix_4(15,2)))];

Mx5_avg_8inch = [mean(Mx5_8inch(Matrix_5(1,1):Matrix_5(1,2))) 
           mean(Mx5_8inch(Matrix_5(2,1):Matrix_5(2,2))) 
           mean(Mx5_8inch(Matrix_5(3,1):Matrix_5(3,2))) 
           mean(Mx5_8inch(Matrix_5(4,1):Matrix_5(4,2))) 
           mean(Mx5_8inch(Matrix_5(5,1):Matrix_5(5,2))) 
           mean(Mx5_8inch(Matrix_5(6,1):Matrix_5(6,2))) 
           mean(Mx5_8inch(Matrix_5(7,1):Matrix_5(7,2))) 
           mean(Mx5_8inch(Matrix_5(8,1):Matrix_5(8,2))) 
           mean(Mx5_8inch(Matrix_5(9,1):Matrix_5(9,2))) 
           mean(Mx5_8inch(Matrix_5(10,1):Matrix_5(10,2)))
           mean(Mx5_8inch(Matrix_5(11,1):Matrix_5(11,2)))
           mean(Mx5_8inch(Matrix_5(12,1):Matrix_5(12,2)))
           mean(Mx5_8inch(Matrix_5(13,1):Matrix_5(13,2)))
           mean(Mx5_8inch(Matrix_5(14,1):Matrix_5(14,2)))
           mean(Mx5_8inch(Matrix_5(15,1):Matrix_5(15,2)))];
My5_avg_8inch = [mean(My5_8inch(Matrix_5(1,1):Matrix_5(1,2))) 
           mean(My5_8inch(Matrix_5(2,1):Matrix_5(2,2))) 
           mean(My5_8inch(Matrix_5(3,1):Matrix_5(3,2))) 
           mean(My5_8inch(Matrix_5(4,1):Matrix_5(4,2))) 
           mean(My5_8inch(Matrix_5(5,1):Matrix_5(5,2))) 
           mean(My5_8inch(Matrix_5(6,1):Matrix_5(6,2))) 
           mean(My5_8inch(Matrix_5(7,1):Matrix_5(7,2))) 
           mean(My5_8inch(Matrix_5(8,1):Matrix_5(8,2))) 
           mean(My5_8inch(Matrix_5(9,1):Matrix_5(9,2))) 
           mean(My5_8inch(Matrix_5(10,1):Matrix_5(10,2)))
           mean(My5_8inch(Matrix_5(11,1):Matrix_5(11,2)))
           mean(My5_8inch(Matrix_5(12,1):Matrix_5(12,2)))
           mean(My5_8inch(Matrix_5(13,1):Matrix_5(13,2)))
           mean(My5_8inch(Matrix_5(14,1):Matrix_5(14,2)))
           mean(My5_8inch(Matrix_5(15,1):Matrix_5(15,2)))];
Fx5_avg_8inch = [mean(Fx5_8inch(Matrix_5(1,1):Matrix_5(1,2))) 
           mean(Fx5_8inch(Matrix_5(2,1):Matrix_5(2,2))) 
           mean(Fx5_8inch(Matrix_5(3,1):Matrix_5(3,2))) 
           mean(Fx5_8inch(Matrix_5(4,1):Matrix_5(4,2))) 
           mean(Fx5_8inch(Matrix_5(5,1):Matrix_5(5,2))) 
           mean(Fx5_8inch(Matrix_5(6,1):Matrix_5(6,2))) 
           mean(Fx5_8inch(Matrix_5(7,1):Matrix_5(7,2))) 
           mean(Fx5_8inch(Matrix_5(8,1):Matrix_5(8,2))) 
           mean(Fx5_8inch(Matrix_5(9,1):Matrix_5(9,2))) 
           mean(Fx5_8inch(Matrix_5(10,1):Matrix_5(10,2)))
           mean(Fx5_8inch(Matrix_5(11,1):Matrix_5(11,2)))
           mean(Fx5_8inch(Matrix_5(12,1):Matrix_5(12,2)))
           mean(Fx5_8inch(Matrix_5(13,1):Matrix_5(13,2)))
           mean(Fx5_8inch(Matrix_5(14,1):Matrix_5(14,2)))
           mean(Fx5_8inch(Matrix_5(15,1):Matrix_5(15,2)))];
Fy5_avg_8inch = [mean(Fy5_8inch(Matrix_5(1,1):Matrix_5(1,2)))
           mean(Fy5_8inch(Matrix_5(2,1):Matrix_5(2,2)))
           mean(Fy5_8inch(Matrix_5(3,1):Matrix_5(3,2)))
           mean(Fy5_8inch(Matrix_5(4,1):Matrix_5(4,2)))
           mean(Fy5_8inch(Matrix_5(5,1):Matrix_5(5,2)))
           mean(Fy5_8inch(Matrix_5(6,1):Matrix_5(6,2)))
           mean(Fy5_8inch(Matrix_5(7,1):Matrix_5(7,2)))
           mean(Fy5_8inch(Matrix_5(8,1):Matrix_5(8,2)))
           mean(Fy5_8inch(Matrix_5(9,1):Matrix_5(9,2)))
           mean(Fy5_8inch(Matrix_5(10,1):Matrix_5(10,2)))
           mean(Fy5_8inch(Matrix_5(11,1):Matrix_5(11,2)))
           mean(Fy5_8inch(Matrix_5(12,1):Matrix_5(12,2)))
           mean(Fy5_8inch(Matrix_5(13,1):Matrix_5(13,2)))
           mean(Fy5_8inch(Matrix_5(14,1):Matrix_5(14,2)))
           mean(Fy5_8inch(Matrix_5(15,1):Matrix_5(15,2)))];


Mx6_avg_8inch = [mean(Mx6_8inch(Matrix_6(1,1):Matrix_6(1,2))); 
           mean(Mx6_8inch(Matrix_6(2,1):Matrix_6(2,2))) 
           mean(Mx6_8inch(Matrix_6(3,1):Matrix_6(3,2))) 
           mean(Mx6_8inch(Matrix_6(4,1):Matrix_6(4,2))) 
           mean(Mx6_8inch(Matrix_6(5,1):Matrix_6(5,2))) 
           mean(Mx6_8inch(Matrix_6(6,1):Matrix_6(6,2))) 
           mean(Mx6_8inch(Matrix_6(7,1):Matrix_6(7,2))) 
           mean(Mx6_8inch(Matrix_6(8,1):Matrix_6(8,2))) 
           mean(Mx6_8inch(Matrix_6(9,1):Matrix_6(9,2))) 
           mean(Mx6_8inch(Matrix_6(10,1):Matrix_6(10,2)))
           mean(Mx6_8inch(Matrix_6(11,1):Matrix_6(11,2)))
           mean(Mx6_8inch(Matrix_6(12,1):Matrix_6(12,2)))
           mean(Mx6_8inch(Matrix_6(13,1):Matrix_6(13,2)))
           mean(Mx6_8inch(Matrix_6(14,1):Matrix_6(14,2)))
           mean(Mx6_8inch(Matrix_6(15,1):Matrix_6(15,2)))];
My6_avg_8inch = [mean(My6_8inch(Matrix_6(1,1):Matrix_6(1,2))) 
           mean(My6_8inch(Matrix_6(2,1):Matrix_6(2,2))) 
           mean(My6_8inch(Matrix_6(3,1):Matrix_6(3,2))) 
           mean(My6_8inch(Matrix_6(4,1):Matrix_6(4,2))) 
           mean(My6_8inch(Matrix_6(5,1):Matrix_6(5,2))) 
           mean(My6_8inch(Matrix_6(6,1):Matrix_6(6,2))) 
           mean(My6_8inch(Matrix_6(7,1):Matrix_6(7,2))) 
           mean(My6_8inch(Matrix_6(8,1):Matrix_6(8,2))) 
           mean(My6_8inch(Matrix_6(9,1):Matrix_6(9,2))) 
           mean(My6_8inch(Matrix_6(10,1):Matrix_6(10,2)))
           mean(My6_8inch(Matrix_6(11,1):Matrix_6(11,2)))
           mean(My6_8inch(Matrix_6(12,1):Matrix_6(12,2)))
           mean(My6_8inch(Matrix_6(13,1):Matrix_6(13,2)))
           mean(My6_8inch(Matrix_6(14,1):Matrix_6(14,2)))
           mean(My6_8inch(Matrix_6(15,1):Matrix_6(15,2)))];
Fx6_avg_8inch = [mean(Fx6_8inch(Matrix_6(1,1):Matrix_6(1,2))) 
           mean(Fx6_8inch(Matrix_6(2,1):Matrix_6(2,2))) 
           mean(Fx6_8inch(Matrix_6(3,1):Matrix_6(3,2))) 
           mean(Fx6_8inch(Matrix_6(4,1):Matrix_6(4,2))) 
           mean(Fx6_8inch(Matrix_6(5,1):Matrix_6(5,2))) 
           mean(Fx6_8inch(Matrix_6(6,1):Matrix_6(6,2))) 
           mean(Fx6_8inch(Matrix_6(7,1):Matrix_6(7,2))) 
           mean(Fx6_8inch(Matrix_6(8,1):Matrix_6(8,2))) 
           mean(Fx6_8inch(Matrix_6(9,1):Matrix_6(9,2))) 
           mean(Fx6_8inch(Matrix_6(10,1):Matrix_6(10,2)))
           mean(Fx6_8inch(Matrix_6(11,1):Matrix_6(11,2)))
           mean(Fx6_8inch(Matrix_6(12,1):Matrix_6(12,2)))
           mean(Fx6_8inch(Matrix_6(13,1):Matrix_6(13,2)))
           mean(Fx6_8inch(Matrix_6(14,1):Matrix_6(14,2)))
           mean(Fx6_8inch(Matrix_6(15,1):Matrix_6(15,2)))];
Fy6_avg_8inch = [mean(Fy6_8inch(Matrix_6(1,1):Matrix_6(1,2))) 
           mean(Fy6_8inch(Matrix_6(2,1):Matrix_6(2,2))) 
           mean(Fy6_8inch(Matrix_6(3,1):Matrix_6(3,2))) 
           mean(Fy6_8inch(Matrix_6(4,1):Matrix_6(4,2))) 
           mean(Fy6_8inch(Matrix_6(5,1):Matrix_6(5,2))) 
           mean(Fy6_8inch(Matrix_6(6,1):Matrix_6(6,2))) 
           mean(Fy6_8inch(Matrix_6(7,1):Matrix_6(7,2))) 
           mean(Fy6_8inch(Matrix_6(8,1):Matrix_6(8,2))) 
           mean(Fy6_8inch(Matrix_6(9,1):Matrix_6(9,2))) 
           mean(Fy6_8inch(Matrix_6(10,1):Matrix_6(10,2)))
           mean(Fy6_8inch(Matrix_6(11,1):Matrix_6(11,2)))
           mean(Fy6_8inch(Matrix_6(12,1):Matrix_6(12,2)))
           mean(Fy6_8inch(Matrix_6(13,1):Matrix_6(13,2)))
           mean(Fy6_8inch(Matrix_6(14,1):Matrix_6(14,2)))
           mean(Fy6_8inch(Matrix_6(15,1):Matrix_6(15,2)))];
M1_tot_8inch = [-Mx1_avg_8inch(:,1).*sin(test_orient)+My1_avg_8inch(:,1).*cos(test_orient)];
F1_tot_8inch = [-Fx1_avg_8inch(:,1).*sin(test_orient)+Fy1_avg_8inch(:,1).*cos(test_orient)];
M2_tot_8inch = [-Mx2_avg_8inch(:,1).*sin(test_orient)+My2_avg_8inch(:,1).*cos(test_orient)];
F2_tot_8inch = [-Fx2_avg_8inch(:,1).*sin(test_orient)+Fy2_avg_8inch(:,1).*cos(test_orient)];
M3_tot_8inch = [-Mx3_avg_8inch(:,1).*sin(test_orient)+My3_avg_8inch(:,1).*cos(test_orient)];
F3_tot_8inch = [-Fx3_avg_8inch(:,1).*sin(test_orient)+Fy3_avg_8inch(:,1).*cos(test_orient)];
M4_tot_8inch = [-Mx4_avg_8inch(:,1).*sin(test_orient)+My4_avg_8inch(:,1).*cos(test_orient)];
F4_tot_8inch = [-Fx4_avg_8inch(:,1).*sin(test_orient)+Fy4_avg_8inch(:,1).*cos(test_orient)];
M5_tot_8inch = [-Mx5_avg_8inch(:,1).*sin(test_orient)+My5_avg_8inch(:,1).*cos(test_orient)];
F5_tot_8inch = [-Fx5_avg_8inch(:,1).*sin(test_orient)+Fy5_avg_8inch(:,1).*cos(test_orient)];
M6_tot_8inch = [-Mx6_avg_8inch(:,1).*sin(test_orient)+My6_avg_8inch(:,1).*cos(test_orient)];
F6_tot_8inch = [-Fx6_avg_8inch(:,1).*sin(test_orient)+Fy6_avg_8inch(:,1).*cos(test_orient)];

%%% Tachometer data
T1_sec_8inch = [ mean(RPM1i_8inch(Tach_R1(1,1):Tach_R1(1,2))), mean(RPM1r_8inch(Tach_R1(1,3):Tach_R1(1,4))), mean(RPM1p_8inch(Tach_R1(1,5):Tach_R1(1,6))); 
           mean(RPM1i_8inch(Tach_R1(2,1):Tach_R1(2,2))), mean(RPM1r_8inch(Tach_R1(2,3):Tach_R1(2,4))), mean(RPM1p_8inch(Tach_R1(2,5):Tach_R1(2,6)));
           mean(RPM1i_8inch(Tach_R1(3,1):Tach_R1(3,2))), mean(RPM1r_8inch(Tach_R1(3,3):Tach_R1(3,4))), mean(RPM1p_8inch(Tach_R1(3,5):Tach_R1(3,6)));
           mean(RPM1i_8inch(Tach_R1(4,1):Tach_R1(4,2))), mean(RPM1r_8inch(Tach_R1(4,3):Tach_R1(4,4))), mean(RPM1p_8inch(Tach_R1(4,5):Tach_R1(4,6)));
           mean(RPM1i_8inch(Tach_R1(5,1):Tach_R1(5,2))), mean(RPM1r_8inch(Tach_R1(5,3):Tach_R1(5,4))), mean(RPM1p_8inch(Tach_R1(5,5):Tach_R1(5,6)));
           mean(RPM1i_8inch(Tach_R1(6,1):Tach_R1(6,2))), mean(RPM1r_8inch(Tach_R1(6,3):Tach_R1(6,4))), mean(RPM1p_8inch(Tach_R1(6,5):Tach_R1(6,6)));
           mean(RPM1i_8inch(Tach_R1(7,1):Tach_R1(7,2))), mean(RPM1r_8inch(Tach_R1(7,3):Tach_R1(7,4))), mean(RPM1p_8inch(Tach_R1(7,5):Tach_R1(7,6))); 
           mean(RPM1i_8inch(Tach_R1(8,1):Tach_R1(8,2))), mean(RPM1r_8inch(Tach_R1(8,3):Tach_R1(8,4))), mean(RPM1p_8inch(Tach_R1(8,5):Tach_R1(8,6)));
           mean(RPM1i_8inch(Tach_R1(9,1):Tach_R1(9,2))), mean(RPM1r_8inch(Tach_R1(9,3):Tach_R1(9,4))), mean(RPM1p_8inch(Tach_R1(9,5):Tach_R1(9,6)));
           mean(RPM1i_8inch(Tach_R1(10,1):Tach_R1(10,2))), mean(RPM1r_8inch(Tach_R1(10,3):Tach_R1(10,4))), mean(RPM1p_8inch(Tach_R1(10,5):Tach_R1(10,6)));
           mean(RPM1i_8inch(Tach_R1(11,1):Tach_R1(11,2))), mean(RPM1r_8inch(Tach_R1(11,3):Tach_R1(11,4))), mean(RPM1p_8inch(Tach_R1(11,5):Tach_R1(11,6)));
           mean(RPM1i_8inch(Tach_R1(12,1):Tach_R1(12,2))), mean(RPM1r_8inch(Tach_R1(12,3):Tach_R1(12,4))), mean(RPM1p_8inch(Tach_R1(12,5):Tach_R1(12,6)));
           mean(RPM1i_8inch(Tach_R1(13,1):Tach_R1(13,2))), mean(RPM1r_8inch(Tach_R1(13,3):Tach_R1(13,4))), mean(RPM1p_8inch(Tach_R1(13,5):Tach_R1(13,6)));
           mean(RPM1i_8inch(Tach_R1(14,1):Tach_R1(14,2))), mean(RPM1r_8inch(Tach_R1(14,3):Tach_R1(14,4))), mean(RPM1p_8inch(Tach_R1(14,5):Tach_R1(14,6)));
           mean(RPM1i_8inch(Tach_R1(15,1):Tach_R1(15,2))), mean(RPM1r_8inch(Tach_R1(15,3):Tach_R1(15,4))), mean(RPM1p_8inch(Tach_R1(15,5):Tach_R1(15,6)));];
T1_avg_8inch = [mean(T1_sec_8inch(1,:))
          mean(T1_sec_8inch(2,:))
          mean(T1_sec_8inch(3,:))
          mean(T1_sec_8inch(4,:))
          mean(T1_sec_8inch(5,:))
          mean(T1_sec_8inch(6,:))
          mean(T1_sec_8inch(7,:))
          mean(T1_sec_8inch(8,:))
          mean(T1_sec_8inch(9,:))
          mean(T1_sec_8inch(10,:))
          mean(T1_sec_8inch(11,:))
          mean(T1_sec_8inch(12,:))
          mean(T1_sec_8inch(13,:))
          mean(T1_sec_8inch(14,:))
          mean(T1_sec_8inch(15,:))];

T2_sec_8inch = [ mean(RPM2i_8inch(Tach_R2(1,1):Tach_R2(1,2))), mean(RPM2r_8inch(Tach_R2(1,3):Tach_R2(1,4))), mean(RPM2p_8inch(Tach_R2(1,5):Tach_R2(1,6))); 
           mean(RPM2i_8inch(Tach_R2(2,1):Tach_R2(2,2))), mean(RPM2r_8inch(Tach_R2(2,3):Tach_R2(2,4))), mean(RPM2p_8inch(Tach_R2(2,5):Tach_R2(2,6)));
           mean(RPM2i_8inch(Tach_R2(3,1):Tach_R2(3,2))), mean(RPM2r_8inch(Tach_R2(3,3):Tach_R2(3,4))), mean(RPM2p_8inch(Tach_R2(3,5):Tach_R2(3,6)));
           mean(RPM2i_8inch(Tach_R2(4,1):Tach_R2(4,2))), mean(RPM2r_8inch(Tach_R2(4,3):Tach_R2(4,4))), mean(RPM2p_8inch(Tach_R2(4,5):Tach_R2(4,6)));
           mean(RPM2i_8inch(Tach_R2(5,1):Tach_R2(5,2))), mean(RPM2r_8inch(Tach_R2(5,3):Tach_R2(5,4))), mean(RPM2p_8inch(Tach_R2(5,5):Tach_R2(5,6)));
           mean(RPM2i_8inch(Tach_R2(6,1):Tach_R2(6,2))), mean(RPM2r_8inch(Tach_R2(6,3):Tach_R2(6,4))), mean(RPM2p_8inch(Tach_R2(6,5):Tach_R2(6,6)));
           mean(RPM2i_8inch(Tach_R2(7,1):Tach_R2(7,2))), mean(RPM2r_8inch(Tach_R2(7,3):Tach_R2(7,4))), mean(RPM2p_8inch(Tach_R2(7,5):Tach_R2(7,6))); 
           mean(RPM2i_8inch(Tach_R2(8,1):Tach_R2(8,2))), mean(RPM2r_8inch(Tach_R2(8,3):Tach_R2(8,4))), mean(RPM2p_8inch(Tach_R2(8,5):Tach_R2(8,6)));
           mean(RPM2i_8inch(Tach_R2(9,1):Tach_R2(9,2))), mean(RPM2r_8inch(Tach_R2(9,3):Tach_R2(9,4))), mean(RPM2p_8inch(Tach_R2(9,5):Tach_R2(9,6)));
           mean(RPM2i_8inch(Tach_R2(10,1):Tach_R2(10,2))), mean(RPM2r_8inch(Tach_R2(10,3):Tach_R2(10,4))), mean(RPM2p_8inch(Tach_R2(10,5):Tach_R2(10,6)));
           mean(RPM2i_8inch(Tach_R2(11,1):Tach_R2(11,2))), mean(RPM2r_8inch(Tach_R2(11,3):Tach_R2(11,4))), mean(RPM2p_8inch(Tach_R2(11,5):Tach_R2(11,6)));
           mean(RPM2i_8inch(Tach_R2(12,1):Tach_R2(12,2))), mean(RPM2r_8inch(Tach_R2(12,3):Tach_R2(12,4))), mean(RPM2p_8inch(Tach_R2(12,5):Tach_R2(12,6)));
           mean(RPM2i_8inch(Tach_R2(13,1):Tach_R2(13,2))), mean(RPM2r_8inch(Tach_R2(13,3):Tach_R2(13,4))), mean(RPM2p_8inch(Tach_R2(13,5):Tach_R2(13,6)));
           mean(RPM2i_8inch(Tach_R2(14,1):Tach_R2(14,2))), mean(RPM2r_8inch(Tach_R2(14,3):Tach_R2(14,4))), mean(RPM2p_8inch(Tach_R2(14,5):Tach_R2(14,6)));
           mean(RPM2i_8inch(Tach_R2(15,1):Tach_R2(15,2))), mean(RPM2r_8inch(Tach_R2(15,3):Tach_R2(15,4))), mean(RPM2p_8inch(Tach_R2(15,5):Tach_R2(15,6)));];
T2_avg_8inch = [mean(T2_sec_8inch(1,:))
          mean(T2_sec_8inch(2,:))
          mean(T2_sec_8inch(3,:))
          mean(T2_sec_8inch(4,:))
          mean(T2_sec_8inch(5,:))
          mean(T2_sec_8inch(6,:))
          mean(T2_sec_8inch(7,:))
          mean(T2_sec_8inch(8,:))
          mean(T2_sec_8inch(9,:))
          mean(T2_sec_8inch(10,:))
          mean(T2_sec_8inch(11,:))
          mean(T2_sec_8inch(12,:))
          mean(T2_sec_8inch(13,:))
          mean(T2_sec_8inch(14,:))
          mean(T2_sec_8inch(15,:))];

T3_sec_8inch = [ mean(RPM3i_8inch(Tach_R3(1,1):Tach_R3(1,2))), mean(RPM3r_8inch(Tach_R3(1,3):Tach_R3(1,4))), mean(RPM3p_8inch(Tach_R3(1,5):Tach_R3(1,6))); 
           mean(RPM3i_8inch(Tach_R3(2,1):Tach_R3(2,2))), mean(RPM3r_8inch(Tach_R3(2,3):Tach_R3(2,4))), mean(RPM3p_8inch(Tach_R3(2,5):Tach_R3(2,6)));
           mean(RPM3i_8inch(Tach_R3(3,1):Tach_R3(3,2))), mean(RPM3r_8inch(Tach_R3(3,3):Tach_R3(3,4))), mean(RPM3p_8inch(Tach_R3(3,5):Tach_R3(3,6)));
           mean(RPM3i_8inch(Tach_R3(4,1):Tach_R3(4,2))), mean(RPM3r_8inch(Tach_R3(4,3):Tach_R3(4,4))), mean(RPM3p_8inch(Tach_R3(4,5):Tach_R3(4,6)));
           mean(RPM3i_8inch(Tach_R3(5,1):Tach_R3(5,2))), mean(RPM3r_8inch(Tach_R3(5,3):Tach_R3(5,4))), mean(RPM3p_8inch(Tach_R3(5,5):Tach_R3(5,6)));
           mean(RPM3i_8inch(Tach_R3(6,1):Tach_R3(6,2))), mean(RPM3r_8inch(Tach_R3(6,3):Tach_R3(6,4))), mean(RPM3p_8inch(Tach_R3(6,5):Tach_R3(6,6)));
           mean(RPM3i_8inch(Tach_R3(7,1):Tach_R3(7,2))), mean(RPM3r_8inch(Tach_R3(7,3):Tach_R3(7,4))), mean(RPM3p_8inch(Tach_R3(7,5):Tach_R3(7,6))); 
           mean(RPM3i_8inch(Tach_R3(8,1):Tach_R3(8,2))), mean(RPM3r_8inch(Tach_R3(8,3):Tach_R3(8,4))), mean(RPM3p_8inch(Tach_R3(8,5):Tach_R3(8,6)));
           mean(RPM3i_8inch(Tach_R3(9,1):Tach_R3(9,2))), mean(RPM3r_8inch(Tach_R3(9,3):Tach_R3(9,4))), mean(RPM3p_8inch(Tach_R3(9,5):Tach_R3(9,6)));
           mean(RPM3i_8inch(Tach_R3(10,1):Tach_R3(10,2))), mean(RPM3r_8inch(Tach_R3(10,3):Tach_R3(10,4))), mean(RPM3p_8inch(Tach_R3(10,5):Tach_R3(10,6)));
           mean(RPM3i_8inch(Tach_R3(11,1):Tach_R3(11,2))), mean(RPM3r_8inch(Tach_R3(11,3):Tach_R3(11,4))), mean(RPM3p_8inch(Tach_R3(11,5):Tach_R3(11,6)));
           mean(RPM3i_8inch(Tach_R3(12,1):Tach_R3(12,2))), mean(RPM3r_8inch(Tach_R3(12,3):Tach_R3(12,4))), mean(RPM3p_8inch(Tach_R3(12,5):Tach_R3(12,6)));
           mean(RPM3i_8inch(Tach_R3(13,1):Tach_R3(13,2))), mean(RPM3r_8inch(Tach_R3(13,3):Tach_R3(13,4))), mean(RPM3p_8inch(Tach_R3(13,5):Tach_R3(13,6)));
           mean(RPM3i_8inch(Tach_R3(14,1):Tach_R3(14,2))), mean(RPM3r_8inch(Tach_R3(14,3):Tach_R3(14,4))), mean(RPM3p_8inch(Tach_R3(14,5):Tach_R3(14,6)));
           mean(RPM3i_8inch(Tach_R3(15,1):Tach_R3(15,2))), mean(RPM3r_8inch(Tach_R3(15,3):Tach_R3(15,4))), mean(RPM3p_8inch(Tach_R3(15,5):Tach_R3(15,6)));];
T3_avg_8inch = [mean(T3_sec_8inch(1,:))
          mean(T3_sec_8inch(2,:))
          mean(T3_sec_8inch(3,:))
          mean(T3_sec_8inch(4,:))
          mean(T3_sec_8inch(5,:))
          mean(T3_sec_8inch(6,:))
          mean(T3_sec_8inch(7,:))
          mean(T3_sec_8inch(8,:))
          mean(T3_sec_8inch(9,:))
          mean(T3_sec_8inch(10,:))
          mean(T3_sec_8inch(11,:))
          mean(T3_sec_8inch(12,:))
          mean(T3_sec_8inch(13,:))
          mean(T3_sec_8inch(14,:))
          mean(T3_sec_8inch(15,:))];

T4_sec_8inch = [ mean(RPM4i_8inch(Tach_R4(1,1):Tach_R4(1,2))), mean(RPM4r_8inch(Tach_R4(1,3):Tach_R4(1,4))), mean(RPM4p_8inch(Tach_R4(1,5):Tach_R4(1,6))); 
           mean(RPM4i_8inch(Tach_R4(2,1):Tach_R4(2,2))), mean(RPM4r_8inch(Tach_R4(2,3):Tach_R4(2,4))), mean(RPM4p_8inch(Tach_R4(2,5):Tach_R4(2,6)));
           mean(RPM4i_8inch(Tach_R4(3,1):Tach_R4(3,2))), mean(RPM4r_8inch(Tach_R4(3,3):Tach_R4(3,4))), mean(RPM4p_8inch(Tach_R4(3,5):Tach_R4(3,6)));
           mean(RPM4i_8inch(Tach_R4(4,1):Tach_R4(4,2))), mean(RPM4r_8inch(Tach_R4(4,3):Tach_R4(4,4))), mean(RPM4p_8inch(Tach_R4(4,5):Tach_R4(4,6)));
           mean(RPM4i_8inch(Tach_R4(5,1):Tach_R4(5,2))), mean(RPM4r_8inch(Tach_R4(5,3):Tach_R4(5,4))), mean(RPM4p_8inch(Tach_R4(5,5):Tach_R4(5,6)));
           mean(RPM4i_8inch(Tach_R4(6,1):Tach_R4(6,2))), mean(RPM4r_8inch(Tach_R4(6,3):Tach_R4(6,4))), mean(RPM4p_8inch(Tach_R4(6,5):Tach_R4(6,6)));
           mean(RPM4i_8inch(Tach_R4(7,1):Tach_R4(7,2))), mean(RPM4r_8inch(Tach_R4(7,3):Tach_R4(7,4))), mean(RPM4p_8inch(Tach_R4(7,5):Tach_R4(7,6))); 
           mean(RPM4i_8inch(Tach_R4(8,1):Tach_R4(8,2))), mean(RPM4r_8inch(Tach_R4(8,3):Tach_R4(8,4))), mean(RPM4p_8inch(Tach_R4(8,5):Tach_R4(8,6)));
           mean(RPM4i_8inch(Tach_R4(9,1):Tach_R4(9,2))), mean(RPM4r_8inch(Tach_R4(9,3):Tach_R4(9,4))), mean(RPM4p_8inch(Tach_R4(9,5):Tach_R4(9,6)));
           mean(RPM4i_8inch(Tach_R4(10,1):Tach_R4(10,2))), mean(RPM4r_8inch(Tach_R4(10,3):Tach_R4(10,4))), mean(RPM4p_8inch(Tach_R4(10,5):Tach_R4(10,6)));
           mean(RPM4i_8inch(Tach_R4(11,1):Tach_R4(11,2))), mean(RPM4r_8inch(Tach_R4(11,3):Tach_R4(11,4))), mean(RPM4p_8inch(Tach_R4(11,5):Tach_R4(11,6)));
           mean(RPM4i_8inch(Tach_R4(12,1):Tach_R4(12,2))), mean(RPM4r_8inch(Tach_R4(12,3):Tach_R4(12,4))), mean(RPM4p_8inch(Tach_R4(12,5):Tach_R4(12,6)));
           mean(RPM4i_8inch(Tach_R4(13,1):Tach_R4(13,2))), mean(RPM4r_8inch(Tach_R4(13,3):Tach_R4(13,4))), mean(RPM4p_8inch(Tach_R4(13,5):Tach_R4(13,6)));
           mean(RPM4i_8inch(Tach_R4(14,1):Tach_R4(14,2))), mean(RPM4r_8inch(Tach_R4(14,3):Tach_R4(14,4))), mean(RPM4p_8inch(Tach_R4(14,5):Tach_R4(14,6)));
           mean(RPM4i_8inch(Tach_R4(15,1):Tach_R4(15,2))), mean(RPM4r_8inch(Tach_R4(15,3):Tach_R4(15,4))), mean(RPM4p_8inch(Tach_R4(15,5):Tach_R4(15,6)));];
T4_avg_8inch = [mean(T4_sec_8inch(1,:))
          mean(T4_sec_8inch(2,:))
          mean(T4_sec_8inch(3,:))
          mean(T4_sec_8inch(4,:))
          mean(T4_sec_8inch(5,:))
          mean(T4_sec_8inch(6,:))
          mean(T4_sec_8inch(7,:))
          mean(T4_sec_8inch(8,:))
          mean(T4_sec_8inch(9,:))
          mean(T4_sec_8inch(10,:))
          mean(T4_sec_8inch(11,:))
          mean(T4_sec_8inch(12,:))
          mean(T4_sec_8inch(13,:))
          mean(T4_sec_8inch(14,:))
          mean(T4_sec_8inch(15,:))];

T5_sec_8inch = [ mean(RPM5i_8inch(Tach_R5(1,1):Tach_R5(1,2))), mean(RPM5r_8inch(Tach_R5(1,3):Tach_R5(1,4))), mean(RPM5p_8inch(Tach_R5(1,5):Tach_R5(1,6))); 
           mean(RPM5i_8inch(Tach_R5(2,1):Tach_R5(2,2))), mean(RPM5r_8inch(Tach_R5(2,3):Tach_R5(2,4))), mean(RPM5p_8inch(Tach_R5(2,5):Tach_R5(2,6)));
           mean(RPM5i_8inch(Tach_R5(3,1):Tach_R5(3,2))), mean(RPM5r_8inch(Tach_R5(3,3):Tach_R5(3,4))), mean(RPM5p_8inch(Tach_R5(3,5):Tach_R5(3,6)));
           mean(RPM5i_8inch(Tach_R5(4,1):Tach_R5(4,2))), mean(RPM5r_8inch(Tach_R5(4,3):Tach_R5(4,4))), mean(RPM5p_8inch(Tach_R5(4,5):Tach_R5(4,6)));
           mean(RPM5i_8inch(Tach_R5(5,1):Tach_R5(5,2))), mean(RPM5r_8inch(Tach_R5(5,3):Tach_R5(5,4))), mean(RPM5p_8inch(Tach_R5(5,5):Tach_R5(5,6)));
           mean(RPM5i_8inch(Tach_R5(6,1):Tach_R5(6,2))), mean(RPM5r_8inch(Tach_R5(6,3):Tach_R5(6,4))), mean(RPM5p_8inch(Tach_R5(6,5):Tach_R5(6,6)));
           mean(RPM5i_8inch(Tach_R5(7,1):Tach_R5(7,2))), mean(RPM5r_8inch(Tach_R5(7,3):Tach_R5(7,4))), mean(RPM5p_8inch(Tach_R5(7,5):Tach_R5(7,6))); 
           mean(RPM5i_8inch(Tach_R5(8,1):Tach_R5(8,2))), mean(RPM5r_8inch(Tach_R5(8,3):Tach_R5(8,4))), mean(RPM5p_8inch(Tach_R5(8,5):Tach_R5(8,6)));
           mean(RPM5i_8inch(Tach_R5(9,1):Tach_R5(9,2))), mean(RPM5r_8inch(Tach_R5(9,3):Tach_R5(9,4))), mean(RPM5p_8inch(Tach_R5(9,5):Tach_R5(9,6)));
           mean(RPM5i_8inch(Tach_R5(10,1):Tach_R5(10,2))), mean(RPM5r_8inch(Tach_R5(10,3):Tach_R5(10,4))), mean(RPM5p_8inch(Tach_R5(10,5):Tach_R5(10,6)));
           mean(RPM5i_8inch(Tach_R5(11,1):Tach_R5(11,2))), mean(RPM5r_8inch(Tach_R5(11,3):Tach_R5(11,4))), mean(RPM5p_8inch(Tach_R5(11,5):Tach_R5(11,6)));
           mean(RPM5i_8inch(Tach_R5(12,1):Tach_R5(12,2))), mean(RPM5r_8inch(Tach_R5(12,3):Tach_R5(12,4))), mean(RPM5p_8inch(Tach_R5(12,5):Tach_R5(12,6)));
           mean(RPM5i_8inch(Tach_R5(13,1):Tach_R5(13,2))), mean(RPM5r_8inch(Tach_R5(13,3):Tach_R5(13,4))), mean(RPM5p_8inch(Tach_R5(13,5):Tach_R5(13,6)));
           mean(RPM5i_8inch(Tach_R5(14,1):Tach_R5(14,2))), mean(RPM5r_8inch(Tach_R5(14,3):Tach_R5(14,4))), mean(RPM5p_8inch(Tach_R5(14,5):Tach_R5(14,6)));
           mean(RPM5i_8inch(Tach_R5(15,1):Tach_R5(15,2))), mean(RPM5r_8inch(Tach_R5(15,3):Tach_R5(15,4))), mean(RPM5p_8inch(Tach_R5(15,5):Tach_R5(15,6)));];
T5_avg_8inch = [mean(T5_sec_8inch(1,:))
          mean(T5_sec_8inch(2,:))
          mean(T5_sec_8inch(3,:))
          mean(T5_sec_8inch(4,:))
          mean(T5_sec_8inch(5,:))
          mean(T5_sec_8inch(6,:))
          mean(T5_sec_8inch(7,:))
          mean(T5_sec_8inch(8,:))
          mean(T5_sec_8inch(9,:))
          mean(T5_sec_8inch(10,:))
          mean(T5_sec_8inch(11,:))
          mean(T5_sec_8inch(12,:))
          mean(T5_sec_8inch(13,:))
          mean(T5_sec_8inch(14,:))
          mean(T5_sec_8inch(15,:))];

T6_sec_8inch = [ mean(RPM6p_8inch(Tach_R6(1,1):Tach_R6(1,2)))
           mean(RPM6p_8inch(Tach_R6(2,1):Tach_R6(2,2)))
           mean(RPM6p_8inch(Tach_R6(3,1):Tach_R6(3,2)))
           mean(RPM6p_8inch(Tach_R6(4,1):Tach_R6(4,2)))
           mean(RPM6p_8inch(Tach_R6(5,1):Tach_R6(5,2)))
           mean(RPM6p_8inch(Tach_R6(6,1):Tach_R6(6,2)))
           mean(RPM6p_8inch(Tach_R6(7,1):Tach_R6(7,2)))
           mean(RPM6p_8inch(Tach_R6(8,1):Tach_R6(8,2)))
           mean(RPM6p_8inch(Tach_R6(9,1):Tach_R6(9,2)))
           mean(RPM6p_8inch(Tach_R6(10,1):Tach_R6(10,2)))
           mean(RPM6p_8inch(Tach_R6(11,1):Tach_R6(11,2)))
           mean(RPM6p_8inch(Tach_R6(12,1):Tach_R6(12,2)))
           mean(RPM6p_8inch(Tach_R6(13,1):Tach_R6(13,2)))
           mean(RPM6p_8inch(Tach_R6(14,1):Tach_R6(14,2)))
           mean(RPM6p_8inch(Tach_R6(15,1):Tach_R6(15,2)))];
T6_avg_8inch = [mean(T6_sec_8inch(1,:))
          mean(T6_sec_8inch(2,:))
          mean(T6_sec_8inch(3,:))
          mean(T6_sec_8inch(4,:))
          mean(T6_sec_8inch(5,:))
          mean(T6_sec_8inch(6,:))
          mean(T6_sec_8inch(7,:))
          mean(T6_sec_8inch(8,:))
          mean(T6_sec_8inch(9,:))
          mean(T6_sec_8inch(10,:))
          mean(T6_sec_8inch(11,:))
          mean(T6_sec_8inch(12,:))
          mean(T6_sec_8inch(13,:))
          mean(T6_sec_8inch(14,:))
          mean(T6_sec_8inch(15,:))];

F1tot_8inch  =   -Fx1_8inch.*sin(test_orient)+Fy1_8inch.*cos(test_orient);
F2tot_8inch  =   -Fx2_8inch.*sin(test_orient)+Fy2_8inch.*cos(test_orient);
F3tot_8inch  =   -Fx3_8inch.*sin(test_orient)+Fy3_8inch.*cos(test_orient);
F4tot_8inch  =   -Fx4_8inch.*sin(test_orient)+Fy4_8inch.*cos(test_orient);
F5tot_8inch  =   -Fx5_8inch.*sin(test_orient)+Fy5_8inch.*cos(test_orient);
F6tot_8inch  =   -Fx6_8inch.*sin(test_orient)+Fy6_8inch.*cos(test_orient);
M1tot_8inch  =    Mx1_8inch.*cos(test_orient)+My1_8inch.*sin(test_orient);
M2tot_8inch  =    Mx2_8inch.*cos(test_orient)+My2_8inch.*sin(test_orient);
M3tot_8inch  =    Mx3_8inch.*cos(test_orient)+My3_8inch.*sin(test_orient);
M4tot_8inch  =    Mx4_8inch.*cos(test_orient)+My4_8inch.*sin(test_orient);
M5tot_8inch  =    Mx5_8inch.*cos(test_orient)+My5_8inch.*sin(test_orient);
M6tot_8inch  =    Mx6_8inch.*cos(test_orient)+My6_8inch.*sin(test_orient);

M1_tot_8inch =     Mx1_avg_8inch(:,1).*cos(test_orient)+My1_avg_8inch(:,1).*sin(test_orient);
M2_tot_8inch =     Mx2_avg_8inch(:,1).*cos(test_orient)+My2_avg_8inch(:,1).*sin(test_orient);
M3_tot_8inch =     Mx3_avg_8inch(:,1).*cos(test_orient)+My3_avg_8inch(:,1).*sin(test_orient);
M4_tot_8inch =     Mx4_avg_8inch(:,1).*cos(test_orient)+My4_avg_8inch(:,1).*sin(test_orient);
M5_tot_8inch =     Mx5_avg_8inch(:,1).*cos(test_orient)+My5_avg_8inch(:,1).*sin(test_orient);
M6_tot_8inch =     Mx6_avg_8inch(:,1).*cos(test_orient)+My6_avg_8inch(:,1).*sin(test_orient);
F1_tot_8inch =    -Fx1_avg_8inch(:,1).*sin(test_orient)+Fy1_avg_8inch(:,1).*cos(test_orient);
F2_tot_8inch =    -Fx2_avg_8inch(:,1).*sin(test_orient)+Fy2_avg_8inch(:,1).*cos(test_orient);
F3_tot_8inch =    -Fx3_avg_8inch(:,1).*sin(test_orient)+Fy3_avg_8inch(:,1).*cos(test_orient);
F4_tot_8inch =    -Fx4_avg_8inch(:,1).*sin(test_orient)+Fy4_avg_8inch(:,1).*cos(test_orient);
F5_tot_8inch =    -Fx5_avg_8inch(:,1).*sin(test_orient)+Fy5_avg_8inch(:,1).*cos(test_orient);
F6_tot_8inch =    -Fx6_avg_8inch(:,1).*sin(test_orient)+Fy6_avg_8inch(:,1).*cos(test_orient);

OFFset_456_f = mean(F6_tot_8inch(4:6));
OFFset_789_f = mean(F6_tot_8inch(7:9));
OFFset_012_f = mean(F6_tot_8inch(10:12));
OFFset_345_f = mean(F6_tot_8inch(13:15));
OFFset_456_m = mean(M6_tot_8inch(4:6));
OFFset_789_m = mean(M6_tot_8inch(7:9));
OFFset_012_m = mean(M6_tot_8inch(10:12));
OFFset_345_m = mean(M6_tot_8inch(13:15));

M1_tot_8inch = [M1_tot_8inch(1:3); M1_tot_8inch(4:6)-OFFset_456_m; M1_tot_8inch(7:9)-OFFset_789_m; M1_tot_8inch(10:12)-OFFset_012_m; M1_tot_8inch(13:15)-OFFset_345_m];
M2_tot_8inch = [M2_tot_8inch(1:3); M2_tot_8inch(4:6)-OFFset_456_m; M2_tot_8inch(7:9)-OFFset_789_m; M2_tot_8inch(10:12)-OFFset_012_m; M2_tot_8inch(13:15)-OFFset_345_m];
M3_tot_8inch = [M3_tot_8inch(1:3); M3_tot_8inch(4:6)-OFFset_456_m; M3_tot_8inch(7:9)-OFFset_789_m; M3_tot_8inch(10:12)-OFFset_012_m; M3_tot_8inch(13:15)-OFFset_345_m];
M4_tot_8inch = [M4_tot_8inch(1:3); M4_tot_8inch(4:6)-OFFset_456_m; M4_tot_8inch(7:9)-OFFset_789_m; M4_tot_8inch(10:12)-OFFset_012_m; M4_tot_8inch(13:15)-OFFset_345_m];
M5_tot_8inch = [M5_tot_8inch(1:3); M5_tot_8inch(4:6)-OFFset_456_m; M5_tot_8inch(7:9)-OFFset_789_m; M5_tot_8inch(10:12)-OFFset_012_m; M5_tot_8inch(13:15)-OFFset_345_m];
M6_tot_8inch = [M6_tot_8inch(1:3); M6_tot_8inch(4:6)-OFFset_456_m; M6_tot_8inch(7:9)-OFFset_789_m; M6_tot_8inch(10:12)-OFFset_012_m; M6_tot_8inch(13:15)-OFFset_345_m];
F1_tot_8inch = [F1_tot_8inch(1:3); F1_tot_8inch(4:6)-OFFset_456_f; F1_tot_8inch(7:9)-OFFset_789_f; F1_tot_8inch(10:12)-OFFset_012_f; F1_tot_8inch(13:15)-OFFset_345_f];
F2_tot_8inch = [F2_tot_8inch(1:3); F2_tot_8inch(4:6)-OFFset_456_f; F2_tot_8inch(7:9)-OFFset_789_f; F2_tot_8inch(10:12)-OFFset_012_f; F2_tot_8inch(13:15)-OFFset_345_f];
F3_tot_8inch = [F3_tot_8inch(1:3); F3_tot_8inch(4:6)-OFFset_456_f; F3_tot_8inch(7:9)-OFFset_789_f; F3_tot_8inch(10:12)-OFFset_012_f; F3_tot_8inch(13:15)-OFFset_345_f];
F4_tot_8inch = [F4_tot_8inch(1:3); F4_tot_8inch(4:6)-OFFset_456_f; F4_tot_8inch(7:9)-OFFset_789_f; F4_tot_8inch(10:12)-OFFset_012_f; F4_tot_8inch(13:15)-OFFset_345_f];
F5_tot_8inch = [F5_tot_8inch(1:3); F5_tot_8inch(4:6)-OFFset_456_f; F5_tot_8inch(7:9)-OFFset_789_f; F5_tot_8inch(10:12)-OFFset_012_f; F5_tot_8inch(13:15)-OFFset_345_f];
F6_tot_8inch = [F6_tot_8inch(1:3); F6_tot_8inch(4:6)-OFFset_456_f; F6_tot_8inch(7:9)-OFFset_789_f; F6_tot_8inch(10:12)-OFFset_012_f; F6_tot_8inch(13:15)-OFFset_345_f];
M_tot_8inch = [M1_tot_8inch,M2_tot_8inch,M3_tot_8inch,M4_tot_8inch,M5_tot_8inch,M6_tot_8inch];
F_tot_8inch = [F1_tot_8inch,F2_tot_8inch,F3_tot_8inch,F4_tot_8inch,F5_tot_8inch,F6_tot_8inch];

mom1_8inch = 0.5*pi*rho_1*(T1_avg_8inch*2*pi/60).^2*Radius^4*L;
mom2_8inch = 0.5*pi*rho_2*(T2_avg_8inch*2*pi/60).^2*Radius^4*L;
mom3_8inch = 0.5*pi*rho_3*(T3_avg_8inch*2*pi/60).^2*Radius^4*L;
mom4_8inch = 0.5*pi*rho_4*(T4_avg_8inch*2*pi/60).^2*Radius^4*L;
mom5_8inch = 0.5*pi*rho_5*(T5_avg_8inch*2*pi/60).^2*Radius^4*L;
mom6_8inch = 0.5*pi*rho_6*(T6_avg_8inch*2*pi/60).^2*Radius^4*L;

for1_8inch = 0.5*pi*rho_1*(T1_avg_8inch*2*pi/60).^2*Radius^3*L;
for2_8inch = 0.5*pi*rho_2*(T2_avg_8inch*2*pi/60).^2*Radius^3*L;
for3_8inch = 0.5*pi*rho_3*(T3_avg_8inch*2*pi/60).^2*Radius^3*L;
for4_8inch = 0.5*pi*rho_4*(T4_avg_8inch*2*pi/60).^2*Radius^3*L;
for5_8inch = 0.5*pi*rho_5*(T5_avg_8inch*2*pi/60).^2*Radius^3*L;
for6_8inch = 0.5*pi*rho_6*(T6_avg_8inch*2*pi/60).^2*Radius^3*L;

Cm1_8inch  = M1_tot_8inch./mom1_8inch;
Cm2_8inch  = M2_tot_8inch./mom2_8inch;
Cm3_8inch  = M3_tot_8inch./mom3_8inch;
Cm4_8inch  = M4_tot_8inch./mom4_8inch;
Cm5_8inch  = M5_tot_8inch./mom5_8inch;
Cm6_8inch  = M6_tot_8inch./mom6_8inch;
Cm_8inch = [Cm1_8inch,Cm2_8inch,Cm3_8inch,Cm4_8inch,Cm5_8inch,Cm6_8inch];

Cf1_8inch  = F1_tot_8inch./for1_8inch;%F1_tot
Cf2_8inch  = F2_tot_8inch./for2_8inch;%F2_tot
Cf3_8inch  = F3_tot_8inch./for3_8inch;%F3_tot
Cf4_8inch  = F4_tot_8inch./for4_8inch;%F4_tot
Cf5_8inch  = F5_tot_8inch./for5_8inch;%F5_tot
Cf6_8inch  = F6_tot_8inch./for6_8inch;%F6_tot
Cf_8inch = [Cf1_8inch,Cf2_8inch,Cf3_8inch,Cf4_8inch,Cf5_8inch,Cf6_8inch];

%% %% 10" propellers
%%%% Order of the script:
%%%% Results at H0
% Problem parameters

L          = 0.20;     %m
numBlades  = 2;
Radius     = 0.254/2; %m (diameter if 0.2 is used
R_constant = 287.04; % m^2 /°Ksec^2
toKelvin   = 273.15;
%%%% File selection and loading of data

LC1 = '20221026/LoadCell/log_20221026_151534_10inch_H0_R1_11.csv';
LC2 = '20221026/LoadCell/log_20221026_133935_10inch_H0_R2_8.csv';
LC3 = '20221026/LoadCell/log_20221026_105857_10inch_H0_R4_5.csv';
LC4 = '20221026/LoadCell/log_20221026_102546_10inch_H0_Rinf_4.csv';

Tr_1 = '20221026/TachometerR/20221026_H0_R1_11.csv';
Tp_1 = '20221026/Tachometer3/20221026_H0_R1_11.csv';

Ti_2 = '20221026/TachometerI/20221026_10inch_H0_R2_8.csv';
Tr_2 = '20221026/TachometerR/20221026_10inch_H0_R2_8.csv';
Tp_2 = '20221026/Tachometer3/20221026_10inch_H0_R2_8.csv';

Ti_3 = '20221026/TachometerI/20221026_10inch_H0_R4_5.csv';
Tp_3 = '20221026/Tachometer3/20221026_10inch_H0_R4_5.csv';

Ti_4 = '20221026/TachometerI/20221026_10inch_H0_Rinf_4.csv';
Tp_4 = '20221026/Tachometer3/20221026_10inch_H0_Rinf_4.csv';

%%% Chamber conditions of each test
P_1 = 993.1e2; % Pa = N/m^2 
P_2 = 993.4e2; % Pa = N/m^2 
P_3 = 994.3e2; % Pa = N/m^2 
P_4 = 994.5e2; % Pa = N/m^2 

T_1 = 20.8;    % ºC
T_2 = 22.3;    % ºC
T_3 = 20.9;    % ºC
T_4 = 20.4;    % ºC

fx_column = 2;
fy_column = 3;
fz_column = 4;
mx_column = 5;
my_column = 6;
mz_column = 7;

offset1 = 477;
offset2 = 477;
offset3 = 477;
offset4 = 477;
add_points = 1;

Matrix_1 = 10*[ 48.4+add_points	75
               317.8+add_points	332.9
               577.4+add_points	584.9
               111.6+add_points	125.8
               368.1+add_points	382.2
                 628+add_points	639.8
               161.8+add_points	177.3
               419.3+add_points	432.1
               680.8+add_points	690.3
               213.3+add_points	228.6
               474.5+add_points	485.5
               730.5+add_points	742.4
               266.3+add_points	280.7
                 525+add_points	536.1
               783.5+add_points	794.9];

diff_matrix1 = Matrix_1(:,2)-Matrix_1(:,1);

Matrix_2 = 10*[     81+add_points	97.9
                 342.2+add_points	354
                 601.4+add_points	613.7
                 137.1+add_points	149.2
                 394.4+add_points	404.3
                 652.8+add_points	665.3
                 186.1+add_points	199.6
                 446.7+add_points	457.9
                 703.6+add_points	715.3
                 236.8+add_points	250.1
                 496.4+add_points	509
                 755.8+add_points	767.3
                 292.1+add_points	303.6
                 550.8+add_points	561.3
                 811.3+add_points	821];

diff_matrix2 = Matrix_2(:,2)-Matrix_2(:,1);

Matrix_3 = 10*[  59.7+add_points	74.2
                322.6+add_points	333
                579.9+add_points	590.2
                112.1+add_points	125.2
                374.6+add_points	385.1
                627.1+add_points	641.7
                162.5+add_points	177
                424.1+add_points	435.4
                681.5+add_points	694.4
                215.7+add_points	229.9
                474.2+add_points	488.1
                735.2+add_points	745.2
                269.4+add_points	281.8
                530.9+add_points	539.1
                789.5+add_points	797.1];

diff_matrix3 = Matrix_3(:,2)-Matrix_3(:,1);

Matrix_4 = 10*[  54.9+add_points	68.5
                316.9+add_points	326.7
                571.4+add_points	583.5
                107.2+add_points	117.2
                  367+add_points	376.7
                623.7+add_points	635.4
                  161+add_points	170.5
                418.3+add_points	428.7
                  677+add_points	686.4
                210.9+add_points	222.1
                465.6+add_points	478.9
                729.7+add_points	737.4
                260.4+add_points	273
                  519+add_points	529.2
                  785+add_points	792.6];

diff_matrix4 = Matrix_4(:,2)-Matrix_4(:,1);

%%%% Thacometers are writtern as 
%%%% T_R1 = [T1_start T1_end T2_start T2_end T3_start T3_end]

Tach_R1 = [1	293	  1	    570
           1833	2033  2095	2357
           3295	3515  3882	4155
           349	675	  608	930
           2083	2337  2422	2739
           3558	3797  4226	4537
           687	1016  965	1289
           2355	2615  2770	3088
           3843	4078  4563	4893
           1065	1392  1311	1643
           2652	2910  3113	3451
           4125	4361  4908	5231
           1419	1740  1678	3471
           2936	3198  3471	3797
           4400	4679  5268	5618];

Tach_R2 =  [1	    851	  1	    643	  1	    851
            2384	2623  1911	2184  2384	2623
            4170	4441  3682	3979  4170	4441
            897	    1201  677	938	  897	1201
            2696	2981  2243	2548  2696	2981
            4491	4782  4023	4339  4491	4782
            1224	1548  970	1234  1224	1548
            3061	3346  2569	2885  3061	3346
            4842	5127  4361	4669  4842	5127
            1587	1818  1271	1552  1587	1818
            3378	3709  2923	3250  3378	3709
            5181	5496  4746	5050  5181	5496
            1945	2254  1563	1829  1945	2254
            3749	4079  3293	3614  3749	4079
            5536	5872  5091	5385  5536	5872];

Tach_R3 = [1	593	  1 	593
           2141	2395  2141	2395
           3940	4210  3940	4210
           677	935	  677	935
           2476	2752  2476	2752
           4270	4549  4270	4549
           1004	1324  1004	1324
           2798	3131  2798	3131
           4589	4903  4589	4903
           1363	1691  1363	1691
           3161	3491  3161	3491
           4947	5262  4947	5262
           1714	2024  1714	2024
           3510	3839  3510	3839
           5294	5658  5294	5658];

Tach_R4 = [1	574	  1	    574
           2133	2391  2133	2391
           3919	4200  3919	4200
           665	962	  665	962
           2472	2749  2472	2749
           4270	4548  4270	4548
           1029	1305  1029	1305
           2820	3110  2820	3110
           4638	4906  4638	4906
           1384	1665  1384	1665
           3169	3474  3169	3474
           4961	5268  4961	5268
           1723	2035  1723	2035
           3524	3826  3524	3826
           5323	5647  5323	5647];






rho_1 = P_1/(R_constant*(T_1+toKelvin));
rho_2 = P_2/(R_constant*(T_2+toKelvin));
rho_3 = P_3/(R_constant*(T_3+toKelvin));
rho_4 = P_4/(R_constant*(T_4+toKelvin));



% Load Cell parameters
Nominal_accuracy = 0.0025;
Fz_meas_range    = 400; % - (-400);
Fxy_meas_range   = 200; % - (-200);
M_meas_range     = 16;  % - (-16);
Fz_acc  = 0;            %Nominal_accuracy*Fz_meas_range;
Fxy_acc = 0;            %Nominal_accuracy*Fxy_meas_range;
M_acc   = 0;            %Nominal_accuracy*M_meas_range;

loadCell_data1 = readtable(LC1);
loadCell_data2 = readtable(LC2);
loadCell_data3 = readtable(LC3);
loadCell_data4 = readtable(LC4);

RPM_data1r = readtable(Tr_1);
RPM_data1p = readtable(Tp_1);

RPM_data2i = readtable(Ti_2);
RPM_data2r = readtable(Tr_2);
RPM_data2p = readtable(Tp_2);

RPM_data3i = readtable(Ti_3);
RPM_data3p = readtable(Tp_3);

RPM_data4i = readtable(Ti_4);
RPM_data4p = readtable(Tp_4);


indx1 = 1; % Index for load cell test 1
indx2 = 1; % Index for load cell test 2
indx3 = 1; % Index for load cell test 3
indx4 = 1; % Index for load cell test 4

indx10 = 1; % Index for RPM test 1
indx11 = 1; % Index for RPM test 2
indx12 = 1; % Index for RPM test 3
indx13 = 1; % Index for RPM test 4


Fz1_10inch = loadCell_data1{indx1:end,fz_column}-loadCell_data1{offset1,fz_column};
Fz2_10inch = loadCell_data2{indx2:end,fz_column}-loadCell_data2{offset2,fz_column};
Fz3_10inch = loadCell_data3{indx3:end,fz_column}-loadCell_data3{offset3,fz_column};
Fz4_10inch = loadCell_data4{indx4:end,fz_column}-loadCell_data4{offset4,fz_column};
 
time1_10inch = loadCell_data1{1:end-indx1+1,1}./10;
time2_10inch = loadCell_data2{1:end-indx2+1,1}./10;
time3_10inch = loadCell_data3{1:end-indx3+1,1}./10;
time4_10inch = loadCell_data4{1:end-indx4+1,1}./10;
 

test_orient = pi/4;
Fx1_10inch = loadCell_data1{indx1:end,fx_column}-loadCell_data1{offset1,fx_column};
Fy1_10inch = loadCell_data1{indx1:end,fy_column}-loadCell_data1{offset1,fy_column};
Fx2_10inch = loadCell_data2{indx2:end,fx_column}-loadCell_data2{offset2,fx_column};
Fy2_10inch = loadCell_data2{indx2:end,fy_column}-loadCell_data2{offset2,fy_column};
Fx3_10inch = loadCell_data3{indx3:end,fx_column}-loadCell_data3{offset3,fx_column};
Fy3_10inch = loadCell_data3{indx3:end,fy_column}-loadCell_data3{offset3,fy_column};
Fx4_10inch = loadCell_data4{indx4:end,fx_column}-loadCell_data4{offset4,fx_column};
Fy4_10inch = loadCell_data4{indx4:end,fy_column}-loadCell_data4{offset4,fy_column};


Mx1_10inch = (loadCell_data1{indx1:end,mx_column}-loadCell_data1{offset1,mx_column})/10;
Mx2_10inch = (loadCell_data2{indx2:end,mx_column}-loadCell_data2{offset2,mx_column})/10;
Mx3_10inch = (loadCell_data3{indx3:end,mx_column}-loadCell_data3{offset3,mx_column})/10;
Mx4_10inch = (loadCell_data4{indx4:end,mx_column}-loadCell_data4{offset4,mx_column})/10;
My1_10inch = (loadCell_data1{indx1:end,my_column}-loadCell_data1{offset1,my_column})/10;
My2_10inch = (loadCell_data2{indx2:end,my_column}-loadCell_data2{offset2,my_column})/10;
My3_10inch = (loadCell_data3{indx3:end,my_column}-loadCell_data3{offset3,my_column})/10;
My4_10inch = (loadCell_data4{indx4:end,my_column}-loadCell_data4{offset4,my_column})/10;
Mz1_10inch = (loadCell_data1{indx1:end,mz_column}-loadCell_data1{offset1,mz_column})/10;
Mz2_10inch = (loadCell_data2{indx2:end,mz_column}-loadCell_data2{offset2,mz_column})/10;
Mz3_10inch = (loadCell_data3{indx3:end,mz_column}-loadCell_data3{offset3,mz_column})/10;
Mz4_10inch = (loadCell_data4{indx4:end,mz_column}-loadCell_data4{offset4,mz_column})/10;

Fx1_10inch = [Fx1_10inch(1:Matrix_1(2,1)); Fx1_10inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Fx1_10inch(Matrix_1(2,2)); Fx1_10inch(Matrix_1(3,1)+1:end)-Fx1_10inch(Matrix_1(3,2))];
Fy1_10inch = [Fy1_10inch(1:Matrix_1(2,1)); Fy1_10inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Fy1_10inch(Matrix_1(2,2)); Fy1_10inch(Matrix_1(3,1)+1:end)-Fy1_10inch(Matrix_1(3,2))]; 
Fx2_10inch = [Fx2_10inch(1:Matrix_2(2,1)); Fx2_10inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Fx2_10inch(Matrix_2(2,2)); Fx2_10inch(Matrix_2(3,1)+1:end)-Fx2_10inch(Matrix_2(3,2))];
Fy2_10inch = [Fy2_10inch(1:Matrix_2(2,1)); Fy2_10inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Fy2_10inch(Matrix_2(2,2)); Fy2_10inch(Matrix_2(3,1)+1:end)-Fy2_10inch(Matrix_2(3,2))];
Fx3_10inch = [Fx3_10inch(1:Matrix_3(2,1)); Fx3_10inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Fx3_10inch(Matrix_3(2,2)); Fx3_10inch(Matrix_3(3,1)+1:end)-Fx3_10inch(Matrix_3(3,2))];
Fy3_10inch = [Fy3_10inch(1:Matrix_3(2,1)); Fy3_10inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Fy3_10inch(Matrix_3(2,2)); Fy3_10inch(Matrix_3(3,1)+1:end)-Fy3_10inch(Matrix_3(3,2))];
Fx4_10inch = [Fx4_10inch(1:Matrix_4(2,1)); Fx4_10inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Fx4_10inch(Matrix_4(2,2)); Fx4_10inch(Matrix_4(3,1)+1:end)-Fx4_10inch(Matrix_4(3,2))];
Fy4_10inch = [Fy4_10inch(1:Matrix_4(2,1)); Fy4_10inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Fy4_10inch(Matrix_4(2,2)); Fy4_10inch(Matrix_4(3,1)+1:end)-Fy4_10inch(Matrix_4(3,2))];
Fz1_10inch = [Fz1_10inch(1:Matrix_1(2,1)); Fz1_10inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Fz1_10inch(Matrix_1(2,2)); Fz1_10inch(Matrix_1(3,1)+1:end)-Fz1_10inch(Matrix_1(3,2))];
Fz2_10inch = [Fz2_10inch(1:Matrix_2(2,1)); Fz2_10inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Fz2_10inch(Matrix_2(2,2)); Fz2_10inch(Matrix_2(3,1)+1:end)-Fz2_10inch(Matrix_2(3,2))];
Fz3_10inch = [Fz3_10inch(1:Matrix_3(2,1)); Fz3_10inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Fz3_10inch(Matrix_3(2,2)); Fz3_10inch(Matrix_3(3,1)+1:end)-Fz3_10inch(Matrix_3(3,2))];
Fz4_10inch = [Fz4_10inch(1:Matrix_4(2,1)); Fz4_10inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Fz4_10inch(Matrix_4(2,2)); Fz4_10inch(Matrix_4(3,1)+1:end)-Fz4_10inch(Matrix_4(3,2))];
Mx1_10inch = [Mx1_10inch(1:Matrix_1(2,1)); Mx1_10inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Mx1_10inch(Matrix_1(2,2)); Mx1_10inch(Matrix_1(3,1)+1:end)-Mx1_10inch(Matrix_1(3,2))];
My1_10inch = [My1_10inch(1:Matrix_1(2,1)); My1_10inch(Matrix_1(2,1)+1:Matrix_1(3,1))-My1_10inch(Matrix_1(2,2)); My1_10inch(Matrix_1(3,1)+1:end)-My1_10inch(Matrix_1(3,2))];
Mx2_10inch = [Mx2_10inch(1:Matrix_2(2,1)); Mx2_10inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Mx2_10inch(Matrix_2(2,2)); Mx2_10inch(Matrix_2(3,1)+1:end)-Mx2_10inch(Matrix_2(3,2))];
My2_10inch = [My2_10inch(1:Matrix_2(2,1)); My2_10inch(Matrix_2(2,1)+1:Matrix_2(3,1))-My2_10inch(Matrix_2(2,2)); My2_10inch(Matrix_2(3,1)+1:end)-My2_10inch(Matrix_2(3,2))];
Mx3_10inch = [Mx3_10inch(1:Matrix_3(2,1)); Mx3_10inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Mx3_10inch(Matrix_3(2,2)); Mx3_10inch(Matrix_3(3,1)+1:end)-Mx3_10inch(Matrix_3(3,2))];
My3_10inch = [My3_10inch(1:Matrix_3(2,1)); My3_10inch(Matrix_3(2,1)+1:Matrix_3(3,1))-My3_10inch(Matrix_3(2,2)); My3_10inch(Matrix_3(3,1)+1:end)-My3_10inch(Matrix_3(3,2))];
Mx4_10inch = [Mx4_10inch(1:Matrix_4(2,1)); Mx4_10inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Mx4_10inch(Matrix_4(2,2)); Mx4_10inch(Matrix_4(3,1)+1:end)-Mx4_10inch(Matrix_4(3,2))];
My4_10inch = [My4_10inch(1:Matrix_4(2,1)); My4_10inch(Matrix_4(2,1)+1:Matrix_4(3,1))-My4_10inch(Matrix_4(2,2)); My4_10inch(Matrix_4(3,1)+1:end)-My4_10inch(Matrix_4(3,2))];
Mz1_10inch = [Mz1_10inch(1:Matrix_1(2,1)); Mz1_10inch(Matrix_1(2,1)+1:Matrix_1(3,1))-Mz1_10inch(Matrix_1(2,2)); Mz1_10inch(Matrix_1(3,1)+1:end)-Mz1_10inch(Matrix_1(3,2))];
Mz2_10inch = [Mz2_10inch(1:Matrix_2(2,1)); Mz2_10inch(Matrix_2(2,1)+1:Matrix_2(3,1))-Mz2_10inch(Matrix_2(2,2)); Mz2_10inch(Matrix_2(3,1)+1:end)-Mz2_10inch(Matrix_2(3,2))];
Mz3_10inch = [Mz3_10inch(1:Matrix_3(2,1)); Mz3_10inch(Matrix_3(2,1)+1:Matrix_3(3,1))-Mz3_10inch(Matrix_3(2,2)); Mz3_10inch(Matrix_3(3,1)+1:end)-Mz3_10inch(Matrix_3(3,2))];
Mz4_10inch = [Mz4_10inch(1:Matrix_4(2,1)); Mz4_10inch(Matrix_4(2,1)+1:Matrix_4(3,1))-Mz4_10inch(Matrix_4(2,2)); Mz4_10inch(Matrix_4(3,1)+1:end)-Mz4_10inch(Matrix_4(3,2))];


RPM2i_10inch = RPM_data2i{indx11:end,3}./numBlades;
RPM3i_10inch = RPM_data3i{indx12:end,3}./numBlades;
RPM4i_10inch = RPM_data4i{indx13:end,3}./numBlades;

RPM1p_10inch = RPM_data1p{indx10:end,3}./numBlades;
RPM2p_10inch = RPM_data2p{indx11:end,3}./numBlades;
RPM3p_10inch = RPM_data3p{indx12:end,3}./numBlades;
RPM4p_10inch = RPM_data4p{indx13:end,3}./numBlades;

RPM1r_10inch = str2double(RPM_data1r{indx10:end,3})./numBlades/10;
RPM2r_10inch = str2double(RPM_data2r{indx11:end,3})./numBlades/10;

timeRPMfactor = 1;
time_RPM1r_10inch = RPM_data1r{1:end-indx10+1,1}./timeRPMfactor;
time_RPM1p_10inch = RPM_data1p{1:end-indx10+1,1}./timeRPMfactor;

time_RPM2i_10inch = RPM_data2i{1:end-indx11+1,1}./timeRPMfactor;
time_RPM2r_10inch = RPM_data2r{1:end-indx11+1,1}./timeRPMfactor;
time_RPM2p_10inch = RPM_data2p{1:end-indx11+1,1}./timeRPMfactor;

time_RPM3i_10inch = RPM_data3i{1:end-indx12+1,1}./timeRPMfactor;
time_RPM3p_10inch = RPM_data3p{1:end-indx12+1,1}./timeRPMfactor;

time_RPM4i_10inch = RPM_data4i{1:end-indx13+1,1}./timeRPMfactor;
time_RPM4p_10inch = RPM_data4p{1:end-indx13+1,1}./timeRPMfactor;



%%%%% Adimensionalizing
%%% Load cell data
test_orient = pi/4;

Mx1_avg_10inch = [mean(Mx1_10inch(Matrix_1(1,1):Matrix_1(1,2)))
           mean(Mx1_10inch(Matrix_1(2,1):Matrix_1(2,2)))
           mean(Mx1_10inch(Matrix_1(3,1):Matrix_1(3,2)))
           mean(Mx1_10inch(Matrix_1(4,1):Matrix_1(4,2)))
           mean(Mx1_10inch(Matrix_1(5,1):Matrix_1(5,2)))
           mean(Mx1_10inch(Matrix_1(6,1):Matrix_1(6,2)))
           mean(Mx1_10inch(Matrix_1(7,1):Matrix_1(7,2)))
           mean(Mx1_10inch(Matrix_1(8,1):Matrix_1(8,2)))
           mean(Mx1_10inch(Matrix_1(9,1):Matrix_1(9,2)))
           mean(Mx1_10inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(Mx1_10inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(Mx1_10inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(Mx1_10inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(Mx1_10inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(Mx1_10inch(Matrix_1(15,1):Matrix_1(15,2)))];
My1_avg_10inch = [mean(My1_10inch(Matrix_1(1,1):Matrix_1(1,2)))
           mean(My1_10inch(Matrix_1(2,1):Matrix_1(2,2)))
           mean(My1_10inch(Matrix_1(3,1):Matrix_1(3,2)))
           mean(My1_10inch(Matrix_1(4,1):Matrix_1(4,2)))
           mean(My1_10inch(Matrix_1(5,1):Matrix_1(5,2)))
           mean(My1_10inch(Matrix_1(6,1):Matrix_1(6,2)))
           mean(My1_10inch(Matrix_1(7,1):Matrix_1(7,2)))
           mean(My1_10inch(Matrix_1(8,1):Matrix_1(8,2)))
           mean(My1_10inch(Matrix_1(9,1):Matrix_1(9,2)))
           mean(My1_10inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(My1_10inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(My1_10inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(My1_10inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(My1_10inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(My1_10inch(Matrix_1(15,1):Matrix_1(15,2)))];
Fx1_avg_10inch = [mean(Fx1_10inch(Matrix_1(1,1):Matrix_1(1,2))) 
           mean(Fx1_10inch(Matrix_1(2,1):Matrix_1(2,2))) 
           mean(Fx1_10inch(Matrix_1(3,1):Matrix_1(3,2))) 
           mean(Fx1_10inch(Matrix_1(4,1):Matrix_1(4,2))) 
           mean(Fx1_10inch(Matrix_1(5,1):Matrix_1(5,2))) 
           mean(Fx1_10inch(Matrix_1(6,1):Matrix_1(6,2))) 
           mean(Fx1_10inch(Matrix_1(7,1):Matrix_1(7,2))) 
           mean(Fx1_10inch(Matrix_1(8,1):Matrix_1(8,2))) 
           mean(Fx1_10inch(Matrix_1(9,1):Matrix_1(9,2))) 
           mean(Fx1_10inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(Fx1_10inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(Fx1_10inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(Fx1_10inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(Fx1_10inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(Fx1_10inch(Matrix_1(15,1):Matrix_1(15,2)))];
Fy1_avg_10inch = [mean(Fy1_10inch(Matrix_1(1,1):Matrix_1(1,2))) 
           mean(Fy1_10inch(Matrix_1(2,1):Matrix_1(2,2))) 
           mean(Fy1_10inch(Matrix_1(3,1):Matrix_1(3,2))) 
           mean(Fy1_10inch(Matrix_1(4,1):Matrix_1(4,2))) 
           mean(Fy1_10inch(Matrix_1(5,1):Matrix_1(5,2))) 
           mean(Fy1_10inch(Matrix_1(6,1):Matrix_1(6,2))) 
           mean(Fy1_10inch(Matrix_1(7,1):Matrix_1(7,2))) 
           mean(Fy1_10inch(Matrix_1(8,1):Matrix_1(8,2))) 
           mean(Fy1_10inch(Matrix_1(9,1):Matrix_1(9,2))) 
           mean(Fy1_10inch(Matrix_1(10,1):Matrix_1(10,2)))
           mean(Fy1_10inch(Matrix_1(11,1):Matrix_1(11,2)))
           mean(Fy1_10inch(Matrix_1(12,1):Matrix_1(12,2)))
           mean(Fy1_10inch(Matrix_1(13,1):Matrix_1(13,2)))
           mean(Fy1_10inch(Matrix_1(14,1):Matrix_1(14,2)))
           mean(Fy1_10inch(Matrix_1(15,1):Matrix_1(15,2)))];


Mx2_avg_10inch = [mean(Mx2_10inch(Matrix_2(1,1):Matrix_2(1,2))) 
           mean(Mx2_10inch(Matrix_2(2,1):Matrix_2(2,2))) 
           mean(Mx2_10inch(Matrix_2(3,1):Matrix_2(3,2))) 
           mean(Mx2_10inch(Matrix_2(4,1):Matrix_2(4,2))) 
           mean(Mx2_10inch(Matrix_2(5,1):Matrix_2(5,2))) 
           mean(Mx2_10inch(Matrix_2(6,1):Matrix_2(6,2))) 
           mean(Mx2_10inch(Matrix_2(7,1):Matrix_2(7,2))) 
           mean(Mx2_10inch(Matrix_2(8,1):Matrix_2(8,2))) 
           mean(Mx2_10inch(Matrix_2(9,1):Matrix_2(9,2))) 
           mean(Mx2_10inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(Mx2_10inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(Mx2_10inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(Mx2_10inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(Mx2_10inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(Mx2_10inch(Matrix_2(15,1):Matrix_2(15,2)))];
My2_avg_10inch = [mean(My2_10inch(Matrix_2(1,1):Matrix_2(1,2))) 
           mean(My2_10inch(Matrix_2(2,1):Matrix_2(2,2))) 
           mean(My2_10inch(Matrix_2(3,1):Matrix_2(3,2))) 
           mean(My2_10inch(Matrix_2(4,1):Matrix_2(4,2))) 
           mean(My2_10inch(Matrix_2(5,1):Matrix_2(5,2))) 
           mean(My2_10inch(Matrix_2(6,1):Matrix_2(6,2))) 
           mean(My2_10inch(Matrix_2(7,1):Matrix_2(7,2))) 
           mean(My2_10inch(Matrix_2(8,1):Matrix_2(8,2))) 
           mean(My2_10inch(Matrix_2(9,1):Matrix_2(9,2))) 
           mean(My2_10inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(My2_10inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(My2_10inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(My2_10inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(My2_10inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(My2_10inch(Matrix_2(15,1):Matrix_2(15,2)))];
Fx2_avg_10inch = [mean(Fx2_10inch(Matrix_2(1,1):Matrix_2(1,2))) 
           mean(Fx2_10inch(Matrix_2(2,1):Matrix_2(2,2))) 
           mean(Fx2_10inch(Matrix_2(3,1):Matrix_2(3,2))) 
           mean(Fx2_10inch(Matrix_2(4,1):Matrix_2(4,2))) 
           mean(Fx2_10inch(Matrix_2(5,1):Matrix_2(5,2))) 
           mean(Fx2_10inch(Matrix_2(6,1):Matrix_2(6,2))) 
           mean(Fx2_10inch(Matrix_2(7,1):Matrix_2(7,2))) 
           mean(Fx2_10inch(Matrix_2(8,1):Matrix_2(8,2))) 
           mean(Fx2_10inch(Matrix_2(9,1):Matrix_2(9,2))) 
           mean(Fx2_10inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(Fx2_10inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(Fx2_10inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(Fx2_10inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(Fx2_10inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(Fx2_10inch(Matrix_2(15,1):Matrix_2(15,2)))];
Fy2_avg_10inch = [mean(Fy2_10inch(Matrix_2(1,1):Matrix_2(1,2)))
           mean(Fy2_10inch(Matrix_2(2,1):Matrix_2(2,2)))
           mean(Fy2_10inch(Matrix_2(3,1):Matrix_2(3,2)))
           mean(Fy2_10inch(Matrix_2(4,1):Matrix_2(4,2)))
           mean(Fy2_10inch(Matrix_2(5,1):Matrix_2(5,2)))
           mean(Fy2_10inch(Matrix_2(6,1):Matrix_2(6,2)))
           mean(Fy2_10inch(Matrix_2(7,1):Matrix_2(7,2)))
           mean(Fy2_10inch(Matrix_2(8,1):Matrix_2(8,2)))
           mean(Fy2_10inch(Matrix_2(9,1):Matrix_2(9,2)))
           mean(Fy2_10inch(Matrix_2(10,1):Matrix_2(10,2)))
           mean(Fy2_10inch(Matrix_2(11,1):Matrix_2(11,2)))
           mean(Fy2_10inch(Matrix_2(12,1):Matrix_2(12,2)))
           mean(Fy2_10inch(Matrix_2(13,1):Matrix_2(13,2)))
           mean(Fy2_10inch(Matrix_2(14,1):Matrix_2(14,2)))
           mean(Fy2_10inch(Matrix_2(15,1):Matrix_2(15,2)))];

Mx3_avg_10inch = [mean(Mx3_10inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(Mx3_10inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(Mx3_10inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(Mx3_10inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(Mx3_10inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(Mx3_10inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(Mx3_10inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(Mx3_10inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(Mx3_10inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(Mx3_10inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(Mx3_10inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(Mx3_10inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(Mx3_10inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(Mx3_10inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(Mx3_10inch(Matrix_3(15,1):Matrix_3(15,2)))];
My3_avg_10inch = [mean(My3_10inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(My3_10inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(My3_10inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(My3_10inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(My3_10inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(My3_10inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(My3_10inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(My3_10inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(My3_10inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(My3_10inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(My3_10inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(My3_10inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(My3_10inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(My3_10inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(My3_10inch(Matrix_3(15,1):Matrix_3(15,2)))];
Fx3_avg_10inch = [mean(Fx3_10inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(Fx3_10inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(Fx3_10inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(Fx3_10inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(Fx3_10inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(Fx3_10inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(Fx3_10inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(Fx3_10inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(Fx3_10inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(Fx3_10inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(Fx3_10inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(Fx3_10inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(Fx3_10inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(Fx3_10inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(Fx3_10inch(Matrix_3(15,1):Matrix_3(15,2)))];
Fy3_avg_10inch = [mean(Fy3_10inch(Matrix_3(1,1):Matrix_3(1,2))) 
           mean(Fy3_10inch(Matrix_3(2,1):Matrix_3(2,2))) 
           mean(Fy3_10inch(Matrix_3(3,1):Matrix_3(3,2))) 
           mean(Fy3_10inch(Matrix_3(4,1):Matrix_3(4,2))) 
           mean(Fy3_10inch(Matrix_3(5,1):Matrix_3(5,2))) 
           mean(Fy3_10inch(Matrix_3(6,1):Matrix_3(6,2))) 
           mean(Fy3_10inch(Matrix_3(7,1):Matrix_3(7,2))) 
           mean(Fy3_10inch(Matrix_3(8,1):Matrix_3(8,2))) 
           mean(Fy3_10inch(Matrix_3(9,1):Matrix_3(9,2))) 
           mean(Fy3_10inch(Matrix_3(10,1):Matrix_3(10,2)))
           mean(Fy3_10inch(Matrix_3(11,1):Matrix_3(11,2)))
           mean(Fy3_10inch(Matrix_3(12,1):Matrix_3(12,2)))
           mean(Fy3_10inch(Matrix_3(13,1):Matrix_3(13,2)))
           mean(Fy3_10inch(Matrix_3(14,1):Matrix_3(14,2)))
           mean(Fy3_10inch(Matrix_3(15,1):Matrix_3(15,2)))];

Mx4_avg_10inch = [mean(Mx4_10inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(Mx4_10inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(Mx4_10inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(Mx4_10inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(Mx4_10inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(Mx4_10inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(Mx4_10inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(Mx4_10inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(Mx4_10inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(Mx4_10inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(Mx4_10inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(Mx4_10inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(Mx4_10inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(Mx4_10inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(Mx4_10inch(Matrix_4(15,1):Matrix_4(15,2)))];
My4_avg_10inch = [mean(My4_10inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(My4_10inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(My4_10inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(My4_10inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(My4_10inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(My4_10inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(My4_10inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(My4_10inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(My4_10inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(My4_10inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(My4_10inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(My4_10inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(My4_10inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(My4_10inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(My4_10inch(Matrix_4(15,1):Matrix_4(15,2)))];
Fx4_avg_10inch = [mean(Fx4_10inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(Fx4_10inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(Fx4_10inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(Fx4_10inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(Fx4_10inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(Fx4_10inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(Fx4_10inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(Fx4_10inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(Fx4_10inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(Fx4_10inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(Fx4_10inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(Fx4_10inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(Fx4_10inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(Fx4_10inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(Fx4_10inch(Matrix_4(15,1):Matrix_4(15,2)))];
Fy4_avg_10inch = [mean(Fy4_10inch(Matrix_4(1,1):Matrix_4(1,2))) 
           mean(Fy4_10inch(Matrix_4(2,1):Matrix_4(2,2))) 
           mean(Fy4_10inch(Matrix_4(3,1):Matrix_4(3,2))) 
           mean(Fy4_10inch(Matrix_4(4,1):Matrix_4(4,2))) 
           mean(Fy4_10inch(Matrix_4(5,1):Matrix_4(5,2))) 
           mean(Fy4_10inch(Matrix_4(6,1):Matrix_4(6,2))) 
           mean(Fy4_10inch(Matrix_4(7,1):Matrix_4(7,2))) 
           mean(Fy4_10inch(Matrix_4(8,1):Matrix_4(8,2))) 
           mean(Fy4_10inch(Matrix_4(9,1):Matrix_4(9,2))) 
           mean(Fy4_10inch(Matrix_4(10,1):Matrix_4(10,2)))
           mean(Fy4_10inch(Matrix_4(11,1):Matrix_4(11,2)))
           mean(Fy4_10inch(Matrix_4(12,1):Matrix_4(12,2)))
           mean(Fy4_10inch(Matrix_4(13,1):Matrix_4(13,2)))
           mean(Fy4_10inch(Matrix_4(14,1):Matrix_4(14,2)))
           mean(Fy4_10inch(Matrix_4(15,1):Matrix_4(15,2)))];





%%% Tachometer data
T1_sec_10inch = [ mean(RPM1r_10inch(Tach_R1(1,1):Tach_R1(1,2))), mean(RPM1p_10inch(Tach_R1(1,3):Tach_R1(1,4))); 
           mean(RPM1r_10inch(Tach_R1(2,1):Tach_R1(2,2))), mean(RPM1p_10inch(Tach_R1(2,3):Tach_R1(2,4)));
           mean(RPM1r_10inch(Tach_R1(3,1):Tach_R1(3,2))), mean(RPM1p_10inch(Tach_R1(3,3):Tach_R1(3,4)));
           mean(RPM1r_10inch(Tach_R1(4,1):Tach_R1(4,2))), mean(RPM1p_10inch(Tach_R1(4,3):Tach_R1(4,4)));
           mean(RPM1r_10inch(Tach_R1(5,1):Tach_R1(5,2))), mean(RPM1p_10inch(Tach_R1(5,3):Tach_R1(5,4)));
           mean(RPM1r_10inch(Tach_R1(6,1):Tach_R1(6,2))), mean(RPM1p_10inch(Tach_R1(6,3):Tach_R1(6,4)));
           mean(RPM1r_10inch(Tach_R1(7,1):Tach_R1(7,2))), mean(RPM1p_10inch(Tach_R1(7,3):Tach_R1(7,4))); 
           mean(RPM1r_10inch(Tach_R1(8,1):Tach_R1(8,2))), mean(RPM1p_10inch(Tach_R1(8,3):Tach_R1(8,4)));
           mean(RPM1r_10inch(Tach_R1(9,1):Tach_R1(9,2))), mean(RPM1p_10inch(Tach_R1(9,3):Tach_R1(9,4)));
           mean(RPM1r_10inch(Tach_R1(10,1):Tach_R1(10,2))), mean(RPM1p_10inch(Tach_R1(10,3):Tach_R1(10,4)));
           mean(RPM1r_10inch(Tach_R1(11,1):Tach_R1(11,2))), mean(RPM1p_10inch(Tach_R1(11,3):Tach_R1(11,4)));
           mean(RPM1r_10inch(Tach_R1(12,1):Tach_R1(12,2))), mean(RPM1p_10inch(Tach_R1(12,3):Tach_R1(12,4)));
           mean(RPM1r_10inch(Tach_R1(13,1):Tach_R1(13,2))), mean(RPM1p_10inch(Tach_R1(13,3):Tach_R1(13,4)));
           mean(RPM1r_10inch(Tach_R1(14,1):Tach_R1(14,2))), mean(RPM1p_10inch(Tach_R1(14,3):Tach_R1(14,4)));
           mean(RPM1r_10inch(Tach_R1(15,1):Tach_R1(15,2))), mean(RPM1p_10inch(Tach_R1(15,3):Tach_R1(15,4)));];
T1_avg_10inch = [mean(T1_sec_10inch(1,:))
          mean(T1_sec_10inch(2,:))
          mean(T1_sec_10inch(3,:))
          mean(T1_sec_10inch(4,:))
          mean(T1_sec_10inch(5,:))
          mean(T1_sec_10inch(6,:))
          mean(T1_sec_10inch(7,:))
          mean(T1_sec_10inch(8,:))
          mean(T1_sec_10inch(9,:))
          mean(T1_sec_10inch(10,:))
          mean(T1_sec_10inch(11,:))
          mean(T1_sec_10inch(12,:))
          mean(T1_sec_10inch(13,:))
          mean(T1_sec_10inch(14,:))
          mean(T1_sec_10inch(15,:))];

T2_sec_10inch = [ mean(RPM2i_10inch(Tach_R2(1,1):Tach_R2(1,2))), mean(RPM2r_10inch(Tach_R2(1,3):Tach_R2(1,4))), mean(RPM2p_10inch(Tach_R2(1,5):Tach_R2(1,6))); 
           mean(RPM2i_10inch(Tach_R2(2,1):Tach_R2(2,2))), mean(RPM2r_10inch(Tach_R2(2,3):Tach_R2(2,4))), mean(RPM2p_10inch(Tach_R2(2,5):Tach_R2(2,6)));
           mean(RPM2i_10inch(Tach_R2(3,1):Tach_R2(3,2))), mean(RPM2r_10inch(Tach_R2(3,3):Tach_R2(3,4))), mean(RPM2p_10inch(Tach_R2(3,5):Tach_R2(3,6)));
           mean(RPM2i_10inch(Tach_R2(4,1):Tach_R2(4,2))), mean(RPM2r_10inch(Tach_R2(4,3):Tach_R2(4,4))), mean(RPM2p_10inch(Tach_R2(4,5):Tach_R2(4,6)));
           mean(RPM2i_10inch(Tach_R2(5,1):Tach_R2(5,2))), mean(RPM2r_10inch(Tach_R2(5,3):Tach_R2(5,4))), mean(RPM2p_10inch(Tach_R2(5,5):Tach_R2(5,6)));
           mean(RPM2i_10inch(Tach_R2(6,1):Tach_R2(6,2))), mean(RPM2r_10inch(Tach_R2(6,3):Tach_R2(6,4))), mean(RPM2p_10inch(Tach_R2(6,5):Tach_R2(6,6)));
           mean(RPM2i_10inch(Tach_R2(7,1):Tach_R2(7,2))), mean(RPM2r_10inch(Tach_R2(7,3):Tach_R2(7,4))), mean(RPM2p_10inch(Tach_R2(7,5):Tach_R2(7,6))); 
           mean(RPM2i_10inch(Tach_R2(8,1):Tach_R2(8,2))), mean(RPM2r_10inch(Tach_R2(8,3):Tach_R2(8,4))), mean(RPM2p_10inch(Tach_R2(8,5):Tach_R2(8,6)));
           mean(RPM2i_10inch(Tach_R2(9,1):Tach_R2(9,2))), mean(RPM2r_10inch(Tach_R2(9,3):Tach_R2(9,4))), mean(RPM2p_10inch(Tach_R2(9,5):Tach_R2(9,6)));
           mean(RPM2i_10inch(Tach_R2(10,1):Tach_R2(10,2))), mean(RPM2r_10inch(Tach_R2(10,3):Tach_R2(10,4))), mean(RPM2p_10inch(Tach_R2(10,5):Tach_R2(10,6)));
           mean(RPM2i_10inch(Tach_R2(11,1):Tach_R2(11,2))), mean(RPM2r_10inch(Tach_R2(11,3):Tach_R2(11,4))), mean(RPM2p_10inch(Tach_R2(11,5):Tach_R2(11,6)));
           mean(RPM2i_10inch(Tach_R2(12,1):Tach_R2(12,2))), mean(RPM2r_10inch(Tach_R2(12,3):Tach_R2(12,4))), mean(RPM2p_10inch(Tach_R2(12,5):Tach_R2(12,6)));
           mean(RPM2i_10inch(Tach_R2(13,1):Tach_R2(13,2))), mean(RPM2r_10inch(Tach_R2(13,3):Tach_R2(13,4))), mean(RPM2p_10inch(Tach_R2(13,5):Tach_R2(13,6)));
           mean(RPM2i_10inch(Tach_R2(14,1):Tach_R2(14,2))), mean(RPM2r_10inch(Tach_R2(14,3):Tach_R2(14,4))), mean(RPM2p_10inch(Tach_R2(14,5):Tach_R2(14,6)));
           mean(RPM2i_10inch(Tach_R2(15,1):Tach_R2(15,2))), mean(RPM2r_10inch(Tach_R2(15,3):Tach_R2(15,4))), mean(RPM2p_10inch(Tach_R2(15,5):Tach_R2(15,6)));];
T2_avg_10inch = [mean(T2_sec_10inch(1,:))
          mean(T2_sec_10inch(2,:))
          mean(T2_sec_10inch(3,:))
          mean(T2_sec_10inch(4,:))
          mean(T2_sec_10inch(5,:))
          mean(T2_sec_10inch(6,:))
          mean(T2_sec_10inch(7,:))
          mean(T2_sec_10inch(8,:))
          mean(T2_sec_10inch(9,:))
          mean(T2_sec_10inch(10,:))
          mean(T2_sec_10inch(11,:))
          mean(T2_sec_10inch(12,:))
          mean(T2_sec_10inch(13,:))
          mean(T2_sec_10inch(14,:))
          mean(T2_sec_10inch(15,:))];

T3_sec_10inch = [ mean(RPM3i_10inch(Tach_R3(1,1):Tach_R3(1,2))), mean(RPM3p_10inch(Tach_R3(1,3):Tach_R3(1,4))); 
           mean(RPM3i_10inch(Tach_R3(2,1):Tach_R3(2,2))), mean(RPM3p_10inch(Tach_R3(2,3):Tach_R3(2,4)));
           mean(RPM3i_10inch(Tach_R3(3,1):Tach_R3(3,2))), mean(RPM3p_10inch(Tach_R3(3,3):Tach_R3(3,4)));
           mean(RPM3i_10inch(Tach_R3(4,1):Tach_R3(4,2))), mean(RPM3p_10inch(Tach_R3(4,3):Tach_R3(4,4)));
           mean(RPM3i_10inch(Tach_R3(5,1):Tach_R3(5,2))), mean(RPM3p_10inch(Tach_R3(5,3):Tach_R3(5,4)));
           mean(RPM3i_10inch(Tach_R3(6,1):Tach_R3(6,2))), mean(RPM3p_10inch(Tach_R3(6,3):Tach_R3(6,4)));
           mean(RPM3i_10inch(Tach_R3(7,1):Tach_R3(7,2))), mean(RPM3p_10inch(Tach_R3(7,3):Tach_R3(7,4))); 
           mean(RPM3i_10inch(Tach_R3(8,1):Tach_R3(8,2))), mean(RPM3p_10inch(Tach_R3(8,3):Tach_R3(8,4)));
           mean(RPM3i_10inch(Tach_R3(9,1):Tach_R3(9,2))), mean(RPM3p_10inch(Tach_R3(9,3):Tach_R3(9,4)));
           mean(RPM3i_10inch(Tach_R3(10,1):Tach_R3(10,2))), mean(RPM3p_10inch(Tach_R3(10,3):Tach_R3(10,4)));
           mean(RPM3i_10inch(Tach_R3(11,1):Tach_R3(11,2))), mean(RPM3p_10inch(Tach_R3(11,3):Tach_R3(11,4)));
           mean(RPM3i_10inch(Tach_R3(12,1):Tach_R3(12,2))), mean(RPM3p_10inch(Tach_R3(12,3):Tach_R3(12,4)));
           mean(RPM3i_10inch(Tach_R3(13,1):Tach_R3(13,2))), mean(RPM3p_10inch(Tach_R3(13,3):Tach_R3(13,4)));
           mean(RPM3i_10inch(Tach_R3(14,1):Tach_R3(14,2))), mean(RPM3p_10inch(Tach_R3(14,3):Tach_R3(14,4)));
           mean(RPM3i_10inch(Tach_R3(15,1):Tach_R3(15,2))), mean(RPM3p_10inch(Tach_R3(15,3):Tach_R3(15,4)));];
T3_avg_10inch = [mean(T3_sec_10inch(1,:))
          mean(T3_sec_10inch(2,:))
          mean(T3_sec_10inch(3,:))
          mean(T3_sec_10inch(4,:))
          mean(T3_sec_10inch(5,:))
          mean(T3_sec_10inch(6,:))
          mean(T3_sec_10inch(7,:))
          mean(T3_sec_10inch(8,:))
          mean(T3_sec_10inch(9,:))
          mean(T3_sec_10inch(10,:))
          mean(T3_sec_10inch(11,:))
          mean(T3_sec_10inch(12,:))
          mean(T3_sec_10inch(13,:))
          mean(T3_sec_10inch(14,:))
          mean(T3_sec_10inch(15,:))];

T4_sec_10inch = [ mean(RPM4i_10inch(Tach_R4(1,1):Tach_R4(1,2))), mean(RPM4p_10inch(Tach_R4(1,3):Tach_R4(1,4))); 
           mean(RPM4i_10inch(Tach_R4(2,1):Tach_R4(2,2))), mean(RPM4p_10inch(Tach_R4(2,3):Tach_R4(2,4)));
           mean(RPM4i_10inch(Tach_R4(3,1):Tach_R4(3,2))), mean(RPM4p_10inch(Tach_R4(3,3):Tach_R4(3,4)));
           mean(RPM4i_10inch(Tach_R4(4,1):Tach_R4(4,2))), mean(RPM4p_10inch(Tach_R4(4,3):Tach_R4(4,4)));
           mean(RPM4i_10inch(Tach_R4(5,1):Tach_R4(5,2))), mean(RPM4p_10inch(Tach_R4(5,3):Tach_R4(5,4)));
           mean(RPM4i_10inch(Tach_R4(6,1):Tach_R4(6,2))), mean(RPM4p_10inch(Tach_R4(6,3):Tach_R4(6,4)));
           mean(RPM4i_10inch(Tach_R4(7,1):Tach_R4(7,2))), mean(RPM4p_10inch(Tach_R4(7,3):Tach_R4(7,4))); 
           mean(RPM4i_10inch(Tach_R4(8,1):Tach_R4(8,2))), mean(RPM4p_10inch(Tach_R4(8,3):Tach_R4(8,4)));
           mean(RPM4i_10inch(Tach_R4(9,1):Tach_R4(9,2))), mean(RPM4p_10inch(Tach_R4(9,3):Tach_R4(9,4)));
           mean(RPM4i_10inch(Tach_R4(10,1):Tach_R4(10,2))), mean(RPM4p_10inch(Tach_R4(10,3):Tach_R4(10,4)));
           mean(RPM4i_10inch(Tach_R4(11,1):Tach_R4(11,2))), mean(RPM4p_10inch(Tach_R4(11,3):Tach_R4(11,4)));
           mean(RPM4i_10inch(Tach_R4(12,1):Tach_R4(12,2))), mean(RPM4p_10inch(Tach_R4(12,3):Tach_R4(12,4)));
           mean(RPM4i_10inch(Tach_R4(13,1):Tach_R4(13,2))), mean(RPM4p_10inch(Tach_R4(13,3):Tach_R4(13,4)));
           mean(RPM4i_10inch(Tach_R4(14,1):Tach_R4(14,2))), mean(RPM4p_10inch(Tach_R4(14,3):Tach_R4(14,4)));
           mean(RPM4i_10inch(Tach_R4(15,1):Tach_R4(15,2))), mean(RPM4p_10inch(Tach_R4(15,3):Tach_R4(15,4)));];
T4_avg_10inch = [mean(T4_sec_10inch(1,:))
          mean(T4_sec_10inch(2,:))
          mean(T4_sec_10inch(3,:))
          mean(T4_sec_10inch(4,:))
          mean(T4_sec_10inch(5,:))
          mean(T4_sec_10inch(6,:))
          mean(T4_sec_10inch(7,:))
          mean(T4_sec_10inch(8,:))
          mean(T4_sec_10inch(9,:))
          mean(T4_sec_10inch(10,:))
          mean(T4_sec_10inch(11,:))
          mean(T4_sec_10inch(12,:))
          mean(T4_sec_10inch(13,:))
          mean(T4_sec_10inch(14,:))
          mean(T4_sec_10inch(15,:))];


F1tot_10inch  =   -Fx1_10inch.*sin(test_orient)+Fy1_10inch.*cos(test_orient);
F2tot_10inch  =   -Fx2_10inch.*sin(test_orient)+Fy2_10inch.*cos(test_orient);
F3tot_10inch  =   -Fx3_10inch.*sin(test_orient)+Fy3_10inch.*cos(test_orient);
F4tot_10inch  =   -Fx4_10inch.*sin(test_orient)+Fy4_10inch.*cos(test_orient);

M1tot_10inch  =    Mx1_10inch.*cos(test_orient)+My1_10inch.*sin(test_orient);
M2tot_10inch  =    Mx2_10inch.*cos(test_orient)+My2_10inch.*sin(test_orient);
M3tot_10inch  =    Mx3_10inch.*cos(test_orient)+My3_10inch.*sin(test_orient);
M4tot_10inch  =    Mx4_10inch.*cos(test_orient)+My4_10inch.*sin(test_orient);


M1_tot_10inch =     Mx1_avg_10inch(:,1).*cos(test_orient)+My1_avg_10inch(:,1).*sin(test_orient);
M2_tot_10inch =     Mx2_avg_10inch(:,1).*cos(test_orient)+My2_avg_10inch(:,1).*sin(test_orient);
M3_tot_10inch =     Mx3_avg_10inch(:,1).*cos(test_orient)+My3_avg_10inch(:,1).*sin(test_orient);
M4_tot_10inch =     Mx4_avg_10inch(:,1).*cos(test_orient)+My4_avg_10inch(:,1).*sin(test_orient);
F1_tot_10inch =    -Fx1_avg_10inch(:,1).*sin(test_orient)+Fy1_avg_10inch(:,1).*cos(test_orient);
F2_tot_10inch =    -Fx2_avg_10inch(:,1).*sin(test_orient)+Fy2_avg_10inch(:,1).*cos(test_orient);
F3_tot_10inch =    -Fx3_avg_10inch(:,1).*sin(test_orient)+Fy3_avg_10inch(:,1).*cos(test_orient);
F4_tot_10inch =    -Fx4_avg_10inch(:,1).*sin(test_orient)+Fy4_avg_10inch(:,1).*cos(test_orient);
OFFset_456_f = mean(F4_tot_10inch(4:6));
OFFset_789_f = mean(F4_tot_10inch(7:9));
OFFset_012_f = mean(F4_tot_10inch(10:12));
OFFset_345_f = mean(F4_tot_10inch(13:15));
OFFset_456_m = mean(M4_tot_10inch(4:6));
OFFset_789_m = mean(M4_tot_10inch(7:9));
OFFset_012_m = mean(M4_tot_10inch(10:12));
OFFset_345_m = mean(M4_tot_10inch(13:15));

M1_tot_10inch = [M1_tot_10inch(1:3); M1_tot_10inch(4:6)-OFFset_456_m; M1_tot_10inch(7:9)-OFFset_789_m; M1_tot_10inch(10:12)-OFFset_012_m; M1_tot_10inch(13:15)-OFFset_345_m];
M2_tot_10inch = [M2_tot_10inch(1:3); M2_tot_10inch(4:6)-OFFset_456_m; M2_tot_10inch(7:9)-OFFset_789_m; M2_tot_10inch(10:12)-OFFset_012_m; [M2_tot_10inch(13:14); (M2_tot_10inch(13)+M2_tot_10inch(14))/2]-OFFset_345_m];
M3_tot_10inch = [M3_tot_10inch(1:3); M3_tot_10inch(4:6)-OFFset_456_m; M3_tot_10inch(7:9)-OFFset_789_m; M3_tot_10inch(10:12)-OFFset_012_m; [(M3_tot_10inch(14)+M3_tot_10inch(15))/2; M3_tot_10inch(14:15)]-OFFset_345_m];
M4_tot_10inch = [M4_tot_10inch(1:3); M4_tot_10inch(4:6)-OFFset_456_m; M4_tot_10inch(7:9)-OFFset_789_m; M4_tot_10inch(10:12)-OFFset_012_m; [M4_tot_10inch(13);(M4_tot_10inch(13)+M4_tot_10inch(15))/2; M4_tot_10inch(15)]-OFFset_345_m];
F1_tot_10inch = [F1_tot_10inch(1:3); F1_tot_10inch(4:6)-OFFset_456_f; F1_tot_10inch(7:9)-OFFset_789_f; F1_tot_10inch(10:12)-OFFset_012_f; F1_tot_10inch(13:15)-OFFset_345_f];
F2_tot_10inch = [F2_tot_10inch(1:3); F2_tot_10inch(4:6)-OFFset_456_f; F2_tot_10inch(7:9)-OFFset_789_f; F2_tot_10inch(10:12)-OFFset_012_f; F2_tot_10inch(13:15)-OFFset_345_f];
F3_tot_10inch = [F3_tot_10inch(1:3); F3_tot_10inch(4:6)-OFFset_456_f; F3_tot_10inch(7:9)-OFFset_789_f; F3_tot_10inch(10:12)-OFFset_012_f; F3_tot_10inch(13:15)-OFFset_345_f];
F4_tot_10inch = [F4_tot_10inch(1:3); F4_tot_10inch(4:6)-OFFset_456_f; F4_tot_10inch(7:9)-OFFset_789_f; F4_tot_10inch(10:12)-OFFset_012_f; F4_tot_10inch(13:15)-OFFset_345_f];

M_tot_10inch = [M1_tot_10inch,M2_tot_10inch,M3_tot_10inch,M4_tot_10inch];
F_tot_10inch = [F1_tot_10inch,F2_tot_10inch,F3_tot_10inch,F4_tot_10inch];

mom1 = 0.5*pi*rho_1*(T1_avg_10inch*2*pi/60).^2*Radius^4*L;
mom2 = 0.5*pi*rho_2*(T2_avg_10inch*2*pi/60).^2*Radius^4*L;
mom3 = 0.5*pi*rho_3*(T3_avg_10inch*2*pi/60).^2*Radius^4*L;
mom4 = 0.5*pi*rho_4*(T4_avg_10inch*2*pi/60).^2*Radius^4*L;

for1 = 0.5*pi*rho_1*(T1_avg_10inch*2*pi/60).^2*Radius^3*L;
for2 = 0.5*pi*rho_2*(T2_avg_10inch*2*pi/60).^2*Radius^3*L;
for3 = 0.5*pi*rho_3*(T3_avg_10inch*2*pi/60).^2*Radius^3*L;
for4 = 0.5*pi*rho_4*(T4_avg_10inch*2*pi/60).^2*Radius^3*L;

Cm1_10inch  = M1_tot_10inch./mom1;
Cm2_10inch  = M2_tot_10inch./mom2;
Cm3_10inch  = M3_tot_10inch./mom3;
Cm4_10inch  = M4_tot_10inch./mom4;

Cm_10inch = [Cm1_10inch,Cm2_10inch,Cm3_10inch,Cm4_10inch];

Cf1_10inch  = F1_tot_10inch./for1;%F1_tot
Cf2_10inch  = F2_tot_10inch./for2;%F2_tot
Cf3_10inch  = F3_tot_10inch./for3;%F3_tot
Cf4_10inch  = F4_tot_10inch./for4;%F4_tot

Cf_10inch = [Cf1_10inch,Cf2_10inch,Cf3_10inch,Cf4_10inch];


%%%%% Coefficient Uncertainty %%%%%
delta_M = 0.0026; %Nm
delta_F = 0.0259; %N
delta_R = 1e-3/(2*sqrt(3)); %m
delta_L = 1e-3/(2*sqrt(3)); %m
delta_w_fix = 2;     % rev/min
delta_w_var = 0.04;  % of rev/min
delta_w_resol = 0.1; % rev/min

%% %%%%PLOTTING


% Raw signals minus offset

figure()
ah = axes;
hold on
colr = [0.4, 0.6, 0];
coll = [0.6, 0.6, 0];
colo = [0.5, 0,  0.5];
% Ax(1) = axes(f1); 
p1 = plot(time1_8inch,Fz1_8inch,'lineWidth',1.5,'color',coll)
p2 = plot(time1_10inch,Fz1_10inch,'lineWidth',1.5,'color',colo)
% plot([0:0.01:time1_8inch(end)],4.86*ones(1,length([0:0.01:(time1_8inch(end))])))
grid on
txt = '\leftarrow 4.8N';
txt1 = ' 3.1N \rightarrow';
txt2 = '\leftarrow 3.4N';
text(pi,sin(pi),txt);
text(pi,sin(pi),txt1);
text(pi,sin(pi),txt2);
hold off
% plot(time3_8inch,Fz3_8inch,'lineWidth',1.5)
% plot(time4_8inch,Fz4_8inch,'lineWidth',1.5)
% plot(time5_8inch,Fz5_8inch,'lineWidth',1.5)
% plot(time6_8inch,Fz6_8inch,'lineWidth',1.5)
ylabel('F_z [N] ')
xlabel('Time [s]')
xlim([0 time1_10inch(end)])
legend('8"x4.5', '10"x4.7')
% title('F_z at H0')

figure()
hold on
% Ax(1) = axes(f1); 
plot(time1_8inch,Fz1_8inch,'lineWidth',1.5)
plot(time1_10inch,Fz1_10inch,'lineWidth',1.5,'color','r')
diff = [0];
for i=1:1:length(Fz1_8inch)-1
    diff = [diff; (Fz1_8inch(i)-Fz1_8inch(i+1))/0.1];
end
plot(time1_8inch,diff)
grid on
% plot(time3_8inch,Fz3_8inch,'lineWidth',1.5)
% plot(time4_8inch,Fz4_8inch,'lineWidth',1.5)
% plot(time5_8inch,Fz5_8inch,'lineWidth',1.5)
% plot(time6_8inch,Fz6_8inch,'lineWidth',1.5)
ylabel('F_z [N] ')
xlabel('Time [s]')
xlim([0 time1_10inch(end)])
legend('8"x4.5', '10"x4.7')
hold off
% title('F_z at H0')




%{
figure()
plot(time1_8inch,Fx1_8inch,'lineWidth',1.5)
hold on
plot(time2_8inch,Fx2_8inch,'lineWidth',1.5)
plot(time3_8inch,Fx3_8inch,'lineWidth',1.5)
plot(time4_8inch,Fx4_8inch,'lineWidth',1.5)
plot(time5_8inch,Fx5_8inch,'lineWidth',1.5)
plot(time6_8inch,Fx6_8inch,'lineWidth',1.5)
legend('R1','R2','R3','R4','R5','R\infty')
grid on
ylabel('F_x [N]')
xlabel('Time [s]')
title('F_x at H0')

figure()
plot(time1_8inch,Fx1_8inch,'lineWidth',1.5)
hold on
plot(time1_8inch,Fy1_8inch,'lineWidth',1.5)
plot(time1_8inch,F1tot_8inch,'lineWidth',1.5)
grid on
legend('Fx','Fy','Ftot')

figure()
plot(time1_8inch,Mx1_8inch,'lineWidth',1.5)
hold on
plot(time1_8inch,My1_8inch,'lineWidth',1.5)
plot(time1_8inch,M1tot_8inch,'lineWidth',1.5)
grid on
legend('Mx','My','Mtot')

figure()
plot(time1_8inch,Fy1_8inch,'lineWidth',1.5)
hold on
plot(time2_8inch,Fy2_8inch,'lineWidth',1.5)
plot(time3_8inch,Fy3_8inch,'lineWidth',1.5)
plot(time4_8inch,Fy4_8inch,'lineWidth',1.5)
plot(time5_8inch,Fy5_8inch,'lineWidth',1.5)
plot(time6_8inch,Fy6_8inch,'lineWidth',1.5)
legend('R1','R2','R3','R4','R5','R\infty')
grid on
ylabel('F_y [N]')
xlabel('Time [s]')
title('F_y at H0')

figure()
plot(time1_8inch,Mx1_8inch,'lineWidth',1.5)
hold on
plot(time2_8inch,Mx2_8inch,'lineWidth',1.5)
plot(time3_8inch,Mx3_8inch,'lineWidth',1.5)
plot(time4_8inch,Mx4_8inch,'lineWidth',1.5)
plot(time5_8inch,Mx5_8inch,'lineWidth',1.5)
plot(time6_8inch,Mx6_8inch,'lineWidth',1.5)
legend('R1','R2','R3','R4','R5','R\infty')
grid on
ylabel('M_x [N]')
xlabel('Time [s]')
title('M_x at H0')

figure()
plot(time1_8inch,My1_8inch,'lineWidth',1.5)
hold on
plot(time2_8inch,My2_8inch,'lineWidth',1.5)
plot(time3_8inch,My3_8inch,'lineWidth',1.5)
plot(time4_8inch,My4_8inch,'lineWidth',1.5)
plot(time5_8inch,My5_8inch,'lineWidth',1.5)
plot(time6_8inch,My6_8inch,'lineWidth',1.5)
legend('R1','R2','R3','R4','R5','R\infty')
grid on
ylabel('M_y [N]')
xlabel('Time [s]')
title('M_y at H0')
%}


% Tach individually
%{

figure()
plot(time_RPM1i,RPM1i,'lineWidth',1.5)
hold on
plot(time_RPM1r,RPM1r,'lineWidth',1.5)
plot(time_RPM1p,RPM1p,'lineWidth',1.5)
legend('T1', 'T2', 'T3')
grid on
ylabel('RPM [rev/min]')
xlabel('Time [s]')
title('RPM R1 at H0')

figure()
plot(time_RPM2i,RPM2i,'lineWidth',1.5)
hold on
plot(time_RPM2r,RPM2r,'lineWidth',1.5)
plot(time_RPM2p,RPM2p,'lineWidth',1.5)
legend('T1', 'T2', 'T3')
grid on
ylabel('RPM [rev/min]')
xlabel('Time [s]')
title('RPM R2 at H0')

figure()
plot(time_RPM3i,RPM3i,'lineWidth',1.5)
hold on
plot(time_RPM3r,RPM3r,'lineWidth',1.5)
plot(time_RPM3p,RPM3p,'lineWidth',1.5)
legend('T1', 'T2', 'T3')
grid on
ylabel('RPM [rev/min]')
xlabel('Time [s]')
title('RPM R3 at H0')

figure()
plot(time_RPM4i,RPM4i,'lineWidth',1.5)
hold on
plot(time_RPM4r,RPM4r,'lineWidth',1.5)
plot(time_RPM4p,RPM4p,'lineWidth',1.5)
legend('T1', 'T2', 'T3')
grid on
ylabel('RPM [rev/min]')
xlabel('Time [s]')
title('RPM R4 at H0')

figure()
plot(time_RPM5i,RPM5i,'lineWidth',1.5)
hold on
plot(time_RPM5r,RPM5r,'lineWidth',1.5)
plot(time_RPM5p,RPM5p,'lineWidth',1.5)
legend('T1', 'T2', 'T3')
grid on
ylabel('RPM [rev/min]')
xlabel('Time [s]')
title('RPM R5 at H0')

figure()
plot(time_RPM6i,RPM6i,'lineWidth',1.5)
hold on
plot(time_RPM6r,RPM6r,'lineWidth',1.5)
plot(time_RPM6p,RPM6p,'lineWidth',1.5)
legend('T1', 'T2', 'T3')
grid on
ylabel('RPM [rev/min]')
xlabel('Time [s]')
title('RPM Rinf at H0')
%}

% Coefficients and results
%
%%% Plot params
posit     = 13;  % Single section to be visualized
first_seg = 4;  % Segments to be compared from first
last_seg  = 15;
posi= [1,2,3,4,5,10];%.*10;
pos = [1,2,4,10];%.*12.5 ;
xlab = 'D/R';
g = fittype('a-b*exp(-c*x)');


figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(Cm_8inch,2)
    plot(posi(i),Cm_8inch(posit,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(Cm_10inch,2)
    plot(pos(i),Cm_10inch(posit,i),'o','lineWidth',2,'color',colo);
end
grid on
title('C_m H0 in section ', posit)
ylabel('C_m')
xlabel(xlab)
legend('8inch','','','','','','10inch')

figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(Cf_8inch,2)
    plot(posi(i),Cf_8inch(posit,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(Cf_10inch,2)
    plot(pos(i),Cf_10inch(posit,i),'o','lineWidth',2,'color',colo);
end
grid on
title('C_f H0 in section ', posit)
ylabel('C_f')
xlabel(xlab)
legend('8inch','','','','','','10inch')

figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(M_tot_8inch,2)
    plot(posi(i),M_tot_8inch(posit,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(M_tot_10inch,2)
    plot(pos(i),M_tot_10inch(posit,i),'o','lineWidth',2,'color',colo);
end
grid on
title('Mtot H0 in section ', posit)
ylabel('Mtot')
xlabel(xlab)
% legend('8inch','','','','','','10inch')

figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(F_tot_8inch,2)
    plot(posi(i),F_tot_8inch(posit,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(F_tot_10inch,2)
    plot(pos(i),F_tot_10inch(posit,i),'o','lineWidth',2,'color',colo);
end
grid on
title('Ftot H0 in section ', posit)
ylabel('Ftot')
xlabel(xlab)
% legend('8inch','','','','','','10inch')

figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(Cm_8inch,2)
    plot(posi(i),Cm_8inch(4:end,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(Cm_10inch,2)
    plot(pos(i),Cm_10inch(4:end,i),'o','lineWidth',2,'color',colo);
end
grid on
title('C_m H0')
ylabel('C_m')
xlabel(xlab)
% legend('8inch','','','','','','10inch')

figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(Cf_8inch,2)
    plot(posi(i),Cf_8inch(4:end,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(Cf_10inch,2)
    plot(pos(i),Cf_10inch(4:end,i),'o','lineWidth',2,'color',colo);
end
grid on
title('C_f H0')
ylabel('C_f')
xlabel(xlab)
% legend('1R_8inch','2R','3R','4R','5R','R\infty')

figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(M_tot_8inch,2)
    plot(posi(i),M_tot_8inch(4:end,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(M_tot_10inch,2)
    plot(pos(i),M_tot_10inch(4:end,i),'o','lineWidth',2,'color',colo);
end
grid on
title('Mtot H0')
ylabel('Mtot')
xlabel(xlab)
% legend('1R_8inch','2R','3R','4R','5R','R\infty')

figure()
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(F_tot_8inch,2)
    plot(posi(i),F_tot_8inch(4:end,i),'o','lineWidth',2,'color',colr);
end
for i=1:size(F_tot_10inch,2)
    plot(pos(i),F_tot_10inch(4:end,i),'o','lineWidth',2,'color',colo);
end
grid on
title('Ftot H0')
ylabel('Ftot')
xlabel(xlab)
% legend('1R_8inch','2R','3R','4R','5R','R\infty')


figure()
hold on
% p1 = polyfit(pos,[mean(F_tot_10inch(13:end,1)),mean(F_tot_10inch(13:end,3)),mean(F_tot_10inch(13:end,3)),mean(F_tot_10inch(13:end,4))],2);
% x1 = linspace(0,10);
% y1 = polyval(p1, x1);
% p2 = polyfit(posi,[mean(F_tot_8inch(13:end,1)),mean(F_tot_8inch(13:end,3)),mean(F_tot_8inch(13:end,3)),mean(F_tot_8inch(13:end,4)),mean(F_tot_8inch(13:end,5)),mean(F_tot_8inch(13:end,6))],2);
% x2 = linspace(0,10);
% y2 = polyval(p2, x2);
y = [mean(F_tot_10inch(13:end,1)),mean(F_tot_10inch(13:end,2)),mean(F_tot_10inch(13:end,3)),mean(F_tot_10inch(13:end,4))].';
f1 = fit(pos',y,g,'StartPoint',[[ones(size(pos')), -exp(-pos')]\y; 0.63]);
x1 = linspace(0,pos(end));
y = [mean(F_tot_8inch(13:end,1)),mean(F_tot_8inch(13:end,2)),mean(F_tot_8inch(13:end,3)),mean(F_tot_8inch(13:end,4)),mean(F_tot_8inch(13:end,5)),mean(F_tot_8inch(13:end,6))].';
f2 = fit(posi',y,g,'StartPoint',[[ones(size(posi')), -exp(-posi')]\y; 0.235]);
x2 = linspace(0,posi(end));
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(F_tot_8inch,2)
    plot(posi(i),mean(F_tot_8inch(13:end,i)),'o','lineWidth',2,'color',colr);
end
plot(x2,f2(x2),'color',colr)
for i=1:size(F_tot_10inch,2)
    plot(pos(i),mean(F_tot_10inch(13:end,i)),'o','lineWidth',2,'color',colo);
end
plot(x1,f1(x1),'color',colo)
grid on
title('Ftot average of sections 13 to 15')
ylabel('Ftot average')
xlabel(xlab)
legend('8inch','','','','','','','10inch')


figure()
hold on
% p1 = polyfit(pos,[mean(Cf_10inch(13:end,1)),mean(Cf_10inch(13:end,3)),mean(Cf_10inch(13:end,3)),mean(Cf_10inch(13:end,4))],2);
% x1 = linspace(0,10);
% y1 = polyval(p1, x1);
% p2 = polyfit(posi,[mean(Cf_8inch(13:end,1)),mean(Cf_8inch(13:end,3)),mean(Cf_8inch(13:end,3)),mean(Cf_8inch(13:end,4)),mean(Cf_8inch(13:end,5)),mean(Cf_8inch(13:end,6))],2);
% x2 = linspace(0,10);
% y2 = polyval(p2, x2);
y = [mean(Cf_10inch(13:end,1)),mean(Cf_10inch(13:end,2)),mean(Cf_10inch(13:end,3)),mean(Cf_10inch(13:end,4))].';
f1 = fit(pos',y,g,'StartPoint',[[ones(size(pos')), -exp(-pos')]\y; 0.63]);
x1 = linspace(0,pos(end));
y = [mean(Cf_8inch(13:end,1)),mean(Cf_8inch(13:end,2)),mean(Cf_8inch(13:end,3)),mean(Cf_8inch(13:end,4)),mean(Cf_8inch(13:end,5)),mean(Cf_8inch(13:end,6))].';
f2 = fit(posi',y,g,'StartPoint',[[ones(size(posi')), -exp(-posi')]\y; 0.235]);
x2 = linspace(0,posi(end));
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(Cf_8inch,2)
    plot(posi(i),mean(Cf_8inch(13:end,i)),'o','lineWidth',2,'color',colr);
end
plot(x2,f2(x2),'color',colr)
for i=1:size(Cf_10inch,2)
    plot(pos(i),mean(Cf_10inch(13:end,i)),'o','lineWidth',2,'color',colo);
end
plot(x1,f1(x1),'color',colo)
grid on
title('Cf average of sections 13 to 15')
ylabel('Cf average')
xlabel(xlab)
legend('8inch','','','','','','','10inch')


figure()
% p1 = polyfit(pos,[mean(M_tot_10inch(13:end,1)),mean(M_tot_10inch(13:end,3)),mean(M_tot_10inch(13:end,3)),mean(M_tot_10inch(13:end,4))],2);
% x1 = linspace(0,10);
% y1 = polyval(p1, x1);
% p2 = polyfit(posi,[mean(M_tot_8inch(13:end,1)),mean(M_tot_8inch(13:end,3)),mean(M_tot_8inch(13:end,3)),mean(M_tot_8inch(13:end,4)),mean(M_tot_8inch(13:end,5)),mean(M_tot_8inch(13:end,6))],2);
% x2 = linspace(0,10);
% y2 = polyval(p2, x2);
y = [mean(M_tot_10inch(13:end,1)),mean(M_tot_10inch(13:end,2)),mean(M_tot_10inch(13:end,3)),mean(M_tot_10inch(13:end,4))].';
f1 = fit(pos',y,g,'StartPoint',[[ones(size(pos')), -exp(-pos')]\y; 0.00398]); % 0.00398
x1 = linspace(0,pos(end));
y = [mean(M_tot_8inch(13:end,1)),mean(M_tot_8inch(13:end,2)),mean(M_tot_8inch(13:end,3)),mean(M_tot_8inch(13:end,4)),mean(M_tot_8inch(13:end,5)),mean(M_tot_8inch(13:end,6))].';
f2 = fit(posi',y,g,'StartPoint',[[ones(size(posi')), -exp(-posi')]\y; 0.5]); %0.5
x2 = linspace(0,posi(end));
hold on
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(M_tot_8inch,2)
    plot(posi(i),mean(M_tot_8inch(13:end,i)),'o','lineWidth',2,'color',colr);
end
plot(x2,f2(x2),'color',colr)
for i=1:size(M_tot_10inch,2)
    plot(pos(i),mean(M_tot_10inch(13:end,i)),'o','lineWidth',2,'color',colo);
end
plot(x1,f1(x1),'color',colo)
grid on
title('Mtot average of sections 13 to 15')
ylabel('Mtot average')
xlabel(xlab)
legend('8inch','','','','','','','10inch')


figure()
% subplot(2,1,1);
y = [mean(M_tot_10inch(13:end,1)),mean(M_tot_10inch(13:end,2)),mean(M_tot_10inch(13:end,3)),mean(M_tot_10inch(13:end,4))].';
f1 = fit(pos',y,g,'StartPoint',[[ones(size(pos')), -exp(-pos')]\y; 0.1]);
x1 = linspace(0,pos(end));
y = [mean(M_tot_8inch(13:end,1)),mean(M_tot_8inch(13:end,2)),mean(M_tot_8inch(13:end,3)),mean(M_tot_8inch(13:end,4)),mean(M_tot_8inch(13:end,5)),mean(M_tot_8inch(13:end,6))].';
f2 = fit(posi',y,g,'StartPoint',[[ones(size(posi')), -exp(-posi')]\y; 0.6]);
x2 = linspace(0,posi(end));
y = [mean(M_tot_8inch(10:12,1)),mean(M_tot_8inch(10:12,2)),mean(M_tot_8inch(10:12,3)),mean(M_tot_8inch(10:12,4)),mean(M_tot_8inch(10:12,5)),mean(M_tot_8inch(10:12,6))].';
f3 = fit(posi',y,g,'StartPoint',[[ones(size(posi')), -exp(-posi')]\y; 0.1]);
x3 = linspace(0,posi(end));
hold on;grid on
% plot(time1_8inch,Fz1_8inch./100,'lineWidth',1.5)
colr = [0.4, 0.6, 0];
coll = [0.6, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(M_tot_8inch,2)
    plot(posi(i),mean(M_tot_8inch(13:end,i)),'o','lineWidth',2,'color',coll);
end
f2222 = f2(x2);
plot(x2,f2(x2),'color',coll)
e = errorbar(posi,[mean(M_tot_8inch(13:end,1));mean(M_tot_8inch(13:end,2));mean(M_tot_8inch(13:end,3));mean(M_tot_8inch(13:end,4));mean(M_tot_8inch(13:end,5));mean(M_tot_8inch(13:end,6))]',delta_M*ones(length(M_tot_8inch(1,:)),1),':','color',coll);
e.LineStyle = 'none';
for i=1:size(M_tot_8inch,2)
    plot(posi(i),mean(M_tot_8inch(10:12,i)),'o','lineWidth',2,'color',colr);
end
plot(x3,f3(x3),'color',colr)
e = errorbar(posi,[mean(M_tot_8inch(10:12,1));mean(M_tot_8inch(10:12,2));mean(M_tot_8inch(10:12,3));mean(M_tot_8inch(10:12,4));mean(M_tot_8inch(10:12,5));mean(M_tot_8inch(10:12,6))]',delta_M*ones(length(M_tot_8inch(1,:)),1),':','color',colr);
e.LineStyle = 'none';ylim([-0.01 0.07])
ylabel('M [N\cdot m]')
% xlabel({xlab, '(a) Moment at Fz 4.8N (1500\mus) and 3.1N (1325\mus)'})
% subplot(2,1,2); 
hold on
% % plot(time1_10inch,Fz1_10inch./100,'lineWidth',1.5)
for i=1:size(M_tot_10inch,2)
    plot(pos(i),mean(M_tot_10inch(13:end,i)),'o','lineWidth',2,'color',colo);
end
plot(x1,f1(x1),'color',colo)
e = errorbar(pos,[mean(M_tot_10inch(13:end,1));mean(M_tot_10inch(13:end,2));mean(M_tot_10inch(13:end,3));mean(M_tot_10inch(13:end,4))]',delta_M*ones(length(M_tot_10inch(1,:)),1),':','color',colo);
e.LineStyle = 'none';
grid on
legend ('8"x4.5 PWM 1500\mus F_z = 4.8N','','','','', '','','','8"x4.5 PWM 1325\mus F_z = 3.1N','','','','', '','','','10"x4.7 PWM 1300\mus F_z = 3.4N','','','','','')
ylabel('M [N\cdot m]')
xlabel(xlab)


figure()
hold on
g = fittype('a-b*exp(-c*x)');
% p1 = polyfit(pos,[mean(Cm_10inch(13:end,1)),mean(Cm_10inch(13:end,3)),mean(Cm_10inch(13:end,3)),mean(Cm_10inch(13:end,4))],2);
% x1 = linspace(0,10);
% y1 = polyval(p1, x1);
y = [mean(Cm_10inch(13:end,1)),mean(Cm_10inch(13:end,2)),mean(Cm_10inch(13:end,3)),mean(Cm_10inch(13:end,4))].';
f1 = fit(pos',y,g,'StartPoint',[[ones(size(pos')), -exp(-pos')]\y; 0.9]); %0.9
x1 = linspace(0,pos(end));
% p2 = polyfit(posi,[mean(Cm_8inch(13:end,1)),mean(Cm_8inch(13:end,3)),mean(Cm_8inch(13:end,3)),mean(Cm_8inch(13:end,4)),mean(Cm_8inch(13:end,5)),mean(Cm_8inch(13:end,6))],2);
% x2 = linspace(0,10);
% y2 = polyval(p2, x2);
y = [mean(Cm_8inch(13:end,1)),mean(Cm_8inch(13:end,2)),mean(Cm_8inch(13:end,3)),mean(Cm_8inch(13:end,4)),mean(Cm_8inch(13:end,5)),mean(Cm_8inch(13:end,6))].';
f2 = fit(posi',y,g,'StartPoint',[[ones(size(posi')), -exp(-posi')]\y; 0.2]); %0.38
x2 = linspace(0,posi(end));
colr = [0.4, 0.6, 0];
colo = [0.5, 0,  0.5];
for i=1:size(Cm_8inch,2)
    plot(posi(i),mean(Cm_8inch(13:end,i)),'o','lineWidth',2,'color',colr);
end
plot(x2,f2(x2),'color',colr)
for i=1:size(Cm_10inch,2)
    plot(pos(i),mean(Cm_10inch(13:end,i)),'o','lineWidth',2,'color',colo);
end
plot(x1,f1(x1),'color',colo)
grid on
title('Cm average of sections 13 to 15')
ylabel('Cm average')
xlabel(xlab)
legend('8inch','','','','','','','10inch')


