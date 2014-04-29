% Calculates the cost of the location P to all the Sites on the map 
% and stores it inside C.
function [ C ] = cost( P, Sites )
% Initialize the cost at zero.
C = 0;

%  copy sites into locations.
L = Sites;

% Iterate over all the locations
for i= 1:length(L)
    % add the cost of each location to the total cost
    C = C + minimalDistance(P, L(i,:));
end

end

