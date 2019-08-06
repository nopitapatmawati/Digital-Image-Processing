function [red,green,blue] = historgb(img)
r=img(:,:,1);
g=img(:,:,2);
b=img(:,:,3);
red = zeros(1, 256) ;
green = zeros(1, 256);
blue = zeros(1, 256);
for i=1:256
    red(i)=size(r(r==i-1)',2);
    green(i)=size(g(g==i-1)',2);
    blue(i)=size(b(b==i-1)',2);
end
figure('Name','Histogram Red');
bar(red);
figure('Name','Histogram Green');
bar(green);
figure('Name','Histogram Blue');
bar(blue);