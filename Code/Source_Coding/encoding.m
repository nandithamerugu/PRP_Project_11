function [c]=encoding(p)
len=length(p);% length of probability distribution
c=cell(1,len); % empty row generated
A=zeros(len,len);% empty matrix
temp=p;
for nn=1:1:len-1
    [~,new_index]=sort(temp); %creating sorted version of the input probabilities
    A(new_index(1),nn)=10;% we assigned 10 for the least probability
    A(new_index(2),nn)=11; % we assigned 11 for the second least probability
    temp(new_index(2))=temp(new_index(2))+temp(new_index(1)); % we created new array of probability distributions
    temp(new_index(1))=100;  
end
nn=len-1;
r=find(A(:,nn)==10);
c(r)=strcat(c(r),'1');
r=find(A(:,nn)==11);
c(r)=strcat(c(r),'0');
for nn=len-2:-1:1
    r_11=find(A(:,nn)==11);
    r_10=find(A(:,nn)==10);
    c(r_10)=strcat(c(r_11),'1');
    c(r_11)=strcat(c(r_11),'0');
end   
end
