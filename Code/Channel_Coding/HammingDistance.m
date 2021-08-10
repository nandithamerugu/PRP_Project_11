function D=HammingDistance(c1,c2)
n=length(c1);
D=0;
for nn=1:1:n
    if (c1(nn)~=c2(nn))
        D=D+1;
    end
end
end