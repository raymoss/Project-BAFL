%This is function for ball detection which is called from main program
function y=detect_ball(a)
r=a(:,:,1);
g=a(:,:,2);
b=a(:,:,3);
I=[(r>=70) & (g<=70) & (b<=70)]; % need to adjust it according to lighting conditions
se=strel('disk',20);
B=imopen(I,se);
final=imclose(B,se);
imshow(final)
[L,n]=bwlabel(final);
if n>=1
    y=L;
else
    y=0;
end
end
