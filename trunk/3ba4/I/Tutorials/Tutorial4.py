#!/usr/bin/python

# $Id$

import math;

# The Tutorial memory address values.

tut_seq = [
0x0000, 0x0004, 0x000c, 0x2200, 0x00d0, 0x00e0, 0x1130, 0x0028,
0x113c, 0x2204, 0x0010, 0x0020, 0x0004, 0x0040, 0x2208, 0x0008,
0x00a0, 0x0004, 0x1104, 0x0028, 0x000c, 0x0084, 0x000c, 0x3390,
0x00b0, 0x1100, 0x0028, 0x0064, 0x0070, 0x00d0, 0x0008, 0x3394
];

# L, K, N values.
# Currently hard coded, I'll take user input later...

L = 16; # length in bits
K = 8;  # 
N = 1;  # 

# Cache tags and data

cache_tags = [];

# Initialise cache_tags to all -1s...

for a in range(N):
	cache_tags.append(-1);
	cache_tags[a] = [];
	for b in range(K):
		cache_tags[a].append(-1);
		b = b + 1;
	a = a + 1;

# A simple wrapper function to return an integer from math.log(x, 2)

def ilog(x):
	return int(math.log(x, 2));

hits, misses = 0, 0;

for i in range(len(tut_seq)):
	current = int(tut_seq[i]); # Select the current memory address
	# Generate line, set and tag info from current
	line = (current & ilog(L));
	set = ((current >> ilog(L)) & ilog(K)) - 1;
	tag = (current >> ilog((K+L)));
	# Now, let's see if we have a relavent cache for current's tag...
	n = set; # skip straight to the appropriate set
	if set <= N:
		for k in range(K):
			if cache_tags[n][k] == -1:
				# Tag not found, we've got a Miss... :(
				print "[31mMiss[m";
				cache_tags[n][k] = tag;
				print "(",n, k,")", tag, "- Ammended";
				misses = misses + 1;
			if cache_tags[n][k] != tag:
				# Tag not found, we've got a Miss... :(
				print "[31mMiss[m -", "(",n, k,")", cache_tags[n][k], "- Popped";
				cache_tags[n].pop(0);
				print "(",n, k,")", tag, "- Pushed";
				cache_tags[n].append(tag);
				misses = misses + 1;
			elif cache_tags[n][k] == tag:
				# Tag found. Woohoo, a Hit!!
				print "[32mHit[m  -", "(",n, k,")", cache_tags[n][k];
				hits = hits + 1;
			k = k + 1;
		else:
			pass;	# out of bounds exception
	i = i + 1;
print "Hits:", hits, "Misses:", misses;
