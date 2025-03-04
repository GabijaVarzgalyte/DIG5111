% %%Example of IR
% ir = zeros(1, 50000);
% ir([1, 1000, 5000, 10000, 15000])= [1, 0.8, 0.7,0.6, 0.5];% create an impulse response
% 
% [sig, fs] = audioread('pluck.wav'); %Read Signal
% %sound(sig,fs);
% y = conv(sig, ir); % convolve the two signals
% sound(y,fs);
% subplot(211), plot(sig);% plot both signals on same figure.
% subplot(212), plot(y);

%%Task 1

% [sig, fs] = audioread("pluck.wav");%reading in audio file
% t = [0.01, 0.05, 0.1, 0.2, 0.4, 0.6, 1];%creating delay in time
% sampleNumber = round(fs * t);%rounding off the samples to integer values so they can be used as an index
% 
% IR = zeros(1, fs);%creating a function, 1 row with fs units
% IR(sampleNumber(1)) = 1;%attenuation factors aka amplitude
% IR(sampleNumber(2)) = 0.7;
% IR(sampleNumber(3)) = 0.25;
% IR(sampleNumber(4)) = 0.17;
% IR(sampleNumber(5)) = 0.2;
% IR(sampleNumber(6)) = 0.1;
% IR(sampleNumber(7)) = 0.05;
% 
% y = conv(sig, IR);
% duration = length(y)/fs; %% calculates duration of the signal by doing Sig/Fs
% ts = 1/fs; %% time per sample
% time = 0:ts:duration-ts; %% creates an array of time for each sample point
% plot(time',y); %% plots it on the graph: time = Time Sec, Sig = Amplitude
% ylabel('Amplitude'); 
% xlabel('Time'); 
% sound(y, fs)

%Task 2

[sig, fs] = audioread("Church.wav");%reading in the audio file

