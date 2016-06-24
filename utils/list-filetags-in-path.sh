#!/usr/bin/env bash

# list-filetags-in-path             Written by Jonas Sjöberg in 2016
# ~~~~~~~~~~~~~~~~~~~~~             https://github.com/jonasjberg
#
# Simple helper to go along with the "filetags" workflow.
# This script duplicates the functionality already provided by filetags except
# that this script does recursive searches per default, while filetags works
# primarily with files, and would seem to need modification or an external
# wrapper script to do the same thing.
#
# USAGE: list-filetags-in-path [PATH]
#        PATH is optional and defaults to DEFAULT_SEARCH_PATH as per below.


DEFAULT_SEARCH_PATH="$HOME/Dropbox/Archive"
search_path="${1:-$DEFAULT_SEARCH_PATH}"

find "$search_path" -type f -name "* -- *" -printf "%f\n" \
    | grep -Po '.*\ --\ \K(([[:alnum:]]+)\ ?)+'           \
    | while read -a LINE ; do echo "$LINE" ; done         \
    | sort | uniq -c                                      \
    | sort -n

exit $?


# Breakdown of the pipeline:
# [1] find  prints filename with any leading directories removed
# [2] grep  matches [something] -- [tag(s)]
#           The \K operator (variable-length look-behind) causes the preceding
#           pattern to match, but doesn't include the match in the result.
# [3] read  splits multiple words on one line by IFS
#           (default *should* (might) be whitespace)
# [4] uniq  counts occurances and removes duplicate entries
#           (the preceding sort is required by uniq)
# [5] sort  sorts the final list from least to most used

