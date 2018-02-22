%Zero Padding
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

h = [1 0 1/2 0 1/4];
H = fftshift(abs(fft(h)));
N = 5;
f = [0: 1/N : (N-1)/N];

stem(f,H,'LineStyle','-','LineWidth',5,'Color','black','Marker','x','MarkerSize',8);
axis([0 1 0.5 1.8]); grid on
xlabel('Normalized Frequency','Fontsize',15); ylabel('|h[n]|','Fontsize',15)
title('DFT of h[n]  (h = [1,0,0.5,0,0.25])','Fontsize',15)

hold on

N = 30;
f = [0: 1/N : (N-1)/N];
h = [1 0 1/2 0 1/4 zeros(1,25)];
H = fftshift(abs(fft(h)));

stem(f,H,'filled','LineStyle','--','LineWidth',1.5,'Color','black','Marker','o','MarkerSize',5);

legend('Original Signal','Interpolated Signal')