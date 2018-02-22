% Report 28 & 29: image down and upsampling
% Rijk van Wijk en J N du Plessis

X = imread('cameraman.tif');
%imagesc(X);
colormap('gray')
X = double(X);

L = 2;
M = 3;
% fir1 want cut-off frequency between 0 and 1.0
cutoff = min(1/M, 1/L);
N = 6;
b = fir1(N, cutoff);
a = 1;


% Upsample
E = zeros(L,L); E(1,1) = 1;
XE = kron(X, E);
%imagesc(XE)


% apply lowpass filter
Xfilth = imfilter(XE,b);
Xfilt = imfilter(Xfilth',b); 
Xfilt = Xfilt';

imagesc(Xfilt)


% downsample
close all
Xfinal = Xfilt(1:M:end,1:M:end);
imagesc(Xfinal);
disp(size(Xfinal))


figure
imagesc(imresize(X,L/M,'bilinear'))



