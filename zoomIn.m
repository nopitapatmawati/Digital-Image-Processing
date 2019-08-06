function c = zoomIn(img)
[row, columns, colormap] = size(img);
if colormap == 3
    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);
end
% 
k=1;
l=1;
f=2;
for i=1:row
    for t=1:f
        for j=1:columns
            for t=1:f
                if colormap == 3
                    c1(k,l) = red(i,j);
                    c2(k,l) = green(i,j);
                    c3(k,l) = blue(i,j);
                else
                    c(k,l) = img(i,j);
                end
                l=l+1;
            end
        end
        l=1;
        k=k+1;
    end
end
if colormap == 3
    c(:,:,1)=c1;
    c(:,:,2)=c2;
    c(:,:,3)=c3;
end