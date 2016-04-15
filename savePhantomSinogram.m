% Save phantom sinogram

N = 256;
NTheta = 180;
im = phantom(N);
sinogram = getSinogram(im, N, NTheta);
save('sinograms/phantomSinogram.txt', 'sinogram', '-ascii');