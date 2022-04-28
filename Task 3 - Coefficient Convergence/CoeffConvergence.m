%Skriptet visar hur man estimerar ak parametrarna f�r en fyrkantsv�g
%med den Diskreta Fourier Serien, d� vi bara har tillg�ng till en samplad
%periodisk signal f(n)
close all
clear all
clc

k=1; % v�lj koefficient ak
Nmax=128; % Maximal antal sampel under signalens ena period
ak=[]; % tom vektor f�r att spara olika 
for N=4:4:Nmax
    f=[ones(1,N/4) zeros(1,N/2) ones(1,N/4)]; % skapa den samplad fyrkantsv�g �ver en period 0 till 2*pi  
    akN=0;%nollst�ll parametern
    for n=0:N-1
        %formeln tagen ur formelsamling s.12 i kap. 1.6.2
        %(ck �r samma som ak i boken)
        akN=akN+f(n+1)*exp(-j*((2*pi)/N)*k*n); %itterativ summa f�r att estimera ak
    end
    ak(end+1)=akN/N;%spara estimatet
end

plot(2:4:Nmax,(sin((pi*k)/2)/(pi*k))*ones(1,length(2:4:Nmax)),'r')%plotta den teoretiska v�rdet
hold on; %beh�ll f�rra plotten
plot(2:4:Nmax,ak); %plotta estimatet med de olika N
hold off
xlabel('N');
