% Save sinogram of IverBrevik.jpg

N = 256;
NTheta = 180;
im = double(imread('IverBrevik.jpg')) / 255;
sinogram = getSinogram(im, N, NTheta);
save('sinograms/sinogramIver.txt', 'sinogram', '-ascii');