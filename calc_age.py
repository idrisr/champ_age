import matplotlib.pyplot as plt
import csv

csv_reader = csv.reader(open('full_stats.csv'))
l = list()
for row in csv_reader:
    l.append(row)

curr_team = ''
curr_year = ''
l_age = list()
l_mp =list()

def calc_team_age(l_age, l_mp):
    age = 0
    try:
        total_mp = sum(l_mp)
        for i in range(0, len(l_age)):
            age += l_age[i] * l_mp[i] / float( total_mp )
        return age
    except:
        return None
fout = open('output.txt', 'w')

for row in l:
    if row==l[0]:
        headers = row
    else:
        year = row[-1] 
        team = row[-2]
        try:
            age = int( row[2] )
        except:
            age = None
        try:
            mp = int ( row[5] )
        except:
            mp = None 
        team = row[-2]
        year = row[-1]

        if year<>curr_year or team<>curr_team:
            if l_age and l_mp:
                write = "%s,%s,%s\n" % (calc_team_age(l_age, l_mp), curr_team, curr_year)
                fout.write(write)
            curr_team = team
            curr_year = year
            l_age = [age]
            l_mp = [mp] 
        else:
            l_age.append(age) 
            l_mp.append(mp)
