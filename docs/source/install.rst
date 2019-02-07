Installation and requirements
=============================

SegyMAT has been developed and tested using Matlab (R2016a) running on
Linux and Windows 10. Any other Matlab supported platform should work.

As of version 1.02 Octave (version >2.1.64) is supported as well.

No Matlab toolboxes are required.

Local Installation
------------------

Running Matlab with Java extensions (the default), the path can be set
using the ``pathtool`` command, by selecting the install directory (and
subfolder GUI), and save the path and you are done:

::

    >> pathtool

To install without using the commandline, one can can manually add the
install folder to Matlabs search path. If the install directory of
SegyMAT is ``/usr/share/matlab/SegyMAT`` simply use:

::

    >> addpath /usr/share/matlab/SegyMAT -begin
    >> addpath /usr/share/matlab/SegyMAT/GUI -begin

Global Installation
-------------------

For a system wide installation add the following line (substituting the
location of the directory)

::

    >> addpath /usr/share/matlab/SegyMAT -begin
    >> addpath /usr/share/matlab/SegyMAT/GUI -begin

to ``pathdef.m``, usually located in
``$MATLAB_INSTALL/toolbox/local/pathdef.m``
