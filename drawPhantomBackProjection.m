% Making projection of phantom from phantomSinogram.txt

clear;
close all;

load phantomSinogram.txt;
imageProjection = getBackProjection(phantomSinogram);

figure;
imagesc(imageProjection);
colormap('gray');
axis square;
drawnow;