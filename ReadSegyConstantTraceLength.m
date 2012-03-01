% ReadSegy : Reads a SEG Y rev 1 formatted file, and forces Constant Trcae Length
%
% Call :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegyConstantTraceLength(filename);
%
% See ReadSegy for optional arguments
%
% See also : ReadSegy
%
function [Data,SegyTraceHeaders,SegyHeader]=ReadSegyConstantTraceLength(filename,varargin);

SegyHeader=ReadSegyHeader(filename);
SegyHeader.FixedLengthTraceFlag=1;

[Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,varargin);