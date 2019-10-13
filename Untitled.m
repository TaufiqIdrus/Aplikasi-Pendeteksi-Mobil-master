image = imread('avanza-1.jpg');
%image2 = imread('avanza-1.jpg');
%image = convert_grayscale(image);


for i = 1:size(image, 1)
    for j = 1:size(image, 2)
       
      
       image2(i,j) = image(i,j) +255;
        
    end 
end




imshow(image2)
