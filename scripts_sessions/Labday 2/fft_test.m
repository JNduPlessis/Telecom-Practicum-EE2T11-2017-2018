clear; close all; clc;

%Generate Sine Wave
fs = 44100; %Hz
time = 1; %second
t = linspace(0,fs*time,fs/time);
f = 1000; %Hz (middle C)
y = sin(2.*pi.*f.*t);

sound(y,fs)

freq=linspace(-fs/2000,fs/2000,length(y));
Y = fftshift(abs(fft(y)));

plot(freq,Y,'LineWidth',1,'Color','black');
axis([-8 8 0 1000]); grid on;
xlabel('Frequency [kHz]','Fontsize',15); ylabel('Counts','Fontsize',15)
title('FFT of Gong','Fontsize',15)