% File: 7_lqr_controller_design.m
% Author: Safa Bazrafshan
% Step 7 – Design and simulate LQR controller for AUV

clear; clc;

%% Simulation time
dt = 0.01;
t_final = 20;
time = 0:dt:t_final;

%% System parameters
m = 50;             % mass (kg)
Iyy = 10;           % pitch moment of inertia (kg·m^2)
d_z = 20;           % damping in depth (N·s/m)
d_theta = 5;        % damping in pitch (N·m·s/rad)
g = 9.81;           % gravity (m/s^2)
B = m * g;          % buoyancy force

%% Linearized state-space model
% States: x = [z; w; theta; q]
% Inputs: u = [Fz; M]

A = [  0     1        0           0;
      0  -d_z/m    B/m          0;
      0     0        0           1;
      0     0        0      -d_theta/Iyy ];

B = [  0     0;
      1/m    0;
       0     0;
       0   1/Iyy ];

C = eye(4);    % we can observe all states
D = zeros(4,2);

%% LQR design
Q = diag([100, 10, 100, 10]);  % state cost
R = diag([1, 1]);              % control effort penalty

K = lqr(A, B, Q, R);           % LQR gain

disp('✅ LQR gain matrix K calculated:');
disp(K);

%% Initial condition and reference
x = zeros(4, length(time));
x(:,1) = [0; 0; 0; 0];         % [z; w; theta; q]
ref = [5; 0];                  % Desired [z_ref; theta_ref]

%% Simulation loop
for i = 1:length(time)-1
    u = -K * (x(:,i) - [ref(1); 0; ref(2); 0]);
    
    x_dot = A*x(:,i) + B*u;
    x(:,i+1) = x(:,i) + x_dot * dt;
end

%% Extract outputs
z = x(1, :);
theta = x(3, :);

disp('✅ Step 7 completed: LQR simulation done.');