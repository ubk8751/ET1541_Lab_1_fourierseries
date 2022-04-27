function f=triangel(t)

if t>=0 && t<2
   f=0.5*t;
elseif t>=2 && t<=4
   f=2-0.5*t;
else
   f=0;
end