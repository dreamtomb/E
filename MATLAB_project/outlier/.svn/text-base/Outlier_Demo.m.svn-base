% Example for spatial outlier detection
% Created by Pusheng Zhang and Shashi Shekhar
% University of Minnesota
% 5/8/2003
%
% Let's start the script for spatial outlier detection
% First we will load the example data
% the data consist 30 data points for illustration purpose
% the data is a one-dimensional spatially single variable data
% first col is the linear spatial coordinate
% second col is the attribute value for the saptial location
% the data file is named as data.txt

% load the data, a 30 x 2 matrix
clear all;
load data.txt;

% return the size of data matrix
[m,n]=size(data)

% Definition of neighborhood for each location
% since data is 30 x 2 matrix, let's initial neighborhood matrix with 30 x 2 matrix
% first col is same as data, second one is the average attribute value among neighbors
% for simplicity, neighborhood window size is one.
nei = data;

% first one just has one neighbor
nei(1,2)=data(2,2);

% point in middle locations has two nearby neighbors, left and right. 
for i=2:m-1
    nei(i,2)=0.5*(data(i-1,2)+data(i+1,2));
end;

% last one just has one neighbor
nei(m,2) = data(m-1,2);

% x is a vector of the attribute value for each location in data
x = data(:,2);

% y is a vector of avg attribute value of neighbors for each location
y = nei(:,2);

% initialize a 1-30 index for figure in Outlier_Global and Outlier_Scatter
x_index = [1:30]';
% initialize a horizontal line 
hori_line = zeros(30,1);

% If you want to show the original data, please uncomment the following:
% Show_Data
 
% If you want to show the histogram of the attribute values, please uncomment the following: 
% Show_Hist;

% If you want to show the global outlier detection 
% Please uncomment the following: 
% Outlier_Global;

% If you want to show the results of different outlier detection methods in the data
% (1) Scatter Plot
% Please uncomment the following
% Outlier_Scatter;

% (2) Variogram
% Please uncomment the following:
% Outlier_Variogram;

% (3) Spatial Outlier Test used in the paper, Detecting Graph-based Spatial Outliers,
% KDD 2001, S. Shekhar, C. T. Lu, and P. Zhang
% Please uncomment the following:
% Outlier_Test;







