The SEGY-Y format
=================

SegyMAT has been implemented using the SEG-Y `revision
0 <https://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0ahUKEwiH-97U-tDPAhUBWCwKHdg-DuEQFggjMAE&url=http%3A%2F%2Fseg.org%2FPortals%2F0%2FSEG%2FNews%2520and%2520Resources%2FTechnical%2520Standards%2Fseg_y_rev0.pdf&usg=AFQjCNGlquyq1sbphA0vNQVFscPO_wok4g&sig2=qx5W1h1-LAYUR6Lm6DZIjA>`__
and `revision
1 <http://www.seg.org/documents/10161/77915/seg_y_rev1.pdf>`__ standards
as defined by
`SEG <http://seg.org/Publications/SEG-Technical-Standards>`__\  [1]_.

SegyMAT also has support for reading and writing the format used by
`CWP <http://www.cwp.mines.edu/>`__'s `Seismic
Unix <http://www.cwp.mines.edu/cwpcodes/>`__ package (the SU format),
which is merely a simplified version the SEG-Y format.

A short description of the formats follows here.

Structure of a file
-------------------

A SEG-Y file consists of a 3600 byte header; a number of extended
textual headers; a number trace headers+data.

-  A 3200 byte Textual File Header, ASCII or EBCDIC formated.

-  A 400 byte Binary File Header

-  A (optional) number of 'Extended Textual File Headers', 3200 bytes
   long, ASCII or EBCDIC formatted.

-  A number of traces, separated into a 240 bytes long binary Trace
   Header, followed by the Trace Data, that can be formatted in a number
   of ways : IEEE, IBM Floating Point, 1,2 and 4 byte two's complement
   integers.

Structure of a SU file
----------------------

A SU formatted file is just a simple version of a file, containing only
trace information :

-  No 3200 byte textual header and no extended textual headers.

-  No binary header.

-  The data must be formatted as IEEE.

-  Data can be both little and big endian formatted.

What is supported in SegyMAT ?
------------------------------

The following parts of the SEG-Y format, revision 0 and 1, are supported

Textual file headers
~~~~~~~~~~~~~~~~~~~~

The Textual 400 byte file header can be both ASCII and EBCDIC formatted,
using revision 1.

Extended Textual Headers
~~~~~~~~~~~~~~~~~~~~~~~~

In revision 1 a number of extended textual file headers are allowed.

Data Sample Format / Revision
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following data formats are supported :

REVISION 0 (1975):

+--------+--------------------------------+-------------+
| Type   | DataSampleFormat               | Supported   |
+========+================================+=============+
| 1      | 4 Byte IBM Floating Point      | Yes         |
+--------+--------------------------------+-------------+
| 2      | 4 Byte Fixed Point             | No          |
+--------+--------------------------------+-------------+
| 3      | 2 Byte Fixed Point             | No          |
+--------+--------------------------------+-------------+
| 4      | 4 Byte Fixed Point with Gain   | No          |
+--------+--------------------------------+-------------+

REVISION 1 (2002)

+--------+-----------------------------------+-------------+
| Type   | DataSampleFormat                  | Supported   |
+========+===================================+=============+
| 1      | 4 Byte IBM Floating Point         | Yes         |
+--------+-----------------------------------+-------------+
| 2      | 4 Byte two's complement integer   | Yes         |
+--------+-----------------------------------+-------------+
| 3      | 2 Byte two's complement integer   | Yes         |
+--------+-----------------------------------+-------------+
| 4      | 4 Byte Fixed Point with Gain      | No          |
+--------+-----------------------------------+-------------+
| 5      | 4 Byte IEEE FLoating Pint         | Yes         |
+--------+-----------------------------------+-------------+
| 6      | Not Specified                     |             |
+--------+-----------------------------------+-------------+
| 7      | Not Specified                     |             |
+--------+-----------------------------------+-------------+
| 8      | 1 Byte Fixed Point with Gain      | Yes         |
+--------+-----------------------------------+-------------+

The type number is the number that should be used as '``dsf``' (Data
Sample Format), for functions like `ReadSegy <#ReadSegy>`__,
`WriteSegy <#WriteSegy>`__,
`WriteSegyStructure <#WriteSegyStructure>`__.

Segy Trace Header name definition
---------------------------------

The definition of trace header names, location in the Trace Header and
precision can be listed by running

::

    TraceHeaderDef;

which provides the folloing output:

::

     POS   PREC Traece Header Name
       0  int32 TraceSequenceLine
       4  int32 TraceSequenceFile
       8  int32 FieldRecord
      12  int32 TraceNumber
      16  int32 EnergySourcePoint
      20  int32 cdp
      24  int32 cdpTrace
      28  int16 TraceIdenitifactionCode
      30  int16 NSummedTraces
      32  int16 NStackedTraces
      34  int16 DataUse
      36  int32 offset
      40  int32 ReceiverGroupElevation
      44  int32 SourceSurfaceElevation
      48  int32 SourceDepth
      52  int32 ReceiverDatumElevation
      56  int32 SourceDatumElevation
      60  int32 SourceWaterDepth
      64  int32 GroupWaterDepth
      68  int16 ElevationScalar
      70  int16 SourceGroupScalar
      72  int32 SourceX
      76  int32 SourceY
      80  int32 GroupX
      84  int32 GroupY
      88  int16 CoordinateUnits
      90  int16 WeatheringVelocity
      92  int16 SubWeatheringVelocity
      94  int16 SourceUpholeTime
      96  int16 GroupUpholeTime
      98  int16 SourceStaticCorrection
     100  int16 GroupStaticCorrection
     102  int16 TotalStaticApplied
     104  int16 LagTimeA
     106  int16 LagTimeB
     108  int16 DelayRecordingTime
     110  int16 MuteTimeStart
     112  int16 MuteTimeEND
     114 uint16 ns
     116 uint16 dt
     118  int16 GainType
     120  int16 InstrumentGainConstant
     122  int16 InstrumentInitialGain
     124  int16 Correlated
     126  int16 SweepFrequenceStart
     128  int16 SweepFrequenceEnd
     130  int16 SweepLength
     132  int16 SweepType
     134  int16 SweepTraceTaperLengthStart
     136  int16 SweepTraceTaperLengthEnd
     138  int16 TaperType
     140  int16 AliasFilterFrequency
     142  int16 AliasFilterSlope
     144  int16 NotchFilterFrequency
     146  int16 NotchFilterSlope
     148  int16 LowCutFrequency
     150  int16 HighCutFrequency
     152  int16 LowCutSlope
     154  int16 HighCutSlope
     156  int16 YearDataRecorded
     158  int16 DayOfYear
     160  int16 HourOfDay
     162  int16 MinuteOfHour
     164  int16 SecondOfMinute
     166  int16 TimeBaseCode
     168  int16 TraceWeightningFactor
     170  int16 GeophoneGroupNumberRoll1
     172  int16 GeophoneGroupNumberFirstTraceOrigField
     174  int16 GeophoneGroupNumberLastTraceOrigField
     176  int16 GapSize
     178  int16 OverTravel
     180  int32 cdpX
     184  int32 cdpY
     188  int32 Inline3D
     192  int32 Crossline3D
     196  int32 ShotPoint
     200  int16 ShotPointScalar
     202  int16 TraceValueMeasurementUnit
     204  int32 TransductionConstantMantissa
     208  int16 TransductionConstantPower
     210  int16 TransductionUnit
     212  int16 TraceIdentifier
     214  int16 ScalarTraceHeader
     216  int16 SourceType
     218  int32 SourceEnergyDirectionMantissa
     222  int16 SourceEnergyDirectionExponent
     224   in32 SourceMeasurementMantissa
     228  int16 SourceMeasurementExponent
     230  int16 SourceMeasurementUnit
     232  int32 UnassignedInt1
     236  int32 UnassignedInt2

.. [1]
   The Society of Exploration Geophysicists
