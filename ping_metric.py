import re
import sqlite3

conn = sqlite3.connect('ping_result.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Ping')

cur.execute('CREATE TABLE Ping (place TEXT, min REAL, avg REAL, max REAL, mdev REAL, result REAL)')

fname = input("Enter file name: ")
if len(fname) < 1: fname = "vultr_ping.txt"

try:
	fh = open(fname)
except:
	print("No such file: ", fname)
	quit()

ping_values = dict()
ping_index = ["Tokyo","Singapore","Amsterdam","Paris","Frankfurt","London","New York","Chicago","Dallas","Atlanta","Los Angeles","Miami","Seattle","Silicon Valley","Sydney"]
count = 0

skip = input("Enter the place no result:")
if skip is True:
	skip = int(skip)

for line in fh:
	line = line.strip()
	if re.match("10 packets",line):
		loss = re.findall("([0-9]+)% packet loss",line)
		loss = (100-int(loss[0]))/100
	if re.match("rtt",line):
		stuff = re.findall("([0-9]+.[0-9]+)",line)
		place = ping_index[count]
		if len(stuff) < 1: continue
		elif count == skip:
			print("Skip ",ping_index[count])
			cur.execute('''INSERT OR IGNORE INTO Ping (place,min,avg,max,mdev,result)
				VALUES ( ?, 9999, 9999, 9999, 9999, 9999)''', (place,))
			count = count + 1
		print("Scraping ",ping_index[count])
		stuff = [float(value) for value in stuff]
		stuff.append((stuff[1]+stuff[3])/loss)
		min_num = stuff[0]
		avg_num = stuff[1]
		max_num = stuff[2]
		mdev_num = stuff[3]
		result = stuff[4]
		cur.execute('''INSERT OR IGNORE INTO Ping (place,min,avg,max,mdev,result)
			VALUES ( ?, ?, ?, ?, ?, ?)''', (place, min_num, avg_num, max_num, mdev_num, result))
		ping_values[ping_index[count]] = stuff
		count = count + 1

		conn.commit()

# print(ping_values)
sqlstr = 'SELECT place, result FROM Ping ORDER BY result LIMIT 5'

for row in cur.execute(sqlstr):
    print(str(row[0]), row[1])

cur.close()



	
