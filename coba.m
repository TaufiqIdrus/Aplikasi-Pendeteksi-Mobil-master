%load image
%img_rgb=imread('avanza\ww.jpg');

%convert ke grayscale
img_grayscale = convert_grayscale(img_rgb);

%mendapatkan jumlah baris dan kolom dari gambar input 
[row, col] = size(img_grayscale);

%matrik 0 dengan ukuran sama dengan gambar asli
img_baru = zeros(row, col);

%kernel untuk konvolusi
kernel = [-1 0  0 0 -1;
          -1 0 0 0 -1;
          -1 0 9 0 -1;
          -1 0 0 0 -1;
          -1 0 0 0 -1];
      
% kernel = [-1 0 -1;
%           -1 9 -1;
%           -1 0 -1];
% kernel =  1 / 273 *[2 4 5 4 2;
%                 4 9 12 9 4;
%                 5 12 15 12 5;
%                 4 9 12 9 4;
%                 2 4 5 4 2];
% kernel = [ 0 -1 0;
%     -1 5 -1;
%     0 -1 0;];
            
kernel3 = [-1 -1 -1;
          -1 8 -1;
          -1 -1 -1];

kernel9 = 1/9 * [1 1 1;
    1 1 1;
    1 1 1];

sobel = [-1 0 1;
    -2 0 2;
    -3 0 3];
%c= konvolusi(img_grayscale, kernel);

%ee=konvolusi(rgb2gray(imread('xenia 1\xenia-6.jpg')), kernel9);
ee = gaussian_blur(imread('avanza-1.jpg'));
be=konvolusi(ee,kernel);

imshow([be]);