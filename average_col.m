%mencari nilai rata-rata dari kolom
function result =  average_col(data)

%menyimpan ukuran dari data ke dalam variable r dan c
[row,col] = size(data);

%inisialisasi nilai awal total penjumlahan isi kolom dengan nilai 0
total = 0;

%melakukan looping sebanyak jumlah kolom terlebih dahulu
%bukan sebanyak baris karena nilai rata rata yang dicari adalah nilai rata
%rata dari kolom
for i =1 : col
    %setiap perulangan selesai nilai totalCol akan menjadi 0, untuk
    %kemudian diisi dengan nilai baru
    totalCol = 0;
    
    %melakukan perulangan sebanyak jumlah baris untuk mendapatkan nilai
    %total dari sebuah kolom
    for j = 1 : row
        
       %nilai total kolom disimpan dalam variabel totalCol
       totalCol = totalCol+data(j,i);
    end
    
    %jika data hanya mempunyai 1 kolom, nilai totalCol langsung disimpan
    %dalam variabel total
    if i==1
        total = totalCol;
    %jika lebih dari 1 kolom makan nilai total setiap kolom disimpan dalam
    %array
    else
        %setiap perulangan akan memasukkan nilai total kolom ke dalam array
        %total 
        total = [total, totalCol];
    end
end

%membagi nilai total dengan jumlah kolom untuk mendapatkan nilai rata-rata akhir
%dari setiap kolom
result = total/row;
return