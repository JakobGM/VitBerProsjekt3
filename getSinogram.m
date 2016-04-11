function sinogram = getSinogram(im, N)
% Calculates 2N-1 projections of image (im) from each of NTheta uniformly 
% distributed angles 0 <= theta < 180 degrees, and returns them in matrix
% sinogram

NTheta = 180;
NProj = 2*N-1;
sinogram = zeros(NProj, NTheta);
theta = linspace(0, 180 - 180/NTheta, NTheta)/180*pi;
projWidth = 1/sqrt(2); % distance between two projections
x = linspace(-(N-1)/2, (N-1)/2, N); y = x;

for n = 1:NTheta % the angles
    p = zeros(NProj, 1);

    % Calculate values of the projections
    for i = 1:N % the columns
        s_i = (x(i))*cos(theta(n)) + (y)*sin(theta(n));
        m_i = round(s_i/projWidth+N);
        
        for j = 1:N % the rows
            p(m_i(j)) = p(m_i(j)) + im(i,j);
        end
        
    end

    sinogram(:,n) = p;
end

end