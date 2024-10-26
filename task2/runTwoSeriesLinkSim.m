function result = runTwoSeriesLinkSim(K, p, N)
    % This function simulates the number of transmissions
    % p - Probability of failure
    % N - Number iterations
    % K - Number of packets

    simResults = ones(1, N);  % Store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0;  % Transmission count
        pktSuccessCount = 0;  % Number of packets that have succeded
        
        while pktSuccessCount < K
            % Transmit the packet through the first link
            r1 = rand;  % Random number to determine if the first link succeeds
            txAttemptCount = txAttemptCount + 1;  % Count the first transmission
            
            % Transmit the packet through the second link
            while r1 < p  % If the first link fails try again
                r1 = rand;
                txAttemptCount = txAttemptCount + 1;  % Count additional attempts
            end
            
            r2 = rand;  % transmit through second link
            while r2 < p  % If second link fails try again
                r2 = rand;
                txAttemptCount = txAttemptCount + 1;  % Count additional attempts
            end
            
            pktSuccessCount = pktSuccessCount + 1;  % Packet successfully passed both links
        end
        
        simResults(i) = txAttemptCount;  % Record total number of attempts
    end
    
    result = mean(simResults);  % Return average transmission count
end
