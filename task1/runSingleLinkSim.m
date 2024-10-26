

% K - number of packets
% p - probability of failure
% N - number of iterations


function result = runSingleLinkSim(K, p, N)
    simResults = ones(1, N);  % Place to store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0;  % Transmission count
        pktSuccessCount = 0;  % Number of packets that have made it across
        
        while pktSuccessCount < K
            r = rand;  % Generate random number to determine if packet is successful
            txAttemptCount = txAttemptCount + 1;  % Count 1st attempt
            
            % While packet transmission is not successful
            while r < p
                r = rand;  % Transmit again
                txAttemptCount = txAttemptCount + 1;  % Count additional attempt
            end
            
            pktSuccessCount = pktSuccessCount + 1;  % Increase success count after success
        end
        
        simResults(i) = txAttemptCount;  % Record total number of attempted transmissions
    end
    
    result = mean(simResults);  % Return the average result
end
