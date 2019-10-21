function B = gaussian_blur(A)
gaussian_mask = [2 4 5 4 2;
                 4 9 12 9 4;
                 5 12 15 12 5;
                 4 9 12 9 4;
                 2 4 5 4 2;];
A = convert_grayscale(A);
B = konvolusi(A,gaussian_mask);
end

                             
