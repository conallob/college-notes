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
	
	alphabet = ('[A-Z][a-z]', '[0-9]', 'DIV', 'MOD', 'WRITE', 'END', ':', '=', 
					',', '+', '-', '*', '|', '(', ')', '(\(n|r|t)| )', '\004');

	valid_transitions = [
	(0, alphabet[1],   1),
	(1, alphabet[1],   1),
	(0, alphabet[2],   2),
	(1, alphabet[2],   1),
	(0, alphabet[3],   3),
	(0, alphabet[4],   4),
	(0, alphabet[5],   5),
	(0, alphabet[6],   6),
	(0, alphabet[7],   7),
	(0, alphabet[8],   8),
	(2, alphabet[8],   4),
	(0, alphabet[9],   9),
	(0, alphabet[10], 10),
	(0, alphabet[11], 11),
	(0, alphabet[12], 12),
	(0, alphabet[13], 13),
	(0, alphabet[14], 14),
	(0, alphabet[15], 15),
	(0, alphabet[16], 16),
	(0, alphabet[17], 17)
	];


	def gamma(x, y):
		return ;


	for a in range(len(input)):
		
	

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
