function g = bpfilter(f,r)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
f=double(f);
f=fft2(f);
f=fftshift(f);
[m,n]=size(f);
m1=fix(m/2);
n1=fix(n/2);
for i=1:m
    for j=1:n
        d=sqrt((i-m1)^2+(j-n1)^2);
        h1(i,j)=exp(-d^2/2/r^2);
    end
end
g=f.*h1;
g=ifftshift(g);
g=ifft2(g);
g=mat2gray(real(g));
end

