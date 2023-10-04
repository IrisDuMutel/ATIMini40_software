%% %% One example to understand fft and filters
close all
clear variables

% Creation of signals
Ts = 0.005; % (200Hz) Remember Nyquist. For visualizing frequencies, sampling freq must be at least 2*freq of the signal.
Fs = 1/Ts;
x = [0:Ts:2*pi];
funt = 0.5 + 2*sin(2*pi*50*x) + cos(2*pi*25*x) + cos(2*pi*30*x);

% FFT of original signal
fastFT = fft(funt);
f_x = Fs/length(fastFT)*(0:length(fastFT)-1);


% Filtering and FFT of filtered signals
filtered_signal_high = highpass(funt,48,Fs);
filtered_signal_low  = lowpass(funt,0.01,Fs);
filtered_signal_pass = bandpass(funt,[24, 26],Fs);
fastFT_filt_high = fft(filtered_signal_high);
fastFT_filt_low  = fft(filtered_signal_low);
fastFT_filt_pass = fft(filtered_signal_pass);

% For frequencies close to each other, lowpass/highpasss don't have a steep
% gain cancelling, unless you explicitly code it

figure(1)
hold on 
grid on
plot(f_x,abs(fastFT),'linewidth',4);
plot(f_x,abs(fastFT_filt_high),'linewidth',2);
plot(f_x,abs(fastFT_filt_pass),'linewidth',2);
plot(f_x,abs(fastFT_filt_low),'linewidth',2);
xlabel("Frequency [Hz]")
ylabel('FFT(y(x))')
legend('Complete signal','Filtered high','Filtered pass','Filtered low')

figure(2)
hold on
plot(x,funt,'LineWidth',4)
plot(x,filtered_signal_high,'linewidth',2)
plot(x,filtered_signal_pass,'linewidth',2)
plot(x,filtered_signal_low,'linewidth',2)
legend('Complete signal','Filtered high','Filtered pass','Filtered low')
xlabel('x')
ylabel('y(x)')
grid on


%% Butterworth filters

% Creating Butterworth filters from order 1 to order 5 to filter everything
% except for the constant value in our function
f_cutoff = 1;
f_sampling = Fs;
w_n = f_cutoff/(f_sampling/2)*pi;  % Cutoff frequency

[b_1,a_1] = butter(1,w_n,'low');   % Create Butterworth filter of order 1
[b_2,a_2] = butter(2,w_n,'low');   % Create Butterworth filter of order 2
[b_3,a_3] = butter(3,w_n,'low');   % Create Butterworth filter of order 3
[b_4,a_4] = butter(4,w_n,'low');   % Create Butterworth filter of order 4
[b_5,a_5] = butter(5,w_n,'low');   % Create Butterworth filter of order 5

fc = 2;
fs = 150;

[b,a] = butter(6,fc/(fs/2)*pi,'low');
Y_1 = filter(b_1, a_1, funt);                          % Filter function 'funt' with numerator b and denominator a
Y_2 = filter(b_2, a_2, funt);                          % Filter function 'funt' with numerator b and denominator a
Y_3 = filter(b_3, a_3, funt);                          % Filter function 'funt' with numerator b and denominator a
Y_4 = filter(b_4, a_4, funt);                          % Filter function 'funt' with numerator b and denominator a
Y_5 = filter(b_5, a_5, funt);                          % Filter function 'funt' with numerator b and denominator a
Y_6 = filter(b, a, funt);                          % Filter function 'funt' with numerator b and denominator a

[h_1,w_1] = freqz(b_1,a_1,[],f_sampling);              % returns the n-point frequency response vector h and ang freq w
[h_2,w_2] = freqz(b_2,a_2,[],f_sampling);              % returns the n-point frequency response vector h and ang freq w
[h_3,w_3] = freqz(b_3,a_3,[],f_sampling);              % returns the n-point frequency response vector h and ang freq w
[h_4,w_4] = freqz(b_4,a_4,[],f_sampling);              % returns the n-point frequency response vector h and ang freq w
[h_5,w_5] = freqz(b_5,a_5,[],f_sampling);              % returns the n-point frequency response vector h and ang freq w
[h_6,w_6] = freqz(b,a,[],f_sampling);              % returns the n-point frequency response vector h and ang freq w


figure(3)
hold on
plot(w_1/pi,20*log10(abs(h_1)),'linewidth',2)
plot(w_2/pi,20*log10(abs(h_2)),'linewidth',2)
plot(w_3/pi,20*log10(abs(h_3)),'linewidth',2)
plot(w_4/pi,20*log10(abs(h_4)),'linewidth',2)
plot(w_5/pi,20*log10(abs(h_5)),'linewidth',2)
plot(w_6/pi,20*log10(abs(h_6)),'linewidth',2)
legend('Butter 1','Butter 2','Butter 3','Butter 4','Butter 5')
xlabel('Frequency [Hz]')
ylabel('Magnitude [dB]')
grid on
% ylim([-100 20])
% xlim([0, 100])

figure(4)
hold on
plot([w_1 w_2 w_3 w_4 w_5 w_6]/(pi), ...
    mag2db(abs([h_1 h_2 h_3 h_4 h_5 h_6])), 'LineWidth',2)
% axis([0 10 -45 5])
grid
xlabel("Frequency (Hz)")
ylabel("Attenuation (dB)")
legend('Butter 1','Butter 2','Butter 3','Butter 4','Butter 5')
xlabel('Frequency [Hz]')
ylabel('Magnitude [dB]')
grid on

[A_1,B_1,C_1,D_1] = butter(1,w_n,'low');
[A_2,B_2,C_2,D_2] = butter(2,w_n,'low');
[A_3,B_3,C_3,D_3] = butter(3,w_n,'low');
[A_4,B_4,C_4,D_4] = butter(4,w_n,'low');
[A_5,B_5,C_5,D_5] = butter(5,w_n,'low');
sys_1 = ss(A_1,B_1,C_1,D_1,1/f_sampling);
sys_2 = ss(A_2,B_2,C_2,D_2,1/f_sampling);
sys_3 = ss(A_3,B_3,C_3,D_3,1/f_sampling);
sys_4 = ss(A_4,B_4,C_4,D_4,1/f_sampling);
sys_5 = ss(A_5,B_5,C_5,D_5,1/f_sampling);

figure(5)
hold on
opts1=bodeoptions('cstprefs');
opts1.PhaseVisible = 'off';
opts1.YLim={[-100 20]};
opts1.XLim={[0.01 100]};
bode(sys_1,opts1)
bode(sys_2,opts1)
bode(sys_3,opts1)
bode(sys_4,opts1)
bode(sys_5,opts1)
grid
legend('Butter 1','Butter 2','Butter 3','Butter 4','Butter 5')
grid on

figure(6)
hold on
plot(x,funt,'LineWidth',4)
plot(x,Y_1,'linewidth',2)
plot(x,Y_2,'linewidth',2)
plot(x,Y_3,'linewidth',2)
plot(x,Y_4,'linewidth',2)
plot(x,Y_5,'linewidth',2)
legend('Unfiltered','Butter 1','Butter 2','Butter 3','Butter 4','Butter 5')
xlabel('x')
ylabel('y(x)')
grid on

%% Chebyshev filters




