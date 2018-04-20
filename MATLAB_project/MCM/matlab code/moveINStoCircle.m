function [] = moveINStoCircle()
% moves cars from lanes to traffic circle w.r.t. current rules
% No additional details.

global numOfINS;
global INslot;
global trafficLight;
global hasPriority;
global laneForIN;
global INpos;
global INspace;
global INshift;
global numOfSlots;
global circleSlot;
global GOALpos;

for in=1:numOfINS                                   % for every lane
    if (INslot(in,1) ~= 0)                          % check if there is a car
        canMove = 1;                                % initial state

        % directions with no green signal and without priority
        if (trafficLight.greenCount(in) == 0 && ~hasPriority(in))
            for i=1:laneForIN(in)                   % check that crossed lanes
                for pos=INpos(in):-1:(INpos - INspace - INshift*(i-1))
                    if (circleSlot(i,conv(pos,numOfSlots)) ~= 0)
                        canMove = 0;
                    end
                end
            end
            if (canMove)                            % if a car can move => do it!
                circleSlot(laneForIN(in),INpos(in)-GOALpos+1) = INslot(in,1);
                INslot(in,1) = 0;
            end

        % directions for green signal or priority - move always if there is free space
        elseif ((trafficLight.greenCount(in) ~= 0 || ...
                hasPriority(in)) && circleSlot(laneForIN(in),INpos(in)) == 0)
            circleSlot(laneForIN(in),INpos(in)) = INslot(in,1);
            INslot(in,1) = 0;
        end
    end
end

end