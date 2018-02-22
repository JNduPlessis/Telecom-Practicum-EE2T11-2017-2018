%Convolution Property
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

load train
freq=linspace(-Fs/2000,Fs/2000,length(y));

%Original Signals
h_short = [1 0 1/2 0 1/4]; %Impulse
Y_short = conv(y,h_short,'same');
Y_short = Y_short(1:length(y)); %truncate padded zeros

%Plot Original
subplot(211)
stem(freq,fftshift(abs(fft(Y_short))),'LineStyle','-','LineWidth',1,'Color','black','Marker','^','MarkerSize',3);
axis([-4 4 0 1100]); grid on
xlabel('Frequency [kHz]','Fontsize',15); ylabel('Counts','Fontsize',15)
title('DFT of Convolution of y=x*h','Fontsize',15)

%Padded Signals
h_padded = [1 0 1/2 0 1/4, zeros(1,12884-5)]; %filter impulse
Y_padded = conv(y,h_padded);
Y_padded = Y_padded(1:length(y)); %truncate padded zeros

%Plot Padded
subplot(212)
stem(freq, fftshift(abs(fft(Y_padded))),'LineStyle','-','LineWidth',1,'Color','black','Marker','^','MarkerSize',3);
axis([-4 4 0 1100]); grid on
xlabel('Frequency [kHz]','Fontsize',15); ylabel('Counts','Fontsize',15)
title('DFT of Convolution of padded y=x*h','Fontsize',15)



