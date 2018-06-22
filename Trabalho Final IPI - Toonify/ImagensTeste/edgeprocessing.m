function finaledges = edgeprocessing(image)
    pegabordas = edge(image,'Canny',[0.07 0.2]);
    bordasDilatadas = imdilate(pegabordas,strel('square',2));%dilatar as bordas conseguidas no edge detection "Canny"
    filtredEdges = bwareaopen(bordasDilatadas,50,8);%filtro de bordas que apaga bordas com tamanho menor ou igual a 400 pixels
    blackedgesdilated = imcomplement(filtredEdges); %inverter a imagem "dilatabordas" para tornar as bordas pretas
    finaledges = blackedgesdilated;
end
