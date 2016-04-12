% Task 8
% Making projection of sinogram in file sinogramNN.txt

clear;
close all;

% Sinogram and backprojection
filename = 'sinogram01';
sinogram = load(['sinograms/' filename '.txt']);
imBackProjection = getBackProjection(sinogram);

% Draw image
h = figure;
colormap('gray');
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

imagesc(imBackProjection);
axis('square');
title('Direkte tilbakeprojisert bilde');
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

drawnow;

saveTightFigure(h, ['figures/backProjetion_' filename '.pdf']);