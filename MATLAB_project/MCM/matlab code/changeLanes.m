function [] = changeLanes()
% cars in the circle change lanes if needed
% Simple AI that forces to change lanes to the required ones
% if the destination OUT is close enough.

global numOfLanes;
global numOfSlots;
global circleSlot;

for lane=1:numOfLanes                                               % lane to the right has priority
    for pos=1:numOfSlots                                            % for all slots
        out = circleSlot(lane,pos);
        if (out ~= 0)                                               % if a car is presen

            if (lane > leftTillOUT(pos,out))                        % and it is NOT FAR till OUT
                if (circleSlot(lane-1,pos) == 0)                    % try to change to the RIGHT
                    circleSlot(lane-1,pos) = circleSlot(lane,pos);
                    circleSlot(lane,pos) = 0;
                end

            elseif (lane < leftTillOUT(pos,out))                    % else if it is FAR till OUT
                if (circleSlot(lane+dir,pos) == 0)                  % try to change to the LEFT
                    circleSlot(lane+dir,pos) = circleSlot(lane,pos);
                    circleSlot(lane,pos) = 0;
                end
            end

        end
    end
end

end