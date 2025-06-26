%% model_with_yaw.m
% 3DOF AUV Model: Depth, Pitch, Yaw

clear all; close all; clc;

% Simulation time
t_final = 20;
dt = 0.01;
time = 0:dt:t_final;

% Parameters
m = 50;          % Mass (kg)
d_z = 8;         % Damping for depth
d_theta = 5;     % Damping for pitch
d_r = 3;         % Damping for yaw

% Initial states: [z; theta; dz; dtheta; psi; r]
x0 = [0; 0; 0; 0; 0; 0];

% Reference inputs
z_ref = 5 * ones(size(time));          % Desired depth
theta_ref = zeros(size(time));         % Desired pitch angle
psi_ref = pi/6 * ones(size(time));     % Desired yaw (30 degrees)

% Preallocate
x = zeros(6, length(time));
x(:,1) = x0;

% Control gains (initial)
Kp_z = 50;   Kd_z = 20;
Kp_theta = 80; Kd_theta = 30;
Kp_psi = 40;  Kd_psi = 15;

for k = 1:length(time)-1
    % Errors
    e_z = z_ref(k) - x(1,k);
    de_z = -x(3,k);

    e_theta = theta_ref(k) - x(2,k);
    de_theta = -x(4,k);

    e_psi = psi_ref(k) - x(5,k);
    de_psi = -x(6,k);

    % PID-like control inputs
    u_z = Kp_z * e_z + Kd_z * de_z;
    u_theta = Kp_theta * e_theta + Kd_theta * de_theta;
    u_psi = Kp_psi * e_psi + Kd_psi * de_psi;

    % System dynamics
    dz = x(3,k);
    dtheta = x(4,k);
    dr = x(6,k);

    ddz = (1/m) * (-d_z * dz + u_z);
    ddtheta = (1/m) * (-d_theta * dtheta + u_theta);
    ddr = (1/m) * (-d_r * dr + u_psi);

    % Integration (Euler)
    x(1,k+1) = x(1,k) + dt * dz;
    x(2,k+1) = x(2,k) + dt * dtheta;
    x(3,k+1) = x(3,k) + dt * ddz;
    x(4,k+1) = x(4,k) + dt * ddtheta;
    x(5,k+1) = x(5,k) + dt * dr;
    x(6,k+1) = x(6,k) + dt * ddr;
end

% Save data
save('auv_model_with_yaw.mat', 'time', 'x', 'z_ref', 'theta_ref', 'psi_ref');