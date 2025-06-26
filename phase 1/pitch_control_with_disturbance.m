% File: 6_pitch_control_with_disturbance.m
% PID control with water current disturbance on depth

%% Desired references
z_ref = 5;
theta_ref = 0;

%% PID parameters (use tuned values)
Kp_z = 40;
Ki_z = 5;
Kd_z = 70;

Kp_theta = 35;
Ki_theta = 4;
Kd_theta = 20;

%% Initialize integral errors
integral_error_z = 0;
integral_error_theta = 0;

%% Disturbance parameters
disturbance_amplitude = 20;      % Max force (N)
disturbance_frequency = 0.1;     % Hz

for i = 1:length(time)-1
    disturbance_force = disturbance_amplitude * sin(2*pi*disturbance_frequency * time(i));
    
    error_z = z_ref - z(i);
    integral_error_z = integral_error_z + error_z * dt;
    derivative_z = -w(i);
    
    Fz = Kp_z * error_z + Ki_z * integral_error_z + Kd_z * derivative_z;
    Fz = max(min(Fz + disturbance_force, 100), -100);
    
    error_theta = theta_ref - theta(i);
    integral_error_theta = integral_error_theta + error_theta * dt;
    derivative_theta = -q(i);
    
    M = Kp_theta * error_theta + Ki_theta * integral_error_theta + Kd_theta * derivative_theta;
    M = max(min(M, 50), -50);
    
    w_dot = (1/m) * (Fz - d_z * w(i) - m*g + B * cos(theta(i)));
    q_dot = (1/Iyy) * (M - d_theta * q(i));
    
    w(i+1) = w(i) + w_dot * dt;
    z(i+1) = z(i) + w(i) * dt;
    
    q(i+1) = q(i) + q_dot * dt;
    theta(i+1) = theta(i) + q(i) * dt;
end

disp('✅ Step 6 completed: Simulation with disturbance done.');