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
% OUTPUT:   --


function calculate_stats(A, num_rows, num_col, actual_rank, errors_norm, min_error, min_iteration, gaps, timer, id)
    
    %load configurations 
    hyperparameters;    
    tic;

    %compute svd of A and relative error
    [u,s,v] = svd(A, 'econ');
    Ak = u(:,1:actual_rank)*s(1:actual_rank,1:actual_rank)*v(:,1:actual_rank)'; 
    svd_err= norm(A - Ak,'fro') / norm(A, 'fro');
    
    %save time for svd
    timer_svd = toc;

    [dim_row, dim_col] = size(A);

    %MAKE GRAFH:
    fig_title = 'Matrix:'+string(dim_row)+'x'+string(dim_col)+' rank:'+ string(actual_rank);
    make_graph(gaps, errors_norm, 'results/matrix_'+string(id)+'.png', fig_title);

    %SAVE IN A TABLE:
    saveValuesToFile(id, num_rows, num_col, actual_rank, length(errors_norm), min_iteration, min_error, svd_err, timer, timer_svd, 'results/log_stats.txt')
    
end

function saveValuesToFile(id, num_rows, num_cols, actual_rank, NUM_IT, MIN_IT, MIN_ERROR, ERROR_SVD, TIMER_AlOp, TIMER_SVD, file_name)
    
    %  Creating the row of values to be saved
    values = [id, num_rows, num_cols, actual_rank, NUM_IT, MIN_IT, MIN_ERROR, ERROR_SVD, TIMER_AlOp, TIMER_SVD];
    values_str = sprintf('%d\t\t', values);
    values_str = values_str(1:end-1); 
    
    % Opening the file in append mode
    fid = fopen(file_name, 'a');
    
    % Writing values to the file
    fprintf(fid, '%s\n', values_str);
    
    % Closing the file
    fclose(fid);
end