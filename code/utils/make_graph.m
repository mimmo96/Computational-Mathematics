function make_graph(gaps, errors_norm, it, name_fig )
  
    num_it = linspace(1,it,it);

    fig1 = figure('Visible', 'off');
    
    semilogy(num_it,errors_norm);
    grid on;
    hold on;
    semilogy(num_it,gaps,':');
    hold off;
  
    xlabel('iteration');
    ylabel('error & gap');
    %title('Matrix:' + string(matrix_dim) + ' rank:' + string(rank));
    
    legend('errors','gaps');
    saveas(fig1, string(name_fig));

end
