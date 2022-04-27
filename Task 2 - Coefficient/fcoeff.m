function [a0, a]=fcoeff(fun,T0,index)
% function [a0, a]=fcoeff(fun,T0,index) 
% 
% Matlabfunktionen fcoeff anropas med kommandot [a0 a]=fcoeff('fun',T0,N)  
% vilket ger de komplexa Fourierkoefficienterna a0 och ak f�r k=1...N  
% svarande mot variablerna a0 och a. Variabeln a �r en vektor med dimension 1xN.
% Fourierserien har perioden T0 och en period �r definierad av Matlabfunktionen  
% med namnet 'fun'.
% 
% Funktionen fcoeff samplar en period av v�gformen definierad av funktionen fun. 
% Fourierkoefficienterna ges approximativt av den samplade v�gformens DFT 
% (Discrete Fourier Transform). DFT'n ber�knas med FFT-algoritmen 
% (Fast Fourier Transform). Approximationen blir b�ttre desto fler sampelv�rden 
% som anv�nds vid FFT ber�kningen.Som kontroll plottar ocks� Matlabfunktionen 
% fcoeff perioden definierad av fun f�r 0<t<T0.
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
