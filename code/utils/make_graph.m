% FUNCTION make_graph: create graph of 
%
% Author:   Domenico Profumo 
%           Gerlando Gramaglia
%
% INPUT   
%       gaps: array containing how much the error reached at each iteration deviates from the optimal error relatively
%       errors_norm: array containing errors of each iteration
%       name_fig: name of figure to store (specific id)
%       fig_title: figure title
%
% OUTPUT: --


function make_graph(gaps, errors_norm, name_fig, fig_title )
  
    % create a vector for representing all iterations
    num_it = linspace(1,length(gaps),length(gaps));

    % create figure
    fig = figure('Visible', 'off');

    % Plot for gaps
    semilogy(num_it,gaps);
    xlabel('iteration (i)');
    ylabel('(error_i-error_*)/error_*');
    title(fig_title)
    grid on;

    % Saving the figure with both subplots
    print(fig, name_fig, '-dpng', '-r300');

end
