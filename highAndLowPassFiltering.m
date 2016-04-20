N = 256;
im1 = phantom(N);
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

% Draw image
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

highAndLowPassFiltering = figure();
subplot(1,3,1), imagesc(im1), colormap('gray'), axis square;
title('Opprinnelig bilde', 'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

subplot(1,3,2), imagesc(im2), colormap('gray'), axis square;
title({'Direkte tilbakeprojisert bilde';'med h$\o$ypassfilter'}, ...
    'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

subplot(1,3,3), imagesc(im3), colormap('gray'), axis square;
title({'Direkte tilbakeprojisert bilde';'med lavpassfilter'}, ...
    'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

saveTightFigure(highAndLowPassFiltering, ...
    'figures/highAndLowPassFiltering.pdf'); % saves figure