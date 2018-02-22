%% Touch tone detection v2.0 
%% Rijk van Wijk 
load touch

Fs = 8192


F0 = 30; % passband frequency
F1 = 60; % stopband frequency
R0 = 3; % max passband damping (dB)
R1 = 40; % min stopband damping (dB)

%[N, Wp] = ellipord(F0/Fs*2, F1/Fs*2, R0, R1);
%[b,a] = ellip(N,R0,R1,Wp);

%Butterworth has no ripple in passband
[N, Wc] = buttord(F0/Fs*2, F1/Fs*2, R0, R1);
[b,a] = butter(N,Wc);


samp = hardx2; % sample audio

freqs=[ 697, 770, 852, 941, 1209, 1336, 1477];
legends = [];

for ii = 1:length(freqs)
    close all;
    n = 0:1/(Fs-1):length(samp)/Fs;
    freq = freqs(ii);
    demodulated = (samp .*exp(-2i*pi*freq*n)); % demodulation
    detect = filter(b,a,demodulated); %low pass filter
    figure
    plot(n,abs((detect)))
    legend(sprintf('Detection of %sHz\n', num2str(freq)))
    xlabel('Time (s)')
    ylim([0 0.6])
    saveas(gca, sprintf('report24-%s.png', num2str(freq)))
    %legends = cellstr([legends  sprintf('Detection of %sHz\n', num2str(freq))]);
end



