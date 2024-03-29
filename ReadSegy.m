% ReadSegy : Reads a SEG Y rev 1 formatted file
%
% Call :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename);
%
% To read only sample number 123 (to get time slice):
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'it',123);
% To read time slice 0.5<t<5 :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'trange',.5,3);
% To read time trace number 100,110 and 150 :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'traces',[100 110 150]);
% Skip every 5th trace :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'jump',5);
% Read data in a CDP header range : 5000<cdp<5800 :
% (change cdp to any other valid TraceHeader value)
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'minmax','cdp',5000,5800);
% Read only the header values (Data will return empty)
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'SkipData',1);
%
% SEG-Y format revision number can be '0' (1975) or
% '100' (similar to '1') (2002).
% By default the SEG-Y format revision number is read in the
% binary header, but this can be overruled using :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'revision',0);
%
% Read using a specific Data Sample Format :
% Rev 0, IBM FLOATING POINT
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'revision',0,'dsf',1);
% Rev 1, IEEE FLOATING POINT
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'revision',1,'dsf',5);
%
% A SegyHeader can be forced on the SEG-Y file using :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'SegyHeader',SegyHeader);
% The SegyHeader can be obtain by GetSegyHeader(segyfilename), and
% then edited.
%
% To read using little endian :
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'endian','l');
%
% Combine any combination of the above
% [Data,SegyTraceHeaders,SegyHeader]=ReadSegy(filename,'jump',1,'minmax','cdp',5300,5400);
%
%
% Plot the data using e.g.
% imagesc([SegyTraceHeaders.cdp],SegyHeader.time,Data);
% wiggle([SegyTraceHeaders.TraceNumber],SegyHeader.time,Data);
%
% (C) 2003-2012, Thomas Mejer Hansen, thomas.mejer.hansen@gmail.com
%

% Implemented using the syntax of the SEG-Y revised format :
% SEGY-Y rev 0, SEG-Y rev 1 as described in
% http://seg.org/publications/tech-stand/
%
% Extended Textual Header is not yet tested
% If you would like it implemented, please send me an SEGY file with
% that sort of information, as well as a description of the segy file
%
%
% (C) 2001-2012, Thomas Mejer Hansen, tmh@gfy.ku.dk/thomas@cultpenguin.com
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
%
%
%
% 0.1 : INitial Release
% 0.2 : Added SkipData var, to skip reading of data.
% 0.3 : May 01, 2002
%       Added ability to read in ever 'jump' traces.
%       Added ability to read in time range.
%       Added abiliy to read in header range (ex. mincdp to maxcdp).
%

% TODO : WHEN READING ONLY PART OF DATASET MAKE SURE TO ADJUST THE SEGY
% HEADER ACCORDINGLY !!!!!!

function [Data,SegyTraceHeaders,SegyHeader,HeaderInfo]=ReadSegy(filename,varargin);

if isoctave
    doWaitBar=0; % [1] show progress bar gui
    mfilename='ReadSegy';
else
    doWaitBar=0;
    mfilename='ReadSegy';
end

if nargout<2
    SkipSegyTraceHeaders=1;
else
    SkipSegyTraceHeaders=0;
end

SegymatVerbose(sprintf('%s: reading from %s',mfilename,filename),0)

dsf=[];
revision=[];
endian_tight=[];
tmin=[];tmax=[];
headermin=[];headermax=[];header=[];
jump=[];
SkipData=[];

endian='ieee-be'; % Big Endian is default


SegymatVerbose([mfilename,' : reading ',filename])

if ~(exist(filename)==2'),
    SegymatVerbose([mfilename,' : ', filename,' does not exist !'],-1)
    Data=[];SegyTraceHeaders=[];SegyHeader=[];HeaderInfo=[];
    return
end


% IF ONLY 'filename', AND one outpuet HAS BEEN
% SPECIFIED AS IN/OUTPUT, THEN USE THE FAST
% ALGORITHM FOR READING.
if (nargin==1)&&(nargout==1)
    [Data]=ReadSegyFast(filename);
    return
end

SegymatVerbose([mfilename,' - Checking Varargin'],90)

ninput=nargin;
% NEXT TWO LINES TO ENUSRE THAT VARARGIN CAN BE PASSED TO FUNCTION
if ninput==2
    % CALL USING VARARGIN
    ninput=1+length(varargin{1});
    varargin=varargin{1};
else
    % DIRECT CALL
    ninput=length(varargin);
end




% TRANSFORM VARARGING INTO PARAMETERS
traces=[];
cargin=1;
while (cargin<ninput)
    SegymatVerbose([mfilename,' - Converting varargin, ',num2str(cargin)],90)

    if strcmp(varargin{cargin},'jump')
        cargin=cargin+1;
        eval(['jump=',num2str(varargin{cargin}),';']);
        SegymatVerbose(['JUMP : Read only every ',num2str(jump),'th trace'])
    end

    if strcmp(varargin{cargin},'traces')
        cargin=cargin+1;
        traces=varargin{cargin};
        SegymatVerbose(['TRACES : Read only every ',num2str(jump),'th trace'])
    end

    if strcmp(varargin{cargin},'minmax')
        SkipSegyTraceHeaders=0;
        cargin=cargin+1;
        eval(['header=''',varargin{cargin},''';']);
        cargin=cargin+1;
        eval(['headermin=',num2str(varargin{cargin}),';']);
        cargin=cargin+1;
        eval(['headermax=',num2str(varargin{cargin}),';']);
        SegymatVerbose(['MIN MAX : Using header ',header,' from ',num2str(headermin),' to ',num2str(headermax)])

        h=ReadSegyTraceHeaderValue(filename,'key',header);
        minmax_traces=find(h>=headermin & h<=headermax);


        if isempty(traces)
            traces=minmax_traces;
        else
            traces=intersect(traces,minmax_traces);
        end

    end

    if strcmp(varargin{cargin},'trange')
        cargin=cargin+1;
        eval(['tmin=',num2str(varargin{cargin}),';']);
        cargin=cargin+1;
        eval(['tmax=',num2str(varargin{cargin}),';']);
        SegymatVerbose(['TRANGE : tmin=',num2str(tmin),' tmax=',num2str(tmax)])
    end

    % ENDIAN FORMAT
    if strcmp(varargin{cargin},'endian')
        cargin=cargin+1;
        eval(['endian_tight=varargin{cargin};'])
        if endian_tight=='l',
            SegymatVerbose(['USING LITTLE ENDIAN TYPE'])
            endian='ieee-le';
        else
            SegymatVerbose(['USING BIG ENDIAN TYPE'])
        end
    end

    if strcmp(varargin{cargin},'it')
        cargin=cargin+1;
        eval(['it=',num2str(varargin{cargin}),';']);
        SegymatVerbose(['it=',num2str(it)],-1)
    end

    if strcmp(varargin{cargin},'revision')
        cargin=cargin+1;
        eval(['revision=',num2str(varargin{cargin}),';']);
        SegymatVerbose(['USING REVISION : rev=',num2str(revision)])
    end

    if strcmp(varargin{cargin},'dsf')
        cargin=cargin+1;
        eval(['dsf=',num2str(varargin{cargin}),';']);
        SegymatVerbose(['USING Data Sample Format : dsf=',num2str(dsf)])
    end

    if strcmp(varargin{cargin},'SkipData')
        cargin=cargin+1;
        eval(['SkipData=',num2str(varargin{cargin}),';']);
        SegymatVerbose(['SKIPPNG DATA - READING ONLY HEADERS'])
    end

    if strcmp(varargin{cargin},'SegyHeader')
        cargin=cargin+1;
        SegyHeader=varargin{cargin};
        SegymatVerbose(['USING LOADED SEGYHEADER'])
    end

    cargin=cargin+1;

end


if isempty(SkipData)==1,
    SegymatVerbose([mfilename,' : Skip data is not set (defautls to 0)'],90)
    SkipData=0; % [0] READ ONLY HEADER VALUES, [1] READ IN ALL DATA
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPEN FILE HANDLE
if exist('endian')==1,
    SegymatVerbose([mfilename,' : ENDIAN : ',endian],1)
    segyid = fopen(filename,'r',endian);
else
    endian='ieee-be';
    SegymatVerbose([mfilename,' : ENDIAN SET TO ',endian],0)
    segyid = fopen(filename,'r','ieee-be');  % ALL DISK FILES ARE IN BIG
end                                        % ENDIAN FORMAT, ACCORDING TO
% SEGY Y rev 1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BINARY HEADERS
if exist('SegyHeader')==0
    SegyHeader=GetSegyHeader(segyid);
else
    SegymatVerbose([mfilename,' - Using supplied SegyHeader'])
end

% APPLY CHANGES TO SEGY HEADER IF NEEDE
if isempty(revision)==0,
    SegyHeader.SegyFormatRevisionNumber=revision;
    SegymatVerbose([mfilename,' - Manually set SEG-Y revision to ',num2str(revision)])
end
if isempty(dsf)==0,
    SegyHeader.DataSampleFormat=dsf;
end



% JUST SOME INFORMATION TO WRITE TO SCREEN :

Revision=SegyHeader.SegyFormatRevisionNumber;
if Revision>0, Revision=1; end

if (SegyHeader.DataSampleFormat>length(SegyHeader.Rev(Revision+1).DataSampleFormat));
    SegymatVerbose([mfilename,' : WARNING : YOU HAVE SELECTED (OR THE FILE IS FORMATTED SUCH THAT) A DATASAMPLE FORMAT THAT IS NOT DEFINED. \nREMEBER IEEE IS NOT SPECIFIED IN THE SEGY REV0 STANDARD !'])

    if (Revision==0)
        SegymatVerbose([mfilename,' : TRYING TO USE REVISION 1 AS OPPOSED TO REVISION 0'])
        Revision=1;

        if (SegyHeader.DataSampleFormat>length(SegyHeader.Rev(Revision+1).DataSampleFormat));
            SegymatVerbose([mfilename,' : FATAL ERROR : STILL THE DATASAMPLE FORMAT IS NOT SUPPRTED - EXITING (Report error to tmh@gfy.ku.dk)'])
        else
            SegymatVerbose([mfilename,' : APPARENT SUCCES CHANING FROM Revision 0 to 1 - Continuing'])
            SegyHeader.SegyFormatRevisionNumber=256; % FORCING REVISION TO BE 1 !!!
        end

    end

end

FormatName=SegyHeader.Rev(Revision+1).DataSampleFormat(SegyHeader.DataSampleFormat).name;
Format=SegyHeader.Rev(Revision+1).DataSampleFormat(SegyHeader.DataSampleFormat).format;
BPS=SegyHeader.Rev(Revision+1).DataSampleFormat(SegyHeader.DataSampleFormat).bps;
txt=['SegyRevision ',sprintf('%0.4g',Revision),', ',FormatName,'(',num2str(SegyHeader.DataSampleFormat),')'];


ns=SegyHeader.ns;
% YOU CAN FORCE FixedLengthTraceFlag=1;
% This will make the code much faster (especially when using
% the 'jump' option) but reading data with varying trace lengt will fail.
% It is here since many old data sets with Constant trace length
% has FixedLengthTraceFlag=0;
%
% As of version 1.01 this has been enable by default.
% Change the variable below to '0' if you do not want this behaviour
%
SegyHeader.FixedLengthTraceFlag=1;


SegymatVerbose([mfilename,' : Reading Data'],90);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% READ DATA
fseek(segyid,0,'eof'); DataEnd=ftell(segyid);

DataStart=3600+3200*SegyHeader.NumberOfExtTextualHeaders;
fseek(segyid,DataStart,'bof');       % Go to the beginning of the file

ntraces=round((DataEnd-DataStart)./(240+(SegyHeader.ns)*(BPS/8)));

SegymatVerbose(['Number of Samples Per Trace=',num2str(SegyHeader.ns)])
SegymatVerbose(['Number of Traces=',num2str(ntraces)])
if (ntraces~=round(ntraces))
    SegymatVerbose(['Trace lengths seems to vary. trying to read the file anyway'])
end

existJump=~isempty(jump);
existHeader=~isempty(header);
existTmin=~isempty(tmin);
existTmax=~isempty(tmax);

out_ntraces=ntraces;
if existJump==1, out_ntraces=ceil(ntraces/jump);end
if ~isempty(traces), out_ntraces=length(traces);end


dwaitbar=10;
if DataEnd./jump>1e+6, dwaitbar=10;  end
if DataEnd./jump>1e+7, dwaitbar=50;  end
if DataEnd./jump>1e+8, dwaitbar=200;  end
traceinfile=0;
outtrace=0;
tic;
toc_old=toc;
if doWaitBar==1;
    hw=waitbar(0,['Reading Segy - ',txt]);
end


% LOOP OVER TRACES

t0=now;
tlast=t0;
pos0=ftell(segyid);



while (~(ftell(segyid)>=DataEnd))

    usetrace=1; % DEFAULT USING TRACE WHEN [1].

    traceinfile=traceinfile+1;

    if ~isempty(traces);
        if (traceinfile>length(traces))
            break
        else
            traceskip=240+(BPS/8)*SegyHeader.ns;
            skip=DataStart+(traces(traceinfile)-1)*traceskip;
            fseek(segyid,skip,'bof');
        end
    end


    ishow=1000;
    itime=2; % Min time between verbose info to screen   in seconds
    t_since_last=(now-tlast)*24*3600; % Time in seconds since last screen update
    %t_since_last=1;
    if (((traceinfile/ishow)==round(traceinfile/ishow))&&(t_since_last>itime)),
        tnow=now;
        tlast=tnow;
        posnow=ftell(segyid);
        tend=t0+DataEnd.*(tnow-t0)./(posnow-pos0);
        tleft=(tend-tnow)*3600*24;
        txt=sprintf('Reading trace %d/%d, (%5.0fs left) (est end %s)',traceinfile,ntraces,tleft,datestr(tend));
        toc_old=toc;
        SegymatVerbose(txt,-1)
    end
    TraceStart=ftell(segyid);

    % IF 'JUMP' IS SET THEN CHECK IF THIS TRACE SHOULD BE SKIPPED
    if existJump==1
        if (traceinfile/jump)~=round(traceinfile/jump), usetrace=0; end
    end

    if ((usetrace==0)&&(SegyHeader.FixedLengthTraceFlag==1)),
        % SKIP FORWARD IN FILE'
        skip=240+(BPS/8)*SegyHeader.ns;
        fseek(segyid,skip,'cof');
        SegymatVerbose([num2str(traceinfile),' - SKIPPING TRACE ... ',num2str(outtrace)],2)
    elseif (SegyHeader.FixedLengthTraceFlag==0)
        SegymatVerbose(sprintf('Using Fixed Length Trace as SegyHeader.FixedLengthTraceFlag=0',traceinfile),10);
        SingleSegyTraceHeaders=GetSegyTraceHeader(segyid,TraceStart,[]);
        SingleSegyData.data=GetSegyTraceData(segyid,SingleSegyTraceHeaders.ns,SegyHeader);
    else
        if SkipSegyTraceHeaders==1
            if exist('SingleSegyTraceHeaders','var');
                fseek(segyid,240,'cof');
            else
                %% make sure we have read at least one trace header
                SingleSegyTraceHeaders=GetSegyTraceHeader(segyid,TraceStart,[]);
            end
        else
            SingleSegyTraceHeaders=GetSegyTraceHeader(segyid,TraceStart,[]);
        end

        if exist('it','var')
            SingleSegyData.data=GetSegyTraceData(segyid,SegyHeader.ns,SegyHeader,0,it);
        else
            SingleSegyData.data=GetSegyTraceData(segyid,SegyHeader.ns,SegyHeader);
        end
        try%%
        if SingleSegyTraceHeaders.TraceNumber<1
            SingleSegyTraceHeaders.TraceNumber=traceinfile;
            SegymatVerbose(sprintf('TraceNumber malformatetd. Setting TraceNumber=%d',traceinfile),10);
        end
        end%%
        %SegymatVerbose(sprintf('ns=%d, Trace in line : %d, Trace in file : %d, ns=%10.5f dt=%10.5f',SingleSegyTraceHeaders.ns,SingleSegyTraceHeaders.TraceSequenceLine,SingleSegyTraceHeaders.TraceSequenceFile,SingleSegyTraceHeaders.ns,SingleSegyTraceHeaders.dt),10)


    end


    % IF HEADER MIN MAX HAS BEEN CHOSEN, THEN CHECK THAT TRACE IS GOOD ENOUGH
    if ((existHeader==1)&&(usetrace==1))
        headervalue=getfield(SingleSegyTraceHeaders,header);
        if ((headervalue<headermin)|(headervalue>headermax))
            usetrace=0;
        end
    end

    % USE THIS TRACE IF usetrace=1 !!
    if usetrace==1,
        %% IF TIME RANGE IS SPECIFIED, THEN EXTRACT THIS
        if (existTmin==1)&&(existTmax==1)
            % NEXT LINE SHOULD CONSIDER THAT ns in Trace and Segy Header
            % could vary !!!
            origtrange=[1:1:SegyHeader.ns].*SegyHeader.dt.*1e-6+SingleSegyTraceHeaders.DelayRecordingTime.*1e-3;
            gooddata=find(origtrange>tmin & origtrange<tmax);
            SingleSegyData.data=SingleSegyData.data(gooddata);
            % CHECK NEXT LINE TAHT DelatRec... is in micro seconds
            SingleSegyTraceHeaders.DelayRecordingTime=tmin.*1e+3;
            SingleSegyTraceHeaders.ns=length(gooddata);
            ns=length(gooddata); %  for use below
        end

        outtrace=outtrace+1;

        if (outtrace==1),
            % Preallocate RAM
            ta1=now;
            SegymatVerbose(sprintf('Pre allocating RAM ntraces=%d out_traces=%d',ntraces,out_ntraces));
            SegyData=repmat(struct('data',zeros(ns,1)),1,out_ntraces);
            if nargout>1
                SegyTraceHeaders=repmat(SingleSegyTraceHeaders,1,out_ntraces);
            end
            %whos SegyData SegyTraceHeaders
            %save T1
            ta2=now;
            t0=t0+ta2-ta1;
        end


        SegyData(outtrace).data=SingleSegyData.data;
        if nargout>1
            SegyTraceHeaders(outtrace)=SingleSegyTraceHeaders;
        end


        if doWaitBar==1,
            if ((outtrace/dwaitbar)==round(outtrace/dwaitbar))
                waitbar(ftell(segyid)/DataEnd,hw);
            end
        end

    end

end
%save T2
%whos SegyData SegyTraceHeaders

if outtrace==0
    SegymatVerbose(sprintf('%s : No traces read!',mfilename));
    SegyTraceHeaders=[];
    Data=[];
    return
end

if doWaitBar==1
    try
        close(hw);
    end
end
SegymatVerbose([mfilename,' : Elapsed time ',num2str(toc),'  ended at ',datestr(now)]);
t=outtrace;

% Write time to SegyHeader
SegyHeader.ns=ns;
if SkipSegyTraceHeaders==1;
    SegyHeader.time=[1:1:SegyHeader.ns].*SegyHeader.dt./1e+6;
else
    SegyHeader.time=[1:1:SegyHeader.ns].*SegyHeader.dt./1e+6+SegyTraceHeaders(1).DelayRecordingTime./1e+3;
end
% Make sure that only read SegyTraceHEaders are returned
if SkipSegyTraceHeaders==0;
    if outtrace~=out_ntraces
        SegyTraceHeaders=SegyTraceHeaders(1:outtrace);
    end
end
% MOVE DATA from SegyData.data to a regular variable
% THIS STEP COULD BE AVOIDED WHEN FixedTraceLength=1, which is almost
% allways the case... Should speed up things and reduce memory reqs.
if SkipData==1,
    Data=[];
else

    try
        Data=[SegyData(1:outtrace).data];
    catch


        Data=zeros(ns,outtrace);
        for i=1:outtrace
            try
                Data(:,i)=SegyData(i).data;
            catch
                errmsg=lasterr;
                if isempty(SegyData(i).data)
                    errmsg='Empty data in trace';
                elseif (strfind(errmsg, 'In an assignment  A(:,matrix) = B, the number of rows in A and B'))
                    nns=length(SegyData(i).data);
                    if nns<ns
                        errmsg='Length of trace varies - padding with zeros';
                        Data(1:nns,i)=SegyData(i).data;
                    else
                        errmsg='Length of trace varies - truncating';
                        Data(:,i)=SegyData(i).data(1:ns);
                    end
                end
                SegymatVerbose(sprintf('Had a problem at trace %d : %s',i,errmsg))
            end
        end
    end
end

fclose(segyid)


