%Time Domain and Frequency Domain
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

load train
%Time axis
time_length = (length(y)/Fs);
t = linspace(0,time_length,length(y));
freq=linspace(-Fs/2000,Fs/2000,length(y));
Y = fftshift(abs(fft(y)));

subplot(231)
plot(t,y,'LineWidth',1,'Color','black');
axis([0 1.6 -1 1]); grid on;
xlabel('Time [s]','Fontsize',15); ylabel('Amplitude [normalized]','Fontsize',15)
title('Spectrum of Train','Fontsize',15)

subplot(234)
plot(freq,Y,'LineWidth',1,'Color','black');
axis([-4 4 0 1000]); grid on;
xlabel('Frequency [kHz]','Fontsize',15); ylabel('Counts','Fontsize',15)
title('FFT of Train','Fontsize',15)

load gong
%Time axis
time_length = length(y)/Fs;
t = linspace(0,time_length,length(y));
freq=linspace(-Fs/2000,Fs/2000,length(y));
Y = fftshift(abs(fft(y)));

subplot(232)
plot(t,y,'LineWidth',1,'Color','black');
axis([0 5.1 -1 1]); grid on;
xlabel('Time [s]','Fontsize',15); ylabel('Amplitude [normalized]','Fontsize',15)
title('Spectrum of Gong','Fontsize',15)

subplot(235)
plot(freq,Y,'LineWidth',1,'Color','black');
axis([-4 4 0 1000]); grid on;
xlabel('Frequency [kHz]','Fontsize',15); ylabel('Counts','Fontsize',15)
title('FFT of Gong','Fontsize',15)

load handel
%Time axis
time_length = length(y)/Fs;
t = linspace(0,time_length,length(y));
freq=linspace(-Fs/2000,Fs/2000,length(y));
Y = fftshift(abs(fft(y)));

subplot(233)
plot(t,y,'LineWidth',1,'Color','black');
axis([0 9 -1 1]); grid on;
xlabel('Time [s]','Fontsize',15); ylabel('Amplitude [normalized]','Fontsize',15)
title('Spectrum of Handel','Fontsize',15)

subplot(236)
plot(freq,Y,'LineWidth',1,'Color','black');
axis([-4 4 0 1000]); grid on;
xlabel('Frequency [kHz]','Fontsize',15); ylabel('Counts','Fontsize',15)
title('FFT of Handel','Fontsize',15)