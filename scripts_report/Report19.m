
Fs = 8192; % sample frequency
F0 = 1000; % passband frequency
F1 = 1500; % stopband frequency
alpha0 = 10^(-3/20); % max passband ripple (linear units)
alpha1 = 10^(-40/20); % max stopband ripple (linear units)
[N,F,A,W] = firpmord( [F0 F1], [1 0], [alpha0 alpha1], Fs );
h = firpm(N,F,A,W);


[s,w] = freqz(h,1, 512);

close all
plot( (Fs*w)/(2*pi), 20*log10(abs(s)));
legend('Frequency response of filter')
xlim([0,Fs/2]);
y1=get(gca,'ylim');
hold on;

%xticks(0:Fs/8:Fs/2)

l1 = line([F0 F0], y1);
set(l1, 'LineStyle', '--');
set(l1, 'color', 'g');
set(l1, 'DisplayName', 'Passband frequency' )

l2 = line([F1 F1], y1);
set(l2, 'LineStyle', '--');
set(l2, 'color', 'r');
set(l2, 'DisplayName', 'Stopband frequency' );
ylabel('Magnitude (dB)')
xlabel('Frequency (Hz)')
ylim([-65 5]);
grid on;

