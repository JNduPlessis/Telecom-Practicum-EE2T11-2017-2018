%Recording of audio samples
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

%Set Parameters
Fs = 22050;

%Generate Test Signal 1 cm
[y_1, x_1, x_t1] = send_refsignal(5, Fs, 1);

pause

%Generate Test Signal 50 cm
[y_2, x_2, x_t2] = send_refsignal(5, Fs, 1);

pause

%Generate Test Signal 1 m
[y_3, x_3, x_t3] = send_refsignal(5, Fs, 1);

%Channel Estimation of Three distances using the Reference Signal
h1 = ch3(x_1,y_1);
h2 = ch3(x_2,y_2);
h3 = ch3(x_3,y_3);

%Channel Estimation of Two distances using the 1cm signal as reference
h4 = ch3(x_2, y_1);
h5 = ch3(x_3, y_1);

code4_4;