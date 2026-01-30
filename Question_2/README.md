## Question 2: Log Analyzer 
## Command: nano log_analyzer.sh
## Output: text editor opened
## Explanation: I used this to write the script that parses logs for specific keywords.
## Screenshot: ![Terminal output](q2_output1)

## Command: chmod +x log_analyzer.sh
## Output: No output
## Explanation: I executed this command to grant execution permissions to the script.
## Screenshot: ![Terminal output](q2_output2)

## Command: nano sample.log
## Output: text editor opened
## Explanation: I used this command to create a custom log file containing sample entries for INFO, WARNING and ERROR. I did this to provide the script with a controlled  dataset so i could verify that the parsing logic and counting functions work accurately.
## Screenshot: ![Terminal output](q2_output3)

## Command: ./log_analyzer.sh sample.log
## Output: Total number of log entries: 4
Number of INFO messages: 1
Number of WARNING messages: 1
Number of ERROR messages: 2
Most recent ERROR message: 2025-01-12 10:17:10 ERROR Network timeout
Report generated: logsummary_2026-01-30.txt
## Explanation: I ran the script with a sample log file. I observed that it correctly counted the entries and identified the msot recent error.
## Screenshot: ![Terminal output](q2_output4)

## Command: ls
## Output: analyze.sh  log.txt  log_analyzer.sh  logsummary_2026-01-30.txt  project_documents  sample.log  sample_data.txt  sample_hard.txt  system_report.txt  testfile.txt  user_info.txt
## Explanation: I executed this command to list the files in my current directory after running the script. I observed that a new file named logsummary_2026-01-30.txt was created, confirming that the script's redirection logic for generating automated reports is functioning correctly.
## Screenshot: ![Terminal output](q2_output5)

## Command: cat logsummary_*.txt
## Output: Log Summary Report - Generated on Fri Jan 30 15:06:00 UTC 2026
Total Entries: 4
INFO: 1, WARNING: 1, ERROR: 2
## Explanation: I verified that the script succefully generated an external summary report with the current date in the filename.
## Screenshot: ![Terminal output](q2_output6)

