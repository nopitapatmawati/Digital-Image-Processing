function hasil = med(img)
temp = zeros(size(img,1)+2, size(img,2)+2, size(img,3));
temp(2:end-1, 2:end-1, :)=img(:,:,:);
hasil = zeros(size(img,1), size(img,2), size(img,3));
for i=1:size(img,1)
    pooling=zeros(3,3,3);
    for j=1:size(img,2)
        pooling=temp(i:i+2,j:j+2,:);
        pool1=pooling(:,:,1);
        pool2=pooling(:,:,2);
        pool3=pooling(:,:,3);
        hasil(i,j,1)=median(pool1(:)');
        hasil(i,j,2)=median(pool2(:)');
        hasil(i,j,3)=median(pool3(:)');
    end
end