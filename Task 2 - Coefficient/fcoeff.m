function [a0, a]=fcoeff(fun,T0,index)
% function [a0, a]=fcoeff(fun,T0,index) 
% 
% Matlabfunktionen fcoeff anropas med kommandot [a0 a]=fcoeff('fun',T0,N)  
% vilket ger de komplexa Fourierkoefficienterna a0 och ak för k=1...N  
% svarande mot variablerna a0 och a. Variabeln a är en vektor med dimension 1xN.
% Fourierserien har perioden T0 och en period är definierad av Matlabfunktionen  
% med namnet 'fun'.
% 
% Funktionen fcoeff samplar en period av vågformen definierad av funktionen fun. 
% Fourierkoefficienterna ges approximativt av den samplade vågformens DFT 
% (Discrete Fourier Transform). DFT'n beräknas med FFT-algoritmen 
% (Fast Fourier Transform). Approximationen blir bättre desto fler sampelvärden 
% som används vid FFT beräkningen.Som kontroll plottar också Matlabfunktionen 
% fcoeff perioden definierad av fun för 0<t<T0.
% 
N=1024;
T=T0/N;
t=0:T:(N-1)*T;
for k=1:length(t)
    x(k)=feval(fun,t(k));
end

figure
plot(t,x)
title(['Plot av ' fun ' funktionen'] )

X=fft(x);
a0=(1/N)*X(1);
a=(1/N)*X(2:index+1);
a=a(:).';
