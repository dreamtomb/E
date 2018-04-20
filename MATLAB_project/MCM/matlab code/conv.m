function [slot] = conv(s)
% converts indices for circle slot topology after arbitrary shifts

global numOfSlots;

slot = s;
if slot > 0
    while (slot > numOfSlots)
        slot = slot - numOfSlots;
    end
else
    while (slot < 1)
        slot = slot + numOfSlots;
    end
end    

end
