%% model_phase3_non_linear.m
% Phase 3 - Nonlinear AUV Dynamics Model
clc; clear;

% Time settings
dt = 0.01;
t_final = 30;
time = 0:dt:t_final;

% AUV Parameters
m = 50;             % mass (kg)
Iz = 10;            % moment of inertia for yaw (kg*m^2)
Iy = 8;             % moment of inertia for pitch (kg*m^2)
Xu = -5;            % linear drag (surge)
Xuu = -0.8;         % nonlinear drag coefficient (surge)
Zw = -10;           % linear drag (heave)
Zww = -1.0;         % nonlinear drag (heave)
Mw = -2;            % pitch damping
Mww = -0.3;         % pitch nonlinear damping
Nr = -3;            % yaw damping
Nrr = -0.2;         % yaw nonlinear damping

% Initial conditions
x = 0;              % position
z = 0;              % depth
theta = 0;          % pitch angle
psi = 0;            % yaw angle
u = 0;              % surge velocity
w = 0;              % heave velocity
q = 0;              % pitch rate
r = 0;              % yaw rate

% Desired commands (open-loop control input)
u_cmd = 1.0;        % forward thrust
w_cmd = 0.0;        % vertical input (unused yet)
q_cmd = 0.0;        % pitch torque input
r_cmd = 0.2;        % yaw torque input

% Logging variables
states = zeros(length(time), 7);  % x, z, theta, psi, u, w, r

for i = 1:length(time)
    % Nonlinear drag forces
    drag_u = Xu*u + Xuu*abs(u)*u;
    drag_w = Zw*w + Zww*abs(w)*w;
    damp_q = Mw*q + Mww*abs(q)*q;
    damp_r = Nr*r + Nrr*abs(r)*r;

    % Accelerations
    du = (u_cmd + drag_u)/m;
    dw = (w_cmd + drag_w)/m;
    dq = (q_cmd + damp_q)/Iy;
    dr = (r_cmd + damp_r)/Iz;

    % Update velocities
    u = u + du*dt;
    w = w + dw*dt;
    q = q + dq*dt;
    r = r + dr*dt;

    % Update positions and angles
    x = x + u*dt;
    z = z + w*dt;
    theta = theta + q*dt;
    psi = psi + r*dt;

    % Log states
    states(i,:) = [x, z, theta, psi, u, w, r];
end

% Save for plotting
save('nonlinear_model_output.mat', 'states', 'time');
disp("✅ Nonlinear model simulation complete.");