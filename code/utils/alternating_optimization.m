function [errors_norm, min_error, min_iteration, timer] = alternating_optimization(A,U,V,num_it)

    w = 1 ;
    [m , n] = size(A);
    errors_norm = Inf(1, num_it);
    %the min error is not the last error in errors_norm
    min_error = Inf;
    min_iteration = 0;
    
    tic;

    while (w <= num_it)

        % step 1 fissiamo U
        [Qu, Ru] = thin_qr(U);
        %calcolare in modo corretto Bu_o
        Quo_T = Qu.';

        Bu_o = (Quo_T)*A;

        V_tra = V.';
        %optimization
        Ru_o = Ru;
        for i = 1:n
            V_tra(:,i) = solve_LLS(Ru_o,Bu_o(:,i)); % V dev'essere V.'
        end

        V = V_tra.';
      
        % step 2 fissiamo V
        [Qv, Rv] = thin_qr(V);
       
        Qvo_T = Qv.';
        Bvo_T = Qvo_T*A';
        U_tra = U.';  

        Rv_o = Rv;
        for j = 1:m
            U_tra(:,j) = solve_LLS(Rv_o, Bvo_T(:,j));
        end

        U = U_tra.';
        %maybe it's better to calculate the error with 
        % ||A - UV^T || / ||A|| ??????
        errors_norm(w) =  norm(A - U*(V.'),'fro') / norm(A, 'fro');
        if (errors_norm(w) < min_error)
            min_error = errors_norm(w);
            min_iteration = w;
        end 
        w = w + 1 ;
    end
    
    timer = toc;   