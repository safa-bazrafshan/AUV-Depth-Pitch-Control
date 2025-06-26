% smc_depth_control.m
clc; clear; close all

% Parameters
a = -0.8; 
b = 0.5;
lambda = 2;
k = 1.5;

% Simulation settings
dt = 0.01;
T = 20;
time = 0:dt:T;

% Initial conditions
z = zeros(size(time));      % Depth
z_dot = zeros(size(time));  % Depth rate
u = zeros(size(time));      % Control input
s = zeros(size(time));      % Sliding surface
z_ref = 5 * ones(size(time));  % Desired depth

% Disturbance
disturbance = 0.2 * sin(0.5 * time);

% Simulation loop
for i = 1:length(time)-1
    s(i) = lambda * (z(i) - z_ref(i)) + z_dot(i);
    u(i) = -(1/b)*(a*z_dot(i) + lambda*z_dot(i) + k * sign(s(i)));
    
    % System dynamics
    z_ddot = a*z_dot(i) + b*u(i) + disturbance(i);
    z_dot(i+1) = z_dot(i) + dt*z_ddot;
    z(i+1) = z(i) + dt*z_dot(i);
end

% Plotting
figure
plot(time, z, 'b', 'LineWidth', 2); hold on
plot(time, z_ref, 'r--', 'LineWidth', 1.5)
xlabel('Time (s)')
ylabel('Depth (m)')
title('Depth Control using Sliding Mode')
legend('Depth', 'Reference')
grid on