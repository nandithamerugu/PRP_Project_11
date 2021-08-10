function I=indicator(c1,c2)
n=length(c1);
p=0;
for nn=1:1:n
    if(c1(nn)~=c2(nn))
        p=p+1;
    end
end
if p>0
    I=1;
else
    I=0;
end

end