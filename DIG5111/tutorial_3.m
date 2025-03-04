%Code for table1
%Generate simple sinusoid waveform
%Sound = A*cos(wt + phase)
%sound parameters!
% amplitude = 0.5;
% frequency = 440;
% w = frequency*2*pi;
% 
% %Time! 
% fs = 11025;
% ts = 1/fs;
% time = 0:ts:2;
% 
% %Ok let us create sound
% signal = amplitude*cos(w*time);
 
%Plot one cycle signal
%If we want to plot only one cycle, how many samples are there?
%roughly 26 samples why?
%Time (1:26) signal (1:26)
% figure(1);
% plot(time(1:26), signal(1:26));
% xlabel('Time (Sec)');
% ylabel('Amplitude (V)');
% grid on;
 
%output to wav file
% audiowrite('A4.wav',signal, fs);

%% EXERCISES %%
function noteX = note(A, keynum, dur)
%function note() will create a note with sampling frequency 11025 by given
%any key and any time duration.
fs = 11025;
ts = 1/fs;
A4=440;
ref_key=49;     %A4 is the 49th Key in piano keyboard 
n = keynum-ref_key;  %Calculate the difference between ref_key and input Key
freq = A4*2^(n/12); %Calculate the frequency of input Key
time = 0:ts:dur;

noteX=A*sin(2*pi*freq*time);
end
% %% Step 2
% NoteC = note(0.01, 40, 2);
% NoteE = note(0.01, 44, 2);
% NoteG = note(0.01, 47, 2);
% 
% NoteC = NoteC ./ max(abs(NoteC)); % Normalize individually
% NoteE = NoteE ./ max(abs(NoteE));
% NoteG = NoteG ./ max(abs(NoteG));
% 
% Ctriad_org = NoteC + NoteE + NoteG;
% Ctriad = Ctriad_org ./ max(abs(Ctriad_org)); % Final normalization

%% Tasks %%
%1a)
%% CHATGPT MELODY %%

% fs = 11025;  % Sampling frequency
% silence = zeros(1, round(fs * 0.05)); % Short pause of 0.05 sec
% 
% % Define notes (Amplitude, Key Number, Duration)
% note1 = note(0.5, 40, 0.5);  % C (Middle C)
% note2 = note(0.5, 42, 0.5);  % D
% note3 = note(0.5, 44, 0.75); % E
% note4 = note(0.5, 47, 0.25); % G (Shorter note)
% note5 = note(0.5, 49, 1);    % A (Longer note)
% 
% % Create a C major chord (C, E, G)
% chord_C = note(0.3, 40, 1) + note(0.3, 44, 1) + note(0.3, 47, 1);
% 
% % Combine melody with pauses
% melody = [note1, silence, note2, silence, note3, silence, note4, silence, note5, silence, chord_C];
% 
% % Normalize the audio to avoid clipping
% melody = melody ./ max(abs(melody));
% 
% % Play the melody
% sound(melody, fs);
% 
% % Save the melody as a .wav file
% audiowrite('melody.wav', melody, fs);
% 
% % Display a message
% disp('Melody generated and saved as "melody.wav".');

%% My melody %%

fs = 11025;  % Sampling frequency
silence = zeros(1, round(fs * 0.01)); % Short pause of 0.05 sec

%Defining notes 
Eb = note(0.5, 55, 0.2);  
C = note(0.5, 52, 0.2); 
G_low = note(0.5, 47, 0.2); 
Ab = note(0.5, 60, 0.2);
F = note(0.5, 57, 0.2);
G_high = note(0.5, 59, 0.2); 
Bb = note(0.5, 50, 0.2); 
D = note(0.5, 54, 0.2); 

%Combining melody

melody = [Eb, silence, C, silence, G_low, silence, Eb, silence, C, silence, G_low, silence, Eb, silence, C, silence, Ab, silence, F, silence, C, silence, G_high, silence, Eb, silence, Bb, silence, G_high, silence, Eb, silence, F, silence, D, silence, Bb, silence, F, silence, D, silence, Bb, silence, F, silence, D, silence, G_high, silence, Eb, silence, Bb, silence, F, silence, D, silence, Bb, silence, G_high, silence, Eb];

%Play melody
sound(melody, fs);
%play as .wav
audiowrite('melody.wav', melody, fs);
