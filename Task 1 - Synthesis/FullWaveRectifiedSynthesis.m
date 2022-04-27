close all
clear all
clc

% 300 is the numbero of components where I started to have to zoom in very
% far to see a difference
N=300 %Number of signals in the synthesis
T0=4; %The period
t=0:0.01:3*T0; %tidsvektor
f = 1/T0; %frequency

%Make the original
original=abs(sin(pi*f*t))

xN=2/pi; %set the first component a0
for k=1:N
    xN=xN+(4/(pi*(1-4*k^2)))*cos(2*pi*f*k*t);
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    pause(0.25)
end