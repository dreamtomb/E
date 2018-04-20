function [] = updateLights()
% updates traffic lights
% turns green light if there are more than queueSize cars waiting, holds it for greenTime, and stays
% inactive (off) for offTime

global numOfINS;
global trafficLight;
global INslot;

for in=1:numOfINS
    if (trafficLight.isPresent(in))
        if (trafficLight.offCount(in) == 0)
            if (trafficLight.greenCount(in) == 0)
                if (sum(INslot(in,:) ~= 0) >= trafficLight.queueSize(in))
                    trafficLight.greenCount(in) = trafficLight.greenTime(in);
                end
            else
                trafficLight.greenCount(in) = trafficLight.greenCount(in) - 1;
                if (trafficLight.greenCount(in) == 0)
                    trafficLight.offCount(in) = trafficLight.offTime(in);
                end
            end
        else
            trafficLight.offCount(in) = trafficLight.offCount(in) - 1;
        end
    end
end

end