function [] = queueINS(iter)
% queues new cars to the lanes
% Random queuing based on statistical traffic-flow data and traffic-circle
% geometry.

global numOfINroads;
global numOfOUTroads;
global isInOUTroad;
global INpos;
global laneOfINroad;
global laneOfOUTroad;
global stats;
global isInINroad;
global numOfIters;
global iterLength;

hour = ceil( (iter * 12)/numOfIters );              % hour for statistical data
frac = iterLength/3600;                             % fraction of the hour for one iter       

for inR=1:numOfINroads
    for outR=1:numOfOUTroads
        
        % FINDS BEST LANE TO GO INTO
        bestLane = 0;
        out = laneOfOUTroad(outR);
        while (isInOUTroad(out) == outR)
            bestLane = bestLane + leftTillOUT(INpos(laneOfINroad(inR)),laneOfOUTroad(outR));
            out = convOUT(out+1);
        end
        totalOUTS = sum(outR == isInOUTroad);
        bestLane = round(bestLane/totalOUTS);
        
        % CALCULATES TOTAL WEIGHT TO BE DISTRIBUTED FOR LANES
        totalINS = sum(inR == isInINroad);
        % TW - total weight: sum of weights to the right
        TW = bestLane*(bestLane-1)/2;                                   % sum of weights to the left
        TW = TW + (totalINS-bestLane)*(totalINS-bestLane-1)/2;          % sum of weights to the right
        TW = TW + bestLane;                                             % adds weight of bestLane

        % CALCULATES TOTAL FLOW TO BE DISTRIBUTED IN THIS ITERATION
        flow = frac*stats(inR,outR,hour) * genR();
        
        % DISTRIBUTES TOTAL FLOW: CLOSIER TO THE BEST LANE => MORE CARS
        index = totalINS;                                               % index for lane count
        in = laneOfINroad(inR);
        while (isInINroad(in) == inR)                                   % for all INs of inR
            laneFlow = (flow/TW)*(bestLane-abs(bestLane-index));        % distribution
            laneFlow = round( laneFlow*genR() );                        % noise, normalization
            out = laneOfOUTroad(outR) + min(totalOUTS,index)-1;         % destination OUT
            putToLane(in,out,laneFlow);                                 % put cars to lane
            index = index - 1;                                          % increments index
            in = convIN(in+1);
        end
    end
end

end