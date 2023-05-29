function create_file_for_log()
    
    %crea la cartella se non esiste
    dir = 'results';

    if (~exist(dir, 'dir')) 
        mkdir(dir); 
    end

    % Creazione della riga di valori da salvare
    values_str = sprintf('id\t\tnum_rows\tnum_cols\tactual_rank\tNUM_IT\t\tMIN_IT\t\tMIN_ERROR\t\tERROR_SVD\t\tTIMER_AlOp\t\tTIMER_SVD');

    % creo un nuovo file
    fid = fopen('results/log_stats.txt', 'w');
    
    % Scrittura dei valori sul file
    fprintf(fid, '%s\n', values_str);
    
    % Chiusura del file
    fclose(fid);

end