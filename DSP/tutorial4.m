% %%INTRODUCTION

% %wages = 0;
% %for i = 1:8
% %wages = wages + 12.50;
% %end

% %%IF STATEMENTS

% %x = 0.5;
% %y = 10;
% %if (x > 1)
% %y = x+y;
% %end
% %disp(['new value of y is ', num2str(y)])

% %%IF/ELSE STATEMENTS

% %if (x>1)
% %y = x+y;
% %else
% %y = x*y;
% %end
% %disp(['newer value of y is ', num2str(y)]);

% %%FOR LOOPS

% %array = [1, 3, 2, 4, 6, 5, 7, 6, 8, 7, 9];
% %plot(array, '-');
% %hold on;
% %arrayLength = length(array);
% %for i = 1:arrayLength
%    % array(i) = array(i) + 1;
% %end
% %plot (array, '--');

% %%COMBINING 'FOR'S' AND 'IF'S'

% x = -1:0.5:1; %input
% y = x; %output
% plot(y, x, '.')
% hold on;
% length_x = length(x);
% for i = 1:length_x
%     if (x(i) > 0.5)
%         y(i) = 0.5;
%     end 
%        if (x(i) < -0.5)
%         y(i) = -0.5;
%        end 
% end
% plot(x, y, '..')
% hold on

% %%BIT CRUSHING

% fs = 44100; % Sampling frequency
% ts = 1/fs; % Sampling period
% dur = 4.5; % Duration in seconds
% NumberOfSteps = 2; % Bit depth/resolution
% t = 0:ts:dur; % Time vector
% % First subplot (Linear ramp with quantization)
% subplot(2,1,1);
% plot(t, t, 'b--'); % Plotting linear ramp (x-axis)
% grid on;
% hold on;
% 
% y = t * NumberOfSteps; % Scale time by the number of steps
% y = round(y); % Quantization
% y = y * (1 / NumberOfSteps); % Normalize
% 
% plot(t, y, 'r-'); % Plot quantized version
% title('Quantized Linear Ramp');
% xlabel('Time (s)');
% ylabel('Amplitude');
% 
% % Reduce sample points for visibility
% t_plot = t(1:100:end); % Downsample for better visualization
% 
% % Second subplot (Sine wave with quantization)
% z = sin(2*pi*0.22.*t);
% subplot(2,1,2);
% plot(t_plot, z(1:100:end), 'b'); % Downsampled sine wave plot
% grid on;
% hold on;
% 
% NumberOfSteps2 = 2;
% y2 = z * NumberOfSteps2;
% y2 = round(y2);
% y2 = y2 * (1 / NumberOfSteps2);
% 
% plot(t_plot, y2(1:100:end), 'r--'); % Downsampled quantized sine wave
% title('Quantized Sine Wave');
% xlabel('Time (s)');
% ylabel('Amplitude');

%%TASK1

% fs = 44100; % Sampling frequency
% ts = 1/fs; % Sampling period
% dur = 1; % Duration in seconds
% t = 0:ts:dur-ts; % Time vector (avoid extra point)
% 
% f = 10; % Frequency of sine wave
% x = sin(2 * pi * f * t); % Generate sine wave
% 
% % Normalize the distorted signal
% y = y / max(abs(y)); 
% 
% threshold = 0.5;
% y = x;  % Copy original signal
% 
% for i = 1:length(y)
%     if y(i) > threshold
%         y(i) = threshold;  % Clip positive peaks
%     elseif y(i) < -threshold
%         y(i) = -threshold;  % Clip negative peaks
%     end
% end
% 
% % For debugging, display the result
% disp(y);
% 
% % Downsample for better plotting
% downsample_factor = 100; % Reduce number of plotted points
% t_plot = t(1:downsample_factor:end);
% x_plot = x(1:downsample_factor:end);
% y_plot = y(1:downsample_factor:end);
% 
% % Plot the original and distorted waveforms
% figure;
% subplot(2,1,1);
% plot(t_plot, x_plot, 'b'); % Original sine wave in blue
% title('Original Sine Wave');
% xlabel('Time (s)');
% ylabel('Amplitude');
% grid on;
% ylim([-1.1 1.1]);
% 
% subplot(2,1,2);
% plot(t_plot, y_plot, 'r'); % Distorted sine wave in red
% title('Clipped and Normalized Sine Wave');
% xlabel('Time (s)');
% ylabel('Amplitude');
% grid on;
% ylim([-1.1 1.1]);

%%TASK2

% fs = 44100;    % Sampling frequency
% ts = 1/fs;     % Sampling period
% dur = 4.5;     % Duration in seconds (for 1 Hz sine wave over 4.5 seconds)
% f = 1/dur;     % Frequency for 1 full cycle over 4.5 seconds
% t = 0:ts:dur;  % Time vector
% 
% % Generate the sine wave with the desired frequency
% sineWave = sin(2 * pi * f * t);
% sineLength = length(sineWave);
% clip2 = sineWave;  % Copy the original sine wave
% 
% % Normalize the signal
% clip2 = clip2 / max(abs(clip2));  % Normalize clip2 signal
% 
% % Apply clipping
% for i = 1:sineLength
%     if sineWave(i) < -0.1
%         clip2(i) = -0.1;  % Clip values below -0.1
%     end
% end
% 
% % Plot the clipped signal
% figure;
% plot(t, clip2);  % Use t for the x-axis to reflect time in seconds
% axis([0 dur -1 1]);  % Set x-axis from 0 to 4.5 seconds
% grid on;

%%TASK3








