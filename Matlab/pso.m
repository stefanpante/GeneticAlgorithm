function [ ] = pso( omg, phii, phik, numPart,it )
% preallocate for efficiency
best_position = [ 100, 100, 500];
particles = zeros(numPart,7);
locations = calculateGrid();
text = 'position i\nposition j\nbest position i\nbest position j\nvelocity i\nvelocity j\ncost';

% Initial positions for the particles and the global best position
for k=1:numPart
    i = randi(10);
    j = randi(5);
    v_i = randi([-10 10]);
    v_j = randi([-5 5]);
    co = cost([i j], locations);
    
    if co < best_position(3);
        best_position = [i j co];
    end
    particles(k,:) = [i j i j v_i v_j co];
end

% start the iteration
for k=1:it
    fprintf('========================================== Iteration %d ========================================== \n', k);
    disp('best position for this generation:');
    disp(best_position);
    fprintf(text);
    disp(particles');
    for l=1:numPart
        R1 = rand();
        R2 = rand();
        
        i   = particles(l,1);
        j   = particles(l,2); 
        b_i = particles(l,3);
        b_j = particles(l,4);
        v_i = particles(l,5);
        v_j = particles(l,6); 
        
        v_i = omg * v_i + phii * R1 *( b_i - i) + phik * R2*( best_position(1) - i);
        v_j = omg * v_j + phii * R1 *( b_j - j) + phik * R2*( best_position(2) - j);
        i = (i + v_i);
        j = (j + v_j);
        
        cost_new = cost([i j], locations);
        cost_best = cost([b_i, b_j], locations);
        
        if cost_new < cost_best
            b_i = i;
            b_j = j;
        end
        
        if cost_new < best_position(3)
            best_position = [i j cost_new];
        end
        
        particles(k,:) = [i j b_i b_j v_i v_j cost_new];
        
    end
end

