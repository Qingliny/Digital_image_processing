function H = brFilterTF4e(type,M,N,C0,W,n)
%Perform bandreject filtering
X=0:M-1;
Y=0:N-1;
Cx=0.5*M;
Cy=0.5*N;
[X,Y]=meshgrid(X,Y);
D = sqrt((X-Cx).^2+(Y-Cy).^2);
if type == "ideal"
    H = D;
    for p = 1:M
        for q = 1:N
            if (D(p,q) <= C0+W/2) && (H(p,q) >= C0-W/2)
                H(p,q) = 0;
            else
                H(p,q) = 1;
            end
        end
    end
elseif type == "gaussian"
    Lo = exp(-((D.^2-C0^2)./(D.*W)).^2);
    H = 1-Lo; % High pass filter=1-low pass filter
elseif type == "butterworth"
    H = 1./(1+((D.*W)./(D.^2-C0.^2)).^(2.*n));
end
end

