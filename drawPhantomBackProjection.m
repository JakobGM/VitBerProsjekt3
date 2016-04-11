% Drawing phantom sinogram and projection of phantom from phantomSinogram.txt

clear;
close all;

load sinograms/phantomSinogram.txt;
imBackProjection = getBackProjection(phantomSinogram);

figure;
imagesc(phantomSinogram);
colormap('gray');
drawnow;

figure;
imagesc(imBackProjection);
colormap('gray');
axis square;
drawnow;