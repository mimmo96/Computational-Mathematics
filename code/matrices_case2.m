clear;

addpath utils;

hyperparameters;
create_file_for_log;
id = 0;

%caso m == n
for idx_mag = 1:length(magnitude)
    for num_cols = n:step_col:max_col

        A = rand(num_cols, num_cols)*magnitude(idx_mag);
        rank_max = num_cols;

        for i = 1:length(rank)
            k = round(rank(i)*rank_max);
            U = rand(num_cols,k);
            V = rand(num_cols,k);

            %alternating_optimization
            [errors_norm, min_error, min_iteration, timer] = alternating_optimization(A,U,V, num_iterations);
            %if you want gaps btw two consecutive errors, calculate its
            %here or in makegraphs or in an appropriete function named:
            % save_results
            
            calculate_stats(A, num_cols, num_cols, k, errors_norm, min_error, min_iteration, timer, id)
            id = id + 1;
        end
       
    end
end
