%Room Channel Impulse Response
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

%Due to the time limit, instead of making making a script that can
%calcualte nth reflection based on input coordinates, we instead hardcoded
%the reflection into the scripts. Each reflection is seen as a virtual
%source mirrored in the appropriate plane.

sound_speed = 340; %speed of sound in m/s
beta_damp = 0.5; %dampning factor of the air
num_virt_source = 17; %number of virtual sources

%Impulse Signal
N = 30; %number of samples
x = [1 zeros(1, N-1)]; %impulse response
n = 0:N-1; %time index

%Source Coordiantes
Tx_x = 1.2; %meters
Tx_y = 0.3; %meters
%Target Coordinates
Rx_x = 3.1; %meters
Rx_y = 3.3; %meters
%Reflection Boundary Coordinates
Room_x = 4; %meters
Room_y = 4; %meters

%Virtual Source Vector
sources = zeros(num_virt_source,2); %sources(:,1) is x coordiantes, sources(:,2) is y coordiantes
sources(1,1) = Tx_x; sources(1,2) = Tx_y; %Original Source

%Primary Reflections
sources(2,1) = -Tx_x; sources(2,2) = Tx_y; %X=0
sources(3,1) = (2*Room_x)-Tx_x; sources(3,2) = Tx_y; %X=4
sources(4,1) = Tx_x; sources(4,2) = -Tx_y; %Y=0
sources(5,1) = Tx_x; sources(5,2) = (2*Room_y)-Tx_y; %Y=4

%Secondary Reflections
sources(6,1) = sources(2,1); sources(6,2) = (2*Room_y)-sources(2,2); %X=0 -> Y=4
sources(7,1) = sources(2,1); sources(7,2) = -sources(2,2); %X=0 -> Y=0
sources(8,1) = (2*Room_x)-sources(2,1); sources(8,2) = sources(2,2); %X=0 -> X=4

sources(9,1) = sources(3,1); sources(9,2) = (2*Room_y)-sources(3,2); %X=4 -> Y=4
sources(10,1) = sources(3,1); sources(10,2) = -sources(3,2); %X=4 -> Y=0
sources(11,1) = -sources(3,1); sources(11,2) = sources(3,2); %X=4 -> X=0

sources(12,1) = sources(4,1); sources(12,2) = -sources(4,2); %Y=4 -> Y=0
sources(13,1) = -sources(4,1); sources(13,2) = sources(4,2); %Y=4 -> X=0
sources(14,1) = (2*Room_x)-sources(4,1); sources(14,2) = sources(4,2); %Y=4 -> X=4

sources(15,1) = sources(5,1); sources(15,2) = (2*Room_y)-sources(5,2); %Y=4 -> Y=0
sources(16,1) = -sources(5,1); sources(16,2) = sources(5,2); %Y=4 -> X=0
sources(17,1) = (2*Room_x)-sources(5,1); sources(17,2) = sources(5,2); %Y=4 -> X=4

%Calculations
distances = sqrt(((sources(:,1)-Rx_x).^2) + ((sources(:,2)-Rx_y).^2)); %Distance Vector
attenuations = (distances./sound_speed); %Attenutions
times = beta_damp./(distances.^2); %Travel Times

atten_sorted = sort(attenuations,'descend'); %Higher attenuation means longer journey
times_sorted = sort(times); %Sort times to match above attenuation vector

%Convolution of input signal and resulting recording
response = conv(x,atten_sorted);
response = response(1:num_virt_source); %truncate padded zeros

%Plots
subplot(311)
stem(n,x,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',5);
ylabel('H(t)','Fontsize',15); xlabel('Time (s)','Fontsize',15); grid on;
title('Initial Impulse Response','Fontsize',15)

subplot(312)
stem(times_sorted,atten_sorted,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time (s)','Fontsize',15); grid on;
title('Recieved Signal At Targer','Fontsize',15)

subplot(313)
stem(times_sorted,response,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time (s)','Fontsize',15); grid on;
title('Room Channel Impulse Response','Fontsize',15)