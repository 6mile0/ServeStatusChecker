# Server Status Checker
This program checks to see if it can communicate with the server, and if not, it assumes that the power is off and sends out a WoL Magic packet.

## How to use
### 1. Clone the repository
```
git clone
```

### 2. Installations  
First, you need to edit the checker.sh file to include your target machine's IP address, MAC address, Discord Webhook URL, and logFile.
```bash
$ vim checker.sh

# Edit the following lines
targetIPAddr=<YOUR_TARGET_MACHINE_IPAddr>
targetMACAddr=<YOUR_TARGET_MACHINE_MACAddr>
discordWebhookURL="<YOUR_DISCORD_WEBHOOK_URL>"
logFile="/root/<LOG_FILE_NAME>.log"
```

Then, you need to make the file executable.

```bash
$ chmod +x checker.sh
```

After that, you can Test the script by running it.
```bash
$ ./checker.sh
```

### 3. Set up a cron job
You can set up a cron job to run the script every 5 minutes.  
```bash
$ crontab -e
```

Add the following line to the file.
```bash
*/5 * * * * /path/to/checker.sh
* * * * * rm /path/to/<LOG_FILE_NAME>.log
```
