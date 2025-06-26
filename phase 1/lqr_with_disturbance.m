% File: 9_lqr_with_disturbance.m
% Author: Safa Bazrafshan
% Step 9 – LQR control with water current disturbance

clear; clc;

%% Simulation setup
dt = 0.01;
t_final = 20;
time = 0:dt:t_final;

%% System parameters
m = 50;
Iyy = 10;
d_z = 20;
d_theta = 5;
g = 9.81;
B = m * g;

%% State-space model
A = [  0     1        0           0;
      0  -d_z/m    B/m          0;
      0     0        0           1;
      0     0        0      -d_theta/Iyy ];

B = [  0     0;
      1/m    0;
       0     0;
       0   1/Iyy ];

%% LQR gain
Q = diag([100, 10, 100, 10]);
R = diag([1, 1]);
K = lqr(A, B, Q, R);

%% Initial state and reference
x = zeros(4, length(time));
x(:,1) = [0; 0; 0; 0];
ref = [5; 0];

%% Disturbance definition (sinusoidal force)
dist_amplitude = 2;     % N (Newtons)
dist_frequency = 0.2;   % Hz
disturbance = dist_amplitude * sin(2 * pi * dist_frequency * time);

%% Simulation loop with disturbance
for i = 1:length(time)-1
    u = -K * (x(:,i) - [ref(1); 0; ref(2); 0]);
    
    % Add disturbance to vertical force input
    u_disturbed = u + [disturbance(i); 0];
    
    x_dot = A * x(:,i) + B * u_disturbed;
    x(:,i+1) = x(:,i) + x_dot * dt;
end

%% Extract outputs
z = x(1,:);
theta = x(3,:);

disp('✅ Step 9 completed: LQR with disturbance simulation done.');