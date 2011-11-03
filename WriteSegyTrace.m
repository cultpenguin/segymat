% WriteSegyTrace
%
% Call : 
%   [Data,SegyTraceHeader,SegyHeader]=WriteSegyTrace(filename,traces,Data,SegyTraceHeader,SegyHeader);  
%
%
%   Example : 
%   %% EXAMPLE : Change polarity of trace 10 and 12
%   itrace=[10,12];
%   [D,STH,SegyHeader]=ReadSegy(filename,'traces',itrace);
%   WriteSegyTrace(filename_copy,itrace,D,STH,SegyHeader)
%
%
%
function [Data,SegyTraceHeader,SegyHeader]=WriteSegyTrace(filename,traces,Data,SegyTraceHeader,SegyHeader);

if nargin<5
    SegyHeader=GetSegyHeader(filename);
end

if (length(traces)>1)   
    for i=1:length(traces)
        i
        [Data(:,i),SegyTraceHeader(i)]=WriteSegyTrace(filename,traces(i),Data(:,i),SegyTraceHeader(i),SegyHeader);
    end
    
    return
end


endian='ieee-be'; % Big Endian is default

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPEN FILE HANDLE
if exist('endian')==1,
    SegymatVerbose([mfilename,' : ENDIAN : ',endian],1)
    segyid = fopen(filename,'r+',endian);
else
    endian='ieee-be';
    SegymatVerbose([mfilename,' : ENDIAN SET TO ',endian],0)
    segyid = fopen(filename,'r','ieee-be');  % ALL DISK FILES ARE IN BIG
end                                        % ENDIAN FORMAT, ACCORDING TO

Revision=SegyHeader.SegyFormatRevisionNumber;
if Revision>0, Revision=1; end

FormatName=SegyHeader.Rev(Revision+1).DataSampleFormat(SegyHeader.DataSampleFormat).name;
Format=SegyHeader.Rev(Revision+1).DataSampleFormat(SegyHeader.DataSampleFormat).format;
BPS=SegyHeader.Rev(Revision+1).DataSampleFormat(SegyHeader.DataSampleFormat).bps;
txt=['SegyRevision ',sprintf('%0.4g',Revision),', ',FormatName,'(',num2str(SegyHeader.DataSampleFormat),')'];


% move to proper location in segyfile
DataStart=3600+3200*SegyHeader.NumberOfExtTextualHeaders;
fseek(segyid,DataStart,'bof');       % Go to the beginning of the file


skip=240+(BPS/8)*SegyHeader.ns;
fseek(segyid,(traces-1)*skip,'cof');
%SegymatVerbose([num2str(traceinfile),' - SKIPPING TRACE ... ',num2str(outtrace)],2)

TraceStart=ftell(segyid);

PutSegyTrace(segyid,Data,SegyTraceHeader,SegyHeader);

%STH=GetSegyTraceHeader(segyid,TraceStart,Format,SegyHeader.ns,[]);
%Data=GetSegyTraceData(segyid,STH.ns,SegyHeader);


fclose(segyid);