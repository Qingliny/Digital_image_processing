function u = centralMoments4e(f,n)
%computing central moments of typical image
%   u: n- dimension vector
%   n = 1: mean value
%   n = 2: variance
%   n = 3: central moments
%   ...
[r,c] = size(f);
u = zeros(1,n);
%   n = 1
u(1) = mean2(f);
%   n > 1
f1 = zeros(r,c);
for i = 2:n
    for rf = 1:r
        for cf = 1:c
            f1(rf,cf) = (f(rf,cf)-u(1))^i;
        end
    end
    u(i) = mean2(f1);
end

