Fs = 8192; % sample frequency
F0 = 1000; % passband frequency
F1 = 1500; % stopband frequency
R0 = 3; % max passband damping (dB)
R1 = 40; % min stopband damping (dB)
[N, Wp] = ellipord(F0/Fs*2, F1/Fs*2, R0, R1)
[b,a] = ellip(N,R0,R1,Wp)

freqz(b,a)
figure
zplane(b,a)

