% Task 6
% Making sinogram of 16x16 matrix with color white in the middle (4x4)
% and black otherwise

clear;
close all;

load Sinograms/sinogramTask6.txt;
figure;
imagesc(sinogramTask6);
colormap('gray');
drawnow;