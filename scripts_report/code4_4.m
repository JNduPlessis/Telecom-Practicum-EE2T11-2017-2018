%Plot recorded auto samples
%Rijk van Wijk & Nicolaas du Plessis
close all;

freq1 = linspace(-Fs/1000,Fs/1000,length(x_1));
freq2 = linspace(-Fs/1000,Fs/1000,length(y_1));

%Plotting of All Graphs
figure(1)

subplot(231)
plot(x_1)
title('1cm Sent Signal Time Domain','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 1420 0 2]); grid on;

subplot(234)
plot(freq1,fftshift(abs(fft(x_1))))
title('1cm Sent Signal Frequency Domain','Fontsize',15)
xlabel('Frequency (kHz)','Fontsize',12)
ylabel('Counts','Fontsize',12)
axis([0 22 0 600]); grid on;

subplot(232)
plot(y_1)
title('1cm Recivered Signal Time Domain','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([4800 9000 -1 1]); grid on;

subplot(235)
plot(freq2,fftshift(abs(fft(y_1))))
title('1cm Recivered Signal Frequency Domain','Fontsize',15)
xlabel('Frequency (kHz)','Fontsize',12)
ylabel('Counts','Fontsize',12)
axis([0 22 0 2500]); grid on;

subplot(233)
plot(h1)
title('1cm Impulse Recovered from Refsignal','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 35000 0 0.25]); grid on;

figure(2)
subplot(231)
plot(x_2)
title('50cm Sent Signal Time Domain','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 1420 0 2]); grid on;

subplot(234)
plot(freq1,fftshift(abs(fft(x_2))))
title('50cm Sent Signal Frequency Domain','Fontsize',15)
xlabel('Frequency (kHz)','Fontsize',12)
ylabel('Counts','Fontsize',12)
axis([0 22 0 600]); grid on;

subplot(232)
plot(y_2)
title('50cm Recivered Signal Time Domain','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([4800 9000 -1 1]); grid on;

subplot(235)
plot(freq2,fftshift(abs(fft(y_2))))
title('50cm Recivered Signal Frequency Domain','Fontsize',15)
xlabel('Frequency (kHz)','Fontsize',12)
ylabel('Counts','Fontsize',12)
axis([0 22 0 1200]); grid on;

subplot(233)
plot(h2)
title('50cm Impulse Recovered from Refsignal','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 35000 0 0.3]); grid on;

subplot(236)
plot(h4)
title('50cm Impulse Recovered from 1cm Recieved Signal','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 35000 0 0.3]); grid on;

figure(3)
subplot(231)
plot(x_3)
title('1m Sent Signal Time Domain','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 1420 0 2]); grid on;

subplot(234)
plot(freq1,fftshift(abs(fft(x_3))))
title('1m Sent Signal Frequency Domain','Fontsize',15)
xlabel('Frequency (kHz)','Fontsize',12)
ylabel('Counts','Fontsize',12)
axis([0 22 0 600]); grid on;

subplot(232)
plot(y_3)
title('1m Recivered Signal Time Domain','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([4800 9000 -1 1]); grid on;

subplot(235)
plot(freq2,fftshift(abs(fft(y_3))))
title('1m Recivered Signal Frequency Domain','Fontsize',15)
xlabel('Frequency (kHz)','Fontsize',12)
ylabel('Counts','Fontsize',12)
axis([0 22 0 2500]); grid on;

subplot(233)
plot(h3)
title('1m Impulse Recovered from Refsignal','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 35000 0 0.3]); grid on;

subplot(236)
plot(h5)
title('1m Impulse Recovered from 1cm Recieved Signal','Fontsize',15)
xlabel('Samples','Fontsize',12)
ylabel('Amplitude','Fontsize',12)
axis([0 35000 0 0.3]); grid on;