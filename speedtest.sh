#!/bin/bash

# กำหนด header สำหรับไฟล์ CSV
echo "Server ID,Server Name,Location,Country,Latency,Download,Upload" > speedtest_X.csv

# ใช้คำสั่ง speedtest-cli เพื่อค้นหา Server และทดสอบความเร็ว
speedtest-cli --list | while read line; do
    # แยกเอา Server ID ออกมา
    server_id=$(echo $line | awk '{print $1}')
    
    # ตรวจสอบว่า server_id เป็นตัวเลขหรือไม่
    if [[ $server_id =~ ^[0-9]+$ ]]; then
        # ทดสอบความเร็วและบันทึกผลลงในไฟล์ CSV
        speedtest-cli --server $server_id --csv >> speedtest_7.csv
    fi
done
