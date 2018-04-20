load data.mat
place={'区域1','区域2','区域3','区域4','区域5','区域6','区域7','区域8','区域9','区域10'};
%% 第一阶段
txt1=cell(90,3);
for i=1:10
    txt1(i*9-8:i*9,1)={[place{i}];[place{i}];[place{i}];[place{i}];...
        [place{i}];[place{i}];[place{i}];[place{i}];[place{i}]};
    if i==1
        txt1(i*9-8:i*9,2)={[place{2}];[place{3}];[place{4}];[place{5}];...
        [place{6}];[place{7}];[place{8}];[place{9}];[place{10}]};
    elseif i==10
        txt1(i*9-8:i*9,2)={[place{1}];[place{2}];[place{3}];[place{4}];...
        [place{5}];[place{6}];[place{7}];[place{8}];[place{9}]};
    else
        ttemp(1,1)={place{1}};
        for j=1:i-1
            ttemp(j,1)={place{j}};
        end
        for j=i:9
            ttemp(j,1)={place{j+1}};
        end
        txt1(i*9-8:i*9,2)=ttemp;
    end
    if i==1
        txt1(i*9-8:i*9,3)={[pp1(i,2)];[pp1(i,3)];[pp1(i,4)];[pp1(i,5)];...
            [pp1(i,6)];[pp1(i,7)];[pp1(i,8)];[pp1(i,9)];[pp1(i,10)]};
    elseif i==10
        txt1(i*9-8:i*9,3)={[pp1(i,1)];[pp1(i,2)];[pp1(i,3)];[pp1(i,4)];[pp1(i,5)];...
            [pp1(i,6)];[pp1(i,7)];[pp1(i,8)];[pp1(i,9)]};
    else
        ptemp(1,1)={pp1(i,1)};
        for j=1:i-1
            ptemp(j,1)={pp1(i,j)};
        end
        for j=i:9
            ptemp(j,1)={pp1(i,j+1)};
        end
        txt1(i*9-8:i*9,3)=ptemp;
    end
end
%% 第二阶段
txt2=cell(90,3);
for i=1:10
    txt2(i*9-8:i*9,1)={[place{i}];[place{i}];[place{i}];[place{i}];...
        [place{i}];[place{i}];[place{i}];[place{i}];[place{i}]};
    if i==1
        txt2(i*9-8:i*9,2)={[place{2}];[place{3}];[place{4}];[place{5}];...
        [place{6}];[place{7}];[place{8}];[place{9}];[place{10}]};
    elseif i==10
        txt2(i*9-8:i*9,2)={[place{1}];[place{2}];[place{3}];[place{4}];...
        [place{5}];[place{6}];[place{7}];[place{8}];[place{9}]};
    else
        ttemp(1,1)={place{1}};
        for j=1:i-1
            ttemp(j,1)={place{j}};
        end
        for j=i:9
            ttemp(j,1)={place{j+1}};
        end
        txt2(i*9-8:i*9,2)=ttemp;
    end
    if i==1
        txt2(i*9-8:i*9,3)={[pp2(i,2)];[pp2(i,3)];[pp2(i,4)];[pp2(i,5)];...
            [pp2(i,6)];[pp2(i,7)];[pp2(i,8)];[pp2(i,9)];[pp2(i,10)]};
    elseif i==10
        txt2(i*9-8:i*9,3)={[pp2(i,1)];[pp2(i,2)];[pp2(i,3)];[pp2(i,4)];[pp2(i,5)];...
            [pp2(i,6)];[pp2(i,7)];[pp2(i,8)];[pp2(i,9)]};
    else
        ptemp(1,1)={pp2(i,1)};
        for j=1:i-1
            ptemp(j,1)={pp2(i,j)};
        end
        for j=i:9
            ptemp(j,1)={pp2(i,j+1)};
        end
        txt2(i*9-8:i*9,3)=ptemp;
    end
end
%% 第三阶段
txt3=cell(90,3);
for i=1:10
    txt3(i*9-8:i*9,1)={[place{i}];[place{i}];[place{i}];[place{i}];...
        [place{i}];[place{i}];[place{i}];[place{i}];[place{i}]};
    if i==1
        txt3(i*9-8:i*9,2)={[place{2}];[place{3}];[place{4}];[place{5}];...
        [place{6}];[place{7}];[place{8}];[place{9}];[place{10}]};
    elseif i==10
        txt3(i*9-8:i*9,2)={[place{1}];[place{2}];[place{3}];[place{4}];...
        [place{5}];[place{6}];[place{7}];[place{8}];[place{9}]};
    else
        ttemp(1,1)={place{1}};
        for j=1:i-1
            ttemp(j,1)={place{j}};
        end
        for j=i:9
            ttemp(j,1)={place{j+1}};
        end
        txt3(i*9-8:i*9,2)=ttemp;
    end
    if i==1
        txt3(i*9-8:i*9,3)={[pp3(i,2)];[pp3(i,3)];[pp3(i,4)];[pp3(i,5)];...
            [pp3(i,6)];[pp3(i,7)];[pp3(i,8)];[pp3(i,9)];[pp3(i,10)]};
    elseif i==10
        txt3(i*9-8:i*9,3)={[pp3(i,1)];[pp3(i,2)];[pp3(i,3)];[pp3(i,4)];[pp3(i,5)];...
            [pp3(i,6)];[pp3(i,7)];[pp3(i,8)];[pp3(i,9)]};
    else
        ptemp(1,1)={pp3(i,1)};
        for j=1:i-1
            ptemp(j,1)={pp3(i,j)};
        end
        for j=i:9
            ptemp(j,1)={pp3(i,j+1)};
        end
        txt3(i*9-8:i*9,3)=ptemp;
    end
end
xlswrite('test1.xlsx',txt1,1,'A1');
xlswrite('test2.xlsx',txt2,1,'A1');
xlswrite('test3.xlsx',txt3,1,'A1');