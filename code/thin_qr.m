function [Q, R] = thin_qr(A)

    [m, n] = size(A);
    
    R = A;
    up_to = min(m, n);
    
    for j = 1:up_to
        [u, s] = householder_vector(R(j:end, j));
        R(j:end, j:end) = R(j:end, j:end) - 2*u*(u'*R(j:end, j:end));
        % Salva il vettore u
        U{j} = u;
    end
    
    R = R(1:up_to , 1:up_to);
    
    % Creo la matrice Q identità
    Q = eye(m,n);
    
    for k = up_to:-1:1
        %recupero il vettore u
        u = cell2mat(U(k));
        
        %identity matrix of dim k:end
        id_matrix = Q(k:end, k:end);

        Q(k:end, k:end) = id_matrix - 2 * u * (u'* id_matrix);
    end

end