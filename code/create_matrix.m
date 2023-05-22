% function for create 10 different matrix with a specific density and save it into a new folder 
% called 'Matrices'

function create_matrix(m,n)
   
    %number of matrix to create
    num = 10;
    dir = ('Matrices');
    if (~exist(dir, 'dir')) 
        mkdir(dir); 
    end
    
    cd 'Matrices';

    % Densità, cioè la frazione di elementi non nulli
    perc_dens = 0.25;
    
    for i = 1:num
        
        % Genera una matrice casuale sparsa
        %matrix = sprand(m, n, perc_dens);
        
        % Genera una matrice random con tutti gli elementi
        matrix = rand(m, n);
        
        % Genera un nome univoco per il file
        fileName = sprintf('matrix_%d.mat', i);
        
        % Salva la matrice su file
        save(fileName, 'matrix');
        
    end

    cd ..

end

% NOTA: per utilizzare la matrice salvata usare il comando load(matrix_0),
% dopo averlo seguito la matrice sarà salvata in memoria con il nome
% 'matrix'
