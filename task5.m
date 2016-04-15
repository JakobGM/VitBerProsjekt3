% Task 5
% Calculating the procection of a 3x3 matrix, this time with additional diagnoal projections

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
rightLeftDiagProjection = [M(1,1)+M(1,2)+M(2,1), sum(diag(M(:,end:-1:1))), M(3,3)+M(2,3)+M(3,2)]; %theta = pi/4
leftRightDiagProjection = [M(3,1)+M(3,2)+M(2,1), sum(diag(M)), M(1,3)+M(1,2)+M(2,3)]; %theta = 3pi/4

% Back projection matrix
N = zeros(3);
for x = 1:3
  for y = 1:3
    N(y,x) = collumnProjection(x) + rowProjection(y);
  end
end

% Adding theta = pi/4 projections
N([1 1 2],[1 2 1]) = N([1 1 2],[1 2 1]) + rightLeftDiagProjection(1);
N([1 2 3],[3 2 1]) = N([1 2 3],[3 2 1]) + rightLeftDiagProjection(2);
N([2 3 3],[3 3 2]) = N([2 3 3],[3 3 2]) + rightLeftDiagProjection(3);

% Adding theta = 3pi/4 projections
N([2 3 3],[1 1 2]) = N([2 3 3],[1 1 2]) + leftRightDiagProjection(1);
N([1 2 3],[1 2 3]) = N([1 2 3],[1 2 3]) + leftRightDiagProjection(2);
N([1 1 2],[2 3 3]) = N([1 1 2],[2 3 3]) + leftRightDiagProjection(3);

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
saveTightFigure(fig3x3, 'figures/3x3MatrixV2.pdf')

% Showing value of N matrix in terminal
format rat
N
format long

% Calculating root mean square difference between original picture and the backprojection
A = abs(N-M);
A = A ./ max(max(A));
rmsDiff = mean(mean((A).^2))^2;
fprintf('The scaled root mean square difference between the original picture and the backprojection is: \n\trms = %1.4f\n', rmsDiff)
