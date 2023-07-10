% script for make graph from log_stats files
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%

format long e;

% NOTE: change it manualy!
% ----- OPTIONS -----

% path of the folder that contain log_stats.txt results in this case is considered in
% the current path
path = 'log_stats.txt';

%a 150-line file is used
num_rows = 150;

% -------------------

%read the contents of the file by deleting the first line
fileContent = fileread(path);
newlineIdx = strfind(fileContent, newline);
fileContent = fileContent(newlineIdx(1)+1:end);
tempFile = tempname;
fid = fopen(tempFile, 'w');
fwrite(fid, fileContent, 'char');
fclose(fid);
data = dlmread(tempFile);
delete(tempFile);

%create a matrix with file content
M = data;
matrix = M(1:num_rows,1:end);

%set rank for graph:
% 0 = 75%
% 1 = 50%
% 2 = 25%

dim_rank = num_rows/3;
rank = 0;

% grafico del tempo rispetto al numero delle righe (ogni linea rappresenta
% la colonna)
x_val = Inf(1, dim_rank);
y_val = Inf(1, dim_rank);

% store the values for different rank
for i=1:dim_rank
    x_val(i) = M((i*3)-rank,2);
    y_val(i) = M((i*3)-rank,11);
end

% x_column, one for each size
xcolumn_1 = x_val(1:10);
xcolumn_2 = x_val(11:20);
xcolumn_3 = x_val(21:30);
xcolumn_4 = x_val(31:40);
xcolumn_5 = x_val(41:50);

% y_column, one for each size
ycolumn_1 = y_val(1:10);
ycolumn_2 = y_val(11:20);
ycolumn_3 = y_val(21:30);
ycolumn_4 = y_val(31:40);
ycolumn_5 = y_val(41:50);

% Plot graph
plot(xcolumn_1, ycolumn_1,'m--')
hold on;
plot(xcolumn_2, ycolumn_2,'r--')
plot(xcolumn_3, ycolumn_3,'b--')
plot(xcolumn_4, ycolumn_4,'c--')
plot(xcolumn_5, ycolumn_5,'g--')
legend('10 col','20 col','30 col','40 col','50 col')
title('time respect to rows with rank=0.25*column')
xlabel('rows');
ylabel('time(s)');
grid on;

hold off;
