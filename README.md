# 🛠️ AUV Control Project – Six Phases of Advanced Controller Design

This repository contains the simulation and implementation of advanced control strategies for an Autonomous Underwater Vehicle (AUV) in MATLAB/Simulink. The project is divided into six progressive phases, each introducing a new control technique with increasing complexity and robustness.

---

## 📂 Project Structure

Each phase includes:
- MATLAB codes (.m files)
- Simulation results (figures)
- Documentation (PDF report)

---

## 📌 Phase Overview

### ✅ Phase 1: Open-Loop System Analysis
- Description: Simulation of the AUV's nonlinear model without any controller.
- Purpose: To observe the natural dynamics of the system and its instability.
- Output: Uncontrolled depth and pitch responses showing divergence from desired states.

---

### ✅ Phase 2: Sliding Mode Controller (SMC)
- Description: Implementation of a basic SMC to control the AUV's depth.
- Features: Robustness to parameter uncertainties and matched disturbances.
- Output: Smooth convergence of depth to desired value.

---

### ✅ Phase 3: Sliding Mode Controller with Disturbance
- Description: SMC with external disturbance applied to evaluate robustness.
- Output: Despite disturbance, controller successfully tracks desired depth.

---

### ✅ Phase 4: Fuzzy Controller
- Description: Design and simulation of a fuzzy logic–based controller.
- Purpose: Introduce human-like reasoning to handle system nonlinearities.
- Output: Smooth depth tracking with reduced overshoot compared to SMC.

---

### ✅ Phase 5: Adaptive Neuro-Fuzzy Inference System (ANFIS)
- Description: Data-driven controller using ANFIS trained on input-output data.
- Features: Combines neural learning with fuzzy logic for adaptive control.
- Output: High tracking accuracy with very low RMSE during training.

---

### ✅ Phase 6: Model Reference Adaptive Control (MRAC)
- Description: Implementation of MRAC where the AUV follows a reference model.
- Features: Online adaptation of control parameters based on tracking error.
- Output: Adaptive convergence to reference output with damped oscillations.

---

### ✅ Phase 7 - LQR Controller

This phase introduces the use of a Linear Quadratic Regulator (LQR) to control the depth of the AUV based on a linearized system model. The LQR controller minimizes a quadratic cost function to achieve optimal control.

- ✅ Gain matrix K was computed using MATLAB's lqr function.
- ✅ The closed-loop response shows excellent stability and zero steady-state error.
- ✅ The system output follows a flat line at zero, indicating rapid convergence.

📎 PDF Report: AUV_Control_Phase7_LQR.pdf  
🖼️ Simulation Figure: AUV_Phase7_LQR_Response.png

---

## 📘 Documentation

Each phase has its own detailed PDF report:
- Phase 1–7 PDF files are included in this repository.
- Figures and analysis are embedded in the documents.

---

## 💻 Requirements

- MATLAB R2021a or newer
- Fuzzy Logic Toolbox
- Control System Toolbox
- (Optional) Simulink for full visual simulation

---

## 🤝 Contribution

Feel free to fork the project, explore new controllers (e.g., LQR, MPC), or test on 6-DOF AUV models.

---


## 🌊 Dive into AUV control – from basics to intelligence!

## 👤 Author

Safa Bazrafshan  
MSc in Electrical Engineering – Control  

🔗 [LinkedIn](https://www.linkedin.com/in/safa-bazrafshan-04100a29a)  
🔗 [GitHub](https://github.com/safa-bazrafshan)  
🔗 [ORCID](https://orcid.org/0009-0004-4029-9550)

---

## 📝 License

This project is open for academic and educational use. Please credit the author when using or modifying this work.

