% Task 8
% Making projection of sinogram in file sinogramNN.txt

clear;
close all;

load sinogram01.txt;
imageProjection = getBackProjection(sinogram01, 1);

figure;
imagesc(imageProjection);
colormap('gray');
axis square;
drawnow;