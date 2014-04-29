% This script plots the cost function

Grid = calculateGrid();

[X,Y] = meshgrid(1:0.25:10,1:0.25:5);

[a,b] = size(X);
Costs = zeros(a,b);
for i= 1:a
    for j = 1:b
        selectedPoint = [X(i,j), Y(i,j)];
        Costs(i,j) = cost(selectedPoint, Grid);
    end
end

figure(1);
mesh(X, Y, Costs);
figure(2);
contour(X, Y, Costs);