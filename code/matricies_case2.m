% File used for creation of matrix with m == n
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia


%clean environment
clear;

%load configurations
addpath utils;
hyperparameters;
create_file_for_log;

id = 0;

%case2: m == n: num_matrici= 60
for idx_mag = 1:length(magnitude)
    for num_rows = n:step_rows:max_rows

        A = rand(num_rows, num_rows)*magnitude(idx_mag);
        rank_max = num_rows;
 
        tic;
        % Compute SVD of A
        [u_svd, S, v_svd] = svd(A);
            
        %save time for svd
        timer_svd = toc;

        % Save all sigma values
        [~ , size_sigma_matrix] = size(S);
        
        % Inizializza l'array per salvare i valori diagonali
        sigma = zeros(size_sigma_matrix, 1);
        
        for i = 1:size_sigma_matrix
            sigma(i) = S(i, i);
        end


        for i = 1:length(rank)
            k = round(rank(i)*rank_max);
            U = rand(num_rows,k);
            V = rand(num_rows,k);

            %alternating_optimization
            [opt_error, errors_norm, min_error, min_iteration, gaps, timer] = alternating_optimization(A,U,V, sigma, tol, num_iterations);
                
            %save statistics of execution
            calculate_stats(A, u_svd, S, v_svd , num_rows, num_rows, k, opt_error, errors_norm, min_error, min_iteration, gaps, timer, timer_svd, id)
            id = id + 1;
        end
       
    end
end
