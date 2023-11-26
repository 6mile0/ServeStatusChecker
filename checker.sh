#!/bin/ash

targetIPAddr=<YOUR_TARGET_MACHINE_IPAddr>
targetMACAddr=<YOUR_TARGET_MACHINE_MACAddr>
discordWebhookURL="<YOUR_DISCORD_WEBHOOK_URL>"
logFile="/root/<LOG_FILE_NAME>.log"

result=$(ping -c 2 $targetIPAddr | grep "received" | awk '{print $4}')

echo $(date) >> $logFile
if [ $result -eq 0 ]; then
    echo "Host is down" >> $logFile    
    wakeResult=$(etherwake $targetMACAddr)
    echo $wakeResult >> $logFile
    curl -H "Content-Type: application/json" -X POST -d '{"username": "お前の家の鯖", "content": "落ちてたから起こしたぞ"}' $discordWebhookURL
else
    echo "Host is up" >> $logFile
fi
echo "---------------------" >> $logFile
