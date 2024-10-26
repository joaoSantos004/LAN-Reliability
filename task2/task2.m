% Main for task 2
K_values = [1, 5, 15, 50, 100];  % Number of packets
N = 1000;  % Number of iterations
p_values = 0:0.01:0.99;  % Probability of failure

% Create a figure for each K value
for idx = 1:length(K_values)
    K = K_values(idx);  % Current number of packets
    simulatedResults = zeros(1, length(p_values));  % Initialize simulated results
    calculatedResults = zeros(1, length(p_values)); % Initialize calculated results
    
    % Run simulation for each p value
    for j = 1:length(p_values)
        p = p_values(j);  % Current probability of failure
        % Simulated result
        simulatedResults(j) = runTwoSeriesLinkSim(K, p, N);
        % Calculated result
        if p < 1
            calculatedResults(j) = K / (1 - p)^2;
        else
            calculatedResults(j) = NaN;
        end
    end
    
    % Plot the results for the current K
    figure;
    semilogy(p_values, calculatedResults, 'b-', 'LineWidth', 2); 
    hold on;
    semilogy(p_values, simulatedResults, 'ro', 'MarkerSize', 4); 
    hold off;
    title(['K = ', num2str(K), ' Packets (Two Series Links)']);
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    legend('Calculated', 'Simulated');
    grid on;
end

% Create a single figure with results from all K values
figure;
colors = ['b', 'r', 'g', 'm', 'k'];  % Color for each K value
for idx = 1:length(K_values)
    K = K_values(idx);  % Current number of packets
    simulatedResults = zeros(1, length(p_values));  % Initialize simulated results
    calculatedResults = zeros(1, length(p_values)); % Initialize calculated results
    
    % Run simulation for each p value
    for j = 1:length(p_values)
        p = p_values(j);  % Current probability of failure
        % Simulated result
        simulatedResults(j) = runTwoSeriesLinkSim(K, p, N);
        % Calculated result using the formula K / (1-p)^2
        if p < 1
            calculatedResults(j) = K / (1 - p)^2;
        else
            calculatedResults(j) = NaN;  % Undefined at p = 1
        end
    end
    
    % Plot the results for the current K
    semilogy(p_values, calculatedResults, [colors(idx), '-'], 'LineWidth', 2); 
    hold on;
    semilogy(p_values, simulatedResults, [colors(idx), 'o'], 'MarkerSize', 4); 
end
hold off;
title('Comparison of Calculated and Simulated Results for Different K Values (Two Series Links)');
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
legend('Calculated K=1', 'Simulated K=1', 'Calculated K=5', 'Simulated K=5', ...
       'Calculated K=15', 'Simulated K=15', 'Calculated K=50', 'Simulated K=50', ...
       'Calculated K=100', 'Simulated K=100');
grid on;
