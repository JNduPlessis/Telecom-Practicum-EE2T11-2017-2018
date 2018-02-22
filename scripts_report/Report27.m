
%% Exported from Jupyter Notebook
% Run each section by placing your cursor in it and pressing Ctrl+Enter

%% Code Cell[53]:

% Report 27

clear all
close all

% t from original signal: 0-19
t = 0 : 1: 19;
%x = randn(20,1);

omega_i = 1;
n = [0:19]';
x = sin(omega_i*n);
%x = ones(1,20)';

tr = -5 : 0.1 : 5;
hr = sinc(tr);
h0 = ones(10,1); % zero order hold, time axis is t0 = -0.5:0.1:0.4
t0 = -0.5:0.1:0.4;
h1 = bartlett(21); % linear interpolation, time axis t1 = -1:0.1:1
t1 = -1:0.1:1;

d = [1 zeros(1,10)] % impulse response

tt = 0:0.1:20-0.1;
xx = kron(x, [1; zeros(9,1)]);

xa = conv(xx,hr);
x0 = conv(xx,h0);
x1 = conv(xx,h1);

d1 = conv(d,h1);
td1 = -1:0.1:2;
d0 = conv(d,h0);
td0 = -0.5:0.1:1.4;
dr = conv(d,hr);

tdr = -5 : 0.1 : 6;


ta0 = -0.5:0.1:20.4-0.1;
ta1 = -1:0.1:21-0.1;


% t of upsampled signal: t, with 5 seconds add before and after
ta = -5:0.1:25-0.1;

figure
subplot(311)
Fs = 1/0.1;
Y = abs(fftshift(fft(x0)));
f = -Fs/2:Fs/length(Y):Fs/2-1/length(Y);
plot(f,Y)
ylabel('Amplitude')
xlabel('Frequency (Hz)')
title('Zero order hold')
subplot(312)
plot(ta0, x0);
hold on;
plot(t, x, 'ro');
ylabel('Amplitude')
xlabel('Time (s)')
subplot(313)

plot(td0,d0);
ylim([0 1.2])

ylabel('Amplitude')
xlabel('Time (s)')

figure
subplot(311)
Fs = 1/0.1;
Y = abs(fftshift(fft(xa,1024)));
f = -Fs/2:Fs/length(Y):Fs/2-1/length(Y);
plot(f,Y)
ylabel('Amplitude')
xlabel('Frequency (Hz)')
title('Sinc')
subplot(312)
plot(ta, xa);
hold on;
plot(t, x, 'ro');
ylabel('Amplitude')
xlabel('Time (s)')
subplot(313)

plot(tdr,dr);
ylabel('Amplitude')
xlabel('Time (s)')
ylim([-0.5 1.2])

figure
subplot(311)
Fs = 1/0.1;
Y = abs(fftshift(fft(x1,1024)));
f = -Fs/2:Fs/length(Y):Fs/2-1/length(Y);
plot(f,Y)
ylabel('Amplitude')
xlabel('Frequency (Hz)')
title('Linear interpolation')
subplot(312)
plot(ta1, x1);
hold on;
plot(t, x, 'ro');
ylabel('Amplitude')
xlabel('Time (s)')
subplot(313)
plot(td1,d1);
ylim([0 1.2])

ylabel('Amplitude')
xlabel('Time (s)')

%% Code Cell[43]:

length(conv(d,h1))

%% Code Cell[42]:

t1

%% Code Cell[ ]:


