img_rgb=imread('avanza-1.jpg');
red = img_rgb(:, :, 1);
green = img_rgb(:, :, 2);
blue = img_rgb(:, :, 3);

gs = rgb2gray(img_rgb);


imshow([gs,threshold(gs,150),threshold(gs,75), (threshold(gs,75)+threshold(gs,150)) ]);

