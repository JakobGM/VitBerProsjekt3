% Save phantom sinogram

N = 256;
im = phantom(N);
sinogram = getSinogram(im, N);
save Sinograms/phantomSinogram.txt sinogram -ascii;