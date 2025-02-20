# Backup script to Run NIVLM every night

Run this is a command windows to create a new task in the task scheduler

```sh
schtasks /create /tn "NI VLM Backup" /tr "c:\backup\Backup-NiVLM.cmd" /sc daily /st 23:00 /ru "Username" 
```

In this command:

- /create specifies that you want to create a new scheduled task.
- /tn "NI VLM Backup" specifies the name of the task.
- /tr "c:\backup\Backup-NiVLM.cmd" specifies the path to the batch file you want to run.
- /sc daily specifies that the task should run daily.
- /st 23:00 specifies the start time for the task (in 24-hour format).
- /ru "Username" specifies the user account under which the task should run.
- /rp "Password" specifies the password for the user account.

>If you prefer not to include the password in the command for security reasons, you can omit the /rp parameter. The system will then prompt you to enter the password when you create the task.





