function [error ] = alternating_optimization(A,U,V,num_it)
    error = 0;
    k = 0 ;
    [m , n] = size(A);

    while k < num_it
        
        % step 1 fissiamo U
        [Qu, Ru] = efficient_qr(U);
        Bu = (Qu.')*A;
        V_tra = V.';

        for i = 1:n
            V_tra(:,i) = solve_LLS(Ru,Bu(:,i)); % V dev'essere V.'
        end

        V = V_tra.';
      
        % step 2 fissiamo V
        [Qv, Rv] = efficient_qr(V);
        Bv = A * Qv;

        U_tra = U.';  
        Bv_tra = Bv.';  

        for j = 1:m
            U_tra(:,j) = solve_LLS(Rv, Bv_tra(:,j));
        end

        U = U_tra.';

        error = norm(A - U*(V.'),'fro');
        k = k + 1 ;
    
    end

