# Autonomous Underwater Vehicle (AUV) Control Project

This repository contains the simulation and control design for an AUV using different control strategies across multiple development phases. Each phase builds upon the previous one to improve stability, accuracy, and robustness of the underwater vehicle.

## ✅ Project Phases Overview

### 🔹 Phase 1 – Mathematical Modeling and Linearization
- Developed a mathematical model of the AUV’s depth, pitch, and yaw dynamics.
- Linearized the nonlinear model around an operating point.

### 🔹 Phase 2 – LQR Controller Design
- Designed an LQR controller based on the linearized model.
- Simulated the closed-loop system and evaluated system response.
- 📄 [AUV_Control_Phase2_SMC.pdf](AUV_Control_Phase2_SMC.pdf)

### 🔹 Phase 3 – Sliding Mode Controller (SMC)
- Implemented a Sliding Mode Controller (SMC) on the nonlinear model.
- Demonstrated robust performance in the presence of model uncertainties.
- 📄 [AUV_Control_Phase3_SMC.pdf](AUV_Control_Phase3_SMC.pdf)

### 🔹 Phase 4 – Fuzzy Logic Controller (FLC)
- Designed a Fuzzy Logic Controller for AUV depth control.
- Observed improved settling time and less overshoot.
- 📄 [AUV_Control_Phase4_FLC.pdf](AUV_Control_Phase4_FLC.pdf)

### 🔹 Phase 5 – Adaptive Neuro-Fuzzy Inference System (ANFIS)
- Trained an ANFIS controller using generated simulation data.
- Achieved minimal RMSE and smooth trajectory tracking.
- 📄 [AUV_Control_Phase5_ANFIS.pdf](AUV_Control_Phase5_ANFIS.pdf)

---

## 🛠 Tools & Environment
- MATLAB / Simulink
- Control System Toolbox
- Fuzzy Logic Toolbox
- Optimization Toolbox

---

## ⭐️ If you found this helpful...

Feel free to star ⭐️ the repo, share, or contribute improvements!

## 👤 Author

Safa Bazrafshan  
MSc in Electrical Engineering – Control  

🔗 [LinkedIn](https://www.linkedin.com/in/safa-bazrafshan-04100a29a)  
🔗 [GitHub](https://github.com/safa-bazrafshan)  
🔗 [ORCID](https://orcid.org/0009-0004-4029-9550)

---

## 📝 License

This project is open for academic and educational use. Please credit the author when using or modifying this work.

