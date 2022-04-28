close all
clear all
clc

k=1; % Choose coefficient ak
Nmax=4096; % Maximal number of sampeles during one period
ak=[]; % empty vector

for N=4:4:Nmax
    f=[linspace(0,1,N/2) linspace(1,0,N/2)]; % Create a sample signal 
    akN=0;
    for n=0:N-1
        akN=akN+f(n+1)*exp(-j*((2*pi)/N)*k*n); % Estimate ak
    end
    ak(end+1)=akN/N;%spara estimatet
end

plot(2:4:Nmax,((-2/((k^2)*(pi^2))))*ones(1,length(2:4:Nmax)),'r') % plot the theoretical value
hold on;
plot(2:4:Nmax,ak);
hold off
xlabel('N');