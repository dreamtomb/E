function [ trueIn ] = convIN( in )
% converts indices for INS topology after arbitrary shifts

global numOfINS;

trueIn = in;
if trueIn > 0
    while (trueIn > numOfINS)
        trueIn = trueIn - numOfINS;
    end
else
    while (trueIn < 1)
        trueIn = trueIn + numOfINS;
    end
end   

end
