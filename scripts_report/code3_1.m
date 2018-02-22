%Auto Correlation of Test Signals
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

N = 1000; Omega = 0.2;
[x_1, x_2, x_3, x_4] = datagen(N,Omega);

%Autocorrelation (Convolute signals with their inverse)
r_1=conv(x_1, flipud(x_1));
r_2=conv(x_2, flipud(x_2));
r_3=conv(x_3, flipud(x_3));
r_4=conv(x_4, flipud(x_4));

%Plots
subplot(411)
plot(r_1)
title('Autocorrelation x_1')
subplot(412)
plot(r_2)
title('Autocorrelation x_2')
subplot(413)
plot(r_3)
title('Autocorrelation x_3')
subplot(414)
plot(r_4)
title('Autocorrelation x_4')


%The signal with the highest peak in the middle and the lowest sidelobes is
%the most useful signal, here this clearly is the random signal x_4                                                         