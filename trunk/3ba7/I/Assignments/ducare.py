#! /sw/bin/python

#
# $Id: ducare.py 494 2005-01-22 23:18:02Z conall $
#

#
# Variables
#


#
# Functions
#

def LexicalAnalyser(input):

	# A function for lexical analysis using a FSM
	
	valid_transitions = {
	'CHAR'   		:	'ACCEPT',
	'DIGIT'  		:	'ACCEPT', 
	'DIV'    		:	'ACCEPT',
	'MOD'    		:	'ACCEPT',
	'WRITE'  		:	'ACCEPT',
	'END'    		:	'ACCEPT',
	':'        		:	'=',
	'='        		:	'ACCEPT',
	','        		:	'ACCEPT',
	'+'        		:	'ACCEPT',
	'-'        		:	'ACCEPT',
	'*'        		:	'ACCEPT',
	'|'        		:	'ACCEPT',
	'('        		:	'ACCEPT',
	'('        		:	'ACCEPT',
	')'        		:	'ACCEPT',
	'WHITESPACE' 	:	'ACCEPT',
	'ENDMARKER'		:	'ACCEPT',
	};

	output = [];
	mem = [];
	
	# Decide what lexical token every character from input is
	for i in range(len(input)):
		if re.match(r"[A-Za-z]", input[i]):
			check = 'CHAR';
		elif re.match(r"\d", input[i]):
			check = 'DIGIT';
		elif re.match(r"\s", input[i]):
			check = 'WHITESPACE';
		elif (input[i] == '\004'):
			check = 'ENDMARKER';
		else:
			check = input[i];
		if i < (len(input) - 2):
			# i + 1
			if re.match(r"[A-Za-z]", input[i + 1]):
				nextcheck = 'CHAR';
			elif re.match(r"\d", input[i + 1]):
				nextcheck = 'DIGIT';
			elif re.match(r"\s", input[i + 1]):
				nextcheck = 'WHITESPACE';
			elif (input[i + 1] == '\004'):
				nextcheck = 'ENDMARKER';
			else:
				nextcheck = input[i + 1];
#		print input[i], ':', check, nextcheck;
		# Now to gather the tokens we're going to return
		if len(mem) == 0:
			if valid_transitions.has_key(check):
				# Check for a valid sequence of input or consecutive elements of the same type
				if (valid_transitions[check] == nextcheck) or (check == nextcheck):
					mem.append(input[i]); # save for later
				elif valid_transitions[check] == "ACCEPT":
					output.append(input[i]); # queue for output
					mem = []; # Clear mem
			#else: # Error checking
			#	sys.stderr.write("Error at symbol ".join(input[i]));
		elif len(mem) > 0:
			if valid_transitions.has_key(check):
				# Check for a valid sequence of input or consecutive elements of the same type
				if (valid_transitions[check] == nextcheck) or (check == nextcheck):
					mem.append(input[i]); # save for later
				elif valid_transitions[check] == "ACCEPT":
					mem.append(input[i]); # add to the end of mem for completeness
					output.append("".join(mem)); # return mem as a string
					mem = [];  # Clear mem
			#else: # Error checking
			#	sys.stderr.write("Error at symbol ".join(input[i]));
	return output;					
				

# Main function

if '__main__' == __name__:
	import re, sys
	# Setup command line parameters
	from optparse import OptionParser
	parser = OptionParser(usage="%prog [-f | --file] | [-i | --input] | --version", version="%prog $LastChangedRevision$");
	parser.add_option("-f", "--file", dest="inputfile", help="Read input from FILE", metavar="FILE");
	parser.add_option("-i", "--input", dest="cmdinput", help="Read input from STRING", metavar="STRING");
	(options, args) = parser.parse_args();
	# Complain if no arguements are given
	if options.cmdinput == None and options.inputfile == None:
	        parser.error("incorrect number of arguments");
	# Complain if more than 1 input arguement is given
	elif options.cmdinput != None and options.inputfile != None:
	        parser.error("Please specify a file or string, not both.");
	elif options.inputfile != None:
		# Otherwise, read the input file...
		inputfile = open(options.inputfile, 'r');
		input = inputfile.read();
	elif options.cmdinput:
		# ...or read a string from command line.
		input = options.cmdinput;
	 # Now, let's get to work...
	tokens = LexicalAnalyser(input); # Analyse input
	# Let's give verbobe debugging info...
	for c in range(len(tokens)):
		if tokens[c] == "\n":
			print "\n";
		else:
			print tokens[c];
