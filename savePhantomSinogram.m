% Save phantom sinogram

N = 256;
im = phantom(N);
sinogram = getSinogram(im, N, 1);
save Sinograms/phantomSinogram.txt sinogram -ascii;