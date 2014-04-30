function [  ] = geneticAlgorithm(PopulationSize, PSize, ChildSize, mut, it)
% runs the genetic algorithm

% Preallocate for performance
Generation = zeros(PopulationSize,3);
% Get all the possible building sites
Sites = calculateGrid();

%initialize the population with n chromosomes
for i = 1:PopulationSize
    rndm1 = randi(10);
    rndm2 = randi(5);
    c = cost([rndm1 rndm2], Sites);
    Generation(i,:) = [rndm1, rndm2, c];
end

for i= 1:it
    fprintf('========================================== Iteration %d ========================================== \n', i);
    Generation = sortrows(Generation,3);
    disp('Current Generation:');
    disp(Generation');
    disp('Best of Current Generation:');
    disp(Generation(1,:))
    Parents = Generation(1:PSize, :);
    disp('Selected Possible Parents:');
    disp(Parents');

    kids = zeros(ChildSize, 3);
    
    % Create childSize children from the possible parents.
    for j=1:ChildSize
        % Used to select the two parents;
        R1 = floor(mod( exprnd(PSize/4), PSize -1) +1);
        R2 = floor(mod( exprnd(PSize/4), PSize -1) +1);
        
        % Make sure that the parents are two different chromosomes
        while R1 == R2
            R2 = floor(mod( exprnd(PSize/4), PSize -1) +1);
        end

        % index of the two genes to use with both parents
        Index1 = randi(2);
        Index2 = 2 - Index1 + 1;
        
        % Calculate if an mutation occurs
        Mutation1 = mutation(mut); 
        Mutation2 = mutation(mut);
        
        % The child is generated
        value1 = Parents(R1, Index1) + Mutation1;
        value2 = Parents(R2, Index2) + Mutation2;
        kids(j, Index1) = value1;
        kids(j, Index2) = value2;
        kids(j, 3) = cost([kids(j, 1) kids(j,2)], Sites);
    end
    
    disp('Created Children:');
    disp(kids');
    
    % Select all the Chromosomes except the possible parents
    Survivors = Generation(PSize + 1, :);
    
    % let some survive and mutate them.
    NumSurv = PopulationSize - PSize - ChildSize;
    
    %Preallocate for performance
    Surv = zeros(NumSurv, 3);
    
    for j = 1: NumSurv 
        [x y ] = size(Survivors);
        Index = randi(x);
        Survivor = Survivors(Index, :);
        
        Mutation1 = mutation(mut);
        Mutation2 = mutation(mut);
        
        value1 = Survivor(1,1) + Mutation1;
        value2 = Survivor(1,2) + Mutation2;
        Survivor(1,1) = value1;
        Survivor(1,2) = value2;
        Survivor(1,3) = cost([value1 value2], Sites);
        
        Surv(j, :) = Survivor;
    end
    disp('Selected and mutated Survivors:');
    disp(Surv');
    Generation = [Parents ; kids ; Surv];
    fprintf('============================================================================================== \n \n', i)
 
end





end

