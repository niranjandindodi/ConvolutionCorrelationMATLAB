N=1024; % Number of samples
f1=1;
FS=200;
n=0:N-1;
x=sin(2*pi*f1*n/FS); %Generatethesignal,x(n)
% Frequency of the sinewave
% Sampling Frequency
% Sample index numbers
t=[1:N]*(1/FS); subplot(2,1,1); plot(t,x);
% Prepare a time axis
% Prepare the figure
% Plot x(n)
title('Sinwave of frequency 1000Hz [FS=8000Hz]'); xlabel('Time, [s]');
ylabel('Amplitude');
grid;
Rxx=xcorr(x); subplot(2,1,2); plot(Rxx);
% Estimate its autocorrelation
% Prepare the figure
% Plot the autocorrelation
grid;
title('Autocorrelation function of the sinewave');
xlabel('lags');
ylabel('Autocorrelation');