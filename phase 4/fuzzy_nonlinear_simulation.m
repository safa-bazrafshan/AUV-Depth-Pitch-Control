% fuzzy_nonlinear_simulation.m
% Simulate nonlinear AUV model with fuzzy logic controller

clear; clc;

% Load fuzzy controller
fis = readfis('fuzzy_controller');

% Simulation time
tspan = 0:0.1:30;
x0 = [0; 0];  % Initial states: depth = 0, depth rate = 0

% Nonlinear dynamics with fuzzy control
[time, states] = ode45(@(t, x) fuzzy_nonlinear_dynamics(t, x, fis), tspan, x0);

% Plot results
figure;
plot(time, states(:,1), 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Depth (m)');
title('AUV Depth Response with Fuzzy Controller');
grid on;