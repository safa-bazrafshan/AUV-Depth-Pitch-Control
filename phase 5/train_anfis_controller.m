% train_anfis_controller.m
% Train ANFIS using the generated dataset

clear; clc;

% Load data
load('anfis_training_data.mat');

% Split input/output
input = data(:,1);      % error
output = data(:,2);     % control input

% Combine for training
trainingData = [input output];

% Generate FIS structure (genfis1: grid partitioning)
fis = genfis1(trainingData, 3, 'gbellmf');

% Train ANFIS
[trainedFIS, error] = anfis(trainingData, fis, 50);

% Save trained ANFIS
writeFIS(trainedFIS, 'anfis_controller');

disp("✅ ANFIS training complete. FIS saved as 'anfis_controller.fis'");