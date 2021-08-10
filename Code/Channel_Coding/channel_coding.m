

% n=15 k=10 p=0.015
n=15;
k=10;
p=0.015;
N=1500;
%disp(C);
P_E_C=zeros(1,5);
for tt=1:1:5
    x=randperm((2^n)-1,2^k);
    E=0;
    C=de2bi(x,n,'left-msb');
    for nn=1:1:N

        c=C(randperm(2^k,1),:);
        %disp(c);
        s=rand(1,n);
        for mm=1:1:n
            if (s(mm)<=p)
                if (c(mm)==1)
                    c(mm)=0;
                else
                     c(mm)=1;
                end             
            end
        end
        y=c;
%         disp('y');
%         disp(y);
        c1=MDD(C,y);
%         disp('c');
%         disp(c1);
        
        E=E+indicator(c1,c);
    end
    P_E_C(tt)=E/N;
end
P_E_C_min=min(P_E_C);
disp(P_E_C_min);
disp(P_E_C);

