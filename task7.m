% Task 7
% Making projection of 16x16 matrix with color white in the middle (4x4)
% and black otherwise

clear;
close all;

N = 16;
im = zeros(N);
im(7:10,7:10) = 1;

load Sinograms/sinogramTask6.txt;
imageBackProjection = getBackProjection(sinogramTask6);

h = figure;

set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

colormap('gray');

subplot(1,2,1);
imagesc(im);
axis('square');

subplot(1,2,2);
imagesc(imageBackProjection);
axis('square');

drawnow;

saveTightFigure(h, 'Figures/imageAndBackProjetionTask8.pdf');