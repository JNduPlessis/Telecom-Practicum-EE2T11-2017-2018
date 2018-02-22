
Fs = 8192
Fc = 1000
F1 = 1500
omega_c = 2*pi*(Fc/Fs);
OMEGA_c = tan(omega_c/2);
omega_1 = 2*pi*(F1/Fs);
OMEGA_1 = tan(omega_1/2);
N = 1:1:6

H_1 = 1./(1+(OMEGA_1./OMEGA_c).^(2*N));
plot(N,20*log10(H_1))
hold on 
plot(N,ones(1,6)*-40, 'r--')
grid on;
xlabel('Filter order N')
ylabel('Magnitude at F = F_1')

disp(20*log10(H_1))


