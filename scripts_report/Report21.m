close all;
clear all;
Fs = 8192; % sample frequency
F0 = 1000; % passband frequency
F1 = 1500; % stopband frequency
R0 = 3; % max passband damping (dB)
R1 = 40; % min stopband damping (dB)
[N, omega_c] = buttord( F0/Fs*2, F1/Fs*2, R0, R1); % compute order
[b,a] = butter(N, F0/Fs*2); % compose H(z)
zplane(b,a)
figure
[H,omega] = freqz(b,a); % evaluate the transfer function (omega is vector)
F = omega/(2*pi) * Fs;
plot(F, 20*log10(abs(H)));
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)');
ylim([-300,10]);
xlim([0, Fs/2]);
grid on

figure
phase = unwrap(angle(H))* 360/(2*pi);
plot(F, phase)
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
xlim([0, Fs/2]);
grid on;