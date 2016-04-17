figure();
colormap('gray');
f = double(imread('IverBrevik.jpg')) / 255;
f = rgb2gray(f);
imagesc(f);