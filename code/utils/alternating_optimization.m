% ALTERNATING OPTIMIZATION
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT:    
%           A:
%           U:
%           V:
%           tol:
%           num_it:
%
% OUTPUT:   
%           errors_norm: 
%           min_error:
%           min_iteration:
%           gaps:
%           timer:

function [errors_norm, min_error, min_iteration, gaps, timer] = alternating_optimization(A,U,V,tol,num_it)

    w = 1 ;
    [m , n] = size(A);
 
    %variable used for store errors
    errors_norm = Inf(1, num_it);
    min_error = Inf;
    previus_error = 0;
    min_iteration = 0;

    %variable used for store gaps
    gaps = Inf(1, num_it);
    gap = Inf;
    
    %start timer
    tic;

    while (w <= num_it &&  gap>tol) 
        % --------------------
        % step 1 with fixed U
        % --------------------

        %compute QR over U
        [Qu, Ru] = thin_qr(U);
        
        %compute Bu = ((Q_u^T)*A)
        Quo_T = Qu.';
        Bu_o = (Quo_T)*A;
        V_tra = V.';

        %solve each LLS and save result on V^T columns
        Ru_o = Ru;
        for i = 1:n
            V_tra(:,i) = solve_LLS(Ru_o,Bu_o(:,i)); 
        end

        %save the new V
        V = V_tra.';
      
        % --------------------
        % step 2 with fixed V
        % --------------------
        
        %compute QR over V
        [Qv, Rv] = thin_qr(V);
       
        %compute Rv = ((Q_v^T)*(A^T))
        Qvo_T = Qv.';
        Bvo_T = Qvo_T*A';
        U_tra = U.';  

        %solve each LLS and save result on U^T columns
        Rv_o = Rv;
        for j = 1:m
            U_tra(:,j) = solve_LLS(Rv_o, Bvo_T(:,j));
        end

        %save the new U
        U = U_tra.';

        %compute error and gap 
        errors_norm(w) =  norm(A - U*(V.'),'fro') / norm(A, 'fro');
        if (errors_norm(w) < min_error)
            min_error = errors_norm(w);
            min_iteration = w;
        end 

        gap = abs(previus_error - errors_norm(w));
        gaps(w) = gap;
        previus_error = errors_norm(w);
        w = w + 1 ;
    end

    %resize to correct dimension
    errors_norm = errors_norm(1:w-1);
    gaps = gaps(1:w-1);

    %save execution time
    timer = toc;   
end


%function for compute LLS
function [x] = solve_LLS(A,b)
    x = A\b;
end