#!/usr/bin/python

# $Id$

tut_seq = [
0000, 0004, 000c, 2200, 00d0, 00e0, 1130, 0028,
113c, 2204, 0010, 0020, 0004, 0040, 2208, 0008,
00a0, 0004, 1104, 0028, 000c, 0084, 000c, 3390,
00b0, 1100, 0028, 0064, 0070, 00d0, 0008, 3394
];

q = []

i = 0;

print(tut_seq[15]);

for a in range(len(tut_seq)):
	i = i+1;
	if len(q) < 8:
		q.append(hex(tut_seq[a]));
		print "Pushed", hex(tut_seq[a]), "[32mOn[37m the queue";
	else:
		print "Popped", q[0], "[31mOff[37m the queue";
		q.pop();
		q.append(hex(tut_seq[a]));	
		print "Pushed", q[7], "[32mOn[37m the queue";
print(q);
