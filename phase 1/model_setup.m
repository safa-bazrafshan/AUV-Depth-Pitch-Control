% File: 1_model_setup.m
% Author: Safa Bazrafshan
% Step 1 - Model Initialization for AUV Depth Control

clc; clear;

%% Physical parameters
m = 50;        % Mass of AUV (kg)
g = 9.81;      % Gravity (m/s^2)
B = m * g;     % Buoyancy force (N)
rho = 1000;    % Water density (kg/m^3)
V = m / rho;   % Displaced volume (m^3)

% Hydrodynamic damping coefficients
d_z = 15;      % Heave damping coefficient
d_theta = 5;   % Pitch damping coefficient

% Moment of inertia around y-axis
Iyy = 10;      % (kg*m^2)

%% Initial conditions
z0 = 0;        % Initial depth (m)
theta0 = 0;    % Initial pitch angle (rad)
w0 = 0;        % Initial vertical speed (m/s)
q0 = 0;        % Initial pitch rate (rad/s)

%% Time setup
dt = 0.01;     % Time step (s)
T = 20;        % Total simulation time (s)
time = 0:dt:T;

%% Allocate state arrays
z = zeros(size(time));       % Depth (m)
w = zeros(size(time));       % Vertical velocity (m/s)
theta = zeros(size(time));   % Pitch angle (rad)
q = zeros(size(time));       % Pitch rate (rad/s)

% Initialize with initial conditions
z(1) = z0;
w(1) = w0;
theta(1) = theta0;
q(1) = q0;

disp("✅ Step 1 completed: Model and initial conditions are set.");