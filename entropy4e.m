function e = entropy4e(f,n)
% computing the entropy of the image
%   n is the number of possible values for each element of f

f = double(f);
hi = hist(f(:),n);
fn = find(hi);
hi = hi./sum(hi(:));
e = -sum(hi(fn).* log2(hi(fn)));
end