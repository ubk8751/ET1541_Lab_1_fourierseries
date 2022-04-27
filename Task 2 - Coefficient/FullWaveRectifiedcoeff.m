close all
clear all
clc

N=128; % Number of coefficients
T0=4; % The period

ak=zeros(1,N);
for k=1:2:N
    ak(k)=(4/(pi*(1-4*k^2)));
end
ak=[0.5 ak]; % add a0

% Plot the coefficients with the original sign
stem(0:N,ak)
xlabel('Coeff k');
ylabel('Amplitude');

% Plot the absolute values of the coefficients
figure
stem(0:N,abs(ak))
xlabel('Coeff k');
ylabel('Magnitude');

% Plot the absolute values of the coefficients, as well as the calculated k
% order to the frequence
figure
stem((0:N)*(1/T0),abs(ak))
xlabel('Freq. [Hz]');
ylabel('Magnitude');


% Automatic calculation of the coefficients using FFT (pulse version)
[a0,a]=fcoeff('fullrect',T0,N); 
figure
stem(0:N,abs([a0 a]))
xlabel('Coeff k');
ylabel('Magnitude');

[abs(ak); abs([a0 a])]