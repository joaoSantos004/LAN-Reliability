% Main for task 4
K_values = [1, 5, 15, 50, 100];  % Number of packets
N = 1000;  % Number of simulations to run
p_values = 0:0.01:0.99;  % Probability of failure

% colors to be used
colors = ['b', 'r', 'g', 'm', 'k'];

% Create a figure for each K value
for idx = 1:length(K_values)
    K = K_values(idx);  % Current value of K
    simulatedResults = zeros(1, length(p_values));  % Store simulated results for each p
    
    % Run simulation for each p value
    for j = 1:length(p_values)
        p = p_values(j);  % Current probability of failure
        % Call function
        simulatedResults(j) = runCompoundNetworkSim(K, p, N);
    end
    
    % Plot the results for the current K
    figure;
    semilogy(p_values, simulatedResults, 'ro', 'MarkerSize', 4);
    title(['Simulated Results for K = ', num2str(K), ' Packets (Compound Network)']);
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    grid on;
end

% Create a single figure for all results
figure;
for idx = 1:length(K_values)
    K = K_values(idx);  % Current value of K
    simulatedResults = zeros(1, length(p_values));  % Store simulated results for each p
    
    % Run simulation for each p value
    for j = 1:length(p_values)
        p = p_values(j);  % Current probability of failure
        % Call function
        simulatedResults(j) = runCompoundNetworkSim(K, p, N);
    end
    
    % Plot the results for the current K
    semilogy(p_values, simulatedResults, [colors(idx), 'o'], 'MarkerSize', 4);
    hold on;
end
hold off;
title('Simulated Results for Different K Values (Compound Network)');
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
legend('K=1', 'K=5', 'K=15', 'K=50', 'K=100');
grid on;
