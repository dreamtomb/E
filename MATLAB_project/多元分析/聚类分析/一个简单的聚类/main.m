%% 聚类分析
%% Y=pdist(X,’metric’)中用’metric’指定的方法计算矩阵X中对象间的距
% 离。’metric’是特征字符串值。
%              字符串                                  含 义
%           ’Euclid’                         欧氏距离（缺省）
%           ’SEuclid’                       标准欧氏距离
%           ’Mahal’                 马氏距离（Mahalanobis距离）
%           ’CityBlock’                     绝对值距离
%           ’Minkowski’           闵氏距离（Minkowski距离）
%% linkage
% Z=linkage(Y)使用最短距离算法生成具层次结构的聚类树。输入矩阵Y为pdist函数
% 输出的 m*(m-1)/2 维距离行向量。
% Z=linkage(Y,’method’)使用由’method’指定的算法计算生成聚类树
% 字符串  含 义
% ’single’ 最短距离（缺省）
% ’complete’ 最大距离
% ’average’ 平均距离
% ’centroid’ 重心距离
% ’ward’ 离差平方和方法（Ward方法）
%% cluster
% T=cluster(Z,cutoff)从连接输出（linkage）中创建聚类。cutoff为定义cluster
% 函数如何生成聚类的阈值，其不同的值含义如表4所示。
% 0<cutoff<2
% cutoff作为不一致系数的阈值。不一致系数对聚类树中对象间的差
% 异进行了量化。如果一个连接的不一致系数大于阈值，则cluster
% 函数将其作为聚类分组的边界。
% 2<=cutoff  cutoff作为包含在聚类树中的最大分类数
%% zsore(X)   对数据矩阵进行标准化处理
%% H＝dendrogram(Z,P)
% 由linkage产生的数据矩阵Z画聚类树状图。P是结点数，默认值是30。
%% T=clusterdata(X,cutoff)
% 将矩阵X的数据分类。X为 n m× 矩阵，被看作 m 个大小为 n 的向量。它与以下几个
% 命令等价：
% Y=pdist(X,’euclid’)
% Z=linkage(Y,’single’)
% T=cluster(Z,cutoff)
%% squareform   将pdist的输出转换为方阵。
%% cophenet
% c=cophenet(Z,Y) 计算相干系数，它是将Z中的距离信息（由linkage()函数产生）
% 和Y中的距离信息（由pdist()）函数产生进行比较。
%% 例子
clc,clear
a=[1,0;1,1;3,2;4,3;2,5];
y=pdist(a,'cityblock');
yc=squareform(y);
z=linkage(y);
[h,t]=dendrogram(z);
