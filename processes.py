import os
import psutil 
import csv


csvfile = 'processes.csv'

# Open a CSV file for writing
with open('processes.csv', 'w', newline='') as file:
    # Define our column headers
    fieldnames = ['PID', 'Name', 'ExecutablePath', 'CPUUsage', 'MemUsage']
    
    # Set up CSV writer and write the header row
    writer = csv.DictWriter(file, fieldnames=fieldnames)
    writer.writeheader()
    
    # Loop through running processes
    for proc in psutil.process_iter(['pid', 'name', 'exe', 'cpu_percent', 'memory_percent']):
        try:
            # Write process details to the CSV file
            writer.writerow({
                'PID': proc.info['pid'],
                'Name': proc.info['name'],
                'ExecutablePath': proc.info['exe'],
                'CPUUsage': proc.info['cpu_percent'],
                'MemUsage': proc.info['memory_percent']
            })
            print("Procceses Listed!")        
        except:
             (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess)
          # Handle exceptions which might occur if a process ends or we do not have access
        pass
