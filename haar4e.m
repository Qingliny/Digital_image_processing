function h = haar4e(f)
%J-Scale DWT of N-point 1-D function
%   J = log2(N)
n = length(f);
j = log2(n);
h = zeros(1,n);
num = n./2;
for i = 1:j
    for x = 1:num
        h(x) = (f(2*x-1)+f(2*x))./sqrt(2);
    end
    for x = 1:num
        h(num+x) = (f(2*x-1)-f(2*x))./sqrt(2);
    end
    num = num./2;
    f = h;
end
end

