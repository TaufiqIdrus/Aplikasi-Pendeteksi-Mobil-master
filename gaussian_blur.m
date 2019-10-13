img = imread('avanza-1.jpg');
H = size(img, 1);
W = size(img, 2);
edgeDir = zeros(H, W);

gaussian_mask = [2 4 5 4 2;
                 4 9 12 9 4;
                 5 12 15 12 5;
                 4 9 12 9 4;
                 2 4 5 4 2;]
                             
for row = 2:H-2
   for col 2:W-2
   newPixel = 0;
       for rowOffset= -2:2
           for colOffset= -2:2
               rowTotal = row + rowOffset;
               colTotal = col + colOffset;
               iOffset = (rowTotal*3*W + colTotal*3);
               newPixel = (newPixel * (m_destinationBmp + iOffset))   * gaussian_mask(2+rowOffset, 2 + colOffset);
           end
       end
       i = (row*3*W + col*3);
       [roww , coll] = newPixel /159;
   end
end