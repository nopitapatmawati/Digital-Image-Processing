function dil = Delasi(img)
% ubah gambar kedalam bentuk hitam dan putih
bow = im2bw(img,0.5);
disp(size(bow));
w = [1 1 1;1 1 1;1 1 1];
ero=zeros(size(bow,1), size(bow,2));
dil=zeros(size(bow,1), size(bow,2));
for x=2:size(bow,1)-1
    for y=2:size(bow,2)-1
        a1=[w(1)*bow(x-1,y-1) w(2)*bow(x-1,y) w(3)*bow(x-1, y+1)...
            w(4)*bow(x,y-1) w(5)*bow(x,y) w(6)*bow(x, y+1)...
            w(7)*bow(x+1,y-1) w(8)*bow(x+1,y) w(9)*bow(x+1, y+1)];
        dil(x,y)=min(a1);
        ero(x,y)=max(a1);
    end
end

figure('Name', 'Gambar Awal'), imshow(bow);
figure('Name', 'Gambar Dilasi'), imshow(dil);
figure('Name', 'Gambar Erosi'), imshow(ero);