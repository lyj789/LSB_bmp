W=imread('1_lsb.bmp');
B=W(:,:,1);

for i=1:m*n
   re2(i)=bitget(B(i),1);
end
for i=1:m*n
    if re2(i)==1
         start2=i
         break;
    end
end

for i=1:m*n/start2-1
     se(i)=re2(start2*(i+1));
end

fid=fopen('serect.txt','wt');
for i=1:length(se)/8
    b=num2str(se(1+(i-1)*8:8+(i-1)*8));
    c=bin2dec(b);
    d=char(c);
   fprintf(fid,'%s',d);
end
fclose(fid);

