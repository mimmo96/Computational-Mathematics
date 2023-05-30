% FUNCTION CREATE FILE FOR LOG
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%

function create_file_for_log()
    
    %creates the folder if it does not exist
    dir = 'results';

    if (~exist(dir, 'dir')) 
        mkdir(dir); 
    end

    % Creating the row of values to be saved
    values_str = sprintf('id\t\tnum_rows\tnum_cols\tactual_rank\tNUM_IT\t\tMIN_IT\t\tMIN_ERROR\t\tERROR_SVD\t\tTIMER_AlOp\t\tTIMER_SVD');

    % Create a new file
    fid = fopen('results/log_stats.txt', 'w');
    
    % Writing values to the file
    fprintf(fid, '%s\n', values_str);
    
    % Closing the file
    fclose(fid);

end