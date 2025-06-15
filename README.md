# AUV Depth and Pitch Control Simulation

This repository contains MATLAB scripts for modeling and control of an Autonomous Underwater Vehicle (AUV) focusing on depth and pitch regulation.

## Project Overview

The project simulates the AUV dynamics and compares classical PID and advanced LQR control strategies. Disturbances such as underwater currents are also modeled to test controller robustness.

## Repository Structure

- scripts/: MATLAB scripts for system modeling, controller design, and simulations
- figures/: Key simulation plots showing system responses
- report/: Detailed project report in PDF format

## How to Run

1. Open MATLAB and add this repository folder to your path.
2. Run the scripts in numerical order to reproduce simulations and plots:
    - 1_model_setup.m
    - 2_simulate_pid.m
    - 3_simulate_lqr.m
    - 4_simulate_lqr_disturbance.m
    - 5_plot_results.m

## Author

Safa Bazrafshan  
[GitHub](https://github.com/safa-bazrafshan) | [LinkedIn](https://linkedin.com/in/safa-bazrafshan-04100a29a) 

## License

This project is licensed under the MIT License.
