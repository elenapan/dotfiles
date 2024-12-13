#!/usr/bin/env python3
import json, os, subprocess
from datetime import datetime, timedelta, date

def get_month_calendar(year, month):
    # Determine the first day of the month
    first_day = datetime(year, month, 1)

    # Find the starting point (Monday of the week containing the first day)
    start_date = first_day - timedelta(days=first_day.weekday())

    # Determine the last day of the month
    next_month = first_day + timedelta(days=32)
    last_day = datetime(next_month.year, next_month.month, 1) - timedelta(days=1)

    calendar = []
    current_date = start_date
    today = date.today().strftime('%Y-%m-%d')

    other_month = True
    while current_date <= last_day:
        week = []
        for _ in range(7):
            value = current_date.strftime('%d'),
            if value[0] == "01":
                other_month = not other_month
            week.append({
                "value": value[0],
                "today": True if today == current_date.strftime('%Y-%m-%d') else False,
                "other_month": other_month,
            })
            current_date += timedelta(days=1)
        calendar.append(week)

    return calendar


year = subprocess.run(["eww", "get", "calendar-selected-year"],
                      stdout=subprocess.PIPE, text=True).stdout.strip()
month = subprocess.run(["eww", "get", "calendar-selected-month"],
                       stdout=subprocess.PIPE, text=True).stdout.strip()

today_obj = date.today()
# Empty year means it the vars are currently unset (right after reload), so we
# get the actual month and year first
if year == '':
    year = today_obj.strftime('%Y')
    month = today_obj.strftime('%m')

selected_month_obj = datetime.strptime(month, "%m")
os.system(f"eww update calendar-selected-year={year} calendar-selected-month={month} calendar-selected-month-pretty=\"{selected_month_obj.strftime("%b")}\"")

calendar = get_month_calendar(int(year), int(month))
# Get JSON format of calendar and escape double quotes
os.system("eww update calendar-json=\"%s\"" % (json.dumps(calendar).replace('"', '\\"')))
