s=importdata('text_file.txt'); % importing the data
str=(s(:));
str=[str{:}];
%disp(str);
AZ='!':'~';
AZ=[AZ ' '];
long=sum(ismember(str,AZ));
for k=1:numel(AZ)
  freq(k,1)=sum(ismember(str,AZ(k)))/long;
  sorted=sort(freq,'descend');
end
%disp(freq);
[~,position]=sort(freq,'descend');
N=0;
for nn=1:1:length(sorted)
    if sorted(nn)~=0
        N=N+1;
    else
        break;
    end
end
for ii=1:1:N
     display(strcat(AZ(position(ii)),' -->  ',num2str(sorted(ii))));
end
t=zeros(1,N);
p=zeros(1,N);
for jj=1:1:N
    t(jj)=AZ(position(jj));
    p(jj)=sorted(jj);
end
total_char=strcat(t);
prob_dist=p;
%disp(total_char);
% disp(prob_dist);

code_word=encoding(prob_dist);
 disp(code_word);
for ii=1:1:N
     display(strcat(AZ(position(ii)),' -->  ',code_word(ii)));
end
fileID=fopen('text_file_encode.txt','w');

for nn=1:1:long
    for jj=1:1:N
        if(str(nn)==strcat(AZ(position(jj))))
            en_str=convertCharsToStrings(code_word(jj));
            fprintf(fileID,'%s',(en_str));
        end
    end
end
fclose(fileID);
fileID = fopen('text_file_encode.txt','r');

str_enc = fscanf(fileID,'%s');

fclose(fileID);
estimate=decoding(total_char,code_word,str_enc);

fileID=fopen('text_file_decode.txt','w');
fprintf(fileID,'%s',estimate);
fclose(fileID);

 



