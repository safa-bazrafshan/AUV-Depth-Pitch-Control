% nonlinear_dynamics_with_anfis.m
% Nonlinear AUV model using ANFIS controller

function dx = nonlinear_dynamics_with_anfis(t, x, z_ref, fis)
    z = x(1);      % depth
    z_dot = x(2);  % depth rate

    % Control law using ANFIS
    error = z_ref - z;
    u = evalfis(fis, error);

    % Nonlinear dynamics (simple model)
    dz = z_dot;
    dz_dot = -0.6 * z_dot + 0.8 * u;

    dx = [dz; dz_dot];
end