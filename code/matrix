function matrix()
 

  %caso m >> n: num_matrici < 500
  for num_cols = n:10:max_col
    for num_rows = m:step_rows:max_rows
        matrix = rand(num_rows, num_cols);

    end
  end
  %caso m = n: num_matrici < 100
  for num_rows = n:step_col:max_rows
      matrix = rand(num_rows, num_rows);
  end
  %matrici sparse, density: 0.25, 0.5, 0.75
  for i = 1:lenght(density)
      %caso m >> n: num_matrici < 500
      for num_cols = n:step_col:max_col
        for num_rows = m:step_rows:max_rows
            matrix_sparse = sprand(num_rows, num_cols, density[i]);
        end
      end
      %caso m = n: num_matrici < 100
      for num_rows = m:step_rows:max_rows
        matrix_sparse = sprand(num_rows, num_rows, density[i]);
      end

  end
end

% NOTA: per utilizzare la matrice salvata usare il comando load(matrix_0),
% dopo averlo seguito la matrice sarà salvata in memoria con il nome
% 'matrix'
