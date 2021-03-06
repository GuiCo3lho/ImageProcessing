function grayimage = rgbtogray(rgbimage)
i = rgbimage;
R = i(:,:,1); %get R channel of inputImage
G = i(:,:,2); %get G channel of inputImage
B = i(:,:,3); %get B channel of inputImage
newImage = zeros(size(i,1), size(i,2), 3 , 'uint8'); %create matrix size of inputImage

for x=1:size(newImage,1)
    for y = 1:size(newImage,2)
        newImage(x,y,1) = (0.299*R(x,y)) + (0.587*G(x,y)) + (0.114*B(x,y)); %Luminance Component
        newImage(x,y,2) = 128-(0.168736*R(x,y))-(0.331264*G(x,y))+(0.5*B(x,y)); %Cb component
        newImage(x,y,3) = 128+(0.5*R(x,y))-(0.418688*G(x,y))-(0.081312*B(x,y)); %Cr component
    end
end
grayimage = newImage; %retorna YCbCr components  
end


%function filtredimage_m = medianfilter(image)



