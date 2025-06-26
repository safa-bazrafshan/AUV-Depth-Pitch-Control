% create_fuzzy_controller.m
% This script creates a fuzzy logic controller for depth control of an AUV.

fis = mamfis('Name', 'DepthController');

% Input 1: Depth error
fis = addInput(fis, [-10 10], 'Name', 'error');
fis = addMF(fis, 'error', 'trapmf', [-10 -10 -5 -2], 'Name', 'Negative');
fis = addMF(fis, 'error', 'trimf', [-3 0 3], 'Name', 'Zero');
fis = addMF(fis, 'error', 'trapmf', [2 5 10 10], 'Name', 'Positive');

% Input 2: Derivative of error
fis = addInput(fis, [-5 5], 'Name', 'd_error');
fis = addMF(fis, 'd_error', 'trapmf', [-5 -5 -2 -1], 'Name', 'Negative');
fis = addMF(fis, 'd_error', 'trimf', [-2 0 2], 'Name', 'Zero');
fis = addMF(fis, 'd_error', 'trapmf', [1 2 5 5], 'Name', 'Positive');

% Output: Control force
fis = addOutput(fis, [-100 100], 'Name', 'control');
fis = addMF(fis, 'control', 'trimf', [-100 -50 0], 'Name', 'Negative');
fis = addMF(fis, 'control', 'trimf', [-25 0 25], 'Name', 'Zero');
fis = addMF(fis, 'control', 'trimf', [0 50 100], 'Name', 'Positive');

% Fuzzy rules
ruleList = [
    1 1 1 1 1;
    1 2 1 1 1;
    1 3 2 1 1;
    2 1 1 1 1;
    2 2 2 1 1;
    2 3 3 1 1;
    3 1 2 1 1;
    3 2 3 1 1;
    3 3 3 1 1;
];
fis = addRule(fis, ruleList);

% Save fuzzy controller
writeFIS(fis, 'fuzzy_controller');

disp("✅ Fuzzy controller 'fuzzy_controller.fis' has been saved successfully.");