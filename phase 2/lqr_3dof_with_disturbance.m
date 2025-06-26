%% lqr_3dof_with_disturbance.m
clear all; close all; clc;

load('auv_model_with_yaw.mat'); % Load parameters and time vector

dt = time(2) - time(1);
Tfinal = time(end);

% System matrices (same as before)
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

% Disturbance vector (simulate water current affecting velocities)
disturbance = zeros(6, length(time));
disturbance(4,:) = 0.3*sin(0.2*time); % Disturbance on z velocity
disturbance(5,:) = 0.1*sin(0.1*time); % Disturbance on pitch rate
disturbance(6,:) = 0.2*sin(0.15*time); % Disturbance on yaw rate

% LQR weights
Q = diag([100 100 50 1 1 1]);
R = diag([10 10 10]);

[K, ~, ~] = lqr(A,B,Q,R);

% Initialize states
x = zeros(6,length(time));
x(:,1) = zeros(6,1);

% Reference (desired states)
ref = [z_ref; theta_ref; psi_ref; zeros(3,length(time))];

% Simulation loop with disturbance
for k=1:length(time)-1
    u = -K*(x(:,k)-ref(:,k));
    dx = A*x(:,k) + B*u + disturbance(:,k);
    x(:,k+1) = x(:,k) + dx*dt;
end

% Plot results
figure('Name','AUV 3DOF LQR Control with Disturbance','NumberTitle','off');

subplot(3,1,1)
plot(time, x(1,:), 'b', 'LineWidth', 2); hold on;
plot(time, z_ref, 'r--', 'LineWidth', 1.5);
ylabel('Depth (m)');
legend('Actual','Reference');
title('AUV Depth Response with LQR and Disturbance');

subplot(3,1,2)
plot(time, x(2,:), 'b', 'LineWidth', 2); hold on;
plot(time, theta_ref, 'r--', 'LineWidth', 1.5);
ylabel('Pitch (rad)');
legend('Actual','Reference');
title('AUV Pitch Angle Response with LQR and Disturbance');

subplot(3,1,3)
plot(time, x(3,:), 'b', 'LineWidth', 2); hold on;
plot(time, psi_ref, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Yaw (rad)');
legend('Actual','Reference');
title('AUV Yaw Angle Response with LQR and Disturbance');

% Save results
save('auv_lqr_disturbance_simulation.mat','time','x','z_ref','theta_ref','psi_ref');