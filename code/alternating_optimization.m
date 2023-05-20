function [error ] = alternating_optimization(A,U,V,num_it)
    error = 0;
    k = 0 ;
    [m , n] = size(A);

    while k < num_it
        
        % step 1 fissiamo U
        [Qu, Ru] = efficient_qr(U);
        Bu = (Qu.')*A;

        for i = 1:n
            V(:,i) = solve_LLS(Ru,Bu(:,i));

        end
        asso = V;

        % step 2 fissiamo V
        [Qv, Rv] = efficient_qr(V);
        Bv = A * Qv;
        Bv = Bv.'; U = U.';

        for j = 1:m
            U(:,i) = solve_LLS(Rv, Bv(:,i));
        end

        error = norm(A - U*(V.'),'fro');
        k = k + 1 ;
    end

