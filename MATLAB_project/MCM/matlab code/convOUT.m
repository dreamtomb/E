function [ trueOut ] = convOUT( out )
% converts indices for OUTS topology after arbitrary shifts

global numOfOUTS;

trueOut = out;
if trueOut > 0
    while (trueOut > numOfOUTS)
        trueOut = trueOut - numOfOUTS;
    end
else
    while (trueOut < 1)
        trueOut = trueOut + numOfOUTS;
    end
end   

end