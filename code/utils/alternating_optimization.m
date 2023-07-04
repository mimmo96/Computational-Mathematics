% ALTERNATING OPTIMIZATION
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT:    
%           A: matrix with dim MxN
%           U: matrix with dim MxK
%           V: matrix with dim NxK
%           sigma: array containing all sigma values of matrix A
%           tol: values
%           num_it: maximum number of iteration
%
% OUTPUT:   
%           opt_error: optimal error
%           errors_norm: array containing errors of each iteration
%           min_error: value of the minimum error reached during all iterations
%           min_iteration: number of iterations in which the minimum error is reached
%           gaps: array containing how much the error reached at each iteration deviates from the optimal error relatively
%           timer: time spent during the execution of the algorithm

function [opt_error, errors_norm, min_error, gaps, timer] = alternating_optimization(A,U,V, sigma, tol,num_it)

    w = 1 ;
    [m , n] = size(A);
 
    %variable used for store errors
    errors_norm = Inf(1, num_it);
    min_error = Inf;

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

        %Compute U*V^T
        UV = U*(V.');

        % compute rank of UV^T
        rank_uv = rank( UV );

        % find optimal values
        sigma_from_rank_uv = sigma(rank_uv+1:end);

        % Compute the square root of the sum squared of the sigma elements
        opt_error = sqrt(sum(sigma_from_rank_uv.^2));

        %compute error and gap 
        errors_norm(w) =  norm(A - UV,'fro');
        if (errors_norm(w) < min_error)
            min_error = errors_norm(w);
        end 

        gap = abs(( errors_norm(w) - opt_error ) / opt_error) ;
        gaps(w) = gap;
        w = w + 1 ;
    end

    %save execution time
    timer = toc;   

    %resize to correct dimension
    errors_norm = errors_norm(1:w-1);
    gaps = gaps(1:w-1);

end


%function for compute LLS
function [x] = solve_LLS(A,b)
    x = A\b;
end