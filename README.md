# System Monitoring and Alerting Script

A Linux shell script for monitoring important system resources such as disk usage, memory usage, and CPU-consuming processes.

This project was created as part of a DevOps Linux and Shell Scripting assignment.

---

## Project Objective

The objective of this project is to create a simple Linux-based system monitoring script that can:

- Monitor disk usage
- Alert when disk usage exceeds a defined threshold
- Monitor memory usage
- Alert when memory usage exceeds a defined threshold
- Display the top CPU-consuming processes
- Provide clear and readable monitoring output

---

## Technologies Used

- Linux
- Bash Shell Scripting
- Git
- GitHub
- df
- free
- ps
- awk
- head

---

## Project Structure

```text
system-monitoring-script/
│
├── system_monitor.sh
└── README.md
Monitoring Thresholds

The script uses the following thresholds:

Resource	Threshold
Disk Usage	80%
Memory Usage	80%

These values are defined at the beginning of the script:

DISK_THRESHOLD=80
MEMORY_THRESHOLD=80

The thresholds can be changed according to system requirements.

Features
1. Disk Monitoring

The script checks disk usage of system filesystems.

If disk usage reaches or exceeds 80%, the script displays a warning:

WARNING: Disk usage is above 80%!

Otherwise:

Status: OK
2. Memory Monitoring

The script calculates the percentage of used memory.

If memory usage reaches or exceeds 80%, it displays a warning.

Example:

Memory Usage: 85%
WARNING: Memory usage is above 80%!

If memory usage is below the threshold:

Memory Usage: 41%
Status: OK
3. Top CPU-Consuming Processes

The script displays the processes currently consuming the most CPU resources.

Example:

--- TOP CPU-CONSUMING PROCESSES ---
    PID COMMAND         %CPU %MEM
   1409 mysqld           1.3 15.2
   2049 mysqld           1.2 11.2
   2016 containerd-shim  1.2  0.3
Requirements

The script requires a Linux system with Bash installed.

The following standard Linux commands are used:

df
free
ps
awk
head

No additional software installation is required.

How to Run
Step 1: Clone the repository
git clone git@github.com:khanfaizan1515/system-monitoring-script.git
Step 2: Enter the project directory
cd system-monitoring-script
Step 3: Give execute permission
chmod +x system_monitor.sh
Step 4: Run the script
./system_monitor.sh

Alternatively:

bash system_monitor.sh
Syntax Check

Before running the script, Bash syntax can be checked using:

bash -n system_monitor.sh

If no output is displayed, the script has no syntax errors.

Sample Output
==================================================
       SYSTEM MONITORING AND ALERTING SYSTEM
==================================================
Hostname : ubuntu
Date     : Wed Sep 30 08:54:15 PM UTC 2026
==================================================

--- DISK USAGE ---
Filesystem: /dev/sda2
Mount Point: /
Usage: 94%
WARNING: Disk usage is above 80%!

Filesystem: /dev/sda1
Mount Point: /boot/efi
Usage: 1%
Status: OK

--- MEMORY USAGE ---
Total Memory: 3461088 KB
Used Memory: 1441300 KB
Memory Usage: 41%
Status: OK

--- TOP CPU-CONSUMING PROCESSES ---
    PID COMMAND         %CPU %MEM
   1409 mysqld           1.3 15.2
   2049 mysqld           1.2 11.2
   2016 containerd-shim  1.2  0.3

==================================================
Monitoring completed.
==================================================
Git Workflow

The project uses Git for version control.

Meaningful commits were created during development:

Add basic disk monitoring script
Add memory usage monitoring
Add CPU process monitoring
Add project documentation

This allows the development history and changes to be tracked.

Future Improvements

The script can be extended with additional DevOps features such as:

Log alerts to a file
Email notifications
Monitoring running services
Monitoring network usage
Monitoring CPU utilization
Running automatically using cron
Sending alerts to monitoring systems
Author

Faizan

DevOps / Cloud Learner
