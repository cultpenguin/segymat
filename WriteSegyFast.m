% WriteSegyFast: Fast writing of SegyFile 
%
% Example = 
%
%
%   [Data,SH,STH]=ReadSegyFast('file1.sgy');
%   % Change work on Data, the write the segy using the exact same SegyHeader 
%   % and SegyTraceHeader
%   
%   WriteSegyFast('file2.segy',D,SH,STH);
%
% Not: This will only work using the output from ReadSegyFast, which 
% does not read to actual TraceHeader information in a readable form (only
% as a binary BLOB)
%
% See also: ReadSegyFast
% 
function WriteSegyFast(filename,Data,SegyHeader,SegyTraceHeadersBinary)

segyid = fopen(filename,'w','b');   % ALL DISK FILES ARE IN BIG
                                    % ENDIAN FORMAT, ACCORDING SEG
                                    % Y rev 1
                                    
                                    
           
% Write SEGY HEADER
SegyHeader=PutSegyHeader(segyid,SegyHeader);

% convert IBM formatted data?
if SegyHeader.DataSampleFormat==1
end
%if (strcmp(SegyHeader.DataFormat,'uint32')==1), % IBM FLOATING POINT
if (SegyHeader.DataSampleFormat==1), % IBM FLOATING POINT
        % CONVERT FROM FLOATING POINT
        verbose_level=2;
        SegymatVerbose([mfilename,'Converting to IBM, DataFormat :',SegyHeader.DataFormat],verbose_level)
        Data=num2ibm(Data);
end;

% Write Segy Data
fwrite(segyid,[SegyTraceHeadersBinary;Data],SegyHeader.DataFormat);