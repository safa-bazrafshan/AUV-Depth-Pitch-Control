%% plot_phase3_results.m
% Plot results of nonlinear AUV dynamics
clc; clear;

% Load data
load('nonlinear_model_output.mat');

% Extract states
x     = states(:,1);
z     = states(:,2);
theta = states(:,3);
psi   = states(:,4);
u     = states(:,5);
w     = states(:,6);
r     = states(:,7);

% Plotting
figure;
subplot(3,1,1);
plot(time, z, 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Depth (m)');
title('AUV Depth Response');
grid on;

subplot(3,1,2);
plot(time, theta, 'r', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Pitch Angle (rad)');
title('AUV Pitch Angle Response');
grid on;

subplot(3,1,3);
plot(time, psi, 'g', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Yaw Angle (rad)');
title('AUV Yaw Angle Response');
grid on;

sgtitle('Phase 3 – Nonlinear AUV Simulation Results');