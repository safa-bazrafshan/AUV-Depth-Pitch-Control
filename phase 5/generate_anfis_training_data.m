% generate_anfis_training_data.m
% Generate training data for ANFIS controller using AUV plant model

clear; clc;

% Time vector
t = 0:0.1:30;

% Desired depth reference signal (step + sine perturbation)
ref = 5 + 0.5*sin(0.2 * t);

% Simulate system with basic fuzzy controller to collect data
depth = zeros(size(t));
error = zeros(size(t));
control_input = zeros(size(t));

depth(1) = 0; % initial depth

for i = 1:length(t)-1
    error(i) = ref(i) - depth(i);
    % Simple control law (for generating data): proportional-like fuzzy output
    control_input(i) = 2 * tanh(error(i)); 
    % Plant model (simplified): depth dynamics
    depth(i+1) = depth(i) + 0.1 * (-0.5 * depth(i) + control_input(i));
end

error(end) = ref(end) - depth(end);
control_input(end) = 2 * tanh(error(end));

% Prepare dataset
data = [error', control_input'];

% Save dataset to .mat
save('anfis_training_data.mat', 'data');

disp("✅ ANFIS training data generated and saved as 'anfis_training_data.mat'");