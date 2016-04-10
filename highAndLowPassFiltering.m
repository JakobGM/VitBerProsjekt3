N=256;
im1=phantom(N);
F = fftshift(fft2(im1));

highpass = F;
lowpass = F;
R = 10;
for i = 1:N
    for j = 1:N
        if sqrt((i-N/2)^2+(j-N/2)^2) < R
            highpass(i,j) = 0;
        end
        if sqrt((i-N/2)^2+(j-N/2)^2) > R
            lowpass(i,j) = 0;
        end
    end
end

im2 = real(ifft2(ifftshift(highpass)));
im3 = real(ifft2(ifftshift(lowpass)));
figure;
subplot(1,3,1), imagesc(im1), colormap('gray'), axis square;
subplot(1,3,2), imagesc(im2), colormap('gray'), axis square;
subplot(1,3,3), imagesc(im3), colormap('gray'), axis square;