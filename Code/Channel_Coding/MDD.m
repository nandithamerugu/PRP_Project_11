function estimate=MDD(C,y)

[R n]=size(C);
estimate=zeros(1,n);
m=n;
for nn=1:1:R
    if (HammingDistance(y,C(nn,:)) <= m)
        m=HammingDistance(y,C(nn,:));        
    end
end
for ii=1:1:R
    if m==HammingDistance(y,C(ii,:))
        estimate=C(ii,:); 
    end
end
