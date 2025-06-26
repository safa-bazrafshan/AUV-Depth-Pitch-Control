% File: 2_simulate_control.m
% Author: Safa Bazrafshan
% Step 2 - Simulate AUV depth control using PID

%% Desired depth (reference)
z_ref = 5;  % Target depth in meters

%% PID controller parameters
Kp = 80;
Kd = 30;
Ki = 20;

integral_error = 0;

%% Main simulation loop
for i = 1:length(time)-1
    % Error terms
    e = z_ref - z(i);
    derivative = -w(i);  % z_dot = w ⇒ dz/dt = w ⇒ d(e)/dt = -w
    integral_error = integral_error + e * dt;
    
    % Control force (heave)
    Fz = Kp * e + Ki * integral_error + Kd * derivative;
    
    % Saturate control force
    Fz = max(min(Fz, 100), -100);  % limit between -100 and +100 N
    
    % Dynamics: vertical motion (heave)
    w_dot = (1/m) * (Fz - d_z * w(i) - m * g + B * cos(theta(i)));
    q_dot = (1/Iyy) * (-d_theta * q(i));  % no pitch control (passive damping)

    % Euler integration
    w(i+1) = w(i) + w_dot * dt;
    z(i+1) = z(i) + w(i) * dt;
    
    q(i+1) = q(i) + q_dot * dt;
    theta(i+1) = theta(i) + q(i) * dt;
end

disp("✅ Step 2 completed: Simulation with PID control is done.");