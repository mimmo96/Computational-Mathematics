% FUNCTION FOR COMPUTE STATS
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT:    
%           A:
%           num_rows:
%           num_col:
%           actual_rank:
%           errors_norm:
%           min_error:
%           min_iteration:
%           gaps:
%           timer:
%           id_
%
% OUTPUT:   --


function calculate_stats(A, u_svd, S, v_svd, num_rows, num_col, actual_rank, opt_error, errors_norm, min_error, min_iteration, gaps, timer, timer_svd, id)
    
    %load configurations 
    hyperparameters;    
        
    tic;
    Ak = u_svd(:,1:actual_rank)*S(1:actual_rank,1:actual_rank)*v_svd(:,1:actual_rank)'; 
    svd_err = norm(A - Ak,'fro') ;

    timer2_svd = toc;
    timer_svd_final = timer_svd + timer2_svd;

    [dim_row, dim_col] = size(A);

    %MAKE GRAFH:
    fig_title = 'Matrix:'+string(dim_row)+'x'+string(dim_col)+' rank:'+ string(actual_rank);
    make_graph(gaps, errors_norm, 'results/matrix_'+string(id)+'.png', fig_title);

    %SAVE IN A TABLE:
    saveValuesToFile(id, num_rows, num_col, actual_rank, length(errors_norm), min_iteration, min_error, svd_err, opt_error, timer, timer_svd_final, 'results/log_stats.txt')
    
end

function saveValuesToFile(id, num_rows, num_cols, actual_rank, NUM_IT, MIN_IT, MIN_ERROR, ERROR_SVD, opt_error, TIMER_AlOp, TIMER_SVD, file_name)
    
    %  Creating the row of values to be saved
    values = [id, num_rows, num_cols, actual_rank, NUM_IT, MIN_ERROR, ERROR_SVD, opt_error, abs((opt_error-MIN_ERROR) / opt_error) , abs((opt_error-ERROR_SVD) / opt_error) ,TIMER_AlOp, TIMER_SVD];
    values_str = sprintf('%-8d \t%-8d \t%-8d \t%-8d \t%-8d \t%-8.6e \t\t%-8.6e \t\t%-8.6e \t\t%-8.6e \t\t%-8.6e \t\t%-8.6e \t%-8.6e ', values);
    fprintf('%s\n', values_str);
    
    values_str = values_str(1:end-1); 
    
    % Opening the file in append mode
    fid = fopen(file_name, 'a');
    
    % Writing values to the file
    fprintf(fid, '%s\n', values_str);
    
    % Closing the file
    fclose(fid);
end