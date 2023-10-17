clear variables
close all

%%%% For extended files containing voltages and time vector
file2 = '../LogFiles/20231011/RPM/log_20231011_10inch_Rinf_test6.csv';
file1 = '../LogFiles/20231011/RPM/log_20231011_10inch_Rinf_test6.csv';

test1 = readtable(file1);
test2 = readtable(file2);

sample_freq = 1;
num_blades  = 2;

time1  = 0:1/sample_freq:length(test1{1:end,1})-1;% - test1{10,index+1});
rpm1 = test1{1:end,1}/num_blades;
rpm2 = test1{1:end,2}/num_blades;
rpm3 = test1{1:end,3}/num_blades;
rpm4 = test1{1:end,4}/num_blades;

figure()
hold on;grid on;
plot(time1,rpm1,'linewidth',2)
plot(time1,rpm2,'linewidth',2)
plot(time1,rpm3,'linewidth',2)
plot(time1,rpm4,'linewidth',2)
xlabel('Time [s]')
ylabel('RPM [rev/s]')