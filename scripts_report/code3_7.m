%Baseband test signal
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

%Given code for x1
Fs = 20e3; %sample frequency
N = 50; %number of bits
p = ones(10,1); %pulse shape(square block)
%p = bartlett(21); %alternative pulse (triangle)
s = sign(randn(N,1)); %random sequence +- 1
ss = kron(s,[1;zeros(9,1)]); %interpolate s with zeros
x1 = conv(ss,p); %convolution of p with s

%Generating x2
n = (1:length(x1));
x2 = x1'.*(cos(n*(pi/2)));

f = linspace(-Fs/2,Fs/2,length(x1));

subplot(421)
plot(x1)
title('BPSK Sequence Time Domain')
xlabel('Samples','Fontsize',10)
ylabel('Amplitude','Fontsize',10); grid on

subplot(422)
plot(f,abs(fftshift(fft(x1))))
title('BPSK Sequence Frequency Domain')
xlabel('Frequency','Fontsize',10)
ylabel('Counts','Fontsize',10); grid on

subplot(423)
plot(x2)
title('Cosine Modulated BPSK Sequence Time Domain')
xlabel('Samples','Fontsize',10)
ylabel('Amplitude','Fontsize',10); grid on

subplot(424)
plot(f,abs(fftshift(fft(x2))))
title('Cosine Modulated BPSK Sequence Frequency Domain')
xlabel('Frequency','Fontsize',10)
ylabel('Counts','Fontsize',10); grid on

%GenerateImpulseResponse
h=[1,2,3,2,1];

%GenerateResultingSignals
y1=conv(x1,h);
y2=conv(x2,h);

%RecoverOriginalImpulse
h1=ch3(x1,y1);
h2=ch3(x2',y2');

subplot(425)
plot(h1)
title('Recovered Sequency for BPSK Time Domain')
xlabel('','Fontsize',10)
ylabel('Amplitude','Fontsize',10); grid on
axis([0 10 0 3.5])

subplot(426)
plot(abs(fftshift(fft(h1))))
title('Recovered Sequency for BPSK Frequency Domain')
xlabel('Frequency','Fontsize',10)
ylabel('Counts','Fontsize',10); grid on

subplot(427)
plot(h2)
title('Recovered Sequency for Cosine Modulated BPSK Time Domain')
xlabel('Samples','Fontsize',10)
ylabel('Amplitude','Fontsize',10); grid on
axis([0 10 0 3.5])

subplot(428)
plot(abs(fftshift(fft(h2))))
title('Recovered Sequency for Cosine Modulated BPSK Frequency Domain')
xlabel('Frequency','Fontsize',10);
ylabel('Counts','Fontsize',10); grid on