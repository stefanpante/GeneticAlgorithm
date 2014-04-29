% Calculates the grid given by the assignment

function [ Grid ] = calculateGrid( )

% Preallocating vector is more efficient than appending values.
Grid = zeros(50,2);

k = 1;

for i=1:10
    for j=1:5
        Grid(k, :) = [i j];
        k = k + 1;
    end
end
end

