%Week2
%audio filename must in same directory of this m file 
filename = 'piano_middle_C.wav'; 
% First read wav file into memory 
[Sig, Fs]=audioread(filename); 
%Sig stores raw audio data in column;  
%Fs sampling frequency 

duration = length(Sig)/Fs; %% calculates duration of the signal by doing Sig/Fs
disp(duration); %% disaplayes duration
ts = 1/Fs; %% time per sample
time = 0:ts:duration-ts; %% creates an array of time for each sample point
plot(time',Sig); %% plots it on the graph: time = Time Sec, Sig = Amplitude
ylabel('Amplitude'); 
xlabel('Time Sec'); 

%%Task1
%%File size = (sampling rate * bit depth * no. of channels * duration)/8
%%Divided by 8 to change it from bits to bytes
file_size = (duration*16*1*44100)/8;

%%Task2
info_audio = audioinfo("piano_middle_C.wav");
disp(info_audio);

%%Task3
%3) Create Matlab code to input the full signal called "Sig”
%and then manipulate the array, assigning samples from 0.5 second
%to 1 second to a new variable called "sig2”

t1 = 0.5;%%time 1
t2 = 1;%%time 2
%sample indicies
t1samples = t1*Fs;
t2samples = t2*Fs;
partSig = Sig(t1samples:t2samples);%%creating part of signal
partTime = time(t1samples:t2samples);%%creating part of time of signal
plot(partTime ,partSig);%%plotting the signal
audioread('piano_middle_C.wav')

%%Task 4

[monoAudio, Fs] = audioread("piano_middle_C.wav");%% reading in the audio file
stereoAudio = [monoAudio, monoAudio];%%creating stereo signal
audiowrite('piano_middle_C_stereo.wav', stereoAudio, Fs);%%writing the stereo file

%%Task 5

nativeAudio = audioread('piano_middle_C.wav', 'native');%%reading audio in using native argument
t = (0:length(nativeAudio)-1) / Fs;%% Converting sample indices to time values
figure;
plot(t, nativeAudio);%%creating plot
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Time-Domain Representation of Mono Audio');
grid on;

%%Task 6 

max_monoAudio = double(nativeAudio)./max(abs(double(nativeAudio))); %% ./

max_monoAudio_multiplier = 1/max_monoAudio;

monoAudio = nativeAudio*max_monoAudio_multiplier;

plot(monoAudio);

%%Task 7

rms_value = rms(monoAudio);
normalised_audio = 0.5 * rms_value * monoAudio;

%%Task 8

%%table() = an array that stores column-oriented data e.g. text data or
%%from a spreadsheet. All variables have to have the same number of rows.
%%Use summary function!

%%num2hex = Use num2hex to convert a matrix of numeric values to hexadecimal representation.

%%num2bin = The num2bin function converts a numeric value into its binary representation.

%% Task 8a









