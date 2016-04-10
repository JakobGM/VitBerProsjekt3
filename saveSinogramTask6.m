% Save sinogram from task 6

N = 16;
im = zeros(N);
im(7:10,7:10) = 1;
sinogram = getSinogram(im, N);
save Sinograms/sinogramTask6.txt sinogram -ascii;