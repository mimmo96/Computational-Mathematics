format long e;

path = '../../results/log_stats.txt';

M = dlmread(path);

matrix = M(1:150,1:end);

%set rank for graph:
% 0 = 75%
% 1 = 50%
% 2 = 25%

rank = 0;

% grafico del tempo rispetto al numero delle righe (ogni linea rappresenta
% la colonna)
x_val = Inf(1, 50);
y_val = Inf(1, 50);

for i=1:50
    x_val(i) = M((i*3)-rank,2);
    y_val(i) = M((i*3)-rank,11);
end

xcolumn_1 = x_val(1:10);
xcolumn_2 = x_val(11:20);
xcolumn_3 = x_val(21:30);
xcolumn_4 = x_val(31:40);
xcolumn_5 = x_val(41:50);

ycolumn_1 = y_val(1:10);
ycolumn_2 = y_val(11:20);
ycolumn_3 = y_val(21:30);
ycolumn_4 = y_val(31:40);
ycolumn_5 = y_val(41:50);

% Plot 
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

