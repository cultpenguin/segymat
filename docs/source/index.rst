.. SegyMAT documentation master file, created by
   sphinx-quickstart on Thu Feb  7 21:28:09 2019.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to SegyMAT's documentation!
===================================

© `Thomas Mejer Hansen <mailto:thomas.mejer.hansen@gmail.com>`__,
2001-2019

SegyMAT is a set of m-files for reading and writing SEG-Y files from
`Matlab <http://mathworks.,com>` and
`Octave <https://www.gnu.org/software/octave/>`, that aims to

-  completely support SEG-Y revision 0 and 1;
-  be easy to use in other projects;
-  be a Swiss Army knife dealing with the SEGY-Y format in
   Matlab/Octave.;

SegyMAT is not lightning fast. SegyMAT makes heavy use of 'structures'.
Unfortunately structures are not very effective in terms of speed in
Matlab. (Or they have not been implemented very effectively in SegyMAT).
However structures make the implementation and maintenance easier, and
the code (hopefully) easy to read. That said, some effort has been made
to optimize SegyMAT for speed.

The latest **stable** version of SegyMAT is available from
`Sourceforge <https://sourceforge.net/projects/segymat/>`__.

The current **development** version of SegyMAT is available from
`Github <https://github.com/cultpenguin/segymat>`__.

Quickstart:

::

    [Data,SegyTraceHeaders,SegyHeader]=ReadSegy('f11_02673_45Hz.segy');
    wiggle([SegyTraceHeaders.TraceNumber],SegyHeader.time,Data,'VA',.006);
    xlabel('Trace Number');ylabel('Time (s)')

License (LGPL)
--------------

| This library is free software; you can redistribute it and/or
| modify it under the terms of the `GNU Lesser General Public
  License <http://www.gnu.org/copyleft/lesser.html>`__ as published by
  the Free Software Foundation; either version 2.1 of the License, or
  (at your option) any later version. This program is distributed in the
  hope that it will be useful, but WITHOUT ANY WARRANTY; without even
  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  PURPOSE. See the GNU Lesser General Public License for more details.
  You should have received a copy of the GNU Lesser General Public
  License along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
  USA.





.. toctree::
   :maxdepth: 2
   :caption: Contents:

   install
   format
   segyreading
   segywriting
   misc
   acknowledgement
   revision
   segymat-functions



Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
