function dx = smc_nonlinear_dynamics_disturbance(t, x, disturbance)
    % States
    z = x(1);          % depth
    zdot = x(2);       % depth rate
    theta = x(3);      % pitch angle
    thetadot = x(4);   % pitch rate

    % Parameters
    m = 50;            % mass (kg)
    Iyy = 10;          % moment of inertia
    g = 9.81;
    desired_depth = 5;

    % Sliding surface
    e = z - desired_depth;
    edot = zdot;
    s = edot + 2 * e;

    % SMC control law
    eta = 20;
    u = -m * (2 * edot + 5 * e) - eta * sign(s);

    % Dynamics with disturbance
    dz = zdot;
    dzdot = (u + disturbance(1)) / m;
    dtheta = thetadot;
    dthetadot = disturbance(2) / Iyy;

    dx = [dz; dzdot; dtheta; dthetadot];
end