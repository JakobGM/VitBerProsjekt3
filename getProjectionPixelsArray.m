function projPixels = getProjectionPixelsArray(NProj, NTheta)
% Loads cell array variabel allocating pixels to the right projections
% in file "NProjProjectionsNThetaAnglesPixelArray", runs 
% saveNewProjectionsPixelsArray first if file doesn't exist

filename = [num2str(NProj) 'Projections' num2str(NTheta) 'AnglesPixelArray.mat'];

if exist(['projectionPixels/' filename], 'file') ~= 2
    saveNewProjectionsPixelsArray(NProj, NTheta);
end

load(['projectionPixels/' filename]); % Cell array variable named "projPixels"

end