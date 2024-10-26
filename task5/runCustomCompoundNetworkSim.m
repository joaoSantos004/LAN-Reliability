function result = runCustomCompoundNetworkSim(K, p1, p2, p3, N)
    % function to simulate transmissions
    % K - Number of packets
    % p1 - Probability of failure for link 1
    % p2 - Probability of failure for link 2
    % p3 - Probability of failure for link 3
    % N - Number of iterations
    
    simResults = zeros(1, N);  % Array to store results
    
    for i = 1:N
        txAttemptCount = 0;  % Counts attempts
        pktSuccessCount = 0;  % Counts success
        
        while pktSuccessCount < K
            % Simulate transmission across parallel links
            r1 = rand;  % Random value for link 1
            r2 = rand;  % Random value for link 2
            txAttemptCount = txAttemptCount + 1;  % Increment transmission
            
            % If either of the parallel links succeeds
            if r1 > p1 || r2 > p2
                % packet must successfully transmit
                r3 = rand;  % Random value for link 3
                
                if r3 > p3
                    pktSuccessCount = pktSuccessCount + 1;  % Increment successful packet
                end
            end
        end
        
        simResults(i) = txAttemptCount;  % Record number of transmissions
    end
    
    % Calculate and return the average number of transmissions
    result = mean(simResults);
end
