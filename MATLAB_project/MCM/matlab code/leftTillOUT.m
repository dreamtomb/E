function [ left ] = leftTillOUT(pos,out)
% return number of OUT left till destination OUT

global OUTpos;

DESTpos = OUTpos(out);

if (pos > DESTpos)
    left = sum(((OUTpos >= pos) + (OUTpos <= DESTpos)) ~= 0);
else
    left = sum((OUTpos >= pos) .* (OUTpos <= DESTpos));
end

end