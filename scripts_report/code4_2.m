%Recording of audio samples
%Rijk van Wijk & Nicolaas du Plessis
close all; clc;

t_l=length(y1)/Fs_RX;
t=linspace(0,t_l, length(y1));
freq=linspace(-Fs_RX,Fs_RX,length(y1));

subplot(211)
plot(t,y1(:,1),t,y2(:,1),t,y3(:,1),'linewidth',2)
title('Time domain signal measurement','Fontsize',15)
xlabel('Time (s)','Fontsize',12); ylabel('Amplitude','Fontsize',12); grid on;
legend('1cm', '50cm', '100cm');
axis([0.15 0.17 -1 1])

subplot(212)
plot(freq,fftshift(abs(fft(y1(:,1)))),freq,fftshift(abs(fft(y2(:,1)))),freq,fftshift(abs(fft(y3(:,1)))),'linewidth',2);
title('Frequency domain signal measurement','Fontsize',15)
xlabel('Frequency (Hz)','Fontsize',12); ylabel('Counts','Fontsize',12); grid on;
legend('1cm', '50cm', '100cm');
axis([0 22050 0 300])