function seg = threshold(img);
% img = imread('manfaat_apel.jpg');
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
outred = red>150;
outgreen = green>150;
outblue = blue>120;
seg = outred;
% seg = strcat(outred, outgreen, outblue)
% disp(outred);