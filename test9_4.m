%fSinogram = load('sinograms/phantomSinogram.txt');
%load('backProjections/phantomSinogramBackProjection.mat');

colormap('gray');
f = double(imread('IverBrevik.jpg')) / 255;
f = rgb2gray(f);

p = getSinogram(f,256,180);
g = getBackProjection(p);

F = fft2(f);
G = fft2(g);
A = abs(F ./ G);

% Sinogram and backprojection
sinogramFilename = 'sinogram02';
sinogram = load(['sinograms/' sinogramFilename '.txt']);
imBackProjection = getBackProjection(sinogram);

G1 = fft2(imBackProjection);
H = A .* G1;
h = real(ifft2(H));

% Draw image
colormap('gray');
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

imagesc(h);
axis('square');
%title('Direkte tilbakeprojisert bilde');
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

drawnow;