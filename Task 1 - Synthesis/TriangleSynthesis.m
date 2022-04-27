close all
clear all
clc

% 252 is the numbero of components where I started to have to zoom in very
% far to see a difference
N=252 % Number of signals in the synthesis
T0=4; % The period
t=0:0.01:3*T0; % tidsvektor
f = 1/T0; % frequency

%Make the original
original=(sawtooth(2*pi*f*t,1/2)+1)/2

xN=0.5; %set the first component a0
for k=1:2:N
    xN=xN+(-4/((k^2)*(pi^2)))*cos(2*pi*f*k*t);
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    pause(0.25)
end