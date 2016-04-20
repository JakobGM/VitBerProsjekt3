% f = phantom(256);
% load('backProjections/phantomSinogramBackProjection.mat');

colormap('gray');
f = double(imread('IverBrevik.jpg')) / 255;
f = rgb2gray(f);
load('backProjections/sinogramIverBackProjection.mat');

F = fftshift(fft2(f));
G = fftshift(fft2(imBackProjection));
A = F ./ G;
A_real = abs(real(A));
A = A_real + imag(A);

load('backProjections/sinogram02BackProjection.mat');
G1 = fftshift(fft2(imBackProjection));
H = A .* G1;
h = real(ifft2(ifftshift(H)));

% Draw image
colormap('gray');
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

subplot(1,2,1), imagesc(imBackProjection), axis square;
title({'Direkte tilbakeprojisert bilde'}, 'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

subplot(1,2,2), imagesc(h), axis square;
title({'Tilbakeprojisert bilde med bruk av filter'}, 'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

drawnow;