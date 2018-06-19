function [ImgColorFiltered] = ColorPreparation(ImagemEntrada)
  
  % Diminuindo a escala da imagem para reduzir o custo computacional da
  % filtragem bilateral
  % ImgDown = imresize(ImagemEntrada,0.25);
  
  ImagemEntrada(:,:,1)=medfilt2(ImagemEntrada(:,:,1), [7 7]);
  ImagemEntrada(:,:,2)=medfilt2(ImagemEntrada(:,:,2), [7 7]);
  ImagemEntrada(:,:,3)=medfilt2(ImagemEntrada(:,:,3), [7 7]);
  
  ImgFiltroBilateral=imbilatfilt(ImagemEntrada); 
  
  ImgFiltroBilateral(:,:,1)=medfilt2(ImgFiltroBilateral(:,:,1), [7 7]);
  ImgFiltroBilateral(:,:,2)=medfilt2(ImgFiltroBilateral(:,:,2), [7 7]);
  ImgFiltroBilateral(:,:,3)=medfilt2(ImgFiltroBilateral(:,:,3), [7 7]);
  %ImgFiltroBilateral = imresize(ImgFiltroBilateral,4);
  %figure, imshow(uint8(ImgFiltroBilateral)), title('Imagem Filtrada Bilateral');

  % Processo de quantizacao da imagem do filtro bilateral, sendo 16 niveis de cor para cada canal.
  ImgColorFiltered = uint8((floor(double(ImgFiltroBilateral)/16))*16);
  
  %figure, imshow(ImgCores), title('Imagem Final Ajuste de Cores');
end