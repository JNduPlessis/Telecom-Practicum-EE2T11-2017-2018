%Touch-Tone Detection
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

%Global Settings
load touch.mat
Fs = 8192;

%Calculations
y = x1;
time_length = length(y)/Fs;
coloms = fix(Fs/50); %Amount of Samples per 20ms
rows = fix(length(y)/coloms); %Amount of Blocks of 20ms
trunc_l = coloms * rows;
y_trunc = y(1:trunc_l);
X = reshape(y_trunc, coloms, rows);
Y = fftshift(abs(fft(X)));
t = linspace(0,time_length,length(y));
f = linspace(-Fs/2000,Fs/2000,coloms);

subplot(221)
imagesc(t,f,Y); axis([0 0.93 0.4 1.8])
xlabel('Time (s)','Fontsize',15); ylabel('Frequency (kHz)','Fontsize',15)
title('Time Frequency Plot of Dail Tone x1','Fontsize',15)


y = x2;
time_length = length(y)/Fs;
coloms = fix(Fs/50); %Amount of Samples per 20ms
rows = fix(length(y)/coloms); %Amount of Blocks of 20ms
trunc_l = coloms * rows;
y_trunc = y(1:trunc_l);
X = reshape(y_trunc, coloms, rows);
Y = fftshift(abs(fft(X)));
t = linspace(0,time_length,length(y));
f = linspace(-Fs/2000,Fs/2000,coloms);

subplot(223)
imagesc(t,f,Y); axis([0 0.93 0.4 1.8])
xlabel('Time (s)','Fontsize',15); ylabel('Frequency (kHz)','Fontsize',15)
title('Time Frequency Plot of Dail Tone x2','Fontsize',15)


y = hardx1;
time_length = length(y)/Fs;
coloms = fix(Fs/50); %Amount of Samples per 20ms
rows = fix(length(y)/coloms); %Amount of Blocks of 20ms
trunc_l = coloms * rows;
y_trunc = y(1:trunc_l);
X = reshape(y_trunc, coloms, rows);
Y = fftshift(abs(fft(X)));
t = linspace(0,time_length,length(y));
f = linspace(-Fs/2000,Fs/2000,coloms);

subplot(222)
imagesc(t,f,Y); axis([0 0.77 0.4 1.8])
xlabel('Time (s)','Fontsize',15); ylabel('Frequency (kHz)','Fontsize',15)
title('Time Frequency Plot of Dail Tone hardx1','Fontsize',15)


y = hardx2;
time_length = length(y)/Fs;
coloms = fix(Fs/50); %Amount of Samples per 20ms
rows = fix(length(y)/coloms); %Amount of Blocks of 20ms
trunc_l = coloms * rows;
y_trunc = y(1:trunc_l);
X = reshape(y_trunc, coloms, rows);
Y = fftshift(abs(fft(X)));
t = linspace(0,time_length,length(y));
f = linspace(-Fs/2000,Fs/2000,coloms);

subplot(224)
imagesc(t,f,Y); axis([0 0.77 0.4 1.8])
xlabel('Time (s)','Fontsize',15); ylabel('Frequency (kHz)','Fontsize',15)
title('Time Frequency Plot of Dail Tone hardx2','Fontsize',15)