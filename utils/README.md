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
