function result = runTwoParallelLinkSim(K, p, N)
    % This function simulates the number of transmissions
    % p - Probability of failure
    % N - Number iterations
    % K - Number of packets
    
    simResults = zeros(1, N);  % Array to store the results
    
    for i = 1:N
        txAttemptCount = 0;  % Counts attempts
        pktSuccessCount = 0;  % Counts success
        
        while pktSuccessCount < K
            % Simulate transmission across both links
            r1 = rand;  % Random value for the first link
            r2 = rand;  % Random value for the second link
            txAttemptCount = txAttemptCount + 1;  % Increment transmission
            
            % If either link succeeds packet is successfully transmitted
            if r1 > p || r2 > p
                pktSuccessCount = pktSuccessCount + 1;  % Increment successful packet
            end
        end
        
        simResults(i) = txAttemptCount;  % Record total number of transmissions
    end
    
    % Calculate and return the average number of transmissions
    result = mean(simResults);
end
