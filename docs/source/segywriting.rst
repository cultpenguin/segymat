Writing SEG-Y files
===================

WriteSegy
---------

``WriteSegy`` can be used to save a matrix of data as a SEG-Y formatted
file.

Specify values for the SGY Header
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here ``dt`` is a scalar and ``Inline``, ``Crossline``, ``X`` and ``Y``
are arrays of values of size size(data,2)

::

    >> WriteSegy('datacube.segy',data,
        'dt',.004,'Inline3D',Inline,'Crossline3D',Crossline,
        'cdpX',X,'cdpY',Y);

Specify revision
~~~~~~~~~~~~~~~~

::

    >> WriteSegy('test.segy',seisdata,'revision',0); % SEG-Y Revision 0
    >> WriteSegy('test.segy',seisdata,'revision',1); % SEG-Y Revision 1

Specify data sample format
~~~~~~~~~~~~~~~~~~~~~~~~~~

See `Data Sample Formats <#DataSampleFormatSupport>`__ for a list of
valid and supported values for the datasample format ``dsf``.

::

    >> % Force Revision 1 and IEEE Floating point :
    >> WriteSegy('test.segy',seisdata,'dsf',5,'revision',1); 
    >>
    >> % Force Revision 0 and IBM Floating point :
    >> WriteSegy('test.segy',seisdata,'dsf',1,'revision',0); 

WriteSegyStructure
------------------

``WriteSegyStructure`` can be used to write a seismic data to disk given
that both ``SegyHeader``, ``SegyTraceheaders`` and the data ``Data`` are
known. They can be obtained using `ReadSegy <#ReadSegy>`__ like ;

::

    >> [Data,TraceHeaderInfo,SegyTraceHeaders,SegyHeader]=ReadSegy('data.segy');

To write the data using ``WriteSegyStructure`` simply do

::

    >> WriteSegyStructure('datacube.segy',SegyHeader,SegyTraceHeaders,Data);

Force revision
~~~~~~~~~~~~~~

::

    >> % Revision 0
    >> WriteSegyStructure('datacube.segy',SegyHeader,
                          SegyTraceHeaders,Data,'revision',0);
    >> % Revision 1
    >> WriteSegyStructure('datacube.segy',SegyHeader,
                          SegyTraceHeaders,Data,'revision',1);

Force Data Sample Format
~~~~~~~~~~~~~~~~~~~~~~~~

See `Data Sample Formats <#DataSampleFormatSupport>`__ for a list of
valid and supported values for the datasample format ``dsf``.

::

    >> % To force the use of SEG Y revision 0 and data sampling format IEEE :
    >> WriteSegyStructure('datacube.segy',SegyHeader,
                           SegyTraceHeaders,Data,'revision',1,'dsf',5);

WrityeSegyTraceHeaderValue
--------------------------

``WriteSegyTraceHeaderValue.m`` writes one trace header from an array
into the Trace Hader of a SGY file.

using keyword
~~~~~~~~~~~~~

To read a read, edit and write the 'cdp' header values (see `Trace
Header Definitions <format.html#TraceHeaderDef>`__ for a list of defined
keys) use for example:

::

    cdp=ReadSegyTraceHeaderValue(file,'key','cdp');  % READ CDP
    cdp=cdp+10;                                      % change CDP 
    WriteSegyTraceHeaderValue(file,cdp,'key','cdp'); % UPDATE CDP

using location+precision
~~~~~~~~~~~~~~~~~~~~~~~~

To manually update a trace header at a specific location, using a
specific data type (precision) use for for example:

::

    % Update all trace header values starting at position 72, in integer32
    % format, to the values in array 'data'
    ntraces=311;
    data=[1:1:311]*10;
    WriteSegyTraceHeaderValue(filename,data,'pos',72,'precision','int32');
    d_header=ReadSegyTraceHeaderValue(filename,'pos',72,'precision','int32');

Take a look at `Trace eEader Definictions <#_TraceHeaderDef>`__ to find
the position of all trace header values.
