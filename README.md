@"
#  Health Check Script (PowerShell)

## Overview
This **PowerShell Health Check Script** helps monitor key system metrics such as CPU load, memory usage, uptime, and disk space.  
It saves the data to a log file called `healthlog.txt` every time you run it.

---

##  Features
-  System Date & Time  
-  Uptime  
-  CPU & Memory Usage  
-  Disk Usage  
-  Top 5 Memory-Consuming Processes  
-  Service Status (e.g., SSH, nginx)  
-  Logs all details to `healthlog.txt` with timestamps  

---
PROJECT STRUCTURE

📦 healthcheck-project
 ┣ 📜 healthcheck.ps1        
 ┣ 📜 healthlog.txt             
 ┣ 📘 README.md                
                   


 How to Run

1 **Open PowerShell (as Administrator)**  
2 Allow script execution:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


💬 Author
👤 Developed by: M SAIDEEP
Instructor: FAVOUR LAWRENCE
📅 Year: 2025
🌐 GitHub: https://github.com/MALGIREDDY/HEALTH-CHECK
