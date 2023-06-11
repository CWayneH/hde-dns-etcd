## Workflow
### This contains all steps for HDE demo.
- run netman.bat to activate network interface
`netman.bat add "乙太網路" 192.168.0`
- open 17 distributed host for services and 1 collector host.
`openode.bat {working directory} dsys_lab 192.168.0 " 30001`
- run client request simulator w/ powershel script.
`powershell.exe -f '.\client request.ps1'`
- while collecting enough data, call collector seize interface; then mechanism will write a .csv file in server-end.
`http://192.168.0.170:8443/seize`
- we use R script for data analysis, that processing hosts data to output priority IP address.
`Rscript "data process.R" hosts_data.csv hostmap.csv outcome.csv`
- after all, we push outcome in .py code regularly.
`python push_data.py`
