function sinogram = getSinogram(im, N, NTheta)
% Returns 2N-1 projections of image (im) for each of NTheta uniformly 
% distributed angles 0 <= theta < 180 degrees in matrix sinogram

NProj = 2*N-1;
sinogram = zeros(NProj, NTheta);
theta = linspace(0, 180 - 180/NTheta, NTheta)/180*pi;
projWidth = 1/sqrt(2); % distance between two projections
x = linspace(-(N-1)/2, (N-1)/2, N); y = x;

for n = 1:NTheta % the angles
    % Calculate values of the projections
    proj = getProjection(im, N, theta(n), NProj, projWidth, x, y);
    sinogram(:,n) = proj;
end

end