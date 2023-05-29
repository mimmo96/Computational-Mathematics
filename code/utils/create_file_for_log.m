function create_file_for_log()
    
    %crea la cartella se non esiste
    dir = 'results';

    if (~exist(dir, 'dir')) 
        mkdir(dir); 
    end

    % Creazione della riga di valori da salvare
    values_str = sprintf('id\tnum_rows\tnum_cols\tactual_rank\tNUM_IT\tMIN_IT\tMIN_ERROR\tERROR_SVD\tTIMER_AlOp\tTIMER_SVD');

    % creo un nuovo file
    fid = fopen('results/log_stats.txt', 'w');
    
    % Scrittura dei valori sul file
    fprintf(fid, '%s\n', values_str);
    
    % Chiusura del file
    fclose(fid);

end
