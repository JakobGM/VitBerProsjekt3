N = 256;
f = phantom(N);
load('backProjections/phantomSinogramBackProjection.mat');

F = fft2(f);
G = fft2(imBackProjection);

set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

fourierImageBackProjection = figure();
subplot(1,2,1), imagesc(log(abs(F))), colorbar, axis square;
title({'Opprinneling bilde'}, 'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

subplot(1,2,2), imagesc(log(abs(G))), colorbar, axis square;
title({'Direkte tilbakeprojisert bilde'}, 'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

% saveTightFigure(fourierImageBackProjection, ...
%     'figures/fourierImageBackProjection.pdf'); % saves figure