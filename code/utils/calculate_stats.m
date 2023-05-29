function calculate_stats(A, num_rows, num_col, actual_rank, errors_norm, min_error, min_iteration, timer, id)
    
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
    make_graph(gaps, errors_norm, length(errors_norm), 'results/matrix_'+string(id)+'.png');

    %SAVE IN A TABLE:
    saveValuesToFile(id, num_rows, num_col, actual_rank, length(errors_norm), min_iteration, min_error, svd_err, timer, timer_svd, 'results/log_stats.txt')
    
end

function saveValuesToFile(id, num_rows, num_cols, actual_rank, NUM_IT, MIN_IT, MIN_ERROR, ERROR_SVD, TIMER_AlOp, TIMER_SVD, file_name)
    
    % Creazione della riga di valori da salvare
    values = [id, num_rows, num_cols, actual_rank, NUM_IT, MIN_IT, MIN_ERROR, ERROR_SVD, TIMER_AlOp, TIMER_SVD];
    values_str = sprintf('%d\t\t', values);
    values_str = values_str(1:end-1); % Rimuove l'ultimo carattere di tabulazione
    
    % Apertura del file in modalità append
    fid = fopen(file_name, 'a');
    
    % Scrittura dei valori sul file
    fprintf(fid, '%s\n', values_str);
    
    % Chiusura del file
    fclose(fid);
end