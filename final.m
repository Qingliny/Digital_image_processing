f1 = imread('Picture1.png');
f1 = rgb2gray(f1);
e1 = entropy4e(f1,256)
f2 = imread('Picture2.png');
f2 = rgb2gray(f2);
e2 = entropy4e(f2,256)
f3 = imread('Picture3.png');
f3 = rgb2gray(f3);
% f3 = imageScaling4e(f3,1,0.99);
e3 = entropy4e(f3,256)
f4 = imread('Picture4.png');
f4 = rgb2gray(f4);
% f4 = imageScaling4e(f4,0.31,0.82);
e4 = entropy4e(f4,256)