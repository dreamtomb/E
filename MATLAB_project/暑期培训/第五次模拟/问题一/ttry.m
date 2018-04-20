%% 找到24个异常临界值.
close
clear
clc
load lofdata.mat
tlof1hn=sort(loffirsthighnum);
lof1hn=tlof1hn(end-round(length(loffirsthighnum)/8));
tlof1ln=sort(loffirstlownum);
lof1ln=tlof1ln(end-round(length(loffirstlownum)/8));
tlof2hn=sort(lofsecondhighnum);
lof2hn=tlof2hn(end-round(length(lofsecondhighnum)/8));
tlof2ln=sort(lofsecondlownum);
lof2ln=tlof2ln(end-round(length(lofsecondlownum)/8));
tlof3hn=sort(lofthirdhighnum);
lof3hn=tlof3hn(end-round(length(lofthirdhighnum)/8));
tlof3ln=sort(lofthirdlownum);
lof3ln=tlof3ln(end-round(length(lofthirdlownum)/8));
tlof4hn=sort(loffourhighnum);
lof4hn=tlof4hn(end-round(length(loffourhighnum)/8));
tlof4ln=sort(loffourlownum);
lof4ln=tlof4ln(end-round(length(loffourlownum)/8));
%% 对第一类每一天的三个指标进行lof的检验，找到异常点
%         478-1230        499-1223       474-1236        515-1191
sum=0;
for i=1:length(line1)
    lof1=lof(478:1230,line1{i}(478:1230),100);
    s1=length(find(lof1>lof1hn));
    if s1~=0
        sum=sum+s1;
    end
    lof2=lof([1:477,1231:length(line1{i})],line1{i}([1:477,1231:length(line1{i})]),100);
    s2=length(find(lof2>lof1ln));
    if s2~=0
        sum=sum+s2;
    end
end

for i=1:length(line2)
    lof1=lof(499:1223,line2{i}(499:1223),100);
    s1=length(find(lof1>lof2hn));
    if s1~=0
        sum=sum+s1;
    end
    lof2=lof([1:498,1224:length(line2{i})],line2{i}([1:498,1224:length(line2{i})]),100);
    s2=length(find(lof2>lof2ln));
    if s2~=0
        sum=sum+s2;
    end
end

for i=1:length(line3)
    lof1=lof(474:1236,line3{i}(474:1236),100);
    s1=length(find(lof1>lof3hn));
    if s1~=0
        sum=sum+s1;
    end
    lof2=lof([1:473,1237:length(line3{i})],line3{i}([1:473,1237:length(line3{i})]),100);
    s2=length(find(lof2>lof3ln));
    if s2~=0
        sum=sum+s2;
    end
end

for i=1:length(line4)
    lof1=lof(515:1191,line4{i}(515:1191),100);
    s1=length(find(lof1>lof4hn));
    if s1~=0
        sum=sum+s1;
    end
    lof2=lof([1:514,1192:length(line4{i})],line4{i}([1:514,1192:length(line4{i})]),100);
    s2=length(find(lof2>lof4ln));
    if s2~=0
        sum=sum+s2;
    end
end
errorrate=sum/size(data,1);
disp(['错误率为',num2str(errorrate*100),'%']);

