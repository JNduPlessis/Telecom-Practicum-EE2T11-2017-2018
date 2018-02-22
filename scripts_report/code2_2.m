%Time Frequency Plot
%Author: Nicolaas du Plessis
close all; clear; clc;

load train

%Time axis
time_length = length(y)/Fs;
Sample_lengths = 0.02;

coloms = fix(Fs.*Sample_lengths); %Amount of Samples
rows = fix(length(y)/coloms); %Amount of Blocks
trunc_l = coloms * rows;
y_trunc = y(1:trunc_l);

X = reshape(y_trunc, coloms, rows);
Y = fftshift(abs(fft(X)));

t = linspace(0,time_length,length(y));
f = linspace(-Fs/2000,Fs/2000,coloms);

subplot(211)
plot(f,Y,'LineWidth',1.5);
axis([-4 4 0 35]); grid on
xlabel('Frequency (kHz)','Fontsize',15); ylabel('Count','Fontsize',15)
title('20 ms Segment DFT of Train','Fontsize',15)

subplot(212)
imagesc(t,f,Y)
xlabel('Time (s)','Fontsize',15); ylabel('Frequency (kHz)','Fontsize',15)
title('Time Frequency Plot of Train','Fontsize',15)