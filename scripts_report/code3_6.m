%Comparison of different carrier frequencies of the training sequences.
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

N = 1000; %samples
Fs = 20000;
freq=linspace(-Fs/1000,Fs/1000,N);

%Data Generation
noise = wgn(N,1,0);
freq_noise = abs(fft(noise));

%Band 1
upper_lim = 1000;
band1 = freq_noise;
band1(((N/2)+(((N/2)/Fs)*upper_lim)):end) = 0; %upper section to 0
band1(1:((N/2)-(((N/2)/Fs)*upper_lim))) = 0; %lower section to 0
band1_time = abs(fftshift(ifft(band1)));

%Band 2
lower_lim = 5000;
upper_lim = 6000;
band2 = freq_noise;
band2(((N/2)+(((N/2)/Fs)*upper_lim)):end) = 0; %upper section to 0
band2(1:((N/2)-(((N/2)/Fs)*upper_lim))) = 0; %lower section to 0
band2(((N/2)-(((N/2)/Fs)*lower_lim)):((N/2)+(((N/2)/Fs)*lower_lim))) = 0; %middle section to 0
band2_time = abs(fftshift(ifft(band2)));

%Band 3
lower_lim = 9000;
upper_lim = 10000;
band3 = freq_noise;
band3(((N/2)+(((N/2)/Fs)*upper_lim)):end) = 0; %upper section to 0
band3(1:((N/2)-(((N/2)/Fs)*upper_lim))) = 0; %lower section to 0
band3(((N/2)-(((N/2)/Fs)*lower_lim)):((N/2)+(((N/2)/Fs)*lower_lim))) = 0; %middle section to 0
band3_time = abs(fftshift(ifft(band3)));

%Channel Creation
h = [1,2,3,2,1];
L = length(h);

%Convolution
y_1 = conv(h,band1_time);
y_2 = conv(h,band2_time);
y_3 = conv(h,band3_time);

%Channel Estimation
h_1 = ch3(band1_time,y_1);
h_2 = ch3(band2_time,y_2);
h_3 = ch3(band3_time,y_3);

figure(1)
subplot(221)
plot(freq,band1)
xlabel('Frequency (kHz)'); ylabel('Counts');
title('Frequency Domain Spectrum of 0-1kHz carrier frequencies'); grid on;

subplot(222)
plot(band1_time)
xlabel('Samples'); ylabel('Amplitude');
title('Time Domain wave of Band 1'); grid on;
axis([0 N 0 2])

subplot(223)
plot(y_1)
xlabel('Samples'); ylabel('Amplitude');
title('Convoluted wave of Band 1'); grid on;
axis([0 N 0 14])

subplot(224)
plot(h_1)
axis([0 7 0 4])
xlabel('Samples'); ylabel('Amplitude');
title('Recovered impulse reponse from Band 1'); grid on;


figure(2)
subplot(221)
plot(freq,band2)
xlabel('Frequency (kHz)'); ylabel('Counts');
title('Frequency Domain Spectrum of 5-6kHz carrier frequencies'); grid on;

subplot(222)
plot(band2_time)
xlabel('Samples'); ylabel('Amplitude');
title('Time Domain wave of Band 2'); grid on;
axis([0 N 0 2])

subplot(223)
plot(y_2)
xlabel('Samples'); ylabel('Amplitude');
title('Convoluted wave of Band 2'); grid on;
axis([0 N 0 9])

subplot(224)
plot(h_2)
axis([0 7 0 4])
xlabel('Samples'); ylabel('Amplitude');
title('Recovered impulse reponse from Band 2'); grid on;


figure(3)
subplot(221)
plot(freq,band3)
xlabel('Frequency (kHz)'); ylabel('Counts');
title('Frequency Domain Spectrum of 9-10kHz carrier frequencies'); grid on;

subplot(222)
plot(band3_time)
xlabel('Samples'); ylabel('Amplitude');
title('Time Domain wave of Band 3'); grid on;
axis([0 N 0 2])

subplot(223)
plot(y_3)
xlabel('Samples'); ylabel('Amplitude');
title('Convoluted wave of Band 3'); grid on;
axis([0 N 0 9])

subplot(224)
plot(h_3)
axis([0 7 0 4])
xlabel('Samples'); ylabel('Amplitude');
title('Recovered impulse reponse from Band 1'); grid on;