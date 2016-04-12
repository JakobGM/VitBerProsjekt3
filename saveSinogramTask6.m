% Save sinogram from task 6

N = 16;
NTheta = 180;
im = zeros(N);
im(7:10,7:10) = 1;
sinogram = getSinogram(im, N, NTheta);
save('sinograms/sinogramTask6.txt sinogram -ascii');