% %% 5
% x = randn(1,200);
% b = Filter.Numerator;
% a = 1; %for FIR filter denominator is omitted. a = 1
% y = filter(b,a,x);
% figure(1);
% subplot(211), plot(x, 'DisplayName', 'x', 'yDataSource', 'x');
% subplot(212), plot(y, 'DisplayName', 'x', 'yDataSource', 'x');

% %% 6
% Fs = 10000;
% Fp = 500 / (Fs / 2);
% Fst = 1000/ (Fs / 2);
% Ap = 1;
% Ast = 60;
% d = fdesign.lowpass('Fp,Fst,Ap,Ast', Fp, Fst, Ap, Ast);
% filt = design(d);

%% EXAMPLE 1

%fdesign example

fs = 10000;
fp = 500/(fs/2);
fst = 800/(fs/2);
aPass = 3;
aStop = 20;
filtspec = fdesign.lowpass('Fp,Fst,Ap,Ast', fp, fst, aPass, aStop);
filt2 = design(filtspec);
fvtool(filt2);

%% EXAMPLE 2