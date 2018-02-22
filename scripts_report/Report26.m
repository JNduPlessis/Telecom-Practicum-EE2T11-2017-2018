
% Report 26

clear all
close all

% t from original signal: 0-19
t = 0 : 1: 19;
%x = randn(20,1);

omega_i = 0.6;
n = [0:19]';
%x = sin(omega_i*n);
x = ones(1,20)';

tr = -5 : 0.1 : 5;
hr = sinc(tr);

tt = 0:0.1:20-0.1;
xx = kron(x, [1; zeros(9,1)]);

xa = conv(xx,hr);
% t of upsampled signal: t, with 5 seconds add before and after
ta = -5:0.1:25-0.1;

figure
plot(ta, xa);
hold on;
plot(t, x, 'ro');
ylabel('Amplitude')
xlabel('Time (s)')



