function [cwt] = getCWT()
% returns Cummulative Waiting Time, i.e. sum of all waiting times
% computes ONLY for the INS, CWT for circle is computed in rotateCircle.m

global numOfINS;
global INslot;

cwt=0;
for in=1:numOfINS
    cwt = cwt + sum(INslot(in,:) ~= 0);
end

end