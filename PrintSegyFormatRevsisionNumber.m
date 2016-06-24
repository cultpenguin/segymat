% PrintSegyFormatRevsisionNumber: Prints/returns the SEGY format revision number
%
% Call: 
%     Revision=PrintSegyFormatRevsisionNumber(SegyHeader);
%     Revision=PrintSegyFormatRevsisionNumber(SegyHeader,vlevel);
%

function Revision=PrintSegyFormatRevsisionNumber(SegyHeader,vlevel);
if nargin<2
    vlevel=0;
end
Revision=str2num(dec2base(SegyHeader.SegyFormatRevisionNumber,16))/100;
SegymatVerbose(sprintf('%s: Using SEG Y revision %3.2f',mfilename,Revision),vlevel)