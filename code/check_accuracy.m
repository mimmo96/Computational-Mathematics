m = 100;
n = 78;
rank_k = 60;

A = rand(m,n);
tol = 1e-12;
num_it = 20;
[u,s,v] = svd(A);

fprintf('rank \t\t altern_err \t\t svd_err \n')

valori = zeros(num_it, 3);

for it=1:num_it
    
    U = rand(m,rank_k)*1e-04;
    V = rand(n,rank_k)*1e-04;

    [error , gap,  dsf , timer]  = alternating_optimization(A,U,V,tol,it);
    Ak = u(:,1:rank_k)*s(1:rank_k,1:rank_k)*v(:,1:rank_k)'; 
   
    svd_err= norm(A-Ak, 'fro');

    valori(it,1) = it;
    valori(it,2) = gap;
    valori(it,3) = svd_err;

end

plot(valori(:, 1), valori(:, 2), 'r');
hold on;
plot(valori(:, 1), valori(:, 3), 'b');

% Aggiungi etichette agli assi e un titolo al grafico
xlabel('num_it');
ylabel('error');
title('Graph');