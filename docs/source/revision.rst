Revisions
=========

+----------+-------------+-------------------+
| Version  | Date        | Changes           |
+==========+=============+===================+
| 1.6      | 2016-10-10  | Updated manual    |
|          |             | (switched to      |
|          |             | `gitbook <http:// |
|          |             | gitbook.com/>`__  |
|          |             | and small         |
|          |             | bug-fixes'.       |
+----------+-------------+-------------------+
| 1.5      | 2011-10-28  | ReadSegy.m :      |
|          |             | Added option      |
|          |             | 'traces' that     |
|          |             | allow fast        |
|          |             | reading of        |
|          |             | specific traces.  |
|          |             | When the 'minmax' |
|          |             | option is used,   |
|          |             | the corresponding |
|          |             | traces are first  |
|          |             | located through   |
|          |             | header files, and |
|          |             | then data are     |
|          |             | read using the    |
|          |             | 'traces' options. |
|          |             | For larger files  |
|          |             | this cause the    |
|          |             | reading time to   |
|          |             | decrease          |
|          |             | significantly     |
|          |             | when using the    |
|          |             | 'minmax' option.  |
+----------+-------------+-------------------+
| 1.4      | 2011-04-05  | ReadSegyHeader.m  |
|          |             | : Fixed           |
|          |             | 'SkipData'        |
|          |             | conflict with     |
|          |             | Robust Control    |
|          |             | Toolbox. Disabled |
|          |             | Waitbar. wiggle.m |
|          |             | : Allowed         |
|          |             | specification of  |
|          |             | line color. Allow |
|          |             | overlaying wiggle |
|          |             | plots. Allow NaN  |
|          |             | value in 'VA'     |
|          |             | style plotting.   |
|          |             | ReadSu : Fixed    |
|          |             | typo in line 221. |
|          |             | MergeSegy.m :     |
|          |             | Added mfile to    |
|          |             | merge Segy Files. |
+----------+-------------+-------------------+
| 1.3      | 2011-01-20  | Added             |
|          |             | 'ReadSegyTraceHea |
|          |             | derValue'         |
|          |             | and               |
|          |             | 'WriteSegyTraceHe |
|          |             | aderValue'        |
|          |             | that can be used  |
|          |             | to read and write |
|          |             | the               |
|          |             | TraceHeaderValues |
|          |             | one by one. Much  |
|          |             | faster that       |
|          |             | reading the whole |
|          |             | dataset.          |
+----------+-------------+-------------------+
| 1.2      | 2009-01-01  | Updated GUI to    |
|          |             | work for Matlab   |
|          |             | R2008a. Enabled   |
|          |             | loading of        |
|          |             | partial segyfile  |
|          |             | (using time and   |
|          |             | header ranges)    |
|          |             | from GUI (ctrl    |
|          |             | X). Enabled       |
|          |             | editing of the    |
|          |             | textual file      |
|          |             | header (both      |
|          |             | ASCII and EBCDIC) |
+----------+-------------+-------------------+
| 1.11     | 2003-08-01  | Kristian Stormark |
|          |             | contributed a     |
|          |             | change to         |
|          |             | GetSegyTraceHeade |
|          |             | r                 |
|          |             | that reduce the   |
|          |             | number of disc    |
|          |             | operations        |
|          |             | causing a         |
|          |             | significant speed |
|          |             | up.               |
+----------+-------------+-------------------+
| 1.08     | 2007-03-01  | Urs Boeniger      |
|          |             | contributed a     |
|          |             | patch that allows |
|          |             | arbitrary         |
|          |             | SegyTraceHeaders  |
|          |             | to be specified   |
|          |             | for WriteSegy.m.  |
+----------+-------------+-------------------+
| 1.06     |             | Fixed a bug that  |
|          |             | casue a fixed     |
|          |             | length of 5011    |
|          |             | samples in        |
|          |             | ReadSu.           |
+----------+-------------+-------------------+
| 1.02     |             | Cleaning up code  |
|          |             | to work with      |
|          |             | Octave 2.1.57.    |
+----------+-------------+-------------------+
| 1.01     |             | 'jump' related    |
|          |             | fixes.            |
+----------+-------------+-------------------+
| 1.00     | 2004-11-15  | Cleaning up some  |
|          |             | Matlab 7.0        |
|          |             | specific bugs.    |
+----------+-------------+-------------------+
