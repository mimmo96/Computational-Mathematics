%rows
x = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];

rank_25 = [1.111640e-01, 4.586030e-01, 1.269365e+00, 2.552912e+00, 5.032398e+00, 8.134306e+00, 1.224648e+01, 1.651475e+01, 2.370004e+01, 3.364446e+01 ];
rank_50 = [2.615410e-01, 1.194009e+00, 3.834570e+00, 8.653561e+00, 1.564082e+01, 2.544865e+01, 4.500244e+01, 6.157173e+01, 8.838664e+01, 1.163819e+02 ];
rank_75 = [4.652930e-01, 2.852418e+00, 8.422085e+00, 1.934301e+01, 3.776819e+01, 6.556215e+01, 8.864838e+01, 1.307613e+02, 1.910159e+02, 2.663084e+02 ];

rank_50_50col = [3.900441e-01, 4.278068e-01,5.402864e-01,6.936480e-01,8.396877e-01,8.901296e-01,1.037936e+00,1.196557e+00,1.320439e+00,1.452170e+00];

%plot(x, rank_25);
%hold on;
%plot(x, rank_50);
%hold on;
%plot(x, rank_75);
%hold off;

y = rank_50_50col;
coeff = polyfit(x, y, 1); % Polynomial regression coefficients
y_fit = polyval(coeff, x); % Estimated values of polynomial regression

coeff

%plot real values
plot(x, y);
hold on;

%plot polynomial
plot(x, y_fit);
xlabel('rows/columns');
ylabel('time(s)');
title('Comparison between real fun and predicted polynomial with 50 columns and rank=25');

legend('real fun','1° degree polynomial');
grid on;

hold off;

