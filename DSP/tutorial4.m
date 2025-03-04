% %%Introduction
% %wages = 0;
% %for i = 1:8
% %wages = wages + 12.50;
% %end
% %%If Statements
% %x = 0.5;
% %y = 10;
% %if (x > 1)
% %y = x+y;
% %end
% %disp(['new value of y is ', num2str(y)])
% %%If/Else statements
% %if (x>1)
% %y = x+y;
% %else
% %y = x*y;
% %end
% %disp(['newer value of y is ', num2str(y)]);
% %%For Loops
% %array = [1, 3, 2, 4, 6, 5, 7, 6, 8, 7, 9];
% %plot(array, '-');
% %hold on;
% %arrayLength = length(array);
% %for i = 1:arrayLength
%    % array(i) = array(i) + 1;
% %end
% %plot (array, '--');
% %%Combining 'for's and 'If 's
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
%%Bit Crushing
fs = 44100;
ts = 1/fs;
dur = 1;
NumberOfSteps = 3; %bit depth/resolution
t = 0:ts:dur;
subplot(211), plot(x);
grid on;
hold on;
y = t*NumberOfSteps;% y is the x value, scaled by the number of steps.
y = round(y);% y is then rounded to the steps.
y = y*(1/NumberOfSteps);% we then divide by 1 to normalise the signal.
plot(y, '.');
%%
z = sin(2*pi*500.*t);
subplot(212), plot(z);
grid on;
hold on;
NumberOfSteps2 = 3;
y2 = z*NumberOfSteps2;
y2 = round(y2);
y2 = y2*(1/NumberOfSteps2);
plot(y2, '--');