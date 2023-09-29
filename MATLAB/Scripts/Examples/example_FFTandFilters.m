%% %% One example to understand fft and filters
close all
clear variables

% Creation of signals
Ts = 0.005; % (200Hz) Remember Nyquist. For visualizing frequencies, sampling freq must be at least 2*freq of the signal.
Fs = 1/Ts;
x = [0:Ts:2*pi];
funt = 0.5 + sin(2*pi*50*x) + cos(2*pi*25*x) + cos(2*pi*30*x);

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
% gain cancelling

%% Plots
figure()
hold on 
grid on
plot(f_x,abs(fastFT),'linewidth',4);
plot(f_x,abs(fastFT_filt_high),'linewidth',2);
plot(f_x,abs(fastFT_filt_low),'linewidth',2);
plot(f_x,abs(fastFT_filt_pass),'linewidth',2);
xlabel("Frequency [Hz]")
ylabel('FFT(y(x))')
legend('Complete signal','Filtered high','Filtered low','Filtered pass')

figure()
hold on
plot(x,funt,'LineWidth',4)
plot(x,filtered_signal_high,'linewidth',2)
plot(x,filtered_signal_low,'linewidth',2)
plot(x,filtered_signal_pass,'linewidth',2)
legend('Complete signal','Filtered high','Filtered low','Filtered pass')
xlabel('x')
ylabel('y(x)')
grid on
