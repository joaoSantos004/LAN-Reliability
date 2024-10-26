% main for task 5
K_values = [1, 5, 10];  % Number of packets
N = 1000;  % Number of iterations
p_values = 0.01:0.01:0.99;  % Probability of failure for link

% Colors to be used
colors = ['b', 'r', 'g'];

% Definition of values for each link
figureConfigs = {
    [0.10, 0.60, NaN],  % Figure 1: p1 = 10%, p2 = 60%, p3 varies
    [0.60, 0.10, NaN],  % Figure 2: p1 = 60%, p2 = 10%, p3 varies
    [0.10, NaN, 0.60],  % Figure 3: p1 = 10%, p2 varies, p3 = 60%
    [0.60, NaN, 0.10],  % Figure 4: p1 = 60%, p2 varies, p3 = 10%
    [NaN, 0.10, 0.60],  % Figure 5: p1 varies, p2 = 10%, p3 = 60%
    [NaN, 0.60, 0.10]   % Figure 6: p1 varies, p2 = 60%, p3 = 10%
};

% Run simulations for each graph
for figIdx = 1:length(figureConfigs)
    config = figureConfigs{figIdx};
    p1_fixed = config(1);
    p2_fixed = config(2);
    p3_fixed = config(3);
    
    figure;
    hold on;
    
    % Run simulations for packet values
    for kIdx = 1:length(K_values)
        K = K_values(kIdx);  % Current packet value
        simulatedResults = zeros(1, length(p_values));  % Store results for each p value
        
        % Run simulations with varying p
        for pIdx = 1:length(p_values)
            if isnan(p1_fixed)  % p1 varies, p2 and p3 are fixed
                p1 = p_values(pIdx);
                p2 = p2_fixed;
                p3 = p3_fixed;
            elseif isnan(p2_fixed)  % p2 varies, p1 and p3 are fixed
                p1 = p1_fixed;
                p2 = p_values(pIdx);
                p3 = p3_fixed;
            elseif isnan(p3_fixed)  % p3 varies, p1 and p2 are fixed
                p1 = p1_fixed;
                p2 = p2_fixed;
                p3 = p_values(pIdx);
            end
            
            % Call function
            simulatedResults(pIdx) = runCustomCompoundNetworkSim(K, p1, p2, p3, N);
        end
        
        % Plot the results
        semilogy(p_values, simulatedResults, [colors(kIdx), 'o'], 'MarkerSize', 4);  % Hollow circles
    end
    
    hold off;
    title(['Simulated Results for Figure ', num2str(figIdx)]);
    xlabel('Probability of Failure');
    ylabel('Average Number of Transmissions');
    legend('K=1', 'K=5', 'K=10');
    grid on;
end
