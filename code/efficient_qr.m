function [Q, R] = efficient_qr(A)
    [m, n] = size(A);
    R = A;
    Q = eye(m);
    for k = 1:n
        [ u , s] = householder_vector(R(k:end,k));
        R(k:end, k:end) = R(k:end, k:end) - (2*u)*(u'*R(k:end,k:end));

        Q(:,k:end) = Q(:,k:end) - (Q(:,k:end)*u)*(2*u');
    end
