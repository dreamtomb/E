close 
clear 
clc
load lofdata.mat
figure
plot(1:1440,[lofthirdlownum(1:498)',lofthirdhighnum',lofthirdlownum(499:length(lofthirdlownum))']);
figure
plot(1:1440,[lofthirdlowp(1:498)',lofthirdhighp',lofthirdlowp(499:length(lofthirdlowp))']);
figure
plot(1:1440,[lofthirdlowtime(1:498)',lofthirdhightime',lofthirdlowtime(499:length(lofthirdlowtime))']);
index=find(data(:,1)==123);
first=data(index,:);
high=first(499:1223,:);
figure
plot(499:1223,high(:,3)');
hold on
plot(499+[84 167 446 565 280 583],high([84 167 446 565 280 583],3),'r*');
tlof3hn=sort(lofthirdhighnum);
lof3hn=tlof3hn(end-round(length(lofthirdhighnum)/50));
nindex=find(lofthirdhighnum>lof3hn);
plot(499+nindex,high(nindex,3)','r*');
figure
plot(499:1223,high(:,4)');
hold on;
plot(499+[154, 235,657,714],high([154, 235,657,714],4)','r*');
tlof3hp=sort(lofthirdhighp);
lof3hp=tlof3hp(end-round(length(lofthirdhighp)/50));
pindex=find(lofthirdhighp>lof3hp);
plot(499+pindex,high(pindex,4)','r*');
figure
plot(499:1223,high(:,5)');
hold on
plot(499+[23 200 202 483 506],high([23 200 202 483 506],5)','r*');
tlof3ht=sort(lofthirdhightime);
lof3ht=tlof3ht(end-round(length(lofthirdhightime)/50));
tindex=find(lofthirdhightime>lof3ht);
plot(499+tindex,high(tindex,5)','r*');


