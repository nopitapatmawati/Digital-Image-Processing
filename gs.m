function grayImage = gs(img)
[rows, columns, numberOfColorChannels] = size(img);
if numberOfColorChannels == 3
    red = img(:, :, 1);
    green = img(:, :, 2);
    blue = img(:,:,3);
    grayImage = 0.2*double(red)+0.4*double(green)+0.4*double(blue);
    grayImage = uint8(grayImage);
else
    grayImage = img;
end
