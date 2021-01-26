clc
clear
N = 100;
for i = 1:N
x1 = rand(1,11);y2=sum(x1);r1=x1/y2*259;
x2 = rand(1,11);y2=sum(x2);r2=x2/y2*73.5;
Load(i,:) = r1;
Load(i+N,:) = r2;
end