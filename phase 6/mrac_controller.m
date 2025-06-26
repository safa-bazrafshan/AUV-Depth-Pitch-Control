% mrac_controller.m
clc; clear; close all;

%% Reference Model (desired dynamics)
Am = -2;
Bm = 2;

%% Actual Plant Parameters (AUV simplified dynamics)
A = -1;
B = 1;

%% MRAC Gains
gamma = 10;           % adaptation gain
theta_hat = 0;        % initial estimate

%% Simulation Settings
dt = 0.01;
T = 20;
time = 0:dt:T;
n = length(time);
x = zeros(1, n);       % plant state
xm = zeros(1, n);      % reference model state
u = zeros(1, n);       % control input
theta = zeros(1, n);   % estimated parameter

r = ones(1, n);        % reference input (step)

%% Simulation Loop
for i = 1:n-1
    % Control law
    u(i) = theta_hat * r(i);

    % Plant dynamics
    x(i+1) = x(i) + dt * (A * x(i) + B * u(i));

    % Reference model dynamics
    xm(i+1) = xm(i) + dt * (Am * xm(i) + Bm * r(i));

    % Adaptation law
    e = x(i) - xm(i);
    theta_hat = theta_hat - gamma * e * r(i) * dt;
    theta(i+1) = theta_hat;
end

%% Plot results
figure;
plot(time, x, 'b', 'LineWidth', 2); hold on;
plot(time, xm, 'r--', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Response');
legend('AUV Output', 'Reference Model');
title('MRAC Controller Performance');
grid on;