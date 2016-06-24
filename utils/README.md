filetags utils
================================================================================
Simple utility scripts for working with filetags.

Written by Jonas Sjöberg in 2016  
    jomeganas@gmail.com  
    https://github.com/jonasjberg  


`exif2filetag`
--------------
**USAGE:** `exif2filetag /starting/path [MATCH EXIF TAG] [NEW FILETAG]`  

The starting path is searched recursively for images with any EXIF tags.
Images whose EXIF keywords matches `[MATCH EXIF TAG]` is
sent to `filetags`, which adds the tag `[NEW FILETAG]` to the image.

The matching includes partial matches and is not case-sensitive.



`filenametagsearch`
-------------------
**USAGE:** `filenametagsearch /starting/path [FILE TAG]`  

The starting path is searched recursively for files tagged with `[FILE TAG]`.
Matching images can be opened or listed in an arbitrary way.
As of now, matching images are displayed in a montage using `feh`.

The matching includes partial matches and is not case-sensitive.


This script is a somewhat temporary fix to a greater problem, to be solved at a
later time. My aim is a complete "desktop search" solution, possibly based on
`recoll`, but tweaked for the `filetags` workflow.  The `xapian` Python API also
looks interesting.



`list-filetags-in-path`
-----------------------
**USAGE:** `list-filetags-in-path [PATH]`  

Where `PATH` is optional and defaults to `DEFAULT_SEARCH_PATH` as per hardcoded
in the script..


This script duplicates the functionality already provided by `filetags` version
"0.6beta from 2016-01-08" using the option:

```
--ln, --list-tags-by-number
                      list all file-tags sorted by their number of use
```

.. except that this script does recursive searches per default, while
`filetags` works primarily with files, and would seem *(as in "not absolutely
sure about this")* to need modification or an external wrapper script to do the
same thing.
