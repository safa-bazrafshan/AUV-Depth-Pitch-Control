# 🚢 AUV Control Project – Depth and Attitude Control with PID, LQR, and SMC

This repository contains a structured simulation study on the control of an Autonomous Underwater Vehicle (AUV) in MATLAB/Simulink, aiming to design and evaluate robust controllers for depth and attitude tracking under various conditions.

---

## 📌 Project Overview

We model and simulate an underwater vehicle (AUV) with the goal of maintaining depth and pitch/yaw angles accurately. Three phases are included, each progressively implementing more advanced control strategies and increasing model complexity.

---

## 📘 Phase 1: Linear Model – PID and LQR Control

In this phase, we developed and tested:
- A PD controller for pitch angle.
- A PID controller for depth control.
- An LQR controller to achieve optimal state-feedback performance.

Simulations were conducted both with and without external disturbances (e.g., water current).

📄 [PDF Report – Phase 1](AUV_Control_Phase1_PID_LQR.pdf)

---

## ⚙️ Phase 2: Sliding Mode Controller (SMC) – Linear Model

Here, we designed an SMC controller for the linearized AUV model, with a focus on robustness and fast convergence.

- The controller shows strong resistance to matched disturbances.
- Depth tracking remains accurate even with dynamic environmental effects.

📄 [PDF Report – Phase 2](AUV_Control_Phase2_SMC.pdf)

---

## 🌊 Phase 3: SMC Controller – Nonlinear Model

In the final phase, we applied Sliding Mode Control to the nonlinear AUV dynamics, providing more realistic system behavior.

- The controller tracks constant and time-varying depth commands under nonlinear dynamics.
- Disturbances are considered in a more realistic framework.

📄 [PDF Report – Phase 3](AUV_Control_Phase3_SMC_Nonlinear.pdf)

---

## 🛠 Tools Used

- MATLAB R2023 or later
- Simulink (optional)
- Control Systems Toolbox

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

