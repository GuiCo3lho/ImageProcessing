a = imread('Lena.bmp')
ab = a>120;
figure,imshow(ab);
ad = double(a);
ad1 = ad+150;
figure,imshow(uint8(ad1));
figure,imshow(ad1);
ad2 = imadd(ad1);
impxeilinfo(ad1);
imadd(ad1);


ad2 = imadd(a,100);
figure,imshow(ad2);
y = imcomplement(a);
figure,imshow(a);
figure,imshow(y);

%imsubtract(a,50)
%immultiply(a,20)
%imcomplement
%imadd,ad = double(a); ad1 = ad +150
%imhist(a);
%imadjust
