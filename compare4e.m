function rmse = compare4e(f,fa)
[m,n] = size(f);
e = double(f) - double(fa);
rmse = sqrt(sum(e(:).^2)./(m*n));
end

    
    
    
    
    
    
    
    
    
    
    
    
    
    