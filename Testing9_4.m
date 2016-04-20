N = 256;
A = zeros(N,N);

r = 0;
R = sqrt((N/2)^2+(N/2)^2);

a = r;
while a < R
    for i = 1:N
        for j = 1:N
            if sqrt((i-N/2)^2+(j-N/2)^2) < N/2 && ...
                    sqrt((i-N/2)^2+(j-N/2)^2) > r
                A(i,j) = (sqrt((i-N/2)^2+(j-N/2)^2) - r) / (N/2 - r);
            elseif (sqrt((i-N/2)^2+(j-N/2)^2)) > N/2
                A(i,j) = 1;
            end
        end
    end
    a = a + 1;
end

A = tanh(A);

load('backProjections/sinogram02BackProjection.mat');
G = fft2(imBackProjection);
H = A .* G;
h = real(ifft2(H));

% Draw image
colormap('gray');
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

subplot(1,2,1), imagesc(imBackProjection), axis square;
title({'Direkte tilbakeprojisert bilde'}, 'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

subplot(1,2,2), imagesc(h), axis square;
title({'Tilbakeprojisert bilde med bruk av filter'}, 'FontSize', 7);
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])

drawnow;