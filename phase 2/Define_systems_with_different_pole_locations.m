clc;
clear;

% Define systems with different pole locations
s = tf('s');

sys1 = 1 / (s + 1);    % pole at -1
sys2 = 1 / (s + 3);    % pole at -3
sys3 = 1 / (s + 0.5);  % pole at -0.5

figure;
step(sys1, 'r', sys2, 'g', sys3, 'b');
legend('Pole at -1', 'Pole at -3', 'Pole at -0.5');
title('Effect of Pole Location on Step Response');
grid on;

% Plot poles
figure;
pzmap(sys1);
title('Pole at -1');