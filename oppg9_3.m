N = 256;
f = phantom(N);
fSinogram = getSinogram(f,N);
g = getBackProjection(fSinogram);

F = fft2(f);
G = fft2(g);

fourierImageBackProjection = figure();
subplot(1,2,1), imagesc(log(abs(F))), colorbar, axis square;
subplot(1,2,2), imagesc(log(abs(G))), colorbar, axis square;

saveTightFigure(fourierImageBackProjection, ...
    'figures/fourierImageBackProjection.pdf'); % saves figure