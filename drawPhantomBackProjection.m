% Drawing phantom sinogram and projection of phantom from phantomSinogram.txt

clear;
close all;

load Sinograms/phantomSinogram.txt;
imageProjection = getBackProjection(phantomSinogram);

figure;
imagesc(phantomSinogram);
colormap('gray');
drawnow;

figure;
imagesc(imageProjection);
colormap('gray');
axis square;
drawnow;