function w = zoomOut(img)
img=uint16(img);
[row, col, rgb] = size(img);
ukuran = 2;
r = img(:, :, 1);
g = img(:,:,2);
b = img(:,:,3);

row = row/ukuran;
col = col/ukuran;

for i=1 : row
    for j=1 : col
        w1(i,j)= ((r(ukuran*i,ukuran*j)+r(i*ukuran-1,j*ukuran)+r(i*ukuran,j*ukuran-1)+r(i*ukuran-1,j*ukuran-1))/4);
        w2(i,j)= ((g(ukuran*i,ukuran*j)+g(i*ukuran-1,j*ukuran)+g(i*ukuran,j*ukuran-1)+g(i*ukuran-1,j*ukuran-1))/4);
        w3(i,j)= ((b(ukuran*i,ukuran*j)+b(i*ukuran-1,j*ukuran)+b(i*ukuran,j*ukuran-1)+b(i*ukuran-1,j*ukuran-1))/4);
    end
end

w1=uint8(w1);
w2=uint8(w2);
w3=uint8(w3);

w(:,:,1)=w1;
w(:,:,2)=w2;
w(:,:,3)=w3;