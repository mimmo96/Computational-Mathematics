% script for interpolation function
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%


%values of x axis
x = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];

%values of y axis
y = [3.900441e-01, 4.278068e-01,5.402864e-01,6.936480e-01,8.396877e-01,8.901296e-01,1.037936e+00,1.196557e+00,1.320439e+00,1.452170e+00];

% Found and print polynomial regression coefficients
coeff = polyfit(x, y, 1)

% Estimated values of polynomial regression
y_fit = polyval(coeff, x);

%plot real values
plot(x, y);
hold on;

%plot polynomial
plot(x, y_fit);
xlabel('rows/columns');
ylabel('time(s)');
title('Comparison between real fun and predicted polynomial');

legend('real fun','polynomial interpolation');
grid on;

hold off;

