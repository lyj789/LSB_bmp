P=imread('1.jpg');
A=P(:,:,1);
P_g=P(:,:,2);
P_b=P(:,:,3);
[m,n]=size(A); 
a=A(:);


allpath = 'message.txt';
fid = fopen(allpath);
data = textscan(fid,'%s');   
d=vertcat(data{:});  
q=cell2mat(d);        %cell转化为数组
p=dec2bin(q,8);       %10进制转8位2进制
pp=p';                %转置
msg=pp(:);            %变成一维的
fclose(fid);
msg_len=length(msg);

water=a;
lsb=A;
for i=1:length(a)
    water(i)=bitset(water(i),1,0);
end

start=randi(floor(length(a)/(msg_len+1)),1,1)
water(start)=1;
for i=1:msg_len
    water((i+1)*start)=bitset(water((i+1)*start),1,str2double(msg(i)));
end


for i=1:m
    for j=1:n
        lsb(j,i)=water((i-1)*n+j);
    end
end


W=cat(3,lsb,P_g,P_b);
figure;
subplot(1,2,1);imshow(P);title('normal');
subplot(1,2,2);imshow(W);title('serect');
imwrite(W,'1_lsb.bmp','bmp');

