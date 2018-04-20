
function result = fitness(X,D)
 sum = 0.0; 
 for i = 1:D 
     sum = sum + X(i)^2;
 end
 result = sum; 