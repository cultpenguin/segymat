% WriteSu : writes seismic data in the Seismic Unix format
%
% EX
% WriteSu('datacube.su',data,'dt',.004,'Inline3D',Inline,'Crossline3D',Crossline,'cdpX',X,'cdpY',Y);
%
% to use a specific SEG revision use :
% 
% to use a specific Data Sampling Format use :
% WriteSu('test.su',seisdata,'dsf',1); % IBM FLAOTING POINT
%
% WriteSu('test.su',seisdata,'dsf'); 
%

%
% (C) 2001-2004, Thomas Mejer Hansen, thomas@cultpenguin.com
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
function WriteSu(filename,data,varargin);

[ns,ntraces]=size(data);

if exist('dt')~=1
  dt=0.004;
  SegymatVerbose([mfilename,' - No dt set. Using dt=',num2str(dt)])
end

for i=1:2:length(varargin)
  var=varargin{i};
  val=varargin{i+1};
  eval([var,'=[',num2str(val),'];']);
end  


SegyHeader.SegyFormatRevisionNumber=256;
SegyHeader.DataSampleFormat=5;
SegyHeader.Rev=GetSegyHeaderBasics;


% OPEN SEGY FILE HANDLE
segyid = fopen(filename,'w'); 
% segyid = fopen(filename,'w','b'); % BIG ENDIAN

SegyTraceHeader=InitSegyTraceHeader(ns,dt*1e+6);
for i=1:ntraces;
    if (i/100)==round(i/100),SegymatVerbose(['writing trace ',num2str(i),' of ',num2str(ntraces)],1),end
    % Basic TraceHeader information
    %SegyTraceHeader.ns=ns;
    %SegyTraceHeader.dt=dt.*1e+6;
    % Update TraceHeader information if available
    if exist('cdpX')==1,SegyTraceHeader.cdpX = cdpX(i);end
    if exist('offset')==1,SegyTraceHeader.offset = offset(i);end
    if exist('cdpY')==1,SegyTraceHeader.cdpY = cdpY(i);end
    if exist('Inline3D')==1,SegyTraceHeader.Inline3D = Inline3D(i);end
    if exist('Crossline3D')==1,SegyTraceHeader.Crossline3D=Crossline3D(i);end
    % Write the Trace
    PutSegyTrace(segyid,data(:,i),SegyTraceHeader,SegyHeader);
end

% CLOSE SEGY FILE HANDLE                                 
                                    
fclose(segyid);                                  
