% File: 3_plot_results.m
% Author: Safa Bazrafshan
% Step 3 - Plot simulation results

%% Plot Depth vs Time
figure;
subplot(2,1,1);
plot(time, z, 'b', 'LineWidth', 2); hold on;
yline(z_ref, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Depth (m)');
title('AUV Depth Response');
legend('Depth','Reference');
grid on;

%% Plot Pitch Angle vs Time
subplot(2,1,2);
plot(time, theta * (180/pi), 'k', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Pitch (deg)');
title('AUV Pitch Angle Response');
grid on;

disp("✅ Step 3 completed: Results plotted.");