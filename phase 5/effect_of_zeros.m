% Define numerator and denominator
num_with_zero = [1 10];     % Transfer function with a zero
num_without_zero = [1];     % Transfer function without a zero
den = [1 2 2];               % Common denominator for both systems

% Create transfer functions
sys_with_zero = tf(num_with_zero, den);
sys_without_zero = tf(num_without_zero, den);

% Plot step responses
step(sys_without_zero, 'b'); hold on;
step(sys_with_zero, 'r--');

% Customize plot
legend('Without Zero', 'With Zero');
title('Effect of Zeros on Step Response');
xlabel('Time (seconds)');
ylabel('Amplitude');
xlim([0 5]);
grid on;