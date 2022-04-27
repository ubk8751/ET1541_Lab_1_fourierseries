%Skriptet demosntrerar hur man syntetiserar en periodisk signal med den
%ändliga Fourier Serier Syntesen med N ak koefficienter. 
close all
clear all
clc

% 400 is the numbero of components where I started to have to zoom in very
% far to see a difference
N=400; % Number of signals in the synthesis
T0=4; % The period
t=0:0.01:3*T0; %tidsvektorn

%här skapas original signal i detta fall en ren fyrkantsvåg
ph=(length(t)-1)/6;
original=[ones(1,ph/2) zeros(1,ph) ones(1,ph) zeros(1,ph) ones(1,ph) zeros(1,ph) ones(1,ph/2) 1];

%Syntes for-loopen med plott för varje tillagd komponent ak
%fyrkantsvågen har 0 i jämna k komponenter.
xN=0.5; %start på signalen xN(t) med första koefficienten a0
for k=1:2:N
    %formeln för ak tagen från Exempel C-1 s.535 i boken
    %skriven på formeln enligt exercise C.3 (reell signal)
    ak=sin(pi*k/2)/(pi*k);
    xN=xN+2*ak*cos(2*pi/T0*k*t); %addition av ak
    
    %plottning av den syntetiserad signal över den ursprungliga signalen
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    %pausa med 0.25s
    pause(0.25)
end