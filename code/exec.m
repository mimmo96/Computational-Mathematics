m = 10;
n = 8;
rank_k = 7;

A = rand(m,n);
num_it = 10;
[u,s,v] = svd(A);

fprintf('rank \t\t\t altern_err \t\t svd_err \n')

for k=1:rank_k
    
    U = rand(m,k);
    V = rand(n,k);

    altern = alternating_optimization(A,U,V,num_it);
    Ak = u(:,1:k)*s(1:k,1:k)*v(:,1:k)'; 
   
    svd_err= norm(A-Ak, 'fro');

    fprintf('%f \t\t %f \t\t %f \n', k,  altern, svd_err)

end
