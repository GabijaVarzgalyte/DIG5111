%audio filename must in same directory of this m file 
filename = 'piano_middle_C.wav'; 
% First read wav file into memory 
[Sig, Fs]=audioread(filename); 
%Sig stores raw audio data in column;  
%Fs sampling frequency 

duration = length(Sig)/Fs; %% calculates duration of the signal by doing Sig/Fs
disp(duration); %% displays duration
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

t1 = 0.5;
t2 = 1;
%sample indicies
t1samples = t1Fs;
t2samples = t2Fs;
partSig = Sig(t1samples:t2samples);
partTime = Time(t1samples:t2samples);
plot(partTime ,partSig);
audioread("piano_middle_C.wav")
%% 


