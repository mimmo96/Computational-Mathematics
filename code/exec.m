m = 100;
n = 70;
k = 50;

num_it = 30;

A = rand(m,n);
U = rand(m,k);
V = rand(n,k);

[u,s,v] = svd(A);

fprintf('rank \t\t\t error_altern \t\t error_svd \n')

for i=1:num_it
    
    altern = alternating_optimization(A,U,V,i);
    Ak = u(:,1:i)*s(1:i,1:i)*v(:,1:i)'; 
   
    svd_err= norm(A-Ak, 'fro');

    fprintf('%f \t\t %f \t\t %f \n', i,  altern, svd_err)

end
