%% 1、生命游戏GUI
%Conway 的生命游戏机。
%规则是：
%对周围的 8 个近邻的元胞状态求和
% 如果总和为 2 的话，则下一时刻的状态不改变
%如果总和为 3 ，则下一时刻的状态为 1
% 否则状态= 0
clc
clear all
%构造三个按钮
plotbutton=uicontrol('style','pushbutton',...
    'string','Run', ...
    'fontsize',12, ...
    'position',[100,400,50,20], ...
    'callback', 'run=1;');
erasebutton=uicontrol('style','pushbutton',...
    'string','Stop', ...
    'fontsize',12, ...
    'position',[200,400,50,20], ...
    'callback','freeze=1;');
quitbutton=uicontrol('style','pushbutton',...
    'string','Quit', ...
    'fontsize',12, ...
    'position',[300,400,50,20], ...
    'callback','stop=1;close;');
number = uicontrol('style','text', ...
    'string','1', ...
    'fontsize',12, ...
    'position',[20,400,50,20]);
%元胞个数
n=128;
z = zeros(n,n);
cells = z;
sum = z;
%初始化一部分元胞有生命
cells(n/2,.25*n:.75*n) = 1;
cells(.25*n:.75*n,n/2) = 1;
cells = (rand(n,n))<.5 ;
%创建图片
%cat(3,cells,z,z)的意义是将三个矩阵链接起来
%image(cat(3,cells,z,z))中首个参数是3，
%它意味着后面的三个矩阵分别代表了RGB值
%单一数值中0是黑色，255是白色。
%RGB中【255,0,0】是红色，以此类推。
%例如：a=[255 255;255 255],b=zeros(2)；
%image(cat(3,a,b,b))是红色的
%image(cat(3,b,a,b))是绿色的
%image(cat(3,b,b,a))是蓝色的
%image(cat(3,a,a,b))是黄色的
imh = image(cat(3,cells,z,z));
set(imh, 'erasemode', 'none')
axis equal
axis tight
x = 2:n-1;
y = 2:n-1;
stop= 0; 
run = 0; 
freeze = 0; 
while (stop==0)
    if (run==1)
        %周围活着的生命总数
        sum(x,y) = cells(x,y-1) + cells(x,y+1) + ...
            cells(x-1, y) + cells(x+1,y) + ...
            cells(x-1,y-1) + cells(x-1,y+1) + ...
            cells(3:n,y-1) + cells(x+1,y+1);
        %元胞规则
        cells = (sum==3) | (sum==2 & cells);
        %更新图片
        set(imh, 'cdata', cat(3,cells,z,z) )
        %更新迭代了几步
        stepnumber = 1 + str2num(get(number,'string'));
        set(number,'string',num2str(stepnumber))
    end
    
    if (freeze==1)
        run = 0;
        freeze = 0;
    end
    pause(0.02)
end

%% 2、表面张力
%规则是：
% 对周围的 8 近邻的元胞以及自身的状态求和
% 如果总和< 4 或= 5 ，下一时刻的状态= 0
% 否则状态= 1
clc
clear all
%构造三个按钮
plotbutton=uicontrol('style','pushbutton',...
    'string','Run', ...
    'fontsize',12, ...
    'position',[100,400,50,20], ...
    'callback', 'run=1;');
erasebutton=uicontrol('style','pushbutton',...
    'string','Stop', ...
    'fontsize',12, ...
    'position',[200,400,50,20], ...
    'callback','freeze=1;');
quitbutton=uicontrol('style','pushbutton',...
    'string','Quit', ...
    'fontsize',12, ...
    'position',[300,400,50,20], ...
    'callback','stop=1;close;');
number = uicontrol('style','text', ...
    'string','1', ...
    'fontsize',12, ...
    'position',[20,400,50,20]);
n=128;
z = zeros(n,n);
cells = z;
sum = z;
%初始化一部分元胞有生命
% cells(n/2,.25*n:.75*n) = 1;
% cells(.25*n:.75*n,n/2) = 1;
cells = (rand(n,n))<.5 ;
%创建图片
imh=image(cat(3,cells,z,z));
set(imh,'erasemode','none');
axis equal
axis tight
x = 2:n-1;
y = 2:n-1;
stop= 0; 
run = 0;
freeze=0;
%规则实现
while stop==0
    if run==1
        sum(x,y)=cells(x,y)+cells(x-1,y)+cells(x-1,y-1)+...
            cells(x-1,y+1)+cells(x,y-1)+cells(x,y+1)+...
            cells(x+1,y+1)+cells(x+1,y)+cells(x+1,y-1);
        cells=~((sum<4)|(sum==5));
        set(imh,'cdata',cat(3,cells,z,z));
        stepnumber = 1 + str2num(get(number,'string'));
        set(number,'string',num2str(stepnumber))
    end
    if freeze==1
        run = 0;
        freeze = 0;
    end
    pause(0.05);
end

%% 3 、渗流集群
%规则：
%对周围相邻的 8 邻居求和（元胞只有两种状态，0 或 1 ）。元胞也有一个单
%独的状态参量（所谓'记录' ）记录它们之前是否有非零状态的邻居。
% 在 0 与 1 之间产生一个随机数 r 。
% 如果总和> 0 （至少一个邻居）并且 r >阈值，或者元胞从未有过一个邻居，
%则元胞= 1 。
% 如果总和> 0 则设置"记录"的标志，记录这些元胞有一个非零的邻居。
% Percolation Cluster
clf
clear all
%阈值
threshold = .63;
%设置图片在figure中的左下角的位置和长宽以及颜色
ax = axes('units','pixels','position',[1 1 560 420],'color','k');
%设置图片中的起始文字
text('units', 'pixels', 'position', [100,280,0],...
'string','BioNB','color','w','fontname','helvetica','fontsize',100)
text('units', 'pixels', 'position', [180,150,0],...
'string','441','color','w','fontname','helvetica','fontsize',100)
% 获取整个窗口内容的图像
initial = getframe(gca);
[a,b,c]=size(initial.cdata);
z=zeros(a,b);
cells = double(initial.cdata(:,:,1)==255);
visit = z ;
sum = z;
%创建图片
imh=image(cat(3,cells,z,z));
set(imh, 'erasemode', 'none')
%游戏规则
for i=1:100
sum(2:a-1,2:b-1) = cells(2:a-1,1:b-2) + cells(2:a-1,3:b) + ...
cells(1:a-2, 2:b-1) + cells(3:a,2:b-1) + ...
cells(1:a-2,1:b-2) + cells(1:a-2,3:b) + ...
cells(3:a,1:b-2) + cells(3:a,3:b);
pick = rand(a,b);
cells = cells | ((sum>=1) & (pick>=threshold) & (visit==0)) ;
visit = (sum>=1) ;
set(imh, 'cdata', cat(3,cells,cells,z) )
drawnow
end

%% 4 .激发介质（ BZ reaction or heart）
% 规则：
% 元胞有 10 个不同的状态。状态 0 是体眠。1-5 为活跃状态，、6-9 为是极活跃
% 状态。
% 计算每一个处于活跃的状态的元胞近邻的 8 个元胞。
% 如果和大于或等于 3 （至少有三个活跃的邻居） ，则下一时刻该元胞= 1 。
% 不需要其它输入，1 至 9 种状态依次出现。如果该时刻状态= 1 那么下一时刻
% 状态= 2 。如果该时刻状态= 2 ，然后下一时刻状态= 3 ，对于其它的状态
% 依次类推，直到第 9 种状态。如果状态= 9 ，然后下一状态= 0 并且元胞回
% 到休息状态。
%CA driver
%excitable media
clf; clear all
n=128;
z=zeros(n,n);
cells=z;
cells = (rand(n,n))<.1 ;
%cells(n/2,n*.25:n*.75) = 1;
%cells(n*.25:n*.75,n/2) = 1;
sum=z;
imh = image(cat(3,cells,z,z));
set(imh, 'erasemode', 'none')
axis equal
axis tight
x = [2:n-1]; y = [2:n-1];
t = 6; % center value=6; 7 makes fast pattern; 5 analiating waves
t1 = 3; % center value=3
for i=1:1200
sum(x,y) = ((cells(x,y-1)>0)&(cells(x,y-1)<t)) + ((cells(x,y+1)>0)&(cells(x,y+1)<t)) + ...
((cells(x-1, y)>0)&(cells(x-1, y)<t)) + ((cells(x+1,y)>0)&(cells(x+1,y)<t)) + ...
((cells(x-1,y-1)>0)&(cells(x-1,y-1)<t)) + ((cells(x-1,y+1)>0)&(cells(x-1,y+1)<t)) + ...
((cells(x+1,y-1)>0)&(cells(x+1,y-1)<t)) + ((cells(x+1,y+1)>0)&(cells(x+1,y+1)<t));
cells = ((cells==0) & (sum>=t1)) + 2*(cells==1) + 3*(cells==2) + ...
4*(cells==3) + 5*(cells==4) + 6*(cells==5) + 7*(cells==6) +...
8*(cells==7) + 9*(cells==8) + 0*(cells==9);
set(imh, 'cdata', cat(3,z,cells/10,z) )
drawnow
end

%% 5 .森林火灾
% 规则：
%  元胞有 3 个不同的状态。状态为 0 是空位，状态= 1 是燃烧着的树木，状态
% = 2 是树木。
%  如果 4 个邻居中有一个或一个以上的是燃烧着的并且自身是树木（状态为
% 2 ） ，那么该元胞下一时刻的状态是燃烧（状态为 1 ） 。
%  森林元胞（状态为 2 ）以一个低概率（例如 0.000005 ）开始烧（因为闪电）。
%  一个燃烧着的元胞（状态为 1 ）在下一时时刻变成空位的（状态为 0 ） 。
%  空元胞以一个低概率（例如 0.01 ）变为森林以模拟生长。
%  出于矩阵边界连接的考虑，如果左边界开始着火，火势将向右蔓延，右边界
% 同理。同样适用于顶部和底部。
clear
clc
clear all
%地图大小
n=10;
%被闪电击中的概率
Plightning =0.000005;
%空地生长出树的概率
Pgrowth = 0.01;
z=zeros(n,n);
o=ones(n,n);
veg=z;
sum=z;
%生成三维的矩阵，并构造相应的图像
imh = image(cat(3,z,veg*0.02,z));
%设置图片的擦除模式为不擦除
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:3000
%求上下左右四个邻居和
    sum = (veg(1:n,[n 1:n-1])==1) + (veg(1:n,[2:n 1])==1) + ...
        (veg([n 1:n-1], 1:n)==1) + (veg([2:n 1],1:n)==1) ;
%根据规则更新森林矩阵: 树= 树- 着火的树+ 新生的树
    veg = ...
        2*(veg==2) - ((veg==2) & (sum>0 | (rand(n,n)<Plightning))) + ...
        2*((veg==0) & rand(n,n)<Pgrowth) ;    
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),z) )
    pause(0.02)
end

%% 6 .气体动力学
% 规则：
%  此规则叫作 HPP-气体规则。
%  每个元胞有 2 种状态。状态= 0 是空的，状态= 1 代表粒子。
%  在任何一个时间步长，假设粒子是刚刚进入 2x2 的网格块。它将通过其网格
% 块的中心到达对角的网格中，所以在任何时间步长，每一个元胞与该元胞对
% 角对元胞交换的内容。如下所示，左边显示出来的元胞结构经过一个时间步
% 长变为右边的结构。以下是六种不同的情况，所有所有的元胞都遵循相同的
% 转动规则。
% 0 0      0 0                    1 0      0 0
% 0 0 ->  0 0                    0 0  -> 0 1
% 
% 1 0     1 0                     1 0     0 1           
% 0 1 -> 0 1                     1 0 -> 0 1
% 
% 1 1     0 1                     1 1     1 1
% 1 0 -> 1 1                     1 1 -> 1 1
% 为了实现粒子碰撞过程（保证动量和能量守恒），对于两个处于对角线上的
% 粒子，他们相互撞击后偏转 90 度。在一个时间步长里使其从一个对角转成
% 另一个对角。你可以逆时针旋转这四个元胞来实现这个过程。则第三规则可
% 以表示为：
% 1 0      0 1
% 0 1 -> 1 0
% ? 粒子撞击墙壁时，简单地使其离开且状态不变。这就引起反射现象。
%CA driver
%HPP-gas
clear all
clf
nx=52; %must be divisible by 4
ny=100;
z=zeros(nx,ny);
o=ones(nx,ny);
sand = z ;
sandNew = z;
gnd = z ;
diag1 = z;
diag2 = z;
and12 = z;
or12 = z;
sums = z;
orsum = z;
gnd(1:nx,ny-3)=1 ; % right ground line
gnd(1:nx,3)=1 ; % left ground line
gnd(nx/4:nx/2-2,ny/2)=1; %the hole line
gnd(nx/2+2:nx,ny/2)=1; %the hole line
gnd(nx/4, 1:ny) = 1; %top line
gnd(3*nx/4, 1:ny) = 1 ;%bottom line
%fill the left side
r = rand(nx,ny);
sand(nx/4+1:3*nx/4-1, 4:ny/2-1) = r(nx/4+1:3*nx/4-1, 4:ny/2-1)<0.3;
%sand(nx/4+1:3*nx/4-1, ny*.75:ny-4) = r(nx/4+1:3*nx/4-1, ny*.75:ny-4)<0.75;
%sand(nx/2,ny/2) = 1;
%sand(nx/2+1,ny/2+1) = 1;
imh = image(cat(3,z,sand,gnd));
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:1000
p=mod(i,2); %margolis neighborhood
%upper left cell update
xind = [1+p:2:nx-2+p];
yind = [1+p:2:ny-2+p];
%See if exactly one diagonal is ones
%only (at most) one of the following can be true!
diag1(xind,yind) = (sand(xind,yind)==1) & (sand(xind+1,yind+1)==1) & ...
(sand(xind+1,yind)==0) & (sand(xind,yind+1)==0);
diag2(xind,yind) = (sand(xind+1,yind)==1) & (sand(xind,yind+1)==1) & ...
(sand(xind,yind)==0) & (sand(xind+1,yind+1)==0);
%The diagonals both not occupied by two particles
and12(xind,yind) = (diag1(xind,yind)==0) & (diag2(xind,yind)==0);
%One diagonal is occupied by two particles
or12(xind,yind) = diag1(xind,yind) | diag2(xind,yind);
%for every gas particle see if it near the boundary
sums(xind,yind) = gnd(xind,yind) | gnd(xind+1,yind) | ...
gnd(xind,yind+1) | gnd(xind+1,yind+1) ;
% cell layout:
% x,y x+1,y
% x,y+1 x+1,y+1
%If (no walls) and (diagonals are both not occupied)
%then there is no collision, so move opposite cell to current cell
%If (no walls) and (only one diagonal is occupied)
%then there is a collision so move ccw cell to the current cell
%If (a wall)
%then don't change the cell (causes a reflection)
sandNew(xind,yind) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind+1)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind,yind+1)) + ...
(sums(xind,yind) & sand(xind,yind));
sandNew(xind+1,yind) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind,yind+1)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind,yind))+ ...
(sums(xind,yind) & sand(xind+1,yind));
 sandNew(xind,yind+1) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind+1))+ ...
(sums(xind,yind) & sand(xind,yind+1));
sandNew(xind+1,yind+1) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind,yind)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind))+ ...
(sums(xind,yind) & sand(xind+1,yind+1));
sand = sandNew;
set(imh, 'cdata', cat(3,z,sand,gnd) )
drawnow
end

%% 8.扩散限制聚集
% 这个系统是模拟粘性颗粒的聚集，形成分形结构。质点以一个类似于例 6 中的
% HPP-气体规则发生运动 。不同的是粒子在一些高密度（但看不见）的液体周围
% 被假定是弹跳的。效果是每一个粒子在每个时间步长在随机的方向上运动。换言
% 之，每一个时间步长是一个碰撞的过程。这个仿真矩阵的中心确定了在一个固定
% 生长颗粒。任何弥散粒子触及它就会被它粘住，并成为一个不能移动的，有粘性
% 颗粒。
% 规则：
% ? 使用 Margolus 型邻居。在每一个时间步，等概率地顺时针或逆时针旋转 4
% 个元胞。旋转使速度随机化。
% ? 在移动后，如果八个最近的邻居有一个或一个以上元胞是固定的粘性颗粒，
% 则下时刻该元胞将被冻结，并且使之有粘性。
%diffusion + dla
clear all
clf
nx=200; %must be divisible by 4
ny=200;
z=zeros(nx,ny);
o=ones(nx,ny);
sand = z ;
sandNew = z;
sum = z;
gnd = z;
gnd(nx/2,ny/2) = 1 ;
sand = rand(nx,ny)<.1;
imh = image(cat(3,z,sand,gnd));
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:10000
p=mod(i,2); %margolis neighborhood
 %upper left cell update
xind = [1+p:2:nx-2+p];
yind = [1+p:2:ny-2+p];
%random velocity choice
vary = rand(nx,ny)<.5 ;
vary1 = 1-vary;
%diffusion rule -- margolus neighborhood
%rotate the 4 cells to randomize velocity
sandNew(xind,yind) = ...
vary(xind,yind).*sand(xind+1,yind) + ... %cw
vary1(xind,yind).*sand(xind,yind+1) ; %ccw
sandNew(xind+1,yind) = ...
vary(xind,yind).*sand(xind+1,yind+1) + ...
vary1(xind,yind).*sand(xind,yind) ;
sandNew(xind,yind+1) = ...
vary(xind,yind).*sand(xind,yind) + ...
vary1(xind,yind).*sand(xind+1,yind+1) ;
sandNew(xind+1,yind+1) = ...
vary(xind,yind).*sand(xind,yind+1) + ...
vary1(xind,yind).*sand(xind+1,yind) ;
sand = sandNew;
%for every sand grain see if it near the fixed, sticky cluster
sum(2:nx-1,2:ny-1) = gnd(2:nx-1,1:ny-2) + gnd(2:nx-1,3:ny) + ...
gnd(1:nx-2, 2:ny-1) + gnd(3:nx,2:ny-1) + ...
gnd(1:nx-2,1:ny-2) + gnd(1:nx-2,3:ny) + ...
gnd(3:nx,1:ny-2) + gnd(3:nx,3:ny);
%add to the cluster
gnd = ((sum>0) & (sand==1)) | gnd ;
%and eliminate the moving particle
sand(find(gnd==1)) = 0;
set(imh, 'cdata', cat(3,gnd,gnd,(sand==1)) );
drawnow
end

%% 9 .砂堆规则
% 一堆沙子的横截面，可以使用 Margolus 型邻居仿真，但运动规则不同。
% 规则：
% ? 元胞有 2 个状态。状态= 0 是空的，状态= 1 代表沙子。
% ? 在任何时间步长，一个粒子，可以在 2x2 块中向着底部运动。可能运动如下
% 所示。墙壁和底部将阻止粒子继续运动。
% ? 为了让该运动略有随机性，我亦补充说一项规则，有时处于下落状态的两个
% 元胞还旋转，直到所有的动作都完成。
% 0 0 -> 0 0                                  1 0 -> 0 0
% 0 0     0 0                                  0 0     1 0
% 
% 0 1 -> 0 0                                  1 0 -> 0 0
% 0 0     0 1                                  1 0     1 1
% 
% 0 1 -> 0 0                                  1 0 -> 0 0
% 0 1     1 1                                  0 1     1 1
% 
% 0 1 -> 0 0                                  1 1 -> 1 0
% 1 0     1 1                                  1 0     1 1
% 
% 1 1 -> 0 1
% 0 1     1 1
%sand pile
clear all
clf
nx=52; %must be divisible by 4
ny=100;
Pbridge = .05;
z=zeros(nx,ny);
o=ones(nx,ny);
sand = z ;
sandNew = z;
gnd = z ;
gnd(1:nx,ny-3)=1 ; % the ground line
gnd(nx/4:nx/2+4,ny-15)=1; %the hole line
gnd(nx/2+6:nx,ny-15)=1; %the hole line
gnd(nx/4, ny-15:ny) = 1; %side line
gnd(3*nx/4, 1:ny) = 1 ;
imh = image(cat(3,z',sand',gnd'));
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:1000
p=mod(i,2); %margolis neighborhood
sand(nx/2,ny/2) = 1; %add a grain at the top
%upper left cell update
xind = [1+p:2:nx-2+p];
yind = [1+p:2:ny-2+p];
vary = rand(nx,ny)<.95 ;
vary1 = 1-vary;
sandNew(xind,yind) = ...
gnd(xind,yind).*sand(xind,yind) + ...
(1-gnd(xind,yind)).*sand(xind,yind).*sand(xind,yind+1) .* ...
(sand(xind+1,yind+1)+(1-sand(xind+1,yind+1)).*sand(xind+1,yind));
 sandNew(xind+1,yind) = ...
gnd(xind+1,yind).*sand(xind+1,yind) + ...
(1-gnd(xind+1,yind)).*sand(xind+1,yind).*sand(xind+1,yind+1) .* ...
(sand(xind,yind+1)+(1-sand(xind,yind+1)).*sand(xind,yind));
sandNew(xind,yind+1) = ...
sand(xind,yind+1) + ...
(1-sand(xind,yind+1)) .* ...
( sand(xind,yind).*(1-gnd(xind,yind)) + ...
(1-sand(xind,yind)).*sand(xind+1,yind).*(1-gnd(xind+1,yind)).*sand(xind+1,yind+1));
sandNew(xind+1,yind+1) = ...
sand(xind+1,yind+1) + ...
(1-sand(xind+1,yind+1)) .* ...
( sand(xind+1,yind).*(1-gnd(xind+1,yind)) + ...
(1-sand(xind+1,yind)).*sand(xind,yind).*(1-gnd(xind,yind)).*sand(xind,yind+1));
%scramble the sites to make it look better
temp1 = sandNew(xind,yind+1).*vary(xind,yind+1) + ...
sandNew(xind+1,yind+1).*vary1(xind,yind+1);
temp2 = sandNew(xind+1,yind+1).*vary(xind,yind+1) + ...
sandNew(xind,yind+1).*vary1(xind,yind+1);
sandNew(xind,yind+1) = temp1;
sandNew(xind+1,yind+1) = temp2;
sand = sandNew;
set(imh, 'cdata', cat(3,z',sand',gnd') )
drawnow
end

%% 10、二维元胞自动机小游戏
%imagesc(a)的色度矩阵a中0->256由蓝变黄
% 规则，先把中间点置为1，每一时间每一点如果
%周围八个点和为偶数，则变为0，为奇数则变为 1
% 颜色控制
Map = [1 1 1; 0 0 0];
colormap(Map);
% 设置网格大小
S = 121;
L = zeros(S);
% 把中间一个数设置为 1 作为元胞种子
M = (S+1)/2;
L(M, M) =1;
Temp = L;
% imagesc(L);

% 计算层数
Layer = (S-1)/2 + 1;

for t=2:Layer
    for x=M-t+1:M+t-1
        if x==M-t+1 || x==M+t-1
            for y=M-t+1:M+t-1
                SUM = 0;
                for m=-1:1
                    for n=-1:1
                        if x+m>0 && x+m<=S && y+n>0 && y+n<=S
                            SUM = SUM + L(x+m, y+n);
                        end
                    end
                end
                SUM = SUM - L(x, y);
                Temp(x, y) = mod(SUM, 2);
            end
        else
            y = M-t+1;
            SUM = 0;
            for m=-1:1
                for n=-1:1
                    if x+m>0 && x+m<=S && y+n>0 && y+n<=S
                        SUM = SUM + L(x+m, y+n);
                    end
                end
            end
            SUM = SUM - L(x, y);
            Temp(x, y) = mod(SUM, 2);
            
            y = M+t-1;
            SUM = 0;
            for m=-1:1
                for n=-1:1
                    if x+m>0 && x+m<=S && y+n>0 && y+n<=S
                        SUM = SUM + L(x+m, y+n);
                    end
                end
            end
            SUM = SUM - L(x, y);
            Temp(x, y) = mod(SUM, 2);
        end
    end
    L = Temp;
    imagesc(L);
    % 速度控制
    pause(0.05);
end