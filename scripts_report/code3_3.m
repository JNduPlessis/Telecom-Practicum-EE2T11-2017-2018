%Time-domain channel estimation using Toeplitz Matrix
%Rijk van Wijk & Nicolaas du Plessis

function est_ch = ch1(x,y,L)
%x = transmitted signal
%y = measured signals
if nargin < 3
   %L not given, use calculated result
   L = length(y)-length(x)+1;
end

X=toep(x,length(y),L); %Inverse convolution
est_ch=pinv(X)*y;

end