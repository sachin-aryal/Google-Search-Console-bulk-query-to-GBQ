#!/usr/bin/env bash
# remove previous cronjob
if [ $# -eq 0 ]
then
    echo "Please enter the run_big_query.sh path."
    exit 1
else
    path=${1}
fi
crontab -l | grep -v 'run_big_query.sh'  | crontab -
#write out current crontab
crontab -l > run_big_query
#echo new cron into cron file
echo '00 00 * * * sh '${path} 'from-cron' >> run_big_query
#install new cron file
crontab run_big_query
rm run_big_query
echo "Cronjob installed successfully."