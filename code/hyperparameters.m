% file containing configuration and all hyperparameters
%
% Author: Domenico Profumo 
%         Gerlando Gramaglia

% -----------------------
%     configuration 
% -----------------------

% matrix dimensions
n = 100;  %rows
m = 10;   %column

% step of each column and rows for iteration
step_col = 10;
step_rows = 1000;

%maximum values of rows/column 
max_col = 50;
max_rows = 10000;

%magnitude of values
magnitude = [1, 1e-14, 1e14];

%rank 
rank = [0.25, 0.5, 0.75];

% -----------------------
%     hyperparameters 
% -----------------------
num_iterations = 1000;

%tollerance
tol = 1e-15;
