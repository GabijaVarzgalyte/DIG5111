task1a = (3+4)/(5+6);
task1b = 2*pi^2;
task1c = sqrt(2);
task1d = (0.0000123 + 5.67 *10^-3) * 0.4567*10^-4;

task2 = ((37*9)/5)+32;

Amp=0.9;
f=441;
fs = 44100;
ts= 1/fs;
t = 0:1/fs:(0.1-ts);
sig = Amp*sin(2*pi*f*t);
sound(sig,fs);
plot(t,sig);
xlabel("Time in Seconds");
ylabel("Amplitude");
title("Sine wave signal");
audiowrite('sine1.wav',sig,fs);


%%

Amp=0.5;
f=20;
fs = 10000;
ts= 1/fs;
t = 0:ts:1-ts;
sig = Amp*sin(2*pi*f*t);
subplot(3,1,1);
sound(sig,fs);
plot(t(1:500),sig(1:500));
xlabel("Time in Seconds");
ylabel("Amplitude");
title("Sine wave signal");
audiowrite('sine1.wav',sig,fs);

%%

Amp=0.5;
f=200;
fs = 10000;
ts= 1/fs;
t = 0:ts:1-ts;
sig = Amp*sin(2*pi*f*t);
subplot(3,1,2);
sound(sig,fs);
plot(t(1:500),sig(1:500));
xlabel("Time in Seconds");
ylabel("Amplitude");
title("Sine wave signal");
audiowrite('sine1.wav',sig,fs);

%%

Amp=0.5;
f=1000;
fs = 10000;
ts= 1/fs;
t = 0:ts:1-ts;
sig = Amp*sin(2*pi*f*t);
subplot(3,1,3);
sound(sig,fs);
plot(t(1:500),sig(1:500));
xlabel("Time in Seconds");
ylabel("Amplitude");
title("Sine wave signal");
audiowrite('sine1.wav',sig,fs);

