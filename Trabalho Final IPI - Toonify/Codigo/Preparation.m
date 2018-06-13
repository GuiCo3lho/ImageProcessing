close all;
clear all;
clc;
% Buscando diretório de imagens originais
myFolder = 'D:\MATLAB\IPI\Trabalho Final IPI - Toonify\ImagensTeste';
% Verificar se o diretorio existe
if ~isfolder(myFolder)
    sprintf('Error: Folder %s does not exist', myFolder);
    return;
end
% Procurando apenas por arquivos do tipo 'jpg'
filepadrao = fullfile(myFolder,'*.jpg');
Diretorio = dir(filepadrao);

% Varrendo cada imagem no diretório
for posfile = 1:length(Diretorio)
    imagemOriginal = imread(Diretorio(posfile).name);
    figure, imshow(imagemOriginal);
    imagemycbcr = rgbtogray(imagemOriginal); %YCbCr components of the image
    imagemGray = imagemycbcr(:,:,1); %pegar Luminance component
    figure, imshow(imagemGray);
    fmgrayimage = medfilt2(imagemGray, [7 7]);%filtragem 7x7 com median filter
    figure, imshow(fmgrayimage);
end

    
    

