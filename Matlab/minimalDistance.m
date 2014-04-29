% Output is stored in D, two points are given, between which the minimal 
% distance is calculated.
function [ D ] = minimalDistance( P1, P2)
% the locations of the bridges
B1 = [3.5 3.5];
B2 = [8.5 3.5];

% the Y coordinate of the location of the river
R = 3.5;

if( (P1(2) < R && P2(2) < R) || (P1(2) > R && P2(2) > R) )
    D = norm(P2 - P1);
else
    % The distance between the two points when the first bridge is used
    D1 = norm(B1 - P1) + norm(B1 - P2);
    
    % The distance between the two points when the second bridge is used
    D2 = norm(B2 - P1) + norm(B2 - P2);
    
    % We select the minimum of the two points.
    D = min(D1, D2);
end


end

