clear variables
close all

%%%% For extended files containing voltages and time vector
file1 = '../LogFiles/RPM/putty.csv';
file2 = '../LogFiles/RPM/putty.csv';

test1 = readtable(file1);
test2 = readtable(file2);

time1  = (test1{1:end,1});% - test1{10,index+1});
White1 = (test1{1:end,2});% - test1{10,index+2});
Black1 = (test1{1:end,3});% - test1{10,index+2});
time2  = (test2{1:end,1});% - test1{10,index+1});
White2 = (test2{1:end,2});% - test1{10,index+2});
Black2 = (test2{1:end,3});% - test1{10,index+2});

figure()
hold on;grid on;
plot(time1/1000, White1/1023,'lineWidth',1.5)
plot(time1/1000, Black1/1023,'lineWidth',1.5)
legend('White','Black')

figure()
hold on;grid on;
plot(time2/1000, White2/1023,'lineWidth',1.5)
plot(time2/1000, Black2/1023,'lineWidth',1.5)
legend('White','Black')
xlabel('Time [s]')


figure()
hold on;grid on;
plot(time1./1000, White1/1023,'lineWidth',1.5)
plot(time2./1000, White2/1023,'lineWidth',1.5)

figure()
hold on;grid on;
plot(time1./1000, Black1/1023,'lineWidth',1.5)
plot(time2./1000, Black2/1023,'lineWidth',1.5)
