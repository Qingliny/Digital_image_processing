function F = dft2D4e(f)
%Implement a function that compute 2-D forward FFT of image 
[r,c] = size(f);
F = zeros(r,c);
for rf = 1: r
    F(rf,:) = fft(f(rf,:));
end
for cf = 1: c
    F(:,cf) = fft(F(:,cf));
end
end

