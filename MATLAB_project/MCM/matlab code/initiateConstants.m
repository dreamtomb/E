function [] = initiateConstants()
% sets general constants from statistical data
% Traffic system: EUROPEAN (right-side driving).

%%%%%%%% GEOMETRY %%%%%%%%%%

% LIMITS:

global INlength; INlength = 100;                                 % maximal number of cars in a queue

% BRANCHES:

global numOfINroads; numOfINroads = 4;                          % number of incoming ROADS
global isInINroad; isInINroad = [1,2,3,4];                      % which road is the lane in?
global laneOfINroad; laneOfINroad = [1,2,3,4];                % first lane in the road (counter-clockwise direction)

global numOfOUTroads; numOfOUTroads = 4;                        % number of outgoing ROADS
global isInOUTroad; isInOUTroad = [1,2,3,4];                    % which road is the lane in?
global laneOfOUTroad; laneOfOUTroad = [1,2,3,4];              % first lane in the road (counter-clockwise direction)

global numOfINS; numOfINS = 4;                                  % number of incoming LANES (not roads!)
global numOfOUTS; numOfOUTS = 4;                                % number of outgoing LANES (not roads!)

global INpos; INpos = [2,8,10,14];    %counter-clockwise from R.Kalantos              % incoming lane positions (increasing order!)
global OUTpos; OUTpos = [1,7,11,15];                            % outgoing lane positions (increasing order!)

global INslot; INslot = zeros(numOfINS,INlength);               % matrix for incoming lane car slots

% CIRCLE

global numOfLanes; numOfLanes = 1;                              % number of lanes in the traffic circle
global numOfSlots; numOfSlots = 20;                             % number of cars that fit into one lane
global circleSlot; circleSlot = zeros(numOfLanes,numOfSlots);   % matrix for traffic circle car slots

% DIRECTIONS

global laneForOUT; laneForOUT = [1,1,1,1];              % which circle-lane leads to which OUT
global laneForIN; laneForIN  = [1,1,1,1];               % which circle-lane is from which IN

% MORE LIMITS:

global maxQueueSize; maxQueueSize = 2;                          % traffic light times
global maxGreenTime; maxGreenTime = 2;                          % in ITERS (usually <60 SEC)
global maxOffTime; maxOffTime = 2;

global maxPriorityIndex; maxPriorityIndex = 2^(numOfINS);       % priority
global maxPresenceIndex; maxPresenceIndex = 2^(numOfINS);       % traffic lights presence

global maxQueueIndex; maxQueueIndex = (maxQueueSize)^(numOfINS);
global maxGreenIndex; maxGreenIndex = (maxGreenTime)^(numOfINS);
global maxOffIndex; maxOffIndex = (maxOffTime)^(numOfINS);

%%%%%%% DISTANCES %%%%%%%%%%

global INspace; INspace = 3;                                    % min of free slots to enter lane 1
global laneShift; laneShift = 1;                                % free space shift for further lanes
global GOALpos; GOALpos = floor(INspace/2);                     % entering position (in free space)

end