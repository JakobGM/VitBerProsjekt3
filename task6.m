% Task 6
% Making sinogram of 16x16 matrix with color white in the middle (4x4)
% and black otherwise

clear;
close all;

load sinograms/sinogramTask6.txt;

% Draw sinogram
h = figure;
colormap('gray');
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

imagesc(sinogramTask6);
xlabel('Vinkel $\theta$ (i grader)');
ylabel('Projeksjon $m$');

drawnow;

saveTightFigure(h, 'figures/sinogramTask6.pdf');