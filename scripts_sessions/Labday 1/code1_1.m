%Low pass and High pass filter on impulse and step response
%Rijk van Wijk & Nicolaas du Plessis
close all; clear; clc;

N = 100; %number of samples
x_step = [0 ones(1,N-1)]; %step response
x_impulse = [0 1 zeros(1, N-2)]; %impulse response
n = 0:N-1; %time index

%Low Pass Filter
a = 0.95;
y_lp_step = filter(1, [1 -a], x_step);
y_lp_impulse = filter(1, [1 -a], x_impulse);
%High Pass Filter
a = -0.95;
y_hp_step = filter(1, [1 -a], x_step);
y_hp_impulse = filter(1, [1 -a], x_impulse);

%Plot Input Pulses 
figure(1)
subplot(211); stem(n,x_step,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time Index','Fontsize',15); grid on;
title('Initial step response','Fontsize',15)

subplot(212); stem(n,x_impulse,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time Index','Fontsize',15); grid on;
title('Initial impulse response','Fontsize',15)

%Low Pass Filter
figure(2)
subplot(211); stem(n,y_lp_step,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time Index','Fontsize',15); grid on;
title('Step response of filter H(t) with a = 0.95','Fontsize',15)

subplot(212); stem(n,y_lp_impulse,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time Index','Fontsize',15); grid on;
title('Impulse response of filter H(t) with a = 0.95','Fontsize',15)

%High Pass Filter
figure(3)
subplot(211); stem(n,y_hp_step,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time Index','Fontsize',15); grid on;
title('Step response of filter H(t) with a = -0.95','Fontsize',15)

subplot(212); stem(n,y_hp_impulse,'filled','LineStyle','-','LineWidth',0.8,'Color','black','Marker','^','MarkerSize',2);
ylabel('H(t)','Fontsize',15); xlabel('Time Index','Fontsize',15); grid on;
title('Impulse response of filter H(t) with a = -0.95','Fontsize',15)
