# SegyMAT
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.2648001.svg)](https://doi.org/10.5281/zenodo.2648001)

Download latest stable release from [https://sourceforge.net/projects/segymat/]

Documentation is available at [https://segymat.readthedocs.io/]

Please cite:

Thomas Mejer Hansen (2019). SegyMAT. Zenodo. http://doi.org/10.5281/zenodo.1305289. 


# Release History

## SegyMAT v1.7 [20-04-2019]
Release on (Zenodo)[https://doi.org/10.5281/zenodo.1305290]

Documentattion on [https://segymat.readthedocs.io/]


## SegyMAT 1.5 [2015-07-01]
SegyMAT version 1.5 is now available, promising much faster reading of parts of large segy files.

## Version 1.4 [2011-04-07]
Revision since last release:

ReadSegy.m:
Corrected SH.time to reflect proper traveltime.
Disabled Waitbar.

ReadSegyHeader.m:
Fixed 'SkipData' conflict with Robust Control Toolbox.

wiggle.m:
Allowed specification of line color.
allow overlaying wiggle plots.
allow NaN value in 'VA' style plotting.

ReadSu.m:
Fixed typo in line 221

MergeSegy.m:
New file-->Merge several Segy Files into one.


## v1.11 Faster reading [2008-08-21]
Kristian Stormark enhanced GetSegyTraceHeader such that it needs fewer disc operations, resulting in major speed improvements when reading large SGY files

SegyMAT : Fixed serious bug in ReadSu

A bug in ReadSu (version 1.05) that caused all traces to have a fixed trace length of 5011 has bee fixed.
Posted by Thomas Mejer Hansen 2005-10-03 

## v1.0 [2004-11-15]
Finally version 1.0 of SegyMAT has been released. A few bugfixes with respect to Matlab 7.0 have been fixed, and some minor updates.
Posted by Thomas Mejer Hansen 

"Function SkipData is now in context" bug fixed

## v0.91 [2004-02-19]
Windows users have reported the error message "Function SkipData is now in context". I have been unable to reproduce this error on Win98 and WinXP, but I  changed the code so this should no longer be a problem... -> install version 0.91
Posted by Thomas Mejer Hansen 

## v 0.45 [2004-11-15]
Speed !

A few bugs has been fixed, and the speed of writing SEGY files has significantly improved.

 

## v 0.40 2003-09-29]
Version 0.40

A new version is ready for download .It is mainly a bug release of version 0.39 released two days ago.
Also it includes some enhancement in stability.
Posted by Thomas Mejer Hansen 2003-01-22 


## v 0.39 [2003-01-20]
Version 0.39

A new version of SegyMAY has been uploaded.
Fast version of ReadSu and ReadSegy, that speeds up reading ahile not reading header values.
Initial EBCDIC support.
Function to read only the Segy binary header.
Option to read Little/Big endian formatted files.

## v 0.38 [2002-09-06]
Everybody should upgrade to this release.
A huge number of updates makes the code much more robust for different SEG-Y implementaions.

A few header values were missing in previous released, which has been fixed now.


## v 0.35 [2002-06-17]
Mainly a test release until 0.4 will be stable.
There has so many enhancements that I think a release now will be worthwile.

Major new stuff :

    Reading and writing of IBM Floating point format
    Thanks to (C) Brian Farrelly,
    Brian.Farrelly@nho.hydro.com, Norsk Hydro Research Centre
    Reading and writing of SU (Seismic Unix files)
    GUI Is enhanced
    Lots of options to ReadSu and ReadSegy

## v 0.3 [2002-05-03]
Main new feature is ability to read in parts of a dataset. Combine any of:

    Read every i'th trace
    Read range og trace header value (5700<cdp<5800)
    Read time slice (2<t<12)


## v 0.2 [2002-04-03]
Version 0.2 is available for download.
A GUI SegyReader is just starting to take form, and some smaller changes to the SegyReader.
