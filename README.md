@"
# 🩺 Health Check Script (PowerShell)

## 📌 Overview
This **Health Check Script** monitors your Windows system’s health and performance.  
It collects essential system data and logs it in a file named **healthlog.txt** for review.

---

## ⚙️ Features
- 🕒 Shows system date and time  
- ⚡ Displays system uptime  
- 🧠 Monitors CPU and memory usage  
- 💾 Displays disk usage  
- 🧩 Lists top 5 memory-consuming processes  
- 🔍 Checks if key services (like SSH or nginx) are running  
- 📝 Logs results to `healthlog.txt` with a timestamp  

---

## 🚀 How to Use

### Step 1: Open PowerShell
Run PowerShell as **Administrator**

### Step 2: Allow script execution
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
