%mencari nilai minimal dari data
function min = minimal(data)
%mendefinisikan data sebagai array
data = data(:);
%pencarian nilai minimal dimulai dari indeks pertama
min = data(1);
%jumlah perulangan sesuai dengan panjang array
n = size(data);
%melakukan perulangan dimulai dari indeks ke-2
for i=2 : n
    %membandingan dengan nilai minimal sementara
   if(data(i)>min)
       %dilakukan pergantian nilai minimal jika lebih besar
      min = data(i); 
   end
end

end