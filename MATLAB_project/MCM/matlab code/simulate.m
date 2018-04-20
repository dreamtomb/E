function [ avgCWT ] = simulate(numOfSimulations)
% runs multiple simulations and computes average CWT
% Runs multiple simulations w.r.t. current setup of rules
% and computes average CWT (Cummulative Waiting Time).

global numOfIters;
global TL;

cwt = 0;                                            % cumulative cwt of all simulations

for sim=1:numOfSimulations
    for iter=1:numOfIters
        changeLanes();
        cwt = cwt + rotateCircle();
        moveINStoCircle();
        moveINS();
        queueINS(iter);                             % should go directly after moveINS
        cwt = cwt + getCWT();
        if (TL)
            updateLights();
        end
    end
end

avgCWT = cwt/numOfSimulations;

end