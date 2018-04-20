clc,clear,close all
x=[91,105,110,115,120,124,128];
h=[0,1.0869,1.9710,2.7555,3.3986,4.9073,8.3409];
j=1;
for i=91:130
y(1,j)=interp1(x,h,i,'cubic');
j=j+1;
end
x1=91:130;
plot(x,h,'r')
hold on
plot(x1,y,'o')
