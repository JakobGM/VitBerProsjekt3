function sinogram = getSinogram(im, N, pixelWidth)
% Calculates 2N-1 projections of image (im) from each of 360 uniformly 
% distributed angles 0 <= theta < 180 degrees, and returns them in matrix
% sinogram

NTheta = 180;
NProj = 2*N-1;
sinogram = zeros(NProj, NTheta);
theta = linspace(0, 180 - 180/NTheta, NTheta)/180*pi;
projWidth = (N-1)*sqrt(2)*pixelWidth/(NProj-1); % distance between two projections
x = linspace(-(N-1)/2, (N-1)/2, N)*pixelWidth; y = x;
s_m = -(N-(1:NProj))*pixelWidth/sqrt(2); % s-values of projections

for n = 1:NTheta % the angles
    p = zeros(NProj, 1);

    % Calculate value of the projection
    for i = 1:N % the columns
        projNr = 1;
        s_i = x(i)*cos(theta(n)) + y*sin(theta(n));
        
        for j = 1:N % the rows
            for m = projNr:NProj % the projections
            
                if (s_m(m) + projWidth/2 > s_i(j) && ...
                        s_m(m) - projWidth/2 < s_i(j))
                    projNr = m;
                    p(projNr) = p(projNr) + im(i,j);
                    break;
                end
                
            end
        end
        
    end

    sinogram(:,n) = p;
end

end