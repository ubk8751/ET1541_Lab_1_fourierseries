%Skriptet demostrerar hur man plottar koefficienterna ak fr�n
%Fourier Serier Analysen med hj�lp av stem().
%I slutet av skriptet visas �ven hur koefficientrna kan erh�llas
%automatiskt med hj�lp av FFT
%I detta fall g�ller koefficienterna f�r en fyrkantsv�g
close all
clear all
clc

N=128; %Val av antal Koefficienter vi vill plotta
T0=4; %periodtiden f�r den periodiska signalen

ak=zeros(1,N);
for k=1:2:N
    ak(k)=sin(pi*k/2)/(pi*k);%formeln f�r ak tagen fr�n Exempel C-1 s.535 i boken
end
ak=[0.5 ak]; %l�gg till a0

%H�r plottas koefficienterna med tecknet bevarad
stem(0:N,ak)
xlabel('Coeff k');
ylabel('Amplitude');

%H�r plottas absolutbellopet f�r koefficienterna
figure
stem(0:N,abs(ak))
xlabel('Coeff k');
ylabel('Magnitude');

%H�r plottas absolutbellopet, samt omr�knad k ordningen till frekvens
figure
stem((0:N)*(1/T0),abs(ak))
xlabel('Freq. [Hz]');
ylabel('Magnitude');

%Automatisk ber�kning av koefficienterna med FFT
%'puls' anger den separat skrivna funktionen i puls.m
%skriv 'triangel' f�r att ange triangelfunktionen i triangel.m
[a0,a]=fcoeff('puls',T0,N); 
figure %Denna plott kan j�mf�ras med figur nr.2
stem(0:N,abs([a0 a]))
xlabel('Coeff k');
ylabel('Magnitude');

%s�tter manuellt och automatiskt framtagna koefficienterna vid varandra f�r
%att numeriskt j�mf�ra dessa. F�rsta raden �r manuella v�rden och andra
%raden �r automatiskt framtagna v�rden.
[abs(ak); abs([a0 a])]
