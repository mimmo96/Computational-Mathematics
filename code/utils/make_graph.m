% FUNCTION FOR CREATING GRAPH
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT   
%       gaps:
%       errors_norm:
%       name_fig:
%       fig_title: 
%
% OUTPUT:


function make_graph(gaps, errors_norm, name_fig, fig_title )
  
    %create a vector for representing all iterations
    num_it = linspace(1,length(errors_norm),length(errors_norm));

    %create figure
    fig = figure('Visible', 'off');
    
    % First plot for num iteration and errors
    subplot(2,1,1);
    semilogy(num_it,errors_norm);
    xlabel('iteration');
    ylabel('errors');
    title(fig_title);
    grid on;
  

    % Second plot for num iteration and gaps
    subplot(2,1,2);
    semilogy(num_it,gaps);
    xlabel('iteration');
    ylabel('gap');
    grid on;

    % Manually set the y-axis limits
    gap_ylim = [min(gaps), max(gaps)];
    ylim(gap_ylim);

    % Saving the figure with both subplots
    print(fig, name_fig, '-dpng', '-r200');

end
