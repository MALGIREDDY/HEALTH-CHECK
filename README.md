@"
# 🩺 Health Check Script (PowerShell)

## 📘 Overview
This **PowerShell Health Check Script** helps monitor key system metrics such as CPU load, memory usage, uptime, and disk space.  
It saves the data to a log file called `healthlog.txt` every time you run it.

---

## ⚙️ Features
- 🕒 System Date & Time  
- ⚡ Uptime  
- 🧠 CPU & Memory Usage  
- 💾 Disk Usage  
- 🔍 Top 5 Memory-Consuming Processes  
- 📝 Service Status (e.g., SSH, nginx)  
- 📄 Logs all details to `healthlog.txt` with timestamps  

---

## 🚀 How to Run

1️⃣ **Open PowerShell (as Administrator)**  
2️⃣ Allow script execution:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
