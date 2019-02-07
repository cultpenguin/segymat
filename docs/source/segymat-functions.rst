M-file Reference
================

CheckSegyTraceHeader {#\_CheckSegyTraceHeader} --------------------

::

      SegyTraceHeader=CheckSegyTraceHeader(SegyTraceHeader);
     
      Checks that all fields of the SegyTraceHeader is set. 
      If not, they are initialized.
     

Contents {#\_Contents} --------

::

      SegyMAT : A toolbox to read, write and manipulating SEG Y formatted files
      Version 1.00
     
      New Features.
        README      
     
      Main
        ReadSegy          - Reads Segy File 
        ReadSegyHeader    - Reads SegyHeader from Segy File 
        ReadSegyFast      - Reads Segy File in fast mode. No header values will be read.
        WriteSegy         - Write Segy formatted data   
        WriteSegyStructure- Write Segy formatted data using SegyMAT data structures
     
        ReadSu            - Reads a SU formatted file. 
        ReadSuFast        - Reads a SU formatted file in fast mode. No header values will be read.
        WriteSu           - Write SU formatted data   
        WriteSuStructure  - Write Su formatted data using SegyMAT data structures
     
      Lower Level IO
        GetSegyHeader          - Reads the segyheader of a SEGY Y formatted file 
        GetSegyHeaderBasics    - Default Segy header settings
     
        GetSegyTrace.m         - Read Segy Trace Header and Data from filehandle
        GetSegyTraceHeader     - Read Segy Trace Header from filehandle
        GetSegyTraceData       - Read Segy Trace Data from filehandle
     
        PutSegyHeader          - Write Segy Header to filehandle
        PutSegyTrace           - Write Segy Trace Header and Data to filehandle
     
        InitSegyTraceHeader    - Initalize all fields in the SegyTraceheader
        CheckSegyTraceHeader.m - Check a SegyTraceHeader for all required fields
     
     
      SU<-> SEG-Y conversion
        Su2Segy - Convert SU formatted files to SEG Y
        Segy2Su - Convert SEG Y formatted files to SU
     
      Plotting
        wiggle  - wiggle/variable area/image plotting of seismic data
     
      Misc
        ibm2num - Convert IBM 32 bit floatto double
        num2ibm - Convert IEEE 754 doubles to IBM 32 bit floating point format
        ebcdic2ascii - convert ebcdic to ascii format
        SegymatVerbose - controls amount of info written to screen
        SegymatVersion - Return the current SegyMAT version
     
     
      Seismic Processing :
        SegyMAT_GAIN : 'agc' and 'power' gain.
     
      (C) 2001-2004 Thomas Mejer Hansen, tmh@gfy.ku.dk/thomas@cultpenguin.com
     

        Overloaded methods:
           serial/Contents
           mmreader/Contents
           VideoReader/Contents
           instrument/Contents
           dioline/Contents
           digitalio/Contents
           daqdevice/Contents
           daqchild/Contents
           aochannel/Contents
           analogoutput/Contents
           analoginput/Contents
           aichannel/Contents
           rsmd/Contents
           resultset/Contents
           drivermanager/Contents
           driver/Contents
           dmd/Contents
           dbtbx/Contents
           database/Contents
           cursor/Contents
           videosource/Contents
           videoinput/Contents
           imaqdevice/Contents
           imaqchild/Contents
           rfmodel.Contents
           rfdata.Contents
           rfckt.Contents
           rfchart.Contents

GetSegyHeader {#\_GetSegyHeader} -------------

::

      GetSegyHeader : Reads the segyheader of a SEGY Y formatted file
     
      Call :
       [SegyHeader]=GetSegyHeader(segyid);
     
       segyid can be a filehandle or a filename
       
     
      (C) 2001-2004 Thomas Mejer Hansen, tmh@gfy.ku.dk/thomas@cultpenguin.com
     
     
         This program is free software; you can redistribute it and/or modify
         it under the terms of the GNU General Public License as published by
         the Free Software Foundation; either version 2 of the License, or
         (at your option) any later version.
     
         This program is distributed in the hope that it will be useful,
         but WITHOUT ANY WARRANTY; without even the implied warranty of
         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
         GNU General Public License for more details.
     
         You should have received a copy of the GNU General Public License
         along with this program; if not, write to the Free Software
         Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
     

GetSegyHeaderBasics {#\_GetSegyHeaderBasics} -------------------

::

      GetSegyHeaderBasics : Default Segy Header Header settings
      
      Call :
      Rev=GetSegyHeaderBasics
     
     

GetSegyTrace {#\_GetSegyTrace} ------------

::

      GetSegyTrace : Reads a seg y trace, data and header
     
      [SegyTraceHeader,SegyData]=GetSegyTrace(segyid,TraceStart,DataFormat,ns);
     

GetSegyTraceData {#\_GetSegyTraceData} ----------------

::

      GetSegyTraceData : Get Segy trace data if filehandle
      
      Call : 
     
        tracedata=GetSegyTraceData(segyid,ns,SegyHeader)
     

GetSegyTraceHeader {#\_GetSegyTraceHeader} ------------------

::

      GetSegyTraceHeader : Reads a seg y trace, data and header
     
      [SegyTraceHeader]=GetSegyTraceHeader(segyid,TraceStart);
     
     
      (C) 2001-2012 Thomas Mejer Hansen, thomas.mejer.hansen@gmail.com
     
      Revisions:
      07/2008 Kristian Stormark (<kristian.stormark@gmail.com>) : Reduce the
              number of disc operations causing a significant speed up
     
      03/2012 Cleaned up after suggestion from Kristian Stormark
     

GetSegyTraceHeaderInfo {#\_GetSegyTraceHeaderInfo}
--------------------------------------------------

::

      GetSegyTraceHeaderInfo : Returns a array of a SEGY Y TraceHeader value
     
      Call :
      [value]=GetSegyHeaderInfo(SegyTraceHeaders,header)
     
      header is a header value like 'cdp','dt','TraceNumber'
     

InitSegyTraceHeader {#\_InitSegyTraceHeader} -------------------

::

      InitSegyTraceHeaders : returns an empty SegyTraceHeader structure
     
      EX:
      SegyTraceHeader=InitSegyTraceHeader(ns,dt);
     

MakeXmlRef {#\_MakeXmlRef} ----------

MergeSegy {#\_MergeSegy} ---------

::

      MergeSegy : Merge multiple SEGY files
     
      Example :
         MergeSegy('*.sgy','merge.sgy')
     
         f{1}='file1.sgy';
         f{2}='file2.sgy';
         f{3}='file3.sgy';
         MergeSegy(f,'merge.sgy')
     
     
      Note: All imput segy files must have the same constant trace length
            The SEGY header of the merged SEGY file will be the SEGY header
            form the first input SEGY file.
     
     

PutSegyHeader {#\_PutSegyHeader} -------------

::

      PutSegyHeader : Writes SEG-Y header to disk.
      PutSegyHeader(segyid,SegyHeader)
     
      (C) 2001-2004, Thomas Mejer Hansen, tmh@gfy.ku.dk/thomas@cultpenguin.com
      
         This program is free software; you can redistribute it and/or modify
         it under the terms of the GNU General Public License as published by
         the Free Software Foundation; either version 2 of the License, or
         (at your option) any later version.
     
         This program is distributed in the hope that it will be useful,
         but WITHOUT ANY WARRANTY; without even the implied warranty of
         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
         GNU General Public License for more details.
     
         You should have received a copy of the GNU General Public License
         along with this program; if not, write to the Free Software
         Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
     

PutSegyTrace {#\_PutSegyTrace} ------------

::

      PutSegyTrace(segyid,tracedata,SegyTraceHeader,SegyHeader)
      Write a SegyTrace to a filehandle 'segyid'
     
      (C) 2001-2004, Thomas Mejer Hansen, tmh@gfy.ku.dk/thomas@cultpenguin.com
      

ReadSegy {#\_ReadSegy} --------

::

      ReadSegy : Reads a SEG Y rev 1 formatted file
     
      Call :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename);
     
      To read time slice 0.5<t<5 :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'trange',.5,3);
      To read time trace number 100,110 and 150 :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'traces',[100 110 150]);
      Skip every 5th trace :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'jump',5);
      Read data in a CDP header range : 5000<cdp<5800 :
      (change cdp to any other valid TraceHeader value)
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'minmax','cdp',5000,5800);
      Read only the header values (Data will return empty)
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'SkipData',1);
     
      SEG-Y format revision number can be '0' (1975) or
      '100' (similar to '1') (2002).
      By default the SEG-Y format revision number is read in the
      binary header, but this can be overruled using :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'revision',0);
     
      Read using a specific Data Sample Format :
      Rev 0, IBM FLOATING POINT
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'revision',0,'dsf',1);
      Rev 1, IEEE FLOATING POINT
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'revision',1,'dsf',5);
     
      A SegyHeader can be forced on the SEG-Y file using :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'SegyHeader',SegyHeader);
      The SegyHeader can be obtain by GetSegyHeader(segyfilename), and
      then edited.
     
      To read using little endian :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'endian','l');
     
      Combine any combination of the above
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'jump',1,'minmax','cdp',5300,5400);
     
     
      Plot the data using e.g.
      imagesc([SegyTraceHeaders.cdp],SegyHeader.time,Data);
      wiggle([SegyTraceHeaders.TraceNumber],SegyHeader.time,Data);
     
      (C) 2003-2012, Thomas Mejer Hansen, thomas.mejer.hansen@gmail.com
     

ReadSegyConstantTraceLength {#\_ReadSegyConstantTraceLength}
------------------------------------------------------------

::

      ReadSegy : Reads a SEG Y rev 1 formatted file, and forces Constant Trcae Length
     
      Call :
      [Data,SegyTraceHeaders,SegyHeader]=ReadSegyConstantTraceLength(filename);
     
      See ReadSegy for optional arguments
     
      See also : ReadSegy
     

ReadSegyFast {#\_ReadSegyFast} ------------

::

      ReadSegyFast : Reads a SEG Y rev 1 formatted file, without header values (faster than ReadSegy)
     
      Call :
      [Data]=ReadSegyFast(filename);
      and equivalent to :
      [Data]=ReadSegy(filename);
      
     
      Read only the data of a SegFile - NOT Their headers.
      Much faster than ReadSegy
     
      'minmax', 'skip'
     

ReadSegyHeader {#\_ReadSegyHeader} --------------

::

      ReadSegyHeader : Reads a SEG Y Binary Header
     
      Call :
      [SegyHeader]=ReadSegyHeader(filename);
     
      To read using little endian :
      [SegyHeader]=ReadSegyHeader(filename,'endian','l');

ReadSegyTrace {#\_ReadSegyTrace} -------------

::

      ReadSegyTrace

ReadSegyTraceHeaderValue {#\_ReadSegyTraceHeaderValue}
------------------------------------------------------

::

      ReadSegyTraceHeaderValue : Read a spedicifc trace header value
     
      Call:
         % By Name
         cdp=ReadSegyTraceHeaderValue(filename,'key','cdp');
         SourceX=ReadSegyTraceHeaderValue(filename,'key','SourceX');
         SourceY=ReadSegyTraceHeaderValue(filename,'key','SourceY');
     
         % By location in Trace Header
         SourceX=ReadSegyTraceHeaderValue(filename,'pos',72,'precision','int32');
     
         % Call 'TraceHeaderDef(1)' to see a list of TraceHeader 'key' names
      
      See also WriteSegyTraceHeaderValue, TraceHeaderDef
     

ReadSu {#\_ReadSu} ------

::

      ReadSu : Reads a SU formatted file (Seismic Unix)
     
      Call :
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename);
     
      To read in big endian format (default):
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename,'endian','b');
      To read in little endian format :
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename,'endian','l');
     
     
      To read in trace data as 'int32' :
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename,'DataFormat','int32');
      To read time slice 0.5<t<5 :
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename,'trange',.5,3);
      Skip every 5th trace :
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename,'jump',5);
      Read data in a CDP header range : 5000<cdp<5800 
      (change cdp to any other valid TraceHeader value)
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename,'minmax','cdp'5000,5800);
     
      Combine any combination of the above
      [Data,SuTraceHeaders,SuHeader]=ReadSu(filename,'jump',1,'minmax','cdp',5300,5400);
     
     

ReadSuFast {#\_ReadSuFast} ----------

::

      ReadSuFast
     
      PURPOSE : reads a SEISMIC section i  SU format in big endian format, 
                strips the headers and returns the field in the matrix seis.
                If nx==0 and nt<>0, nx will be computed
                If nt==0 and nx<>0, nt will be computed           
     
      Call : function seis=ReadSuFast(fileid,nt,nx,'byteorder');
                byteorder : 'l' for little or 'b' for big endian (Default : Native )
     
      BY : TMH 1/8 1997
      Updated by Thomas Mejer Hansen : 22-03-1999
     

Sac2Segy {#\_Sac2Segy} --------

::

      Sac2Segy : Reads SAC formatted data into a SegyMAT (SGY) structure
     
      CALL :
        [Data,SegyTraceHeader,SegyHeader]=Sac2Segy(files_in,segyfile_out,varargin)
     
        files_in : Either a single filename or a strcture of filenames
                 files_in='d1.SAC';
                 or
                 files_in{1}='d1.SAC';
                 files_in{2}='d2.SAC';
     
      Examples :
        [D,STH,SH]=Sac2Segy('','test.segy','FixedLengthTraceFlag',1);
                   converts all SAC files into one SEGY file (test.segy), using
                   a FixedLengthTraceFlag of 1. This is compatible with mosty
                   any SEGY reader.
     
        [D,STH,SH]=Sac2Segy('','test.segy','FixedLengthTraceFlag',0);
                   converts all SAC files into one SEGY file (test.segy), using
                   a FixedLengthTraceFlag of 0, allowing varying trace length of SEGY files
                   This is only compatible with revision 1 of the SEGY format.
     
        [D,STH,SH]=Sac2Segy('file.sac');
                   convert file.sac to file.segy
     
        [D,STH,SH]=Sac2Segy('file.sac','another_file.segy');
                   convert file.sac to another_file.segy
     
     
        Force little endian byte format for SAC file:
        Sac2Segy('file.sac','test.sgy','endian','l');
     
      Relies on sac2mat.m 
     
      Download SAC files from : http://www.iris.edu/hq/ssn/events
      

Segy2Su {#\_Segy2Su} -------

::

      Segy2Su : Converts SEGY file to SU format
      
      Call : Segy2Su(filename,ReadSegyOption)
         Replaces the filename suffix to '.su';
         'ReadSegyOptions' are the same as to 'ReadSegy'
     
       See also : ReadSegy
     

SegyMAT\_GAIN {#\_SegyMAT\_GAIN} -------------

::

      SegyMAT_GAIN : Gain plugin for SegyMAT
     
      [Data,SegyTraceHeaders,SegyHeader]=SegyMAT_GAIN(Data,SegyTraceHeaders,SegyHeader,varargin);
     
      ex. AGC using AGC window of 100 ms :
      [Data]=SegyMAT_GAIN(Data,SegyTraceHeaders,SegyHeader,'agc',.1);
      ex. apply t^(pow), pow=2
      [Data]=SegyMAT_GAIN(Data,SegyTraceHeaders,SegyHeader,'pow',2);
      
     
      (C) Thomas Mejer Hansen (thomas@cultpenguin.com), 2002
     

SegyMATdemo1 {#\_SegyMATdemo1} ------------

::

      SegyMATdemo1 : Creates, Reads and plots a Segy File;

SegymatHelp {#\_SegymatHelp} -----------

SegymatRevision {#\_SegymatRevision} ---------------

::

      SegymatRevision - Returns the revision history
     
      Call : [Revision]=SegymatRevision
     

SegymatVerbose {#\_SegymatVerbose} --------------

::

      SegymatVerbose : Writes out verbose information to the screen
     
     
      Call : 
        SegymatVerbose(text,verboselevel)
        prints out 'text' to screen if verboselevel is higher than threshold
        set in m-file.
     

SegymatVersion {#\_SegymatVersion} --------------

::

      SegymatVersion - Returns the version and release date
     
      [ver,d]=SegymatVersion;
     

Su2Segy {#\_Su2Segy} -------

::

      SU2Segy : Converts SEGY file to SU format

TraceHeaderDef {#\_TraceHeaderDef} --------------

::

      TraceHeaderDef : Defines names, position, and precision for Trace Headers
     
      % To get a Matlab structure with trace header definitions call:
      STH==TraceHeaderDef;
      % To get a list fo trace header definision listed on the screen call:
      STH==TraceHeaderDef(1)
     
      See also: ReadSegyTraceHeaderValue, WriteSegyTraceHeaderValue
     

WriteSegy {#\_WriteSegy} ---------

::

      WriteSegy : writes data to disk using SEGY REV 1 standard.
     
      EX
      WriteSegy('datacube.segy',data,'dt',.004,'Inline3D',Inline,'Crossline3D',Crossline,'cdpX',X,'cdpY',Y);
     
      to use a specific SEG revision use :
      WriteSegy('test.segy',seisdata,'revision',0); % SEG-Y Revision 0
      WriteSegy('test.segy',seisdata,'revision',1); % SEG-Y Revision 1
      
      to use a specific Data Sampling Format use :
      WriteSegy('test.segy',seisdata,'dsf',1); % IBM FLAOTING POINT
     
      Forice Revision 1 and IEEE Floating point :
      WriteSegy('test.segy',seisdata,'dsf',5,'revision',1); 
     
      See also : WriteSegyStructure, WriteSu, WriteSuStructure
     

WriteSegyStructure {#\_WriteSegyStructure} ------------------

::

      WriteSegyStructure : writes data to disk using SEGY REV 0 and 1 standards.
     
      EX
      WriteSegyStructure('datacube.segy',SegyHeader,SegyTraceHeaders,Data);
     
      To force the use of SEG Y revision 0
      WriteSegyStructure('datacube.segy',SegyHeader,SegyTraceHeaders,Data,'revision',0);
      To force the use of SEG Y revision 1
      WriteSegyStructure('datacube.segy',SegyHeader,SegyTraceHeaders,Data,'revision',1);
      To force the data sampling format to be IBM Floating Point 
      WriteSegyStructure('datacube.segy',SegyHeader,SegyTraceHeaders,Data,'dsf',1);
      
      To force the use of SEG Y revision 0 and data sampling format IEEE :
      WriteSegyStructure('datacube.segy',SegyHeader,SegyTraceHeaders,Data,'revision',1,'dsf',5);
     
      See the dokumentation for for proper values of 'dsf'
     
     

WriteSegyTrace {#\_WriteSegyTrace} --------------

::

      WriteSegyTrace
     
      Call : 
        [Data,SegyTraceHeader,SegyHeader]=WriteSegyTrace(filename,traces,Data,SegyTraceHeader,SegyHeader);  
     
     
        Example : 
        %% EXAMPLE : Change polarity of trace 10 and 12
        itrace=[10,12];
        [D,STH,SegyHeader]=ReadSegy(filename,'traces',itrace);
        WriteSegyTrace(filename_copy,itrace,D,STH,SegyHeader)
     
     
     

WriteSegyTraceHeaderValue {#\_WriteSegyTraceHeaderValue}
--------------------------------------------------------

::

      WriteSegyTraceHeaderValue : Write trace header valaue at specific location
       
      Call:
     
         % Update all trace header values starting at position 72, in integer32
         % format, to the value 30
         data=30;
         WriteSegyTraceHeaderValue(filename,data,'pos',72,'precision','int32',);
     
         % Update all trace header values starting at position 72, in integer32
         % format, to the values in array 'data'
         ntraces=311;
         data=[1:1:311]*10;
         WriteSegyTraceHeaderValue(filename,data,'pos',72,'precision','int32');
         d_header=ReadSegyTraceHeaderValue(filename,'pos',72,'precision','int32');
         
         % Update the 'cdp' TraceHeader value: 
         cdp=ReadSegyTraceHeaderValue(file,'key','cdp');  % READ CDP
         cdp=cdp+10;                                      % change CDP 
         WriteSegyTraceHeaderValue(file,cdp,'key','cdp'); % UPDATE CDP
     
         Call 'TraceHeaderDef(1)' to see a list of TraceHeader 'key' names
      
      See also ReadSegyTraceHeaderValue, PutSegyTraceHeader, TraceHeaderDef
     

WriteSu {#\_WriteSu} -------

::

      WriteSu : writes data to disk using SEGY REV 2 standard.
     
      EX
      WriteSu('datacube.su',data,'dt',.004,'Inline3D',Inline,'Crossline3D',Crossline,'cdpX',X,'cdpY',Y);
     
      to use a specific SEG revision use :
      WriteSu('test.su',seisdata,'revision',0); % SEG-Y Revision 0
      WriteSu('test.su',seisdata,'revision',1); % SEG-Y Revision 1
      
      to use a specific Data Sampling Format use :
      WriteSu('test.su',seisdata,'dsf',1); % IBM FLAOTING POINT
     
      Forice Revision 1 and IEEE Floating point :
      WriteSu('test.su',seisdata,'dsf',5,'revision',1); 
     

WriteSuStructure {#\_WriteSuStructure} ----------------

::

      WriteSuStructure : writes data to disk using SU-CWP format
     
      EX
      WriteSuStructure('datacube.segy',SegyHeader,SegyTraceHeaders,Data);

ascii2ebcdic {#\_ascii2ebcdic} ------------

::

      ascii2ebcdic : Converts ASCII formatted text to EBCDIC formatted text
     
      CALL : ebcdic=ascii2ebcdic(ascii);
     
      ascii  : Array on unsigned integers
      ebcdic : Array on unsigned integers
     
      (C) 2002-2009, Thomas Mejer Hansen, tmh@gfy.ku.dk/thomas.mejer.hansen@gmail.com
      

cmap\_rwb {#\_cmap\_rwb} ---------

ebcdic2ascii {#\_ebcdic2ascii} ------------

::

      ebcdic2ascii : Converts EBCDIC formatted text to ASCII formatted text
     
      CALL : ascii=ebcdic2ascii(ebcdic);
     
      ebcdic : Array on unsigned integers
      ascii  : Array on unsigned integers
     
      (C) 2002-2004, Thomas Mejer Hansen, tmh@gfy.ku.dk/thomas@cultpenguin.com
      

gse2segy {#\_gse2segy} --------

ibm2num {#\_ibm2num} -------

::

      ibm2num : convert IBM 32 bit floating point format to doubles
         x=num2ibm(b)
      b is a matrix of uint32
      x is a corresponding matrix of doubles
     
     
      See also num2ibm

isoctave {#\_isoctave} --------

::

      isoctave : checks of octave

num2ibm {#\_num2ibm} -------

::

      num2ibm : convert IEEE 754 doubles to IBM 32 bit floating point format
         b=num2ibm(x)
      x is a matrix of doubles
      b is a corresponding matrix of uint32
     
      The representations for NaN and inf are arbitrary
     
      See also ibm2num

pick\_line {#\_pick\_line} ----------

::

      pick_line : pick a line from a figure;
     
     
      Based on doc(ginput);

progress\_txt {#\_progress\_txt} -------------

::

      progress_txt : console based progress bar
     
      Ex1 : 
        for i=1:10000;
          progress_txt(i,10000,'Ciao');
        end
     
      Ex1 :
     
        for i=1:10;
        for j=1:10;
        for k=1:10;
          progress_txt([i j k],[10 100 1000],'i','j','k');
        end
        end
        end
     
      TMH/2005, thomas@cultpenguin.com
     

read\_gse\_int {#\_read\_gse\_int} --------------

sac2mat {#\_sac2mat} -------

::

      [SACdata,SeisData,filenames] = SAC2MAT('file1','file2',..., 'filen',endian )
     
      reads n SAC files file1, file2, filen 
      and converts them to matlab
      format. The filenames can contain globbing characters (e.g. * and ?).
      These are expanded and all matching files loaded.
     
      files are assumed big endian formatted (e.g. SUN), little endian can be
      forced using endian='l': sac2mat('file1.sac','l'); 
     
     
      SACSUN2MAT( cellarray ) where cellarray={'file1','file2',...,'filen'}
      is equivalent to the standard form.
      
      SACdata is an n x 1 struct array containing the header variables
              in the same format as is obtained by using MAT function
              of SAC2000.
              SACdata(i).trcLen contains the number of samples.
     
      SeisData is an m x n array (where m=max(npts1, npts2, ...) )
              containing the actual data.
     
      filenames is a n x 1 string cell array with the filenames actually read.
     
      Note that writing 
     
       [SACdata,SeisData] = sac2mat('file1','file2',..., 'filen' ,endian) 
     
      is equivalent to the following sequence
      
      sac2000
      READ file1 file2 .. filen
      MAT
     
      (in fact the failure of above sequence to work properly on my
      system motivated this script).
     
     
      SAC2MAT was written by F Tilmann (tilmann@esc.cam.ac.uk) 
      based on sac_sun2pc_mat  by C. D. Saragiotis (I copied the 
      routines doing the actual work from this code but
      used a different header structure and made the routine
      flexible). 
      It was tested on MATLAB5 on a PC but
      should work on newer versions, too.
     
      (C) 2004
     
      Update 10/2008 by Thomas Mejer Hansen: Merged sac2sun2mat and sacpc2mat
      into sac2mat.m
     

sacpc2mat {#\_sacpc2mat} ---------

::

      [SACdata,SeisData,filenames] = SACPCMAT('file1','file2',..., 'filen' )
     
      reads n SAC files file1, file2, filen (SAC files are assumed to have
      PC byte order) and converts them to matlab
      format. The filenames can contain globbing characters (e.g. * and ?).
      These are expanded and all matching files loaded.
     
      SACPCMAT( cellarray ) where cellarray={'file1','file2',...,'filen'}
      is equivalent to the standard form.
      
      SACdata is an n x 1 struct array containing the header variables
              in the same format as is obtained by using MAT function
              of SAC2000.
              SACdata(i).trcLen contains the number of samples.
     
      SeisData is an m x n array (where m=max(npts1, npts2, ...) )
              containing the actual data.
     
      filenames is a n x 1 string cell array with the filenames actually read.
     
      Note that writing 
     
       [SACdata,SeisData] = sacsun2mat('file1','file2',..., 'filen' ) 
     
      is equivalent to the following sequence
      
      sac2000
      READ file1 file2 .. filen
      MAT
     
      (in fact the failure of above sequence to work properly on my
      system motivated this script).
     
     
      SACPC2MAT was written by F Tilmann (tilmann@esc.cam.ac.uk) 
      based on sac_sun2pc_mat  by C. D. Saragiotis (I copied the 
      routines doing the actual work from this code but
      used a different header structure and made the routine
      flexible). 
      It was tested on MATLAB5 on a PC but
      should work on newer versions, too.
     
      (C) 2004
     

sacsun2mat {#\_sacsun2mat} ----------

::

      [SACdata,SeisData,filenames] = SACSUN2MAT('file1','file2',..., 'filen' )
     
      reads n SAC files file1, file2, filen (SAC files are assumed to have
      SUN byte order) and converts them to matlab
      format. The filenames can contain globbing characters (e.g. * and ?).
      These are expanded and all matching files loaded.
     
      SACSUN2MAT( cellarray ) where cellarray={'file1','file2',...,'filen'}
      is equivalent to the standard form.
      
      SACdata is an n x 1 struct array containing the header variables
              in the same format as is obtained by using MAT function
              of SAC2000.
              SACdata(i).trcLen contains the number of samples.
     
      SeisData is an m x n array (where m=max(npts1, npts2, ...) )
              containing the actual data.
     
      filenames is a n x 1 string cell array with the filenames actually read.
     
      Note that writing 
     
       [SACdata,SeisData] = sacsun2mat('file1','file2',..., 'filen' ) 
     
      is equivalent to the following sequence
      
      sac2000
      READ file1 file2 .. filen
      MAT
     
      (in fact the failure of above sequence to work properly on my
      system motivated this script).
     
     
      SACSUN2MAT was written by F Tilmann (tilmann@esc.cam.ac.uk) 
      based on sac_sun2pc_mat  by C. D. Saragiotis (I copied the 
      routines doing the actual work from this code but
      used a different header structure and made the routine
      flexible). 
      It was tested on MATLAB5 on a PC but
      should work on newer versions, too.
     
      (C) 2004
     

segymat\_release\_test {#\_segymat\_release\_test}
--------------------------------------------------

testWriteSegy {#\_testWriteSegy} -------------

::

      testWriteSegy : Script to test WriteSegy and WriteSegyStructure
     

wiggle {#\_wiggle} ------

::

      wiggle : plot wiggle/VA/image plot
     
      Call
         wiggle(Data); % wiggle plot
         wiggle(Data,scale); % scaled wiggle plot
         wiggle(x,t,Data); % wiggle plt
         wiggle(x,t,Data,'VA') % variable Area (pos->black;neg->transp)
         wiggle(x,t,Data,'VA2') % variable Area (pos->black;neg->red)
         wiggle(x,t,Data,'wiggle',scale); % Scaled wiggle
         wiggle(x,t,Data,'wiggle',scale,showmax); % Scaled wiggle and max
                                                    showmax traces.
         wiggle(x,t,Data,'wiggle',scale,showmax,plimage); % wiggle + image
         wiggle(x,t,Data,'wiggle',scale,showmax,plimage,caxis); % wiggle +
                                                                  scaled image
     
      Data : [nt,ntraces]
      x : [1:ntraces] X axis (ex [SegyTraceheaders.offset])
      t : [1:nt] Y axis
      style : ['VA'] : Variable Area
              ['wiggle'] : Wiggle plot
      scale : scaling factor, can be left empty as []
      showmax [scalar] : max number of traces to show on display [def=100]
      plimage [0/1] : Show image beneath wiggles [def=0];
      caxis [min max]/[scalar] : amplitude range for colorscale
     
     
      MAKE IT WORK FOR ANY X-AXIS !!!
     
     
