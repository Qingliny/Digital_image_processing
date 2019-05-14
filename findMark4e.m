function c = findMark4e(f,w)
sd = w.sd;
k = w.k; 
m = makeMark4e(sd,k);
alpha = w.alpha;
w = struct('alpha',alpha,'k',k,'sd',sd);
f=f(:,:,1);
[r,c]=size(f);
D=dct2(f);
vec=reshape(D,1,r*c);
[Dstr,Idx]=sort(abs(vec),'descend');
iddx=Idx(2:k+1);
nd=zeros(k,2);
for t=1:k
    x=floor(iddx(t)/r)+1;
    y=mod(iddx(t),r);
    nd(t,1)=y;
    nd(t,2)=x;
end
dm=D;
for t=1:k
    dm(nd(t,1),nd(t,2))=dm(nd(t,1),nd(t,2))+ alpha*dm(nd(t,1),nd(t,2)).*m(t);
end
g=idct2(dm);
z=im2bw(g);
z=double(z);
r=double(g-mod(g,2));
g=uint8(r+z);
ww=[];
for t=1:k
    ww(1,t)=[(dm(nd(t,1),nd(t,2))/D(nd(t,1),nd(t,2))-1)*(1/alpha)];
end

meanw = mean(ww);
meanm = mean(m);
c =sum((ww-meanw).*(m-meanm))/sqrt(sum((ww-meanw).^2).*sum((m-meanm).^2)); 
end