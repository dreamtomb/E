function XY=dealXY(XY)
for i=1:size(XY,1)
    for j=1:4
        XY(i,j*23-22:j*23)=XY(i,j*23-22:j*23)/sum(XY(i,j*23-22:j*23));
    end
end










