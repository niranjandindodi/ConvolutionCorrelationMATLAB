N=1024; % Number of samples to generate 
f=1; % Frequency of the sinewave 
FS=200; % Sampling frequency
n=0:N-1; % Sampling index 
x=sin(2*pi*f1*n/FS); % Generate x(n) 
y=x+10*randn(1,N); % Generate y(n) 
subplot(3,1,1);
plot(x);
title('Pure Sinewave');
grid;
subplot(3,1,2);
plot(y);
title('y(n), Pure Sinewave + Noise');
grid;
Rxy=xcorr(x,y); % Estimate the cross correlation 
subplot(3,1,3);
plot(Rxy);
title('Cross correlation Rxy');
grid;