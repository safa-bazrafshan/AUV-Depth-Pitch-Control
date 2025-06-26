% anfis_nonlinear_control.m
% Simulate nonlinear AUV model with ANFIS controller

clear; clc;

% Load trained FIS
fis = readfis('anfis_controller');

% Simulation parameters
tspan = 0:0.1:30;
x0 = [0; 0]; % [depth; depth_rate]

% Desired depth (constant reference)
z_ref = 5;

% Dynamics
[time, states] = ode45(@(t, x) nonlinear_dynamics_with_anfis(t, x, z_ref, fis), tspan, x0);

% Plot
figure;
plot(time, states(:,1), 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Depth (m)');
title('AUV Depth Response with ANFIS Controller');
grid on;