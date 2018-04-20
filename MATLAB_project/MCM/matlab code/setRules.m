function [] = setRules( rules )
% rules is a set of parameters (priority signs, road marks, traffic lights)
% Every rule set is represented by the unique combination of:
% * index - divided by powers of 2, boolean values are obtained
% * queues - divided by powers of maxQueueSize, natural numbers are obtained
% * greenTimes - divided by powers of maxGreenTime, natural numbers are obtained
% * offTimes - divided by powers of maxOffTime, natural numbers are obtained

global numOfINS;
global maxQueueSize;
global maxGreenTime;
global maxOffTime;
global TL;

% ASSIGNMENTS
p = rules.priority;                                     % priority
if (TL)
    t = rules.present;                                  % presence of traffic lights
    q = rules.queue;                                    % queue sizes
    g = rules.greenTime;                                % green times
    o = rules.offTime;                                  % off times
end

% STRUCTURE OF TRAFFIC LIGHTS
global trafficLight;
if (p == 0)
    trafficLight.isPresent  = zeros(1,numOfINS);        % presence
    trafficLight.queueSize  = zeros(1,numOfINS);        % min queue size for green
    trafficLight.greenTime  = zeros(1,numOfINS);        % total time for green
    trafficLight.greenCount = zeros(1,numOfINS);        % time left for green
    trafficLight.offTime    = zeros(1,numOfINS);        % min time for forced off
    trafficLight.offCount   = zeros(1,numOfINS);        % time left for forced off
end

% TRAFIC LIGHTS
if (TL)
    for i=1:numOfINS
        trafficLight.isPresent(i)  = mod(t, 2^i);
        trafficLight.queueSize(i)  = mod(q, maxQueueSize^i);
        trafficLight.greenTime(i)  = mod(g, maxGreenTime^i);
        trafficLight.greenCount(i) = 0;                 % initial states = off
        trafficLight.offTime(i)    = mod(o, maxOffTime^i);
        trafficLight.offCount(i)   = 0;                 % no previous green signal
    end
end

% PRIORITIES
global hasPriority; hasPriority = zeros(1,numOfINS);
for i=1:numOfINS
    hasPriority(i) = mod(p,2^i);                        % priorities for each IN
end

end