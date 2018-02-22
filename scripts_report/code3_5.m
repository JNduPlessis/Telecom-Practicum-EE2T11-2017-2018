%Frequency domain channel estimation using equalisation
%Rijk van Wijk & Nicolaas du Plessis

function est_chn = ch3(x,y)

Ny = length(y); Nx = length(x); L = Ny - Nx + 1;
Y = fft(y);
X = fft([x; zeros(Ny - Nx ,1)]);%Zero padding
H = Y ./ X; %Deconvolution

h_zero = find(abs(X) == 0);
H(h_zero) = 0;
h = ifft(H);
est_chn = abs(h); 

end