% membagi gambar menjadi 4 bagian
function result = split(grayImg)


[row, col] = size(grayImg);

a = ceil(row/2); 
b =  row-a; 
x = ceil(col/2);
y = col - x;
disp([a b x y]);
result = mat2cell(grayImg, [a b], [x y]);


return