N = 256;
f = phantom(N);
Ntheta = 0 : 1/180 : 180;
fSinogram = getSinogram(f,N, 180);
g = getBackProjection(fSinogram);

F = fft2(f);
G = fft2(g);

set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

fourierImageBackProjection = figure();
subplot(1,2,1), imagesc(log(abs(F))), colorbar, axis square;
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

subplot(1,2,2), imagesc(log(abs(G))), colorbar, axis square;
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

saveTightFigure(fourierImageBackProjection, ...
    'figures/fourierImageBackProjection.pdf'); % saves figure