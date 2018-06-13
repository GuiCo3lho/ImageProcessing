close all;
clear all.
clc;
cd ../ImagensTeste/;
Diretorio = dir('*.jpg');

% Varrendo cada imagem no diretório
%for posfile = 1:length(Diretorio)
for posfile = 1:length(Diretorio)
    imagemOriginal = imread(Diretorio(posfile).name);
    %figure, imshow(imagemOriginal);
    imagemycbcr = rgbtogray(imagemOriginal); %YCbCr components of the image
    imagemGray = imagemycbcr(:,:,1); %pegar Luminance component
    figure, imshow(imagemGray);
    fmgrayimage = medfilt2(imagemGray, [7 7]);
    figure, imshow(fmgrayimage);
    pegabordas = edge(fmgrayimage,'Canny',[0.1 0.4]);
    figure, imshow(pegabordas);   
end
cd ..;
cd Codigo;

    
    

