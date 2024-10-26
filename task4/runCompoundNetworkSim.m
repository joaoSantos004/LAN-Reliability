function result = runCompoundNetworkSim(K, p, N)
    % This function simulates the number of transmissions 
    % K - Number of packets
    % p - Probability of failure for each link
    % N - Number of iterations
    
    simResults = zeros(1, N);  % Array to store results
    for i = 1:N
        txAttemptCount = 0;  % Counts attempts
        pktSuccessCount = 0;  % Counts success
        
        while pktSuccessCount < K
            % Simulate transmission across two parallel links
            r1 = rand;  % Random value for the first link
            r2 = rand;  % Random value for the second link
            txAttemptCount = txAttemptCount + 1;  % Increment transmission
            
            % If either of the parallel links succeeds
            if r1 > p || r2 > p
                % packet must successfully transmit through the single link
                r3 = rand;  % Random value for the single link
                
                if r3 > p
                    pktSuccessCount = pktSuccessCount + 1;  % Increment successful packet
                end
            end
        end
        
        simResults(i) = txAttemptCount;  % Record total number of transmissions
    end
    
    % Calculate and return the average number of transmissions
    result = mean(simResults);
end
