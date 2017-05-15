# SegyMAT
Download latest release from [http://segymat.sourceforge.net/]

Documentation is available at [https://www.gitbook.com/book/cultpenguin/segymat/details]

# Release History

## SegyMAT 1.5

SegyMAT version 1.5 is now available, promising much faster reading of parts of large segy files.
Posted by Thomas Mejer Hansen 2015-07-01 
Labels: 1.5

## Version 1.4
Version 1.4 is just release. It is mostly a bugfix release.

Revision since last release:

ReadSegy.m :
Corrected SH.time to reflect proper traveltime
Disabled Waitbar
ReadSegyHeader.m :
Fixed 'SkipData' conflict with Robust Control Toolbox
wiggle.m :
Allowed specification of line color,
allow overlaying wiggle plots
allow NaN value in 'VA' style plotting
ReadSu :
Fixed typo in line 221
MergeSegy.m :
New file-->Merge several Segy Files into one... read more
Posted by Thomas Mejer Hansen 2011-04-07 

## SegyMAT v1.11 Faster reading
Kristian Stormark enhanced GetSegyTraceHeader such that it needs fewer disc operations, resulting in major speed improvements when reading large SGY files
Posted by Thomas Mejer Hansen 2008-08-21 
SegyMAT : Fixed serious bug in ReadSu

A bug in ReadSu (version 1.05) that caused all traces to have a fixed trace length of 5011 has bee fixed.
Posted by Thomas Mejer Hansen 2005-10-03 

## SegyPY
SegyPY (A python port of SegyMAT) has been in CVS for some time and is useable for reading SEGY files rev0 and rev1. There is a slight problem reading IBM floats (the seismic data gets 'shifted') but this should soon be fixed. Check it out and get back with bug reports.
Posted by Thomas Mejer Hansen 2005-06-03 

## Version 1.0

Finally version 1.0 of SegyMAT has been released. A few bugfixes with respect to Matlab 7.0 have been fixed, and some minor updates.
Posted by Thomas Mejer Hansen 2004-11-15 
Function SkipData is now in context&quot; bug fixes

Windows users have reported the error message "Function SkipData is now in context". I have been unable to reproduce this error on Win98 and WinXP, but have changed the code so this should no longer be a problem... -> install version 0.91
Posted by Thomas Mejer Hansen 2004-02-19 
Version 0.45 - Speed !

A few bugs has been fixed, and the speed of writing SEGY files has significantly improved.
Posted by Thomas Mejer Hansen 2003-09-29 
Version 0.40

A new version is ready for download .It is mainly a bug release of version 0.39 released two days ago.
Also it includes some enhancement in stability.
Posted by Thomas Mejer Hansen 2003-01-22 
Version 0.39

A new version of SegyMAY has been uploaded.
Fast version of ReadSu and ReadSegy, that speeds up reading ahile not reading header values.
Initial EBCDIC support
Function to read only the Segy binary header
Option to read Little/Big endian formatted files.
Posted by Thomas Mejer Hansen 2003-01-20 
Mailing List

Please join the mailing list if you want to participate in the debate about the use and development of SegyMAT
Posted by Thomas Mejer Hansen 2002-09-09 
Version 0.38 - Please upgrade

Everybody should upgrade to this release.
A huge number of updates makes to code much more robust for different SEG-Y implementaions.



A few header values were missing in previous released, which has been fixed now.
Posted by Thomas Mejer Hansen 2002-09-06 
Verson 0.35

Version 0.35 was released June 17, 2002

It is mainly a test release until 0.4 will be stable.
There has so many enhancements that I think a release now will be worthwile.

Mahor new stuff :

    Reading and writing of IBM Floating point format
    Thanks to (C) Brian Farrelly,
    Brian.Farrelly@nho.hydro.com, Norsk Hydro Research Centre
    Reading and writing of SU (Seismic Unix files)
    GUI Is enhanced
    Lots of options to ReadSu and ReadSegy

Posted by Thomas Mejer Hansen 2002-06-17 
Version 0.3

Version 0.3 is out.
Main new feature is ability to read in parts of a dataset. Combine any of :
Read every i'th trace
Read range og trace header value (5700<cdp<5800)
* Read time slice (2<t<12)
Posted by Thomas Mejer Hansen 2002-05-03 
Version 0.2

Version 0.2 is available for download.
A GUI SegyReader is just starting to take form, and some smaller changes to the SegyReader.
Posted by Thomas Mejer Hansen 2002-04-03  
