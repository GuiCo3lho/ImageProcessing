close all;
clear all.
clc;
cd ../ImagensTeste/;
Diretorio = dir('*.jpg');

% Varrendo cada imagem no diretório
% for posfile = 1:length(Diretorio)
for posfile = 1:length(Diretorio)
    imagemOriginal = imread(Diretorio(posfile).name);
    imagemycbcr = rgbtogray(imagemOriginal); %YCbCr components of the image
    imagemGray = imagemycbcr(:,:,1); %pegar Luminance component
    
    %figure, imshow(imagemGray);
    
    fmgrayimage = medfilt2(imagemGray, [7 7]);%usando o median filter na grayscale image
    
    %quanto maior a matriz maior o smoothing/imagem mais washed out
    %quanto menor a matriz mais preservada fica as bordasn
    %figure, imshow(fmgrayimage);
    
    pegabordas = edge(fmgrayimage,'Canny',[0.07 0.2]);
    %figure, imshow(pegabordas);
    dilatabordas = imdilate(pegabordas,strel('square',2));%dilatar as bordas conseguidas no edge detection "Canny"
    
    
    blackedgesdilated = imcomplement(dilatabordas) %inverter a imagem "dilatabordas" para tornar as bordas pretas
    %figure,imshow(dilatabordas);%mostrar bordas com cor branca
    %figure,imshow(blackedgesdilated);%mostrar bordas com cor preta
    
    OrigImageAddEdges = immultiply(imagemGray,blackedgesdilated);%por as bordas feitas no imdilate na imagem gray
    %figure,imshow(OrigImageAddEdges);% mostrar imagem grayscale com a adição das bordas de "blackedgesdilated"X
    
    
    DiretorioResultado = sprintf('../ImagensCartoon/cartoon_%d.jpg', posfile);  
    imwrite(OrigImageAddEdges, DiretorioResultado);
    
end

cd ..;
cd Codigo;

    
    

