#!/usr/bin/python

# $Id$

tut_seq = [
0x0000, 0x0004, 0x000c, 0x2200, 0x00d0, 0x00e0, 0x1130, 0x0028,
0x113c, 0x2204, 0x0010, 0x0020, 0x0004, 0x0040, 0x2208, 0x0008,
0x00a0, 0x0004, 0x1104, 0x0028, 0x000c, 0x0084, 0x000c, 0x3390,
0x00b0, 0x1100, 0x0028, 0x0064, 0x0070, 0x00d0, 0x0008, 0x3394
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
