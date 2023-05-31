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
    for num_rows = n:step_rows:max_rows

        A = rand(num_rows, num_rows)*magnitude(idx_mag);
        rank_max = num_rows;

        for i = 1:length(rank)
            k = round(rank(i)*rank_max);
            U = rand(num_rows,k);
            V = rand(num_rows,k);

            %alternating_optimization
            [errors_norm, min_error, min_iteration, gaps, timer] = alternating_optimization(A,U,V, tol, num_iterations);

            %save statistics of execution
            calculate_stats(A, num_rows, num_rows, k, errors_norm, min_error, min_iteration, gaps, timer, id)
            id = id + 1;
        end
       
    end
end
