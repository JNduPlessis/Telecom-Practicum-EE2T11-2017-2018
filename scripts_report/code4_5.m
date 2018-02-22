%Recording of audio samples
%Rijk van Wijk & Nicolaas du Plessis
clear; close all; clc;

%Parameters
Fs = 22050;
Pk_f = 3;
V_sound = 340;
T_am = 0.2; %Ambient Time Measurement Length


%Measure Ambient
pause(1) %Allow for short silence
recObj = audiorecorder(Fs,16,2);
recordblocking(recObj,T_am);
amb = getaudiodata(recObj);

amb_ave = mean(abs(amb)); %Average Ambient Level 

%Play and Record Training Sequence
[rec_vector,original,original_untrc] = send_refsignal(3,Fs,2);

%Calculte TDOA
max_1 = max(rec_vector(:,1));
max_2 = max(rec_vector(:,2));
loc_1 = find(rec_vector(:,1) > max_1/Pk_f);
loc_2 = find(rec_vector(:,2) > max_1/Pk_f);

t_tdoa = ((loc_1(1) - loc_2(1))/Fs);
d_tdoa = t_tdoa * V_sound;
disp('Distance between Targets (meters) is:')
disp(d_tdoa)

subplot(211)
plot(rec_vector(:,1))
title('Pulse at Source')
xlabel('Time (s)');
ylabel('Amplitude (normalized)');

subplot(212)
plot(rec_vector(:,2))
title('Pulse at Destination')
xlabel('Time (s)');
ylabel('Amplitude (normalized)');