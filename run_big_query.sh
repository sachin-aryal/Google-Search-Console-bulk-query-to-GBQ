#!/usr/bin/env bash
CURRENT_DIR=$(dirname "$0")
cd ${CURRENT_DIR}
previous_file_size=-1
previous_date=""
while IFS=, read -r page_count day file_size row_count
do
    if [ ${file_size} -eq 0 ] && [ ${previous_file_size} -ne -1 ] && [ ${previous_file_size} -eq 0 ]
    then
        break
    fi
    previous_file_size=${file_size}
    previous_date=${day}
done < output.csv

if [[ ${previous_date} = *[!\ ]* ]]; then
  DEFAULT_START_DATE=${previous_date}
else
  DEFAULT_START_DATE=`date +%Y-%m-%d`
fi

DEFAULT_END_DATE=`date +%Y-%m-%d`
if [ $# -eq 0 ]
  then
    echo "Enter Start Date: (Default Start Date From Latest Data: ${DEFAULT_START_DATE})"
    read start_date
    echo "Enter End Date: ${DEFAULT_END_DATE}"
    read end_date
fi
if [ -z "$start_date" ]
then
    start_date=${DEFAULT_START_DATE}
fi
if [ -z "$end_date" ]
then
    end_date=${DEFAULT_END_DATE}
fi
echo "python search_console_query_to_GBQ.py https://comparepower.com ${start_date} ${end_date}"
python search_console_query_to_GBQ.py https://comparepower.com ${start_date} ${end_date}