function make_graph(gaps, errors_norm, num_it, name_fig )
    fig1 = figure();
    matrix_dim = 100;
    rank = 5;
    semilogy(num_it,errors_norm)
    grid on;
    hold on;
    semilogy(num_it,gaps,':')
    hold off;
  
    xlabel('iteration');
    ylabel('error & gap');
    title('Matrix:' + string(matrix_dim) + ' rank:' + string(rank));
    
    legend('errors','gaps')
    saveas(fig1, name_fig);
end
