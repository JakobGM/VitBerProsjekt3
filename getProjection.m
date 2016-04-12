function proj = getProjection(im, N, theta, NProj, projWidth, x, y)
% Calculates projections of image (im) for angle theta and returns them in
% vector proj

proj = zeros(NProj, 1);

% Calculate values of the projection
for i = 1:N % the columns
    s_i = (x(i))*cos(theta) + (y)*sin(theta);
    m_i = round(s_i/projWidth+N);

    for j = 1:N % the rows
        proj(m_i(j)) = proj(m_i(j)) + im(i,j);
    end

end

end