function imageProjection = getBackProjection(sinogram);
% Return projection image made from sinogram

[NProj, NTheta] = size(sinogram);
N = (NProj+1)/2;
imageProjection = zeros(N);
projPixels = getProjectionPixelsArray(NProj, NTheta);
    
% Calculate pixel values
for n = 1:NTheta
    for m = 1:NProj
        p = sinogram(m,n);
        NProjPixels = size(projPixels{m,n},1);
        if NProjPixels == 0, continue; end
        pixelAddValues = p/NProjPixels;

        for j = 1:NProjPixels;
            imageProjection(projPixels{m,n}(j,1), projPixels{m,n}(j,2)) = ... 
            imageProjection(projPixels{m,n}(j,1), projPixels{m,n}(j,2)) + ...
            pixelAddValues;
        end
    end
end

end