% Save phantom sinogram

N = 256;
im = phantom(N);
sinogram = getSinogram(im, N);
save('sinograms/phantomSinogram.txt sinogram -ascii');