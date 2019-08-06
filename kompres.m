function out_put = kompres(in_put,block_size)
X=imread(in_put);
Y=imfinfo(in_put);
K=block_size;
X1=double(X);
y1=size(X);
n=y1(1);
m=y1(2);
k=1;l=1;

disp(K);
disp(size(X1));
disp(n);
disp(m);

if (Y.ColorType=='grayscale')
    subplot(131),imshow(X),title('ORIGINAL');
    for i=1:K:n
        for j=1:K:m
            tmp([1:K],[1:K])=X1([i:i+(K-1)],[j:j+(K-1)]);
            mn=mean(mean(tmp));
            tmp1([i:i+(K-1)],[j:j+(K-1)])=tmp>mn;
            Lsmat=(tmp<mn);
            Mrmat=(tmp>=mn);
            Lsmn=sum(sum(Lsmat));
            Mrmn=sum(sum(Mrmat));
            Mu(k)=sum(sum(Lsmat.*tmp))/(Lsmn+.5);k=k+1;
            Mi(l)=sum(sum(Mrmat.*tmp))/Mrmn;l=l+1;
        end
    end
    subplot(132),imshow(tmp1);title('ENCODED');
    k=1;l=1;
    for i=1:K:n
        for j=1:K:m
            tmp21([1:K],[1:K])=tmp1([i:i+(K-1)],[j:j+(K-1)]);
            tmp22=(tmp21*round(Mu(k)));k=k+1;
            tmp21=((tmp21==0)*round(Mi(l)));l=l+1;
            tmp21=tmp21+tmp22;
            out_put([i:i+(K-1)],[j:j+(K-1)])=tmp21;
        end
    end
    subplot(133),imshow(uint8(out_put));title('DECODED');
elseif (Y.ColorType=='truecolor')
    R=X(:,:,1);
    G=X(:,:,2);
    B=X(:,:,3);
    subplot(131),imshow(X),title('ORIGINAL');
    for b=1:3
        for i=1:K:n
                for j=1:K:m
                    tmp([1:K],[1:K])=X1([i:(i+(K-1))],[j:(j+(K-1))], b);
                    mn=mean(mean(tmp));
                    tmp1([i:i+(K-1)],[j:j+(K-1)],b)=tmp>mn;
                    Lsmat=(tmp<mn);
                    Mrmat=(tmp>=mn);
                    Lsmn=sum(sum(Lsmat));
                    Mrmn=sum(sum(Mrmat));
                    Mu(b,k)=sum(sum(Lsmat.*tmp))/(Lsmn+.5);k=k+1;
                    Mi(b,l)=sum(sum(Mrmat.*tmp))/Mrmn;l=l+1;
                end
        end
    end
    subplot(132),imshow(tmp1);title('ENCODED');
    k=1;l=1;
    for b=1:3
        for i=1:K:n
                for j=1:K:m
                    tmp21([1:K],[1:K])=tmp1([i:i+(K-1)],[j:j+(K-1)]);
                    tmp22=(tmp21*round(Mu(b,k)));k=k+1;
                    tmp21=((tmp21==0)*round(Mi(b,l)));l=l+1;
                    tmp21=tmp21+tmp22;
                    out_put([i:i+(K-1)],[j:j+(K-1)],b)=tmp21;
                end
        end
    end
    subplot(133),imshow(uint8(out_put));title('DECODED');
end