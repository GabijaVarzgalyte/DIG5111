%% MATLAB Starter Code for Image Source Method (ISM)
% This script generates a room impulse response using the Image Source Method.
% It is intended as a starting point for your DSP Assessment.
%
% Key Features:
%   1. Define a custom cuboid room (length, width, height).
%   2. Specify positions for the sound source and receiver.
%   3. Compute reflections up to a user-defined reflection order.
%   4. Include placeholders to incorporate absorption coefficients for each room surface.
%   5. Plot the resulting impulse response.
%   6. Provide a basic framework for later convolution with an audio signal.
%
% You are encouraged to expand the code (e.g., to include higher-order reflections
% or frequency-dependent absorption coefficients) by modifying the indicated sections.

%% 1. Parameter Definition
% Room dimensions (meters)
room_length = 10;    % Length in x-direction
room_width  = 7;     % Width in y-direction
room_height = 3;     % Height in z-direction

% Sound source and receiver (listener) positions [x, y, z] in meters
src_pos = [3, 4, 1.5];   % Source position
rec_pos = [7, 2, 1.5];   % Receiver position

% Sampling parameters and speed of sound
fs = 44100;          % Sampling frequency in Hz
c  = 343;            % Speed of sound in m/s

% Maximum reflection order (i.e. include reflections from -max_order to max_order in each dimension)
% REFLECTION ORDER = how many times the sound or wave is reflected off
% surfaces before it reaches the receiver
max_order = 30;

% Absorption coefficients for surfaces (values between 0 and 1)
% These represent the fraction of energy absorbed at each surface.
% For now, we use a uniform absorption coefficient.

%% Defining Frequency Bands
% Frequency Bands = 125Hz, 250Hz, 500Hz, 1000Hz, 2000Hz, 4000Hz
frequency_bands = [125, 250, 500, 1000, 2000, 4000];
lower_bound = frequency_bands/sqrt(2);
upper_bound = frequency_bands * sqrt(2);
nBands = length(frequency_bands);

% Creating structore that holds different materials with diff. coefficients
materials = struct();
materials.carpet = struct('name', 'Carpet', 'absorption', [0.2, 0.25, 0.3, 0.3, 0.3, 0.3]);
materials.painted_concrete = struct('name', 'Painted/glazed concrete', 'absorption', [0.1, 0.1, 0.1, 0.2, 0.2, 0.2]);
materials.plaster = struct('name', 'Plaster', 'absorption', [0.4, 0.5, 0.6, 0.8, 0.4, 0.6]);
materials.carpet = struct('name', 'Carpet', 'absorption', [0.1, 0.1, 0.1, 0.1, 0.1, 0.1]);
materials.carpet = struct('name', 'Carpet', 'absorption', [0.1, 0.1, 0.1, 0.1, 0.1, 0.1]);
materials.carpet = struct('name', 'Carpet', 'absorption', [0.1, 0.1, 0.1, 0.1, 0.1, 0.1]);

% Display materials
disp('Materials:');
material_names = fieldnames(materials);
for i = 1:length(material_names)
    fprintf('%d: %s\n', i, material_names{i});
end

% User input for surface materials
fprintf(('\nSelect materials for each surface (enter number 1-%d):\n'), length(material_names));
left_wall_material = input('Left wall material: ');
right_wall_material = input('Right wall material: ');
front_wall_material = input('Front wall material: ');
back_wall_material = input('Back wall material: ');
ceiling_material = input('Ceiling material: ');
floor_material = input('Floor material: ');

% For simplicity, we use a single uniform absorption value.
% Dampening of the air
uniform_absorption = 0.2;  % (Placeholder value)
% Reflection coefficient per reflection (simple model):
reflection_coeff_single = 1 - uniform_absorption; 
% Note: In a more detailed model, you might compute the reflection coefficient 
% as the square root of (1 - absorption) to account for energy conservation.

% Impulse response duration (seconds)
ir_duration = 3.0;  
N = round(fs * ir_duration);    % Number of samples in the IR
h = zeros(N, 1);                % Preallocate the impulse response vector

%% 2. Image Source Computation and IR Construction
% Loop over reflection orders in each spatial dimension.
% The image source method creates virtual sources by “mirroring” the actual source.
% For each axis, the image source coordinate is computed as follows:
%   - If the reflection order (n) is even:  img_coord = n*room_dim + src_coord
%   - If odd:                         img_coord = n*room_dim + (room_dim - src_coord)
%
% The total number of reflections for a given image is the sum of the absolute
% values of the reflection orders in x, y, and z. This count is used to scale
% the amplitude (via the reflection coefficients) and to mimic energy loss.


% Computes the position of each 'image source' created by reflections
% nx = reflection order along x-axis
for nx = -max_order:max_order % Looping over -50 to 50 order filters
    % Compute image source x-coordinate (horizontal line)
    if mod(nx,2) == 0 % Divides the reflection order by 2 to determine if it's an even number
        img_x = src_pos(1) + nx * room_length;
    else
        img_x = (room_length - src_pos(1)) + nx * room_length; % If it is an odd number
    end
    
    for ny = -max_order:max_order
        % Compute image source y-coordinate
        if mod(ny,2) == 0
            img_y = src_pos(2) + ny * room_width;
        else
            img_y = (room_width - src_pos(2)) + ny * room_width;
        end
        
        for nz = -max_order:max_order
            % Compute image source z-coordinate
            if mod(nz,2) == 0
                img_z = src_pos(3) + nz * room_height;
            else
                img_z = (room_height - src_pos(3)) + nz * room_height;
            end
            
            % Compute the Euclidean distance from the image source to the receiver
            distance = sqrt((img_x - rec_pos(1))^2 + (img_y - rec_pos(2))^2 + (img_z - rec_pos(3))^2);
            
            % Compute the propagation delay in seconds and convert to a sample index
            time_delay = distance / c;
            sample_delay = round(time_delay * fs) + 1;  % +1 for MATLAB 1-indexing
            
            % Count the total number of reflections from all three dimensions
            num_reflections = abs(nx) + abs(ny) + abs(nz);
            
            % Compute the overall reflection coefficient for this image source.
            % --- Students: Modify this section to apply surface-specific absorption.
            % For example, you could assign different reflection coefficients depending on
            % which wall (left/right, front/back, floor/ceiling) was involved in the reflection.
            total_reflection_coeff = reflection_coeff_single^num_reflections;
            
            % Attenuation due to spherical spreading (inverse of distance)
            attenuation = 1 / distance;
            
            % Add the contribution from this image source to the impulse response,
            % if the computed sample delay is within the impulse response length.
            if sample_delay <= N
                h(sample_delay) = h(sample_delay) + total_reflection_coeff * attenuation;
            end
        end
    end
end

%% 3. Design Bandpass Filters for Each Octave Band

h_filtered = zeros(N, nBands);
for b = 1:nBands
    f_low = lower_bound(b);
    f_high = upper_bound(b);
    wn = [f_low, f_high] / (fs/2);
    [b_f, a_f] = butter(4, wn, 'bandpass');

   
[h] = ISM()

filteredIR(b,:) = filter(b_f, a_f,h);
end

FinalIR = sum(filteredIR);

%% 4. Plot the Impulse Response
time_axis = (0:N-1) / fs;  % Time vector in seconds
figure;
stem(time_axis, h, 'Marker', 'none');
xlabel('Time (s)');
ylabel('Amplitude');
title('Room Impulse Response using Image Source Method');
grid on;

%% 5. Using the Impulse Response for Convolution Reverb
% The generated impulse response (vector h) can now be used to apply convolution
% reverb to an audio signal.

[audio, fs_audio] = audioread('your_audio_file.wav');
if size(audio, 2) > 1
    audio = mean(audio, 2);
end

audio_reverberated = my_convolution(audio, FinalIR);

soundsc(audio_reverberated, fs);

%% End of Script