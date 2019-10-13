%mencari nilai maksimal dari data
function max = maksimal(data)
%mendefinisikan data sebagai array
data = data(:);
%pencarian nilai maksimal dimulai dari indeks pertama
max = data(1);
%jumlah perulangan sesuai dengan panjang array
n = size(data);
%melakukan perulangan dimulai dari indeks ke-2
for i=2 : n
    %membandingan dengan nilai maksimal sementara
   if(data(i)>max)
       %dilakukan pergantian nilai maksimal jika lebih besar
      max = data(i); 
   end
end

end