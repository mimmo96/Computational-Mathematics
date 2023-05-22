function [error , gap,  k , timer] = alternating_optimization(A,U,V,tol,num_it)

    initial_norm = norm(A - U*(V.'),'fro');
    gap =  initial_norm;
    k = 0 ;
    [m , n] = size(A);
    error = initial_norm;
    
    tic;
    [~, col_u] = size(U);
    [~, col_v] = size(V);
    while k < num_it

        % step 1 fissiamo U
        [Qu, Ru] = efficient_qr(U);
        %calcolare in modo corretto Bu_o
        Quo_T = Qu.';
        Quo_T = Quo_T(1:col_u, :);
        Bu_o = (Quo_T)*A;

        %Bu = (Qu.')*A;
        %Bu_o = Bu(1:col_u, :);
        V_tra = V.';
        %optimization
        Ru_o = Ru(1:col_u, :);
        for i = 1:n
            V_tra(:,i) = solve_LLS(Ru_o,Bu_o(:,i)); % V dev'essere V.'
        end

        V = V_tra.';
      
        % step 2 fissiamo V
        [Qv, Rv] = efficient_qr(V);
       
        %Bv = A * Qv;
        Qvo_T = Qv.';
        Qvo_T = Qvo_T(1:col_v, :);
        Bvo_T = Qvo_T*A';
        U_tra = U.';  
        %Bv_tra = Bv.'; 
        %optimization
        %BvT_o = Bv_tra(1:col_v, :);
        Rv_o = Rv(1:col_v, :);
        for j = 1:m
            U_tra(:,j) = solve_LLS(Rv_o, Bvo_T(:,j));
        end

        U = U_tra.';

        error_norm = norm(A - U*(V.'),'fro');
        gap = abs(error_norm - error);

        error =  error_norm;
        k = k + 1 ;
    
    end
    
    timer = toc;        %fprintf('Tempo trascorso: %.2f secondi\n', timer);