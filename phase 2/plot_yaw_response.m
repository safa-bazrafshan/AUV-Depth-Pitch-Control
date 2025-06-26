%% plot_yaw_response.m
load('auv_model_with_yaw.mat');

figure('Name', 'AUV 3DOF Control Responses', 'NumberTitle', 'off');

subplot(3,1,1)
plot(time, x(1,:), 'b', 'LineWidth', 2); hold on;
plot(time, z_ref, 'r--', 'LineWidth', 1.5);
ylabel('Depth (m)');
legend('Actual', 'Reference');
title('AUV Depth Response');

subplot(3,1,2)
plot(time, x(2,:), 'b', 'LineWidth', 2); hold on;
plot(time, theta_ref, 'r--', 'LineWidth', 1.5);
ylabel('Pitch (rad)');
legend('Actual', 'Reference');
title('AUV Pitch Angle Response');

subplot(3,1,3)
plot(time, x(5,:), 'b', 'LineWidth', 2); hold on;
plot(time, psi_ref, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Yaw (rad)');
legend('Actual', 'Reference');
title('AUV Yaw Angle Response');