function [ output_args ] = geneticAlgorithm( n, nS, it )
% runs the genetic algorithm

% Preallocate for performance
Generation = zeros(n,3);
% Get all the possible building sites
Sites = calculateGrid();

for i = 1:n
    rndm1 = randi(10);
    rndm2 = randi(5);
    c = cost([rndm1 rndm2], Sites);
    Generation(i,:) = [rndm1, rndm2, c];
end

for i= 1:it
    fprintf('====== Iteration %d ====== \n', i)
    Generation = sortrows(Generation,3);
    disp('Current Generation:');
    disp(Generation');
    Parents = Generation(1:nS, :);
    disp('Selected Parents:');
    disp(Parents');
    
    
    
end





end
