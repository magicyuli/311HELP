import os
from collections import defaultdict

import sys


def get_fd(val):
    f_name = "data/" + val
    if os.path.isfile(f_name):
        return open(f_name, "a")
    else:
        return open(f_name, "w")

if __name__ == '__main__':
    in_f = open(sys.argv[1])
    file_content_map = defaultdict(str)
    res = ""
    cur_year = ""
    cur_month = ""
    cur_year_f_name = None
    cur_year_f = None
    cur_month_f_name = None
    cur_month_f = None

    for line in in_f:
        created_at = line.strip().split(",")[1]
        if created_at == "Created Date":
            continue
        time = created_at.strip().split(" ", 2)[0].split("/")
        year = time[2]
        month = "%s-%s" % (time[2], time[0])
        if cur_year == "":
            cur_year = year
            cur_month = month
            cur_year_f = get_fd(cur_year)
            cur_month_f = get_fd(cur_month)

        if cur_year != year:
            cur_year = year
            cur_year_f.close()
            cur_year_f = get_fd(cur_year)

        if cur_month != month:
            cur_month = month
            cur_month_f.close()
            cur_month_f = get_fd(cur_month)

        cur_month_f.write(line)
        cur_year_f.write(line)

    in_f.close()
    cur_month_f.close()
    cur_year_f.close()
