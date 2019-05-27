1. set-cron.sh -> This will set the cron tab to execute the run_big_query.sh every midnight.
2. run_big_query.sh -> This will run ** search_console_query_to_GBQ.py ** file.
    - It checks the output file and check for latest date start_date and end_date.
    - If it did not find date from output.csv file, set today as default.
    - Run search_console_query_to_GBQ.py with start_date and end_date.


