function make_graph(gaps, errors_norm, name_fig, fig_title )
  
    num_it = linspace(1,length(errors_norm),length(errors_norm));

    fig = figure('Visible', 'off');
    
    subplot(2,1,1);

    semilogy(num_it,errors_norm);
    xlabel('iteration');
    ylabel('errors');
    title(fig_title);
    grid on;
  

    % Secondo subplot
    subplot(2,1,2);

    semilogy(num_it,gaps);
    xlabel('iteration');
    ylabel('gap');
    grid on;
    

    % Salvataggio della figura con entrambi i subplot
    print(fig, name_fig, '-dpng', '-r200');

end
