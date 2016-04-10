% Making projection of phantom from phantomSinogram.txt

clear;
close all;

load phantomSinogram.txt;
imageProjection = getBackProjection(phantomSinogram, 1);

figure;
imagesc(imageProjection);
colormap('gray');
axis square;
drawnow;