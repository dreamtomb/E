function [cwt] = rotateCircle()
% simulates traffic for 1 step: cars move forward & change lanes
% Returns CWT for all the slots in all the lanes.

%TODO: implement lane change restrictions for lanes that has no outs

global numOfOUTS;
global circleSlot;
global laneForOUT;
global OUTpos;
global numOfINS;
global hasPriority;
global trafficLight;
global INslot;
global laneForIN;
global INpos;
global numOfLanes;
global TL;

% OUTGOING TRAFFIC
for out=1:numOfOUTS
    if (circleSlot(laneForOUT(out),OUTpos(out)) == OUTpos(out))
        circleSlot(laneForOUT(out),OUTpos(out));
    end
end

% TRAFFIC LIGHT AND PRIORITY RESTRICTIONS
cwt = 0;
for in=1:numOfINS
    % a car CAN move forward if:
    % * IN has priority BUT (green signal reverses it OR lane is empty)
    % * IN has NO priority AND signal is not green for IN (<=> not red for a car)
    canMove = 0;
    if (hasPriority(in))
        if ((trafficLight.greenCount(in) ~= 0) || (sum(INslot(in,1:2)) == 0))
            canMove = 1;
        end
    else
        if (trafficLight.greenCount(in) == 0)
            canMove = 1;
        end
    end

    % no cars in front
    if (circleSlot(laneForIN(in),conv(INpos(in)+1)) == 0)
        canMove = 1;
    end

    if (canMove)
        circleSlot(laneForIN(in),conv(INpos(in)+1)) = circleSlot(laneForIN(in),INpos(in));
        circleSlot(laneForIN(in),INpos(in)) = 0;
    else
        cwt = cwt + 1;                                      % car was not moved => cwt++
    end
end

% MOVING THE REST OF THE CARS IN THE CIRCLE

for in=1:numOfINS                                           % process from the front of every INS
    for lane=1:numOfLanes                                   % for all lanes
        pos = conv(INpos(in) - 2);                          % from not processed slot
        adjIn = in - 1;
        while ( pos ~= INpos( mod(adjIn-1,numOfINS) + 1 ) ) % till another INS
            if (circleSlot(lane,conv(pos+1)) == 0 && ...    % if slot in the front is free
                circleSlot(lane,pos) ~= 0)                  % and there is a car to go
                circleSlot(lane,conv(pos+1)) = circleSlot(lane,pos);    % move there
                circleSlot(lane,pos) = 0;
            else
                cwt = cwt + 1;                              % car was not moved => cwt++
            end
            pos = conv(pos - 1);
        end
    end
end

end