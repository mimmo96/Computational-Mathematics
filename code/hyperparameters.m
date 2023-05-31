%file containing all hyperparameters
%
% Author: Domenico Profumo 
%         Gerlando Gramaglia


%dimensioni matrici
m = 100;  
n = 10; 

%
step_col = 100;
step_rows = 1000;

max_col = 1000;
max_rows = 10000;

%magnitude of values
magnitude = [1, 1e-14, 1e14];

%matrici sparse
%density = [0.25, 0.5, 0.75];

%hyperparameters
num_iterations = 1000;
error = 1e-16;

%gap tollerance
tol = 1e-04;

%rank 
rank = [0.25, 0.5, 0.75, 1];
