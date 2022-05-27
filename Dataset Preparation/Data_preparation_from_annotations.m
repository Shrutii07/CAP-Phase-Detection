 clc;clear all;close all;

A = readtable('n1.txt');                    % Reads Annotation File and save in A

[hdr, record] = edfread('n1.edf');
disp('Saving record and hdr files'); save('Record&hdr\record_n1_f4c4.mat','record','-v7.3');
save('Record&hdr\hdr_n1_f4c4.mat','hdr'); disp('Saved')

%disp('Loading files');load('Record&hdr\record_n11.mat')                % Load edf data
%load('Record&hdr\hdr_n11.mat'); disp('Loaded')                         % Load header file
%% Find index for the channel C4A1 or C3A2
Index_c = find(contains(hdr.label,'F4C4'));

%% Get EEG corresponding to the channel C4A1 or C3A2
val = record(Index_c,:);  

%% Get whether the event occuring is A or B
Event = A.Event;

%% Set sampling frequency dependent on the considered subject (set manually)
SampleRate = 512;
Min_Duration = 2*SampleRate;                % Minimum duration for segmenting (2 sec)
%% Get the duration of the 'Event' from annotation file
Dur = A.Duration_s_;

%% Get the time stamp of the 'Event' from annotation file
Time = A.Time_hh_mm_ss_;

%% Get start time from the header file
Start_Time_cell = split(hdr.starttime,'.');

%% Get time in seconds (Consider this as reference i.e. 0th instance)
Start_time = str2num(Start_Time_cell{1})*3600+str2num(Start_Time_cell{2})*60+str2num(Start_Time_cell{3});

%% Get time matrix and index by subtracting the reference point
Time_sec = [];
for i = 1:length(Time)
    %T_cell = split(Time{i},'.');
    T_cell = split(char(Time(i),'hh:mm:ss'),':');
    hh = str2num(T_cell{1});
    mm = str2num(T_cell{2});
    ss = str2num(T_cell{3});
    if hh < 12
        hh = hh+24;
    end
    Time_sec = [Time_sec; hh*3600+mm*60+ss];
end
Time_sec_loc = Time_sec-Start_time;

%% A1
% Get index for the A1 event
disp('Getting A1 samples')
Index = find(contains(Event,'MCAP-A1'));

% Get timestamp in seconds for A1
Idx_CAP = Time_sec_loc(Index);

% Get duration for A1 and multiply by sampling frequency
Dur_CAP = Dur(Index).*SampleRate;

% Empty set for storing A1 phase data
Data_CAP = cell(length(Dur_CAP),1);
for j = 1:length(Dur_CAP)
    % Extracting the data using time stamp in seconds and duration
    Data_CAP{j} = val(Idx_CAP(j)*SampleRate+1:Idx_CAP(j)*SampleRate+Dur_CAP(j));
end
Data_A1 = [];
% Segmenting the data in 2 seconds chunks
% Rejecting the extra data that cannot fit in 2 sec duration
for k = 1:length(Data_CAP)
    Data_temp = Data_CAP{k};
    l = floor(length(Data_temp)/Min_Duration);
    Data_temp = Data_temp(1:l*Min_Duration);
    Data_temp1 = transpose(reshape(Data_temp,[Min_Duration,l]));
    Data_A1 = [Data_A1;Data_temp1];
end
[a b] = size(Data_A1);
Data_A1 = [Data_A1 1*ones(a,1)];
%% A2
disp('Fetching A2 samples')
% Get index for the A2 event
Index = find(contains(Event,'MCAP-A2'));

% Get timestamp in seconds for A2
Idx_CAP = Time_sec_loc(Index);

% Get duration for A2 and multiply by sampling frequency
Dur_CAP = Dur(Index).*SampleRate;

% Empty set for storing A2 phase data
Data_CAP = cell(length(Dur_CAP),1);
for j = 1:length(Dur_CAP)
     % Extracting the data using time stamp in seconds and duration
    Data_CAP{j} = val(Idx_CAP(j)*SampleRate+1:Idx_CAP(j)*SampleRate+Dur_CAP(j));
end
Data_A2 = [];
% Segmenting the data in 2 seconds chunks
% Rejecting the extra data that cannot fit in 2 sec duration
for k = 1:length(Data_CAP)
    Data_temp = Data_CAP{k};
    l = floor(length(Data_temp)/Min_Duration);
    Data_temp = Data_temp(1:l*Min_Duration);
    Data_temp1 = transpose(reshape(Data_temp,[Min_Duration,l]));
    Data_A2 = [Data_A2;Data_temp1];
end
[a b] = size(Data_A2);
Data_A2 = [Data_A2 2*ones(a,1)];
%% A3
disp('A3 samples')
% Get index for the A3 event
Index = find(contains(Event,'MCAP-A3'));

% Get timestamp in seconds for A3
Idx_CAP = Time_sec_loc(Index);

% Get duration for A3 and multiply by sampling frequency
Dur_CAP = Dur(Index).*SampleRate;

% Empty set for storing A3 phase data
Data_CAP = cell(length(Dur_CAP),1);
for j = 1:length(Dur_CAP)
     % Extracting the data using time stamp in seconds and duration
    Data_CAP{j} = val(Idx_CAP(j)*SampleRate:Idx_CAP(j)*SampleRate+Dur_CAP(j));
end
Data_A3 = [];
% Segmenting the data in 2 seconds chunks
% Rejecting the extra data that cannot fit in 2 sec duration
for k = 1:length(Data_CAP)
    Data_temp = Data_CAP{k};
    l = floor(length(Data_temp)/Min_Duration);
    Data_temp = Data_temp(1:l*Min_Duration);
    Data_temp1 = transpose(reshape(Data_temp,[Min_Duration,l]));
    Data_A3 = [Data_A3;Data_temp1];
end
[a b] = size(Data_A3);
Data_A3 = [Data_A3 3*ones(a,1)];
%%
disp('B')
% Get index for the B event
Sleep_Stage = A.Sleep;
Index2 = find(~contains(Event,'MCAP-A') & ~contains(Sleep_Stage,'W') & ~contains(Sleep_Stage,'R'));

% Get timestamp in seconds for B
Idx_NoA = (Time_sec_loc(Index2));

% Get timestamp in seconds for B
Dur_NoA = Dur(Index2).*SampleRate;

% Empty set for storing A1 phase data
Data_NoA = cell(length(Dur_NoA),1);

for j = 1:length(Dur_NoA)-1
     % Extracting the data using time stamp in seconds and duration
     % Rejcecting the B data in whuch there is a possibility 
    if((Event{Index2(j)+1} ~= "MCAP-A1") || (Event{Index2(j)+1} ~= "MCAP-A2") || (Event{Index2(j)+1} ~= "MCAP-A3"))
        Data_NoA{j} = val(Idx_NoA(j)*SampleRate+1:Idx_NoA(j)*SampleRate+Dur_NoA(j));
    end
end
Data_NA = [];
% Segmenting the data in 2 seconds chunks
% Rejecting the extra data that cannot fit in 2 sec duration
for k = 1:length(Data_NoA)
    Data_temp = Data_NoA{k};
    l = floor(length(Data_temp)/Min_Duration);
    Data_temp = Data_temp(1:l*Min_Duration);
    Data_temp1 = transpose(reshape(Data_temp,[Min_Duration,l]));
    Data_NA = [Data_NA;Data_temp1];
end
[a b] = size(Data_NA);
Data_NA = [Data_NA zeros(a,1)];

%% Save 
disp('Saving data...')
save('DATA_A1_A2_A3_B\n1_A1_F4C4.mat','Data_A1','-v7');
save('DATA_A1_A2_A3_B\n1_A2_F4C4.mat','Data_A2','-v7');
save('DATA_A1_A2_A3_B\n1_A3_F4C4.mat','Data_A3','-v7');
save('DATA_A1_A2_A3_B\n1_B_F4C4.mat','Data_NA','-v7');
disp('Done')