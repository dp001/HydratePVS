Citrix PVS - Speed up applications first execution after server reboot

Based on BIS-F ideas with some code changes
https://github.com/EUCweb/BIS-F

PS script read data from csv configuration file (same directory)
You can specify a single file, including full path
Or
You can specify a folder with a filter such as:
*.exe           all exe files
*.dll           all dll files
Child_*.dll     all Child_<something>.dll

Search is recursive on child folders

Script is intent to be scheduled immediately after server reboot
MCS with RAM cache should benefit too
