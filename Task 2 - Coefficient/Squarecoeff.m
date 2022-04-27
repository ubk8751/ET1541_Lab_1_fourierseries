%Skriptet demostrerar hur man plottar koefficienterna ak från
%Fourier Serier Analysen med hjälp av stem().
%I slutet av skriptet visas även hur koefficientrna kan erhållas
%automatiskt med hjälp av FFT
%I detta fall gäller koefficienterna för en fyrkantsvåg
close all
clear all
clc

N=128; %Val av antal Koefficienter vi vill plotta
T0=4; %periodtiden för den periodiska signalen

ak=zeros(1,N);
for k=1:2:N
    ak(k)=sin(pi*k/2)/(pi*k);%formeln för ak tagen från Exempel C-1 s.535 i boken
end
ak=[0.5 ak]; %lägg till a0

%Här plottas koefficienterna med tecknet bevarad
stem(0:N,ak)
xlabel('Coeff k');
ylabel('Amplitude');

%Här plottas absolutbellopet för koefficienterna
figure
stem(0:N,abs(ak))
xlabel('Coeff k');
ylabel('Magnitude');

%Här plottas absolutbellopet, samt omräknad k ordningen till frekvens
figure
stem((0:N)*(1/T0),abs(ak))
xlabel('Freq. [Hz]');
ylabel('Magnitude');

%Automatisk beräkning av koefficienterna med FFT
%'puls' anger den separat skrivna funktionen i puls.m
%skriv 'triangel' för att ange triangelfunktionen i triangel.m
[a0,a]=fcoeff('puls',T0,N); 
figure %Denna plott kan jämföras med figur nr.2
stem(0:N,abs([a0 a]))
xlabel('Coeff k');
ylabel('Magnitude');

%sätter manuellt och automatiskt framtagna koefficienterna vid varandra för
%att numeriskt jämföra dessa. Första raden är manuella värden och andra
%raden är automatiskt framtagna värden.
[abs(ak); abs([a0 a])]
