function saveNewProjectionsPixelsArray(NProj, NTheta)
% Saves cell array variabel allocating pixels to the right projections
% in file "NProjProjectionsNThetaAnglesPixelArray"

projPixels = cell(NProj, NTheta);
theta = linspace(0, 180 - 180/NTheta, NTheta)/180*pi;
projWidth = 1/sqrt(2); % distance between two projections
N = (NProj+1)/2;
x = linspace(-(N-1)/2, (N-1)/2, N); y = x;

for n = 1:NTheta % the angles

    % Find projection pixels
    for i = 1:N % the columns
        s_i = (x(i))*cos(theta(n)) + (y)*sin(theta(n));
        m_i = round(s_i/projWidth+N);
        
        for j = 1:N % the rows
            projPixels{m_i(j), n} = [projPixels{m_i(j), n}; i,j];
        end
        
    end
    
end

filename = [num2str(NProj) 'Projections' num2str(NTheta) 'AnglesPixelArray'];
save(['projectionPixels/' filename], 'projPixels');

end