function [h,edge2] = edgedetect(f)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
% Gaussian low pass
f1 = rgb2gray(f);
f1 = bpfilter(f1,50);
% imshow(f1)
% canny dege
threshold=[0.01,0.17];  
sigma=2;
img_edge = edge(double(f1),'canny',threshold,sigma)*255;  
% figure,imshow(img_edge,[]);  
% title('canny edge detect');
% dilate
% S1 = strel('disk',3);
S1 = [0 1 0; 1 1 1; 0 1 0];
g_di=imdilate(img_edge,S1);
edge2 = g_di;
% imshow(g_di)
% Showing edge in original image
h = f;
% imshow(h)
[m,n,c] = size(h);
for i=10:m-10
    for j=10:n-10
        if g_di(i,j)==255
            h(i,j,1)=225; h(i,j,2)=0;h(i,j,3)=0;
            h(i-1,j,1)=225; h(i-1,j,2)=0;h(i-1,j,3)=0;
            h(i,j-1,1)=225; h(i,j-1,2)=0;h(i,j-1,3)=0;
            h(i+1,j,1)=225; h(i+1,j,2)=0;h(i+1,j,3)=0;
            h(i,j+1,1)=225; h(i,j+1,2)=0;h(i,j+1,3)=0;
        end
    end
end

end

