function finaledges = edgeprocessing(image)
    pegabordas = edge(image,'Canny',[0.07 0.2]);
    dilatabordas = imdilate(pegabordas,strel('square',2));%dilatar as bordas conseguidas no edge detection "Canny"
    blackedgesdilated = imcomplement(dilatabordas); %inverter a imagem "dilatabordas" para tornar as bordas pretas
    finaledges = blackedgesdilated;
end