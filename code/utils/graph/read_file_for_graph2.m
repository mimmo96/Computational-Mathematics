format long e;

path = '../../results/log_stats.txt';

M = dlmread(path);

matrix = M(1:end,1:end);

%set rank for graph:
% 0 = 75%
% 1 = 50%
% 2 = 25%

rank = 1;

% grafico del tempo rispetto al numero delle righe (ogni linea rappresenta
% la colonna)
x_val = Inf(1, 9);
y_val = Inf(1, 9);
y_val5 = Inf(1, 9);
y_val6 = Inf(1, 9);
y_val7 = Inf(1, 9);

for i=1:9
    x_val(i) = M((i*3)-rank,2);
    y_val5(i) = M((i*3)-rank,5);
    y_val6(i) = M((i*3)-rank,6);
    y_val7(i) = M((i*3)-rank,7);
end


% Plot 
plot(x_val, y_val5,'m--')
hold on;
plot(x_val, y_val6,'b--')
title('time respect to rows and columns with rank=0.5*rows')
xlabel('rows-colums');
ylabel('time(s)');
grid on;

hold off;

% Saving the figure with both subplots
%print(fig, name_fig, '-dpng', '-r300');

%matrix(31:60*i,2); 
%matrix(31:60*i,11); 

% 5 grafici per ogni colonna ed ogni grafico una curva per ogni k

%nel plot mettere righe e tempo

%id		rows	cols	rank	it	error*	AlOp_err	svd_error	|(AlOp_err-error*)/error*| |(svd_err-error*)/error*| 	timer_opt	timer_svd


% mostra solo la prima colonna (num_rows)
% mostra solo la 7 colonna (ERROR_SVD)
%data(1:2,7)
