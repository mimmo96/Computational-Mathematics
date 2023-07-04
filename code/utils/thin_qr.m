% FUNCTION thin_qr: compute thin qr factorization from scratch
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT
%           A: Matrix
% OUTPUT
%           u: vector 
%           s: vector

function [Q, R] = thin_qr(A)

    [m, n] = size(A);
    
    % create R = A and set iteration to min(n,m)
    R = A;
    up_to = min(m, n);
    
    for j = 1:up_to

        [u, s] = householder_vector(R(j:end, j));
        R(j:end, j:end) = R(j:end, j:end) - 2*u*(u'*R(j:end, j:end));
        
        % Store vector u
        U{j} = u;
    end
    
    % trasform R leaving only min(n,m) columns and rows
    R = R(1:up_to , 1:up_to);
    
    % create the matrix Q identity
    Q = eye(m,n);
    
    for k = up_to:-1:1
        %retrieve the vector u at position k
        u = cell2mat(U(k));
        
        %identity matrix of dim k:end
        id_matrix = Q(k:end, k:end);
        
        %compute new Q
        Q(k:end, k:end) = id_matrix - 2 * u * (u'* id_matrix);
    end

end


% FUNCTION householder_vector: compute householder_vector
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT
%           x: vector 
%
% OUTPUT
%           u: vector
%           s: vector

function [u, s] = householder_vector(x)

    s = norm(x);
    if x(1) >= 0, s = -s; end
    v = x;
    v(1) = v(1) - s;
    u = v / norm(v);
    
end
