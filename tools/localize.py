import toml
import sys
import re

infilename = sys.argv[1]
tomlfilename = sys.argv[2]

strings = {}

with open(tomlfilename, "r") as tomlfile:
	strings = toml.decoder.load(tomlfile)

def repfunc(r):
	global strings
	return strings.get(r.group(1), "??")

with open(infilename, "r") as infile:
	line = infile.readline()
	while line:
		print(
			re.sub(r"<!--:(\d+)-->", repfunc, line), end=""
		)
		line = infile.readline()
