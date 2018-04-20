function [] = putToLane(in,out,laneFlow)
% puts laneFlow cars heading to out to lane in

global INslot;
global INlength;

firstSlot = find(INslot(in,:) == 0, 1, 'first');
lastSlot = min(firstSlot + laneFlow - 1, INlength);
INslot(in, firstSlot:lastSlot) = out;

end