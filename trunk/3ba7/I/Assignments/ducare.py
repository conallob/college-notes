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


# Setup command line parameters


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
	'WHITESPACE' 	:	'ACCEPT',	# r"\s"
	'ENDMARKER'		:	'ACCEPT',
	};

	output = [];
	n = 0;

	for a in range(len(input)):
		if re.match(r"[A-Za-z]", input[a]):
			check = 'CHAR';
		elif re.match(r"\d", input[a]):
			check = 'DIGIT';
		elif re.match(r"\s", input[a]):
			check = 'WHITESPACE';
		elif (input[a] == '\004'):
			check = 'ENDMARKER';
		else:
			check = input[a];
		# a + 1
		if re.match(r"[A-Za-z]", input[a + 1]):
			nextcheck = 'CHAR';
		elif re.match(r"\d", input[a + 1]):
			nextcheck = 'DIGIT';
		elif re.match(r"\s", input[a + 1]):
			nextcheck = 'WHITESPACE';
		elif (input[a + 1] == '\004'):
			nextcheck = 'ENDMARKER';
		else:
			nextcheck = input[a + 1];
		#
		if valid_transitions.has_key(check):
			if valid_transitions[check] == "ACCEPT":
				output.append(input(a));
			#elif valid_transitions[check] == nextcheck:
			#	n = 1;
	return output;					
				

# Main function

if '__main__' == __name__:
	import re
	from optparse import OptionParser
	parser = OptionParser();
	parser.add_option("-i", "--input", dest="inputfile", 
							help="Read input from FILE", metavar="FILE");
	(options, args) = parser.parse_args();
	inputfile = open(options.inputfile, 'r');
	inputfile = inputfile.read();
	LexicalAnalyser(inputfile);
