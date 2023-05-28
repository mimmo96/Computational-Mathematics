function table = calculate_stats(num_rows, num_col, actual_rank, errors_norm, min_error, min_iteration, timer)
hyperparameters;    
%compare our results with others low rank apprx fuctions
    tic;

    [u,s,v] = svd(A, 'econ');
    Ak = u(:,1:actual_rank)*s(1:actual_rank,1:actual_rank)*v(:,1:actual_rank)'; 
    svd_err= norm(A-Ak, 'fro');
    
    timer_svd = toc;

    
    %gaps = difference btw two consecutive errors in our algo
    gaps = zeros(length(errors_norm));
    for i = 1:length(errors_norm)-1
        %come va calcolato meglio??
        gaps(i) = abs(errors_norm(i) - errors_norm(i+1));
    end
    

    %MAKE GRAFH:
    %GAPS, ERRORS_NORM in log scale
    %makegraph(gaps, num_it);
    %makegraph(errors_norm, num_it)

    %SAVE IN A TABLE:
    % num_rows, num_col, actual_rank, NUM_IT, MIN_IT, MIN_ERROR, ERROR_SVD, TIMER_AlOp, TIMER_SVD
    
    
