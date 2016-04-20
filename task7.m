% Task 7
% Making projection of 16x16 matrix with color white in the middle (4x4)
% and black otherwise

clear;
close all;

% Image
N = 16;
im = zeros(N);
im(7:10,7:10) = 1;

% Sinogram and backprojection
load sinograms/sinogramTask6.txt;
imBackProjection = getBackProjection(sinogramTask6);

% Calculate RMS
imBackProjection = (imBackProjection - min(min(imBackProjection))) / ...
    max(max(imBackProjection));
imNormalized = im;
E = imNormalized - imBackProjection;
E = reshape(E,1,N*N);
rmsDeviation = rms(E);
disp(['RMS-avvik: ' num2str(rmsDeviation)]);

% Draw image and backprojection
h = figure;
colormap('gray');
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

subplot(1,2,1);
imagesc(im);
axis('square');
title('Opprinnelig bilde');
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

subplot(1,2,2);
imagesc(imBackProjection);
axis('square');
title('Direkte tilbakeprojisert bilde');
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

drawnow;

saveTightFigure(h, 'figures/imageAndBackProjectionTask7.pdf');