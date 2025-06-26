% File: 5_plot_pitch_control.m
% Plot depth and pitch results after pitch control added

figure;
subplot(2,1,1);
plot(time, z, 'b', 'LineWidth', 2); hold on;
yline(z_ref, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Depth (m)');
title('AUV Depth Response with Pitch Control');
legend('Depth','Reference');
grid on;

subplot(2,1,2);
plot(time, theta * (180/pi), 'k', 'LineWidth', 2);
yline(theta_ref * (180/pi), 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Pitch Angle (deg)');
title('AUV Pitch Angle Response with PD Control');
legend('Pitch Angle','Reference');
grid on;

disp('✅ Step 5 completed: Plots generated.');