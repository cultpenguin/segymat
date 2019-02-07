Reading SEG-Y files
===================

This section documents how SEG-Y files are read using SegyMAT.

ReadSegy
--------

``ReadSegy.m`` can be used to read SEG-Y formatted files :

::

    [Data,SegyTraceHeaders,SegyHeader]=ReadSegy('data.segy');
    wiggle(Data,[],SegyHeader.time,[SegyTraceHeaders.cdp],'VA')
    imagesc([SegyTraceHeaders.cdp],[SegyHeader.time],Data)

This will read ``data.segy`` using the revision and data sample format
specified in the binary header (``SegyHeader``), and plot the data using
the ``wiggle`` plotting function.

``Data`` is a 2D variable containing the seismic data of size
``[Nsamples x Ntraces]``.

``SegyTraceHeaders``\ is a structure of size
``[1,Ntraces]' structure containing all the header values from the traces. Type``\ SegyTraceHeaders\ ``to see a list of header information.``\ SegyTraceHeaders(9)\`,
list all header names and values of trace number 9.

::

    >> SegyTraceHeaders(9)
      
       ans = 

                            SegyMAT_TraceStart: 91952
                             TraceSequenceLine: 0
                             TraceSequenceFile: 9
                                   FieldRecord: 0
                                   TraceNumber: 9
                             EnergySourcePoint: 0
                                           cdp: 0
                                      cdpTrace: 0
                       TraceIdenitifactionCode: 0
                                 NSummedTraces: 0
                                NStackedTraces: 0
                                       DataUse: 0
                                        offset: 400
                                          ...
                 SourceEnergyDirectionMantissa: 0
                 SourceEnergyDirectionExponent: 0
                     SourceMeasurementMantissa: 0
                     SourceMeasurementExponent: 0
                         SourceMeasurementUnit: 0
                                UnassignedInt1: 0
                                UnassignedInt2: 0
                        SegyMAT_TraceDataStart: 92192

To access an array of trace header values simply use square brackets as
:

::

        cdp=[SegyTraceHeaders.cdp];
        offset=[SegyTraceHeaders.offset];
        ...

``SegyHeader`` is a structure containing all the Segyheader values.
Typing ``SegyHeader`` will list the names and values of all header
values.

::

    >> SegyHeader

        SegyHeader = 

                              Rev: [1x2 struct]
                TextualFileHeader: [3200x1 double]
                              Job: 0
                             Line: 0
                             Reel: 0
             DataTracePerEnsemble: 0
        AuxiliaryTracePerEnsemble: 0
                               dt: 1000
                           dtOrig: 0
                               ns: 2701
                           nsOrig: 0
                 DataSampleFormat: 5
                     EnsembleFold: 0
                     TraceSorting: 0
                  VerticalSumCode: 0
              SweepFrequencyStart: 0
                SweepFrequencyEnd: 0
                      SweepLength: 0
                        SweepType: 0
                     SweepChannel: 0
            SweepTaperlengthStart: 0
              SweepTaperLengthEnd: 0
                        TaperType: 0
             CorrelatedDataTraces: 0
                       BinaryGain: 0
          AmplitudeRecoveryMethod: 0
                MeasurementSystem: 1
            ImpulseSignalPolarity: 0
            VibratoryPolarityCode: 0
                      Unassigned1: [120x1 double]
         SegyFormatRevisionNumber: 100
             FixedLengthTraceFlag: 1
        NumberOfExtTextualHeaders: 0
                      Unassigned2: [47x1 double]
                             time: [1x2701 double]

A number of arguments can be given to ``ReadSegy``, controlling what
type of and which part of the data to read.

Read specific trace numbers
~~~~~~~~~~~~~~~~~~~~~~~~~~~

To read traces 100, 201 and 320 use e.g.

::

    >> [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'traces',[100 201 320]);

Use for example
`ReadSegyTraceHeadervalue.m <#ReadSegyTraceHeaderValue>`__ and 'find' to
find a list of trace ids (this is equivalent to using the
'`minmax <#minmax>`__' option)

::

    >> cdp=ReadSegyTraceHeaderValue(filename,'key','cdp');
    >> traces = find(cdp>100 & cdp<200)
    >> [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'traces',[100 201 320]);

Read only every 5th trace
~~~~~~~~~~~~~~~~~~~~~~~~~

::

    >> [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'jump',5);

To read time slice 0.5 < t < 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

          >> [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'trange',.5,3);

Read data in a CDP header range : 5000> [Data,SegyTraceHeaders,SegyHeader]=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

      ReadSegy(filename,'minmax','cdp',5000,5800);

::


    ### Read only header values

    In some cases it can be desirable only to read the header information (the SegyHeader and SegyTraceHeaders). This will return an empty `Data` variable.

        [Data,SegyTraceHeaders,SegyHeader]=
        ReadSegy(filename,'SkipData',1);

::


    ### SEG-Y format revision

    SEG-Y format revision number can be '0' (1975) or '1' (2002). By default
    the SEG-Y format revision number is read in the binary header, but this
    can be overruled using :

        [Data,SegyTraceHeaders,SegyHeader]=
        ReadSegy(filename,'revision',0);

::


    ### A specific Data Sample Format

    One can overrule the Data Sample Format listed in the binary header,
    using the `dsf` argument. See [Data Sample Formats](format.html#DataSampleFormatSupport) for a list
    of valid and supported values.

        % Rev 0, IBM FLOATING POINT [Data,SegyTraceHeaders,SegyHeader]=
        ReadSegy(filename,'revision',0,'dsf',1); % Rev 1, IEEE FLOATING
        POINT [Data,SegyTraceHeaders,SegyHeader]=
        ReadSegy(filename,'revision',1,'dsf',5);

::


    If `dsf` is set to 5 and `revision` to 0, a warning message will occur,
    since data sample format 5 is only defined in revision 1. The revision
    is then automatically set to 1.

    ### Force the use of a specific SegyHeader

        [Data,SegyTraceHeaders,SegyHeader]=
        ReadSegy(filename,'SegyHeader',SegyHeader);

::


    ## ReadSegyFast {#ReadSegyFast}

    `ReadSegyFast.m` is a faster implementation of [ReadSegy.m](#ReadSegy)
    since no trace header values are read. Thus this function will just
    return the seismic data and the SegyHeader. e.g. :

        [Data,SegyHeader]=ReadSegyFast('data.segy'); imagesc(Data)

::

    If `ReadSegy` is called with only one output argument, `ReadSegyFast` will be used instead of `ReadSegy`.

    ### ReadSegyFast options

    Most of the same options that works for [ReadSegy.m](#ReadSegy) will also work for [ReadSegyFast.m](#ReadSegyFast). The data sample format can be chosen using the 'revision' and 'dsf'
    tags. Also a 'SegyHeader' can be specified.

    [ReadSegyFast.m](#ReadSegyFast) is currently optimized only for reading
    the whole SEGY-Y file, but the options 'jump' and 'trange' can be used (but
    will currently not result in faster read times).

    Since the trace header values are not read, the '[minmax](#minmax)' option is not
    supported.

    ## ReadSegyHeader {#ReadSegyHeader}

    `ReadSegyHeader.m` reads the Binary Segy Header only. It can be called
    with the same options as [ReadSegy.m](#ReadSegy)

    ### Force using little endian :

        SegyHeader=ReadSegyHeader(filename,'endian','l');

::


    ## ReadSegyTraceHeaderValue {#ReadSegyTraceHeaderValue}
    `ReadSegyTraceHeaderValue.m` reads one trace header value into an array. This approach is much faster than to read the whole file

    ### using a keyword

    To read a trace header value by its trace header key. See the definition of all the [Trace Header names](format.html#TraceHeaderDef) to use the correct key:

cdp=ReadSegyTraceHeaderValue(filename,'key','cdp');
SourceX=ReadSegyTraceHeaderValue(filename,'key','SourceX');
SourceY=ReadSegyTraceHeaderValue(filename,'key','SourceY');
plot(SourceX,SourceY)

::


    ### using location+type

    To read a trace header by its position in the trace header using a
    specific data sample format, use:

SourceX=ReadSegyTraceHeaderValue(filename,'pos',70,'precision','int32');

::


    ## ReadSegyConstantTraceLength {#ReadSegyConstantTraceLength}

    Assuming a constant trace length (which is much more common than not) allows much faster reading of parts of large file. For example to read trace number 2030, the whole SEG-Y  file must be sequentially read, assuming variable trace length. Assuming constant trace length the trace can be directly (and fast) located in the data cube.

    To read trace 2030 use

[Data,SegyTraceHeader,SegyHeader]=ReadSegyConstantTraceLength(filename,'trace',2030);

::


    To read traces 1-2000 and 2020-2040 use

[Data,SegyTraceHeader,SegyHeader]=ReadSegyConstantTraceLength(filename,'trace',[1:2000,2020:2040]);

::


    ### using keywords

    Several keywords can be used to efficiently read parts of larger files.

    To read only the part of a file with SourceX between 1000-2000 and
    SourceY between 4000-5000 use :

[Data,SegyTraceHeader,SegyHeader]=ReadSegyConstantTraceLength(filename,'minmax','SourceX',1000,2000,'minmax','SourceY',4000,5000]);

::


    ## ReadSu {#ReadSu}

    `ReadSu.m` works similar to [ReadSegy.m](#ReadSegy) and the same input parameters can be used. A `SuHeader` can optionally be returned, but as there is no (SEG-Y)-Header information in a SU file it is mostly empty.

        [Data,SuTraceHeaders,SuHeader]=ReadSu(filename); \`\`\`
