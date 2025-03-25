%% MATLAB code of Chirp

% fs=10000; % sampling frequency (10khz)
% A=0.8; % Amplitude of signal
% ts=1/fs; % Sampling period
% dur=1.5; % Duration of signal 
% t=0:ts:dur; % Time vector from 0 to 1.5 seconds with step
% %theta = 2*pi*(at^2 + bt + c)
% theta=2*pi*(100+200*t+500*t.*t); % theta = instantaneous phase of chirp signal
% chirp_sig=A*sin(theta);
% audiowrite('myChirp1.wav',chirp_sig,fs);

%% FFT of reverse Chirp signal

fs=10000;
A=0.8;
ts=1/fs;
dur=1.5;
t=0:ts:dur;
% Subtracting a coefficient
theta=2*pi*(100+1700*t-500*t.*t);
chirp_sig=A*sin(theta);
sound(chirp_sig,fs);

%% FFT of the second chirp signal
len = length(chirp_sig);
SSC = fft(chirp_sig);
SSR = abs(SSC)./len;
L=round(len/2);
mag = mag2db(SSR);
f = (fs/2)*(0:L)/L;
plot(f,mag(1:L+1));
xlabel('Frequency')
ylabel('dB') 