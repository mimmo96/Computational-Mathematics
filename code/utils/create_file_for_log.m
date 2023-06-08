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
    values_str = sprintf('id\t\trows\t\tcols\trank\tit\t\tmin_it\tmin_dist\t\t\tsvd_dist\t\t\topt_distance\t\t\ttimer_opt\t\t\ttimer_svd');

    % Create a new file
    fid = fopen('results/log_stats.txt', 'w');
    
    % Writing values to the file
    fprintf(fid, '%s\n', values_str);
    
    % Closing the file
    fclose(fid);

end