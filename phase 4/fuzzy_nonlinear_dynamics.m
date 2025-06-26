% fuzzy_nonlinear_dynamics.m
% Nonlinear AUV model with fuzzy logic control input

function dxdt = fuzzy_nonlinear_dynamics(t, x, fis)
    z = x(1);        % Depth
    dz = x(2);       % Depth rate

    z_ref = 5;       % Desired depth
    error = z_ref - z;
    d_error = -dz;

    % Evaluate fuzzy controller
    u = evalfis([error d_error], fis);

    % Nonlinear AUV model parameters
    m = 50;          % mass (kg)
    b = 10;          % damping coefficient (kg/s)
    g = 9.81;        % gravity (m/s^2)
    buoyancy = m * g * 0.98;  % slightly less than weight

    % Dynamics
    dzdt = (buoyancy - m*g - b*dz + u) / m;
    dxdt = [dz; dzdt];
end