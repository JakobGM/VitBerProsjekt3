% Task 4
% Calculating the projection and backprojection of a 3x3 Matrix
clear
close all

% Matrix representing a body consisting of a square bone in the middle of square soft tissue
M   =  [0 0 0; ...
        0 1 0; ...
        0 0 0];

% Setting LaTeX interpreter
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

% Drawing the body
fig3x3 = figure;
subplot(1,2,1)
imagesc(M)
colormap('gray')
axis square
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])
title('Originalt bilde')
drawnow

% Projections
collumnProjection = sum(M,1); % theta = 0
rowProjection = sum(M,2); % theta = pi/2

% Back projection matrix
N = zeros(3);
for x = 1:3
  for y = 1:3
    N(y,x) = collumnProjection(x) + rowProjection(y);
  end
end

% Normalization
N = N ./ sum(sum(N));

% Drawing the backprojection
subplot(1,2,2)
imagesc(N)
colormap('gray')
axis square
set(gca,'xtick',[]), set(gca,'xticklabel',[])
set(gca,'ytick',[]), set(gca,'yticklabel',[])
title('Direkte tilbakeprojisert bilde')
drawnow

% Saving figures
saveTightFigure(fig3x3, 'figures/3x3Matrix.pdf')

% Calculating root mean square difference between original picture and the backprojection
rmsDiff = mean(mean((N-M).^2))^2;
disp(rmsDiff)
