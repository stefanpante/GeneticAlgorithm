% Calculates the mutation
function [ Mutation ] = mutation( Mut )
Mutation = 0;

if rand(1) < Mut
    Mutation = (-1)^randi(2);
end

end

