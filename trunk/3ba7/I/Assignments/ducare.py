#! /sw/bin/python

#
# $Id$
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
	n = 0;

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
		if i < (len(input) - 1):
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
		# Now to gather the tokens we're going to return
		if n == 0:
			if valid_transitions.has_key(check):
				if valid_transitions[check] == "ACCEPT":
					output.append(input[i]);
					n = 0;  # Clear n
				elif valid_transitions[check] == nextcheck:
					n += 1;
			#else: # Error checking
				#sys.stderr.write("Error at symbol", input[a]);
		elif n > 0:
			if valid_transitions.has_key(check):
				if valid_transitions[check] == "ACCEPT":
					output.append(input[(i - n):i]);
					n = 0;  # Clear n
				elif valid_transitions[check] == nextcheck:
					n += 1;
			#else: # Error checking
				#sys.stderr.write("Error at symbol", input[a]);
	return output;					
				

# Main function

if '__main__' == __name__:
	import re, sys
	# Setup command line parameters
	from optparse import OptionParser
	parser = OptionParser();
	parser.add_option("-i", "--input", dest="inputfile", 
							help="Read input from FILE", metavar="FILE");
	parser.add_option("-e", "--inline", dest="cmdinput", 
							help="Read input from command line paramater", metavar="STRING");
	(options, args) = parser.parse_args();
	# Read the input File
	inputfile = open(options.inputfile, 'r');
	inputfile = inputfile.read();
	tokens = LexicalAnalyser(inputfile);
	for c in range(len(tokens)):
		if tokens[c] == "\n":
			print "\n";
		else:
			print tokens[c];
