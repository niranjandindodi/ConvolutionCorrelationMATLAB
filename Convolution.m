%% Define time vector
samplingFrequency = 1000; %Hz
timeStep = 1/samplingFrequency; %sec
T = 1; % sec
S = T*samplingFrequency; %samples
samples = 1:S;
time = samples*timeStep; %sec


%%Generate square wave
pulseFrequency = 5; %Hz
squareWave = square(time*pulseFrequency*2*pi);

%%Plot Sqaure Wave
figure(1), plot(time,squareWave, 'b')
title([num2str(pulseFrequency) 'Hz Square Pulse'])

%%Adjust Amplitude
squareWaveAdj = (squareWave+1)/2;
close(1)
figure(1), plot(time, squareWaveAdj, 'r')
set(gca, 'YLim', [-0.1 1.1])

%%Define Sampling time vector
nsamplingFrequency = 2*pulseFrequency;
ntimeStep = 1/nsamplingFrequency; %sec
T = 1; %sec
nS = T*nsamplingFrequency; %Number of samples
nsamples = 1:nS; %samples
ntime = nsamples*ntimeStep;%sec

%%Generate Nyquist Sampling Square Wave
nsquareWave = square(ntime*pulseFrequency*2*pi);
nsquareWaveAdj = (nsquareWave+1)/2;

%% Plot Nyquist Sampling Sqaure Wave Compared to Oversampled Square Wave
figure(2), plot(time, squareWaveAdj, 'b', ntime, nsquareWaveAdj, 'r')
legend('Extreme Oversampling', 'Nyquist Sampling')
set(gca, 'YLim', [-0.1 1.1])

%%Define Undersamples Time Vector
usamplingFrequency = 1.7*pulseFrequency;
utimeStep = 1/usamplingFrequency; %sec
T=1; %sec
uS = T*usamplingFrequency; %samples
usamples = 1:uS; %samples
utime = usamples*utimeStep; %sec

%%Generate Undersampled Square Wave
usquareWave = square(utime*pulseFrequency*2*pi);
usquareWaveAdj = (usquareWave+1)/2;

%%Plot Nyquist Sampling Square Wave Compared to Oversampled Square Wave
figure(2), plot(time,squareWaveAdj, 'b', ntime, nsquareWaveAdj, 'r', utime, usquareWaveAdj, 'g')
legend('Extreme Oversampling','Nyquist Sampling', 'Undersampled')
set(gca, 'YLim', [-0.1 1.1])
%{
%%Convolution with Linear Decay
%Generate Linear Decay Signals
lds = fliplr(time)/sum(time);
nlds = fliplr(ntime)/sum(ntime);
ulds = fliplr(utime)/sum(utime);

%%Convolve Square Wave Signals with Linear Decay Signals
squareWaveLDS = conv(squareWaveAdj, lds);
nsquareWaveNLDS = conv(nsquareWaveAdj, nlds);
usquareWaveULDS = conv(usquareWaveAdj, ulds);
%}

%Extend time vectors to match convolved signals
convtime = (-S:1:S)*timeStep;
nconvtime = (-nS:1:nS)*ntimeStep;
uconvtime = (-uS:1:uS)*utimeStep;

%{
%Pad convolved signals with leading and trailing zero
squareWaveLDS = [0,squareWaveLDS, 0];
nsquareWaveNLDS = [0,nsquareWaveNLDS, 0];
usquareWaveULDS = [0,usquareWaveULDS, 0];

figure(3), plot(convtime,squareWaveLDS,'b')
plot(nconvtime,nsquareWaveNLDS,'r')
plot(uconvtime,usquareWaveULDS,'g')
legend('Extreme Oversampling', 'Nyquist Sampling','Undersampled')
%}

%%Convolution with Exponential Decay
%Generate Exponential Decay Signals
eds = exp(-time);
eds = eds/sum(eds);
figure(3);
plot(eds)
neds = exp(-ntime);
neds = neds/sum(neds);
ueds = exp(-utime);
ueds = ueds/sum(ueds);

%Convolve Sqaure Wave Signals with Exponential Decay Signals
squareWaveEDS = conv(squareWaveAdj, eds);
nsquareWaveNEDS = conv(nsquareWaveAdj, neds);
usquareWaveUEDS = conv(usquareWaveAdj, ueds);

%Pad convolved signals with leading and trailing zero
squareWaveEDS = [0, squareWaveEDS, 0];
nsquareWaveNEDS = [0, nsquareWaveNEDS, 0];
usquareWaveUEDS = [0, usquareWaveUEDS, 0];

figure(4); 
plot(convtime, squareWaveEDS, 'b', nconvtime, nsquareWaveNEDS, 'r')
%plot(nconvtime, nsquareWaveNEDS, 'r')
%plot(uconvtime, usquareWaveUEDS, 'g')

legend('Extreme Oversampling', 'Nyquist Sampling', 'Undersampled')



