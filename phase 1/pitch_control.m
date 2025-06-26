% File: 4_pitch_control_pid_updated.m
% Author: Safa Bazrafshan
% Step 4 - PID control for depth and pitch with updated tuning

%% Desired references
z_ref = 5;          % Desired depth (meters)
theta_ref = 0;      % Desired pitch angle (radians)

%% PID parameters for depth control (updated)
Kp_z = 40;          
Ki_z = 5;           
Kd_z = 70;          

%% PID parameters for pitch control (updated)
Kp_theta = 35;      
Ki_theta = 4;       
Kd_theta = 20;      

%% Initialize integral errors
integral_error_z = 0;
integral_error_theta = 0;

%% Make sure initial states and parameters exist:
% Variables from previous steps: z, w, theta, q, time, dt, m, d_z, g, B, Iyy, d_theta

for i = 1:length(time)-1
    %% Depth PID control
    error_z = z_ref - z(i);
    integral_error_z = integral_error_z + error_z * dt;
    derivative_z = -w(i);
    
    Fz = Kp_z * error_z + Ki_z * integral_error_z + Kd_z * derivative_z;
    Fz = max(min(Fz, 100), -100);  % Saturate force
    
    %% Pitch PID control
    error_theta = theta_ref - theta(i);
    integral_error_theta = integral_error_theta + error_theta * dt;
    derivative_theta = -q(i);
    
    M = Kp_theta * error_theta + Ki_theta * integral_error_theta + Kd_theta * derivative_theta;
    M = max(min(M, 50), -50);      % Saturate torque
    
    %% System dynamics update
    w_dot = (1/m) * (Fz - d_z * w(i) - m*g + B * cos(theta(i)));
    q_dot = (1/Iyy) * (M - d_theta * q(i));
    
    w(i+1) = w(i) + w_dot * dt;
    z(i+1) = z(i) + w(i) * dt;
    
    q(i+1) = q(i) + q_dot * dt;
    theta(i+1) = theta(i) + q(i) * dt;
end

disp("✅ Step 4 completed: PID control with updated tuning applied.");