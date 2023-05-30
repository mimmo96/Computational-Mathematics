%File used for creation of matrix with m == n
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
    for num_cols = n:step_col:max_col

        A = rand(num_cols, num_cols)*magnitude(idx_mag);
        rank_max = num_cols;

        for i = 1:length(rank)
            k = round(rank(i)*rank_max);
            U = rand(num_cols,k);
            V = rand(num_cols,k);

            %alternating_optimization
            [errors_norm, min_error, min_iteration, gaps, timer] = alternating_optimization(A,U,V, tol, num_iterations);

            %save statistics of execution
            calculate_stats(A, num_cols, num_cols, k, errors_norm, min_error, min_iteration, gaps, timer, id)
            id = id + 1;
        end
       
    end
end
