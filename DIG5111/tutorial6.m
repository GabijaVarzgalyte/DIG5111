%% Week 6 %%

%5a+b)

noisefs = 22050;
noisedur = 2;
noise = randn(noisefs * noisedur, 1);
sound(noise, noisefs);

%5c+d)

% a = 1;
% b = filt1.numerator;
% stem(b); %plots the impulse response of the filter
% newnoise1 = conv(...);
% newnoise2 = filter(filt.Numerator);
% %%playback them
% sound(newnoise1, noisefs);
% sound(newnoise2, noisefs);
% len = ...;
