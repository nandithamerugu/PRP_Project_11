function [estimate]=decoding(unique_char,code,encoded)
len=length(unique_char);
arr_len=[];
for ii=1:1:len
    l=length(char(code(ii)));
    arr_len=[arr_len l];
end
max_len_cw=max(arr_len);
estimate='';
len_encoded=length(encoded);
i=1;
while i<=len_encoded
    j=0;
    while j<max_len_cw
        c=encoded(i:i+j);
        posn=1;
        while (posn<=len && ~isequal(char(code(posn)),c))
            posn=posn+1;
        end
        if posn<=len
            estimate=[estimate char(unique_char(posn))];
            break
        else j=j+1;
        end
    end
    i=i+j+1;
end
