m = 10;
n = 7;
rank_k = 3;

A = rand(m,n)*1e-12;
tol = 0.001;
num_it = 100;
[u,s,v] = svd(A);

fprintf('rank \t\t altern_err \t\t svd_err \n')

for k=1:rank_k
    
    U = rand(m,k)*1e-04;
    V = rand(n,k)*1e-04;

    altern = alternating_optimization(A,U,V,tol,num_it);
    Ak = u(:,1:k)*s(1:k,1:k)*v(:,1:k)'; 
   
    svd_err= norm(A-Ak, 'fro');

    fprintf('%d \t\t %.5e \t\t %.5e \n', k,  altern, svd_err)

end 
