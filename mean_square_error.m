%mencari nilai mean square error / kesalahan kuadrat rata-rata
function mse = mean_square_error(sample, test)
%mendapatkan jumlah kolom dari data sample
n = size(sample,2);
%inisialisasi nilai awal total dengan nilai 0
total = 0;
%melakukan perulangan sebanyak n jumlah kolom
for i = 1 : n
   %menyimpan total hasil kuadrat dari data sample ke-i dikurangi data test
   %ke-i
   total = total + (sample(i)-test(i))^2;
end
%menbagi nilai total dengan jumlah n untuk mendapatkan nilai mse
mse =  total / n;
end