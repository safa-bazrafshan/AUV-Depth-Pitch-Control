%% plot_smc_nonlinear.m
clc; clear;

% Load data
load('smc_nonlinear_output.mat');

z     = states(:,1);
theta = states(:,2);
time  = time(:);

% Plot
figure;
subplot(3,1,1)
plot(time, z, 'g', 'LineWidth', 2); grid on;
ylabel('Depth (m)')
title('AUV Depth Response - Nonlinear SMC')

subplot(3,1,2)
plot(time, theta, 'b', 'LineWidth', 2); grid on;
ylabel('Pitch Angle (rad)')
title('AUV Pitch Angle Response - Nonlinear SMC')

subplot(3,1,3)
plot(time, 0.5*ones(size(time)), 'r--', 'LineWidth', 1.5); hold on;
plot(time, z, 'g', 'LineWidth', 2);
ylabel('Depth Tracking (m)')
xlabel('Time (s)')
title('Tracking Performance')
grid on;