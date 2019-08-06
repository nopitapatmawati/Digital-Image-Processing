function h = convo(a,konv)
temp = zeros(size(a,1)+2, size(a,2)+2, size(a,3));
temp(2:end-1,2:end-1,:)= a(:,:,:);
poin = zeros(3,3,3);
for i=1:size(a,1)
    poin=zeros(3,3);
    for j=1:size(a,2);
        poin=temp(i:i+2,j:j+2,:);
        h(i,j,:)=sum(sum(poin.*konv));
    end
end
