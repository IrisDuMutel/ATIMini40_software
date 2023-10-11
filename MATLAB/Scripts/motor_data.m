clear variables
close all
%%%% This script plots the data extracted from the matrix making tests
%%%% previous to the actual test sessions. It helps visualize the
%%%% relationship between PWM, total thrust and RPM

load('../LogFiles/10props.mat')
load('../LogFiles/12props.mat')
load('../LogFiles/13props.mat')


PWM10 = PWMFzRPMmatrices10inch.PWM;
PWM12 = PWMFzRPMmatrices12inch.PWM;
PWM13 = PWMFzRPMmatrices13inch.PWM;

Fz10 = PWMFzRPMmatrices10inch.Fz;
Fz12 = PWMFzRPMmatrices12inch.Fz;
Fz13 = PWMFzRPMmatrices13inch.Fz;

RPM10 = PWMFzRPMmatrices10inch.RPM;
RPM12 = PWMFzRPMmatrices12inch.RPM;
RPM13 = PWMFzRPMmatrices13inch.RPM;


figure()
hold on;grid on;
plot(PWM10,Fz10,'o','LineWidth',2,'MarkerSize',6)
plot(PWM12,Fz12,'o','LineWidth',2,'MarkerSize',6)
plot(PWM13,Fz13,'o','LineWidth',2,'MarkerSize',6)
legend('10"x4.5"', '12"x6"', '13"x6.5"')
xlabel('PWM [$\mu$ s]','Interpreter','latex')
ylabel('Total thrust [N]')

figure()
hold on;grid on;
plot(PWM10,RPM10,'o','LineWidth',2,'MarkerSize',6)
plot(PWM12,RPM12,'o','LineWidth',2,'MarkerSize',6)
plot(PWM13,RPM13,'o','LineWidth',2,'MarkerSize',6)
legend('10"x4.5"', '12"x6"', '13"x6.5"')
xlabel('PWM [$\mu$ s]','Interpreter','latex')
ylabel('RPM [rev/min]')


figure()
hold on;grid on;
plot(RPM10,Fz10,'o','LineWidth',2,'MarkerSize',6)
plot(RPM12,Fz12,'o','LineWidth',2,'MarkerSize',6)
plot(RPM13,Fz13,'o','LineWidth',2,'MarkerSize',6)
legend('10"x4.5"', '12"x6"', '13"x6.5"')
ylabel('Total thrust [N]')
xlabel('RPM [rev/min]')


