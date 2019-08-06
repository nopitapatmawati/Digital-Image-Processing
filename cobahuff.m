function sym = cobahuff(img)
count=0;
sym=zeros(255,2);
for i=0:255
    for j=1:size(img,1)
        for k=1:size(img,2)
            if(i==img(j,k))
                count=count+1;
            end
        end
    end
%     disp(i, count);
    if(count~=0)
        sym(i,1)=i;
        sym(i,2)=count;
    end
    count=0;
end
% disp(sym);
simbol=sym(:,1);
prob=sym(:,2)/numel(sym);
disp(sum(prob))
% [dict,avglen] = huffmandict(simbol,prob);
% disp(dict);