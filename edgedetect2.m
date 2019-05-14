function [h,g_re] = edgedetect2(f,dil,clo,ero)
f1 = rgb2gray(f);
f1 = bpfilter(f1,35);
threshold=[0.01,0.17];  
sigma=2;
img_edge = edge(double(f1),'canny',threshold,sigma)*255; 
% imshow(img_edge)
%% 
% S1 = [0 1 0; 1 1 1; 0 1 0];
S1 = strel('disk',dil);
% S1 = ones(9);
g_di=imdilate(img_edge,S1);
% imshow(g_di)

%%
% g_max = maxFilter4e(g_di,10,10);
% imshow(g_max)
S2 = strel('disk',clo);
g_di2 = imclose(g_di,S2);
g_fill = imfill(g_di2,'holes');
% imshow(g_fill)
%%
S2 = strel('disk',ero);
g_di3 = imerode(g_fill,S2);
% imshow(g_di3)
%%
BW = g_di3;
BW = logical(BW);
BW2 = bwareafilt(BW,1);
% imshow(BW2)
%%
threshold=[0.01,0.17];  
sigma=2;
img_edge2 = edge(double(BW2),'canny',threshold,sigma)*255;
B = ones(3);
g_re=imdilate(img_edge2,B);
% imshow(g_re)

h = f;
% imshow(h)
[m,n,c] = size(h);
for i=1:m-1
    for j=1:n-1
        if g_re(i,j)==255
            h(i,j,1)=225; h(i,j,2)=0;h(i,j,3)=0;
            h(i-1,j,1)=225; h(i-1,j,2)=0;h(i-1,j,3)=0;
            h(i,j-1,1)=225; h(i,j-1,2)=0;h(i,j-1,3)=0;
            h(i+1,j,1)=225; h(i+1,j,2)=0;h(i+1,j,3)=0;
            h(i,j+1,1)=225; h(i,j+1,2)=0;h(i,j+1,3)=0;
        end
    end
end
end