function [] = moveINS()
% moves car queue forward in lane

global numOfINS;
global INslot;
global INlength;

for in=1:numOfINS;
    pos=2;
    while (INslot(in,pos) ~= 0 && ...
           INslot(in,pos-1) == 0 && ...
           pos <= INlength)
        INslot(in,pos-1) = INslot(in,pos);
        INslot(in,pos) = 0;
        pos = pos + 1;
    end
end

end