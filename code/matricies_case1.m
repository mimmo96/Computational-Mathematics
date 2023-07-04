%File used for creation of matrix with m>> n
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia

%clean environment
clear;

%load configurations
addpath utils;
format long e;
hyperparameters;
create_file_for_log;

id = 0;

%case1: n >> m: 
for idx_mag = 1:length(magnitude)
    for num_cols = m:step_col:max_col
        for num_rows = n:step_rows:max_rows
            
            % create A matrix with random values
            A = rand(num_rows, num_cols)*magnitude(idx_mag);
            rank_max = min(num_rows,num_cols);
            
            tic;
            % Compute SVD of A
            [u_svd, S, v_svd] = svd(A);
            
            %save time for svd
            timer_svd = toc;
            
            % Save all sigma values
            [~ , size_sigma_matrix] = size(S);
            
            % Initialize array to save diagonal values
            sigma = zeros(size_sigma_matrix, 1);
            
            % save in array all sigma values
            for i = 1:size_sigma_matrix
                sigma(i) = S(i, i);
            end
            
            for i = 1:length(rank)
                
                %Create U,V matrix with specific rank 
                k = round(rank(i)*rank_max);
                U = rand(num_rows,k);
                V = rand(num_cols,k);

                %alternating_optimization
                [opt_error, errors_norm, min_error, gaps, timer] = alternating_optimization(A,U,V, sigma, tol, num_iterations);
                
                %save statistics of execution
                calculate_stats(A, u_svd, S, v_svd , num_rows, num_cols, k, opt_error, errors_norm, min_error, gaps, timer, timer_svd, id)
                id = id + 1;
            end
        end
    end
end
