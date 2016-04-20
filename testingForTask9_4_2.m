N = 256;
% f = phantom(256);
% load('backProjections/phantomSinogramBackProjection.mat');

colormap('gray');
f = double(imread('IverBrevik.jpg')) / 255;
f = rgb2gray(f);
load('backProjections/sinogramIverBackProjection.mat');

F = fft2(f);
G = fft2(imBackProjection);

R = 150;
for i = 1:N
    for j = 1:N
        if sqrt((i-N/2)^2+(j-N/2)^2) < R
            F(i,j) = 0;
        end
%    F(i,j) = tanh(F(i,j));
    end
end

A = F ./ G;
A_real = abs(real(A));
A = A_real + imag(A);

r = 0;
for i = 1:N
    for j = 1:N
        if sqrt((i-N/2)^2+(j-N/2)^2) > r
            A(i,j) = tanh(A(i,j));
        end
    end
end

load('backProjections/sinogram02BackProjection.mat');
G1 = fft2(imBackProjection);
H = A .* G1;
h = real(ifft2(H));

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