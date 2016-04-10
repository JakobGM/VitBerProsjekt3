% Task 7
% Making projection of 16x16 matrix with color white in the middle (4x4)
% and black otherwise

clear;
close all;

load sinogramTask6.txt;
imageBackProjection = getBackProjection(sinogramTask6, 1);

figure;
imagesc(imageBackProjection);
colormap('gray');
axis square;
drawnow;