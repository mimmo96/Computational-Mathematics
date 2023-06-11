format long e;

path = 'results/log_stats.txt';

% Open the file for reading
fid = fopen(path, 'r');

% Skip the header line
fgetl(fid);

% Initialize variables
data = [];

% Read data from file line by line
tline = fgetl(fid);

while ischar(tline)
    % Split the line by tabs
    values = strsplit(tline, '\t');
    
    % Convert values to numerical format
    values = cellfun(@str2double, values(2:end-1))
    

    % Append the values to the data matrix
    data = [data; values];
   
    
    % Read the next line
    tline = fgetl(fid);
end

% Close the file
fclose(fid);


% 1 = num_rows	
% 2 = num_cols	
% 3 = actual_rank	
% 4 = NUM_IT		
% 5 = MIN_IT		
% 6 = MIN_ERROR		
% 7 = ERROR_SVD		
% 8 = TIMER_AlOp		
% 9 = TIMER_SVD

% mostra solo la prima colonna (num_rows)
data(1:end,1)

% mostra solo la 7 colonna (ERROR_SVD)
data(1:end,7)
