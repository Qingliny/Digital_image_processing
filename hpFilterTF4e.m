function H = hpFilterTF4e(type,P,Q,param)
%generate a P*Q hightpass filter transfer function,H
%   type = 'ideal' param  = cut off frequency D0
%   type = 'gaussian' param = standard deviation D0
%   type = 'butterworth', param = [1,2] vector [D0,n]
X=0:P-1;
Y=0:Q-1;
Cx=0.5*P;
Cy=0.5*Q;
[X,Y]=meshgrid(X,Y);
if type == "ideal"
    H = (X-Cx).^2+(Y-Cy).^2;
    for p = 1:P
        for q = 1:Q
            if H(p,q) <= param^2
                H(p,q) = 0;
            else
                H(p,q) = 1;
            end
        end
    end
elseif type == "gaussian"
    Lo=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*param.^2));
    H=1-Lo; % High pass filter=1-low pass filter
elseif type == "butterworth"
    D = sqrt((X-Cx).^2+(Y-Cy).^2);
    H = 1./(1+(param(1)./D).^(2.*param(2)));
end
end

