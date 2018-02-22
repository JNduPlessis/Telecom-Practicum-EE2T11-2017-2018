% Report 25 
% Rijk van Wijk en JN du Plessis

Fs = 48000;
Fmin = 0; Fmax = 12000;
N = 2*Fs;
n = [0:N-1];
f = linspace(Fmin,Fmax,N)/Fs;
x = sin(2*pi*f.*n);
%soundsc(x,Fs)


Fs2 = Fs/2;
x2 = x(1:2:end);

%soundsc(x2,Fs2)


close all
M = 1200;
plot(n(1:M)/Fs,x(1:M), '.');
hold on
n2 = n(1:4:end);
plot(n2(1:M/4)/Fs,x2(1:M/4), 'ro');
legend('Original signal', 'Interpoled signal')
xlabel('time (s)')

close all
figure
spectrogram(x2, 100, 'yaxis')
figure
spectrogram(x, 100, 'yaxis')



