% FUNCTION calculate_stats: compute error of svd, create graph and save
%                           values in a file
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT:    
%           A: matrix with dim MxN
%           u_svd: array containing all u values of svd[u,s,v]
%           S: array containing all S values of svd[u,s,v]
%           v_svd: array containing all v values of svd[u,s,v]
%           num_rows: number of rows of matrix A
%           num_col: number of columns of matrix A
%           actual_rank: value of rank to approximate 
%           opt_error: value of optimal error
%           errors_norm: array containing errors of each iteration
%           min_error: value of the minimum error reached during all iterations
%           gaps: array containing how much the error reached at each iteration deviates from the optimal error relatively
%           timer: time spent during the execution of the alternating_optimization algorithm
%           timer_svd: time spent during the execution of the svd algorithm
%           id: identifier of the corresponding execution
%
% OUTPUT:   --


function calculate_stats(A, u_svd, S, v_svd, num_rows, num_col, actual_rank, opt_error, errors_norm, min_error, gaps, timer, timer_svd, id)
    
    %load configurations 
    hyperparameters;    
        
    %update execution timer of svd 
    tic;
    Ak = u_svd(:,1:actual_rank)*S(1:actual_rank,1:actual_rank)*v_svd(:,1:actual_rank)'; 
    svd_err = norm(A - Ak,'fro') ;

    timer2_svd = toc;
    timer_svd_final = timer_svd + timer2_svd;

    [dim_row, dim_col] = size(A);

    %make graph
    fig_title = 'Matrix:'+string(dim_row)+'x'+string(dim_col)+' rank:'+ string(actual_rank);
    make_graph(gaps, errors_norm, 'results/matrix_'+string(id)+'.png', fig_title);

    %save all stats in a file
    saveValuesToFile(id, num_rows, num_col, actual_rank, length(errors_norm), min_error, svd_err, opt_error, timer, timer_svd_final, 'results/log_stats.txt')
    
end

% FUNCTION saveValuesToFile: take in input some stats and store in a log_stats.txt file 
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT:    
%           id: identifier of the corresponding execution
%           num_rows: number of rows of matrix A
%           num_col: number of columns of matrix A
%           actual_rank: value of rank to approximate 
%           num_it: number of all iteration made
%           min_error: value of the minimum error reached during all iterations
%           error_svd: value of error calculated via svd
%           opt_error: value of optimal error
%           timer_AlOp: time spent during the execution of the alternating_optimization algorithm
%           timer_svd: time spent during the execution of the svd algorithm
%           file_name: name of the file in which i want to save the statistics
%
%
% OUTPUT:   --

function saveValuesToFile(id, num_rows, num_cols, actual_rank, num_it, min_error, error_svd, opt_error, timer_AlOp, timer_svd, file_name)
    
    %  Creating the row of values to be saved
    % [id - rows - cols	 - rank	 - it - error*	- AlOp_err	- svd_error	- |(AlOp_err-error*)/error*| - |(svd_err-error*)/error*| - timer_opt - timer_svd]
    values = [id, num_rows, num_cols, actual_rank, num_it, min_error, error_svd, opt_error, abs((opt_error-min_error) / opt_error) , abs((opt_error-error_svd) / opt_error) ,timer_AlOp, timer_svd];
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