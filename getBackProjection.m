function imageProjection = getBackProjection(sinogram);
% Return projection image made from sinogram

[NProj, NTheta] = size(sinogram);
N = (NProj+1)/2;
imageProjection = zeros(N);
theta = linspace(0, 180 - 180/NTheta, NTheta)/180*pi;
projWidth = (N-1)*sqrt(2)/(NProj-1); % distance between two projections
x = linspace(-(N-1)/2, (N-1)/2, N); y = x;

for n = 1:NTheta % the angles
    s_m = -(N-(1:NProj))/sqrt(2);
    projPixels = cell(1,NProj);

    % Find projection pixels
    for i = 1:N % the columns
        projNr = 1;
        s_i = x(i)*cos(theta(n)) + y*sin(theta(n));
        
        for j = 1:N % the rows
            for m = projNr:NProj % the projections
            
                if (s_m(m) + projWidth/2 > s_i(j) && ...
                        s_m(m) - projWidth/2 < s_i(j))
                    projNr = m;
                    projPixels{projNr} = [projPixels{projNr}; i,j];
                    break;
                end
                
            end
        end
        
    end
    
    % Calculate pixel values
    for i = 1:NProj
        p = sinogram(i,n);
        NProjPixels = size(projPixels{i},1);
        if NProjPixels == 0, continue; end
        
        for j = 1:NProjPixels;
            pixelAddValues = p/NProjPixels;
            imageProjection(projPixels{i}(j,1), projPixels{i}(j,2)) = ... 
            imageProjection(projPixels{i}(j,1), projPixels{i}(j,2)) + ...
            pixelAddValues;
        end
    end
  
end

end