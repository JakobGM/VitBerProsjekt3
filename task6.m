% Task 6
% Making sinogram of 16x16 matrix with color white in the middle (4x4)
% and black otherwise

clear;
close all;

load Sinograms/sinogramTask6.txt;

h = figure;
imagesc(sinogramTask6);
colormap('gray');

set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

xlabel(['Angle $\theta$ (in degrees)']);
ylabel('Projection $m$');

drawnow;

saveTightFigure(h, 'Figures/sinogramTask6');