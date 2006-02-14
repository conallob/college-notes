#!/usr/bin/python

# $Id$

import math;

# The Tutorial memory address values.

tut_seq = [
0x0001, 0x0004, 0x000c, 0x2200, 0x00d0, 0x00e0, 0x1130, 0x0028,
0x113c, 0x2204, 0x0010, 0x0020, 0x0004, 0x0040, 0x2208, 0x0008,
0x00a0, 0x0004, 0x1104, 0x0028, 0x000c, 0x0084, 0x000c, 0x3390,
0x00b0, 0x1100, 0x0028, 0x0064, 0x0070, 0x00d0, 0x0008, 0x3394
];

# L, K, N values.
# Currently hard coded, I'll take user input later...

L = 16; # length in bits
K = 4;  # degree of associativity
N = 2;  # Number of sets

# Cache tags and data

cache_tags = [];

# Initialise cache_tags to all -1s...

for a in range(N):
	cache_tags.append(-1);
	cache_tags[a] = [];
	for b in range(K):
		cache_tags[a].append(-1);

# A simple wrapper function to return an integer from math.log(x, 2)

def ilog(x):
	return int(math.log(x, 2));

hits, misses = 0, 0;
details = [0, 0];

for i in range(len(tut_seq)):
	current = int(tut_seq[i]); # Select the current memory address
	print hex(current);
	# Generate line, set and tag info from current
	line = (current & ilog(L));
	set = ((current >> ilog(L)) & ilog(K));
	tag = (current >> ilog(K+L));
	# Now, let's see if we have a relavent cache for current's tag...
	n = set; # skip straight to the appropriate set
	if ((n >= 0) and (n < N)):	
		for k in range(K):
			luck = 1; # Let's assume we're lucky
			if cache_tags[n][k] == tag:
				# Tag found. Woohoo, a Hit!!
				luck = luck & 1; # Still lucky
				break;
			else:
				# Tag not found, we've got a Miss... :(
				luck = luck & 0; # Not so lucky...
			details[0] = n; # Remember n for a little while...
			details[1] = k; # Remember k for a little while...
	if luck == 1:
		# Tag found. Woohoo, a Hit!!
		print "\033[32mHit\033[m";
		# Remove the hit from it's current position...
		del cache_tags[details[0]][details[1]]; 
		# ... and make it the MRU tag in the cache line
		cache_tags[details[0]].append(tag); 
		hits += 1;
	else:
		# Tag not found, we've got a Miss... :(
		print "\033[31mMiss\033[m";
		# Pop the LRU cache tag out of the cache
		cache_tags[details[0]].pop(0); 
 		# Add the newly cached tag into the cache
		cache_tags[details[0]].append(tag);
		misses += 1;
print "Hits:", hits, "Misses:", misses; # Total stats
