function C = SpectralClustering1(W, k)  
    [n,m] = size(W)    
    s = sum(W);  
    D = full(sparse(1:n, 1:n, s));  
    E = D^(-1/2)*W*D^(-1/2);  
    [Q, V] = eigs(E, k)
    C = kmeans(Q, k);  
end 