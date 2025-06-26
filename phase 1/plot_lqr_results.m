% File: 8_plot_lqr_results.m
% Author: Safa Bazrafshan
% Step 8 – Plot LQR control results

figure;

subplot(2,1,1);
plot(time, z, 'b', 'LineWidth', 2); hold on;
yline(5, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Depth (m)');
title('AUV Depth Response (LQR)');
legend('Depth', 'Setpoint');
grid on;

subplot(2,1,2);
plot(time, theta, 'm', 'LineWidth', 2); hold on;
yline(0, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Pitch Angle (rad)');
title('AUV Pitch Response (LQR)');
legend('Pitch Angle', 'Setpoint');
grid on;