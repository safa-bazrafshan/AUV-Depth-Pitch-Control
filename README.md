# Autonomous Underwater Vehicle (AUV) Depth & Attitude Control

This repository contains simulation and control design for an Autonomous Underwater Vehicle (AUV), focusing on depth, pitch, and yaw control using classical and advanced control strategies. Implemented in MATLAB/Simulink.

## 🚀 Project Goals

- Learn and simulate control systems in underwater robotics
- Apply control theory (PID, LQR, and SMC) to a simplified AUV model
- Visualize and evaluate system performance
- Document results for future research and publication

---

## 🔧 Phase 1: Classical Control Design (PID & LQR)

In this phase, a simplified AUV model was controlled using PID and LQR techniques:

- Depth Control using PID
- Pitch Control using PD and LQR
- Simulation under Disturbances
- Performance Evaluation via plots and response curves

📄 Full report for Phase 1: [AUV_Control_Phase1.pdf](docs/AUV_Control_Phase1.pdf)

---

## ⚙️ Phase 2: Advanced Control (Sliding Mode Control - SMC)

In Phase 2, we expanded the AUV model to 3 DOF (Depth, Pitch, Yaw) and implemented a Sliding Mode Controller for robust performance.

- Nonlinear control design with SMC
- Simulated external disturbances (e.g., underwater currents)
- Pitch and yaw stabilization
- LQR used for baseline comparison

📄 Full report for Phase 2: [AUV_Control_Phase2_SMC.pdf](docs/AUV_Control_Phase2_SMC.pdf)

---

## 📊 Key Figures

### Phase 1

| PID/LQR Depth Response | LQR with Disturbance |
|------------------------|----------------------|
| ![Depth PID Control](figures_phase1/depth_pid_lqr.png) | ![LQR with Disturbance](figures_phase1/lqr_disturbance.png) |

### Phase 2 (SMC Control)

| Full 3DOF Simulation | SMC Stabilization |
|----------------------|-------------------|
| ![SMC Control](figures_phase2/smc_response_1.png) | ![SMC Improved](figures_phase2/smc_response_2.png) |

---
---

## 👤 Author

Safa Bazrafshan  
MSc in Electrical Engineering – Control  

🔗 [LinkedIn](https://www.linkedin.com/in/safa-bazrafshan-04100a29a)  
🔗 [GitHub](https://github.com/safa-bazrafshan)  
🔗 [ORCID](https://orcid.org/0009-0004-4029-9550)

---

## 📝 License

This project is open for academic and educational use. Please credit the author when using or modifying this work.

