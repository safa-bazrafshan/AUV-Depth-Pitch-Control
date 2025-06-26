%% lqr_3dof_control.m
clear all; close all; clc;

% Load simulation parameters from previous step
load('auv_model_with_yaw.mat');

% Sampling time
dt = time(2) - time(1);
Tfinal = time(end);

% System state-space model (linearized simplified)

% States: x = [z; theta; psi; dz; dtheta; dpsi]
A = [ 0 0 0 1 0 0;
      0 0 0 0 1 0;
      0 0 0 0 0 1;
      0 0 0 -8 0 0;
      0 0 0 0 -5 0;
      0 0 0 0 0 -3];

B = [0 0 0;
     0 0 0;
     0 0 0;
     1 0 0;
     0 1 0;
     0 0 1];

% Weighting matrices for LQR
Q = diag([100 100 50 1 1 1]); % Penalize states (positions & angles more)
R = diag([10 10 10]);          % Penalize control effort

% Calculate LQR gain
[K, ~, ~] = lqr(A, B, Q, R);
disp('LQR gain matrix K:');
disp(K);

% Initialize state vector
x_lqr = zeros(6, length(time));
x_lqr(:,1) = zeros(6,1); % start from zero state

% Reference signals (z_ref, theta_ref, psi_ref)
ref = [z_ref; theta_ref; psi_ref; zeros(3, length(time))];

% Simulate system with LQR control
for k=1:length(time)-1
    u = -K * (x_lqr(:,k) - ref(:,k));
    dx = A*x_lqr(:,k) + B*u;
    x_lqr(:,k+1) = x_lqr(:,k) + dx*dt;
end

% Plot results
figure('Name','AUV 3DOF LQR Control Responses','NumberTitle','off');

subplot(3,1,1)
plot(time, x_lqr(1,:), 'b', 'LineWidth', 2); hold on;
plot(time, z_ref, 'r--', 'LineWidth', 1.5);
ylabel('Depth (m)');
legend('Actual', 'Reference');
title('AUV Depth Response with LQR');

subplot(3,1,2)
plot(time, x_lqr(2,:), 'b', 'LineWidth', 2); hold on;
plot(time, theta_ref, 'r--', 'LineWidth', 1.5);
ylabel('Pitch (rad)');
legend('Actual', 'Reference');
title('AUV Pitch Angle Response with LQR');

subplot(3,1,3)
plot(time, x_lqr(3,:), 'b', 'LineWidth', 2); hold on;
plot(time, psi_ref, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Yaw (rad)');
legend('Actual', 'Reference');
title('AUV Yaw Angle Response with LQR');

% Save LQR results
save('auv_lqr_simulation.mat','time','x_lqr','z_ref','theta_ref','psi_ref');