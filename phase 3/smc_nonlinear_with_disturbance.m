
function smc_nonlinear_with_disturbance()
    % Initial conditions
    x0 = [0; 0; 0; 0];
    tspan = 0:0.1:30;

    % Disturbance as a function of time (can be adjusted)
    disturbance_force = @(t) [1.5 * sin(0.2*t); 0.8 * cos(0.1*t)];

    % Simulate
    [time, states] = ode45(@(t, x) smc_nonlinear_dynamics_disturbance(t, x, disturbance_force(t)), tspan, x0);

    % Extract states
    z = states(:,1);
    theta = states(:,3);

    % Plot
    figure;
    subplot(2,1,1);
    plot(time, z, 'b', 'LineWidth', 2); hold on;
    yline(5, 'r--', 'LineWidth', 1.5);
    title('AUV Depth Response with Disturbance (SMC)');
    xlabel('Time (s)');
    ylabel('Depth (m)');
    grid on;

    subplot(2,1,2);
    plot(time, theta, 'm', 'LineWidth', 2);
    title('AUV Pitch Angle Response with Disturbance (SMC)');
    xlabel('Time (s)');
    ylabel('Pitch Angle (rad)');
    grid on;
end