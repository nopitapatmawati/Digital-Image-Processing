function hasil = rata(a)
temp = zeros(size(a,1)+2, size(a,2)+2, size(a,3));
temp(2:end-1, 2:end-1, :)=a(:,:,:);
hasil = zeros(size(a,1), size(a,2), size(a,3));
for i=1:size(a,1)
    pooling=zeros(3,3,3);
    for j=1:size(a,2)
        pooling=temp(i:i+2,j:j+2,:);
        pool1=pooling(:,:,1);
        pool2=pooling(:,:,2);
        pool3=pooling(:,:,3);
        hasil(i,j,1)=mean(pool1(:)');
        hasil(i,j,2)=mean(pool2(:)');
        hasil(i,j,3)=mean(pool3(:)');
    end
end