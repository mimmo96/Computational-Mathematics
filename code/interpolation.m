x = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];

rank_25 = [1.111640e-01, 4.586030e-01, 1.269365e+00, 2.552912e+00, 5.032398e+00, 8.134306e+00, 1.224648e+01, 1.651475e+01, 2.370004e+01, 3.364446e+01 ];
rank_50 = [2.615410e-01, 1.194009e+00, 3.834570e+00, 8.653561e+00, 1.564082e+01, 2.544865e+01, 4.500244e+01, 6.157173e+01, 8.838664e+01, 1.163819e+02 ];
rank_75 = [4.652930e-01, 2.852418e+00, 8.422085e+00, 1.934301e+01, 3.776819e+01, 6.556215e+01, 8.864838e+01, 1.307613e+02, 1.910159e+02, 2.663084e+02 ];

%plot(x, rank_25);
%hold on;
%plot(x, rank_50);
%hold on;
%plot(x, rank_75);
%hold off;

y = rank_50;
coeff = polyfit(x, y, 2); % Coefficienti della regressione polinomiale
y_fit = polyval(coeff, x); % Valori stimati della regressione polinomiale

plot(x, y);
hold on;

plot(x, y_fit);
xlabel('rows/colums');
ylabel('time(s)');
title('Comparison between real fun and 2° degree polynomial for rank 50');

legend('real fun','2° degree polynomial');
grid on;

hold off;

