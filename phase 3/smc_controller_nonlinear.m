%% smc_controller_nonlinear.m
clc; clear;

% Time
dt = 0.01;
T  = 30;
time = 0:dt:T;
N = length(time);

% System parameters
m = 50;     % Mass (kg)
Iyy = 10;   % Moment of inertia around y-axis
g = 9.81;

% Desired states
z_ref     = 5;     % Desired depth (m)
theta_ref = 0;     % Desired pitch angle (rad)

% Gains
lambda_z     = 2;
lambda_theta = 3;
k_z          = 15;
k_theta      = 12;

% Initialization
z     = 0; theta = 0;
w     = 0; q     = 0;

states = zeros(N, 4); % z, theta, w, q

for i = 1:N
    % Errors
    ez     = z_ref - z;
    ez_dot = -w;
    
    et     = theta_ref - theta;
    et_dot = -q;
    
    % Sliding surfaces
    sz = ez_dot + lambda_z * ez;
    st = et_dot + lambda_theta * et;
    
    % Control laws (SMC)
    uw = m * (-lambda_z * ez_dot - k_z * sign(sz));   % Depth control
    uq = Iyy * (-lambda_theta * et_dot - k_theta * sign(st)); % Pitch control
    
    % System dynamics
    w_dot = (1/m) * uw - g * sin(theta);
    q_dot = (1/Iyy) * uq;
    
    % Integrate
    w     = w + w_dot * dt;
    q     = q + q_dot * dt;
    z     = z + w * dt;
    theta = theta + q * dt;
    
    % Store
    states(i,:) = [z, theta, w, q];
end

% Save results
save('smc_nonlinear_output.mat', 'states', 'time');