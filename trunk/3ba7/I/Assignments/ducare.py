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
	
#	alphabet = (r'[A-Z][a-z]', r'[0-9]', 'DIV', 'MOD', 'WRITE', 'END', ':', '=', 
#					 ',', '+', '-', '*', '|', '(', ')', r'(\(n|r|t)| )', '\004');

	valid_transitions = [
	('CHAR',  'CHAR'),	# r"([A-Z]|[a-z])"
	('CHAR',  'ACCEPT'),
	('DIGIT', 'DIGIT'),  # r"\d"
	('DIGIT', 'ACCEPT'), 
	('DIV',   'ACCEPT'),
	('MOD',   'ACCEPT'),
	('WRITE', 'ACCEPT'),
	('END',   'ACCEPT'),
	(':',     '='),
	('=',     'ACCEPT'),
	(',',     'ACCEPT'),
	('+',     'ACCEPT'),
	('-',     'ACCEPT'),
	('*',     'ACCEPT'),
	('|',     'ACCEPT'),
	('(',     'ACCEPT'),
	('(',     'ACCEPT'),
	(')',     'ACCEPT'),
	('WHITESPACE', 'ACCEPT'), # r"\s"
	('ENDMARKER',  'ACCEPT'),
	];

	output = [];

	for a in range(len(input)):
		for b in range(len(valid_transitions)):
			if valid_transitions[b][0] = "CHAR":
				if re.match(r"([A-Z]|[a-z])", input[a]:
					output.append(input[a]); # Single char check only...
			if valid_transitions[b][0] = "DIGIT":
				if re.match(r"\d", input[a]:
					output.append(input[a]); # Single digit check only...
			if valid_transitions[b][0] = "WHITESPACE":	
				if re.match(r"\s", input[a]:
			if valid_transitions[b][0] = "ENDMARKER":
				if input[a] == '\004':
				# ACCEPT
			elif input[a] == 
					
				

# Main function

if '__main__' == __name__:
	from optparse import OptionParser
	parser = OptionParser();
	parser.add_option("-i", "--input", dest="inputfile", 
							help="Read input from FILE", metavar="FILE");
	(options, args) = parser.parse_args();
	inputfile = open(options.inputfile, 'r');
	inputfile = inputfile.read();
	lexicalanalyser();
