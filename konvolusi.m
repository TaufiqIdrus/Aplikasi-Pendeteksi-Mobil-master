%function konvolusi untuk melakukan operasi konvolusi gambar input A dengan
%kernel k untuk menghasilkan gambar output B
function B = konvolusi(A);
k = [-1 0  0 0 -1;
          -1 0 0 0 -1;
          -1 0 9 0 -1;
          -1 0 0 0 -1;
          -1 0 0 0 -1];
%mendapatkan ukuran gambar input A
[r c] = size(A);
%mendapatkan ukuran kernel k
[m n] = size(k);
%melakukan invers terhadap kernel k dengan cara me rotate gambar 90 derajat
%sebanyak 2 kali
h = rot90(k, 2);
%mencari posisi titik tengah dari kernel baru
center = floor((size(h)+1)/2);
%mencari jumlah elemen yang ada di sebelah kiri dari bagian tengah kernel
left = center(2) - 1;
%mencari jumlah elemen yang ada di sebelah kanan dari bagian tengah kernel
right = n - center(2);
%mencari jumlah elemen yang ada di sebelah atas dari bagian tengah kernel
top = center(1) - 1;
%mencari jumlah elemen yang ada di sebelah bawah dari bagian tengah kernel
bottom = m - center(1);

%membuat gambar kosong seukuran gambar A + sejumlah pixel yang
%didapat berdasarkan ukuran kernel
Rep = zeros(r + top + bottom, c + left + right);

% melakukan proses zero padding pada gambar input A yakni menambahkan pixel
% bernilai 0 di sekeliling gambar agar proses konvolusi lebih optimal
for x = 1 + top : r + top
    for y = 1 + left : c + left
        Rep(x,y) = A(x - top, y - left);
    end
end

%membuat gambar kosong B  seukuran gambar input A
B = zeros(r , c);

%looping untuk konvolusi
for x = 1 : r
    for y = 1 : c
        for i = 1 : m
            for j = 1 : n
                q = x - 1;
                w = y - 1;
                B(x, y) = B(x, y) + (Rep(i + q, j + w) * h(i, j));
            end
        end
    end
end