#!/usr/bin/python

# $Id$

# The Tutorial memory address values.

tut_seq = [
0x0000, 0x0004, 0x000c, 0x2200, 0x00d0, 0x00e0, 0x1130, 0x0028,
0x113c, 0x2204, 0x0010, 0x0020, 0x0004, 0x0040, 0x2208, 0x0008,
0x00a0, 0x0004, 0x1104, 0x0028, 0x000c, 0x0084, 0x000c, 0x3390,
0x00b0, 0x1100, 0x0028, 0x0064, 0x0070, 0x00d0, 0x0008, 0x3394
];

# L, K, N values.
# Currently hard coded, I'll take user input later...

L = 16;
K = 1;
N = 8;

# Cache tags and data

cache_tags, cache_data;

for i in range(len(tut_seq)):
	i = i + 1
	current = tut_seq[i]; # Select the current memory address
	# Generate line, set and tag info from current
	line = addr & log(L);
	set = (current >> log(L)) & log(K);
	tag = (current >> log(K+L));
	# Now, let's see if we have a relavent cache for current's tag...
	for n in range(N):
		n = n + 1
		for k in range(K):
			k = k + 1
			if cache_tags[n][k] == tag:
				# Tag found. Woohoo, a Hit!!
			elif cache_tags[n][k] != tag:
				# Tag not found, we've got a Miss... :(
