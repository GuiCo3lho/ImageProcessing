close all;
clear all.
clc;
cd ../ImagensTeste/;
Diretorio = dir('*.jpg');%Armazena n�mero de arquivos do tipo .jpg

%Varrendo cada imagem no diret�rio
%for posfile = 1:length(Diretorio)
for posfile = 1:length(Diretorio)
    
    imagemOriginal = imread(Diretorio(posfile).name);%ler cada foto do arquivo
    imagemycbcr = rgbtogray(imagemOriginal); %YCbCr components of the image
    imagemGray = imagemycbcr(:,:,1); %pegar Luminance component
    [h, w, c] = size(imagemOriginal);
    fmgrayimage = medfilt2(imagemGray, [7 7]);%usando o median filter na grayscale image
   
    finaledges = edgeprocessing(fmgrayimage); %processamento de edges
    
    imageAddEdges = immultiply(imagemGray,finaledges);%por as bordas feitas no edgeprocessing na imagem gray
    
  
    color = colorprocessing(imagemOriginal);
    
    edges=zeros(h,w,c,'uint8');
    edges(:,:,1)=finaledges;
    edges(:,:,2)=finaledges;
    edges(:,:,3)=finaledges;
    
    final=immultiply(edges,color);    
    
    %transferindo para pasta de ImagensCartoon os resultados
    DiretorioResultado = sprintf('../ImagensCartoon/cartoon_%d.jpg', posfile);  
    imwrite(final, DiretorioResultado);
    
end

cd ..;
cd Codigo;

    %quanto maior a matriz maior o smoothing/imagem mais washed out
    %quanto menor a matriz mais preservada fica as bordasn

    
    

