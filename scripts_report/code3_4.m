%Time-domain channel estimation using a matched filter
%Rijk van Wijk & Nicolaas du Plessis

function est_ch = ch2(x,y,L)
%x = transmitted signal
%y = measured signals
if nargin < 3
   %L not given, use calculated result
   L = length(y)-length(x)+1;
end

%Reverse the sequence x (assuming a col vector)
x = x(:); y = y(:);
xr = flipud(x); 

%Matched filtering
h = filter(xr,1,y); %14 long

%Skip the first Nx samples, so length(h) = L
h = h(length(x):end);

%Estimate scale with Gram Determinant
alpha = x'*x; 

%Scale down
est_ch = h/alpha; 

end



