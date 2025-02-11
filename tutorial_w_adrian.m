%% Week 2 (continued)

%%Task 8

Decimal = (1:30).';%%a list but .' makes it into a column
Binary = num2bin(quantizer([16,0]),[1:30]);%%quantizer([how many digits, how many digits will be decimals])
Hexadecimal = num2hex([1:30]);
balls = table(Decimal, Binary, Hexadecimal);
disp(balls)

%%Task 9
filename = 'piano_middle_C.wav';
[sig, fs] = audioread(filename);
duration = length(sig)/fs; 
disp(duration); 
ts = 1/fs; 
time = 0:ts:duration-ts; 
plot(time',sig); 
ylabel('Amplitude'); 
xlabel('Time Sec'); 
reversed_audio = flip(sig);
sound(reversed_audio, fs)
