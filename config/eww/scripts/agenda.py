#!/usr/bin/env python3
import json, re, os, time, textwrap, sys
from datetime import datetime, timedelta, date
from pathlib import Path

org_deadline_warning_days = 14
org_schedule_warning_days = 7

# TODO optimization: use grep/rg to get relevant lines and then just use capture
# groups on these lines
pattern_to_search = r'^(SCHEDULED|DEADLINE):\s*<(\d{4}-\d{2}-\d{2})\s+(\w{3})\s*((\d{2}:\d{2})(?:-(\d{2}:\d{2}))?)?\s*(\.\+)?([\+\d\w]*)'
def search_entries_in_files(file_list):
    results = []
    for file_path in file_list:
        with open(file_path, 'r', encoding='utf-8') as file:
            previous_line = ''
            for line in file:
                line = line.strip()  # Remove leading/trailing whitespace
                if re.search(pattern_to_search, line):
                    title_pattern = r'(\*+)\s+(?:([A-Z]+)\s+)?(.*)'
                    match_title = re.match(title_pattern, previous_line)
                    _, status, title = match_title.groups()

                    match_info = re.match(pattern_to_search, line)
                    event_type, date_str, _, _, time_start, time_end, _, recurrence = match_info.groups()

                    date_obj = datetime.strptime(date_str, "%Y-%m-%d").date()

                    results.append({
                        'file': Path(file_path).stem,
                        'title': title,
                        'status': status,
                        "event_type": event_type,
                        "date_obj": date_obj,
                        "date": date_str,
                        "time_start": time_start,
                        "time_end": time_end,
                        "recurrence": recurrence
                    })
                previous_line = line
    return results

def calculate_recurrence(date, recurrence):
    if not recurrence:
        return None
    match = re.match(r'\+(\d+)([dmy])', recurrence)
    if match:
        amount, unit = match.groups()
        amount = int(amount)
        if unit == 'd':
            return date + timedelta(days=amount)
        elif unit == 'm':
            month = date.month - 1 + amount
            year = date.year + month // 12
            month = month % 12 + 1
            day = min(date.day, [31, 29 if year % 4 == 0 and not year % 100 == 0 or year % 400 == 0 else 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1])
            return date.replace(year=year, month=month, day=day)
        elif unit == 'y':
            return date.replace(year=date.year + amount)
    return None

def pretty_print_date(input_date):
    # Convert the input string to a date object
    today = datetime.today().date()

    # Calculate the difference in days between the input date and today
    delta = (input_date - today).days

    # Determine the human-readable string based on the difference in days
    if delta == 0:
        return "today"
    elif delta == 1:
        return "tomorrow"
    elif delta == -1:
        return "yesterday"
    elif -5 <= delta <= -2:
        return f"{abs(delta)} days ago"
    elif 2 <= delta <= 5:
        return f"in {delta} days"
    else:
        return input_date.strftime("%A %d %B").lower()

def generate_agenda(entries):
    today = datetime.now().date()

    # When to show done/cancelled tasks
    done_time_range_start = today
    done_time_range_end = today # Never
    # done_time_range_end = today + timedelta(days=7)
    # done_time_range_start = today - timedelta(days=today.weekday())
    # done_time_range_end = done_time_range_start + timedelta(days=6)

    agenda = []
    for entry in entries:
        date_obj = entry["date_obj"]
        status = entry["status"]
        event_type = entry["event_type"]
        title = entry["title"]
        while True:
            if not date_obj:
                break

            # Only handle DONE/KILL tasks that are within the time range
            if (status == "DONE" or status == "KILL") and not (done_time_range_start <= date_obj <= done_time_range_end):
                break;

            if (event_type == "DEADLINE"):
                if date_obj > (today + timedelta(days=org_deadline_warning_days)):
                    break;
            else:
                if date_obj > (today + timedelta(days=org_schedule_warning_days)):
                    break;

            agenda.append({
                "file": entry["file"],
                "title": textwrap.shorten(title, width=26, placeholder="..."),
                "type": event_type.lower(),
                "status": status and status.lower(),
                "repeatable": False if entry["recurrence"] == "" else True,
                "overdue": False if date_obj >= today else True,
                "date": datetime.strftime(date_obj, "%Y-%m-%d"),
                "date_pretty": pretty_print_date(date_obj),
                "time_start": entry["time_start"],
                "time_end": entry["time_end"],
            })

            # If the task was DONE/KILL, do not show it again
            if (status == "DONE" or status == "KILL"):
                break

            date_obj = calculate_recurrence(date_obj, entry["recurrence"])

    # Sort results
    def get_datetime(entry):
        date_str = entry['date']
        time_str = entry['time_start'] or "00:00"
        combined_str = f"{date_str} {time_str}"
        return datetime.strptime(combined_str, "%Y-%m-%d %H:%M")

    # Sort entries using the get_datetime function as the key
    sorted_agenda = sorted(agenda, key=get_datetime)

    return sorted_agenda


# Get org files list from arguments
if len(sys.argv) == 0:
    print("No files to parse")
    exit(1)

org_files = sys.argv[1:]

entries = search_entries_in_files(org_files)

agenda = generate_agenda(entries)

# print(json.dumps(agenda, indent=2))
os.system("eww update tasks-json=\"%s\"" % (json.dumps(agenda).replace('"', '\\"')))
