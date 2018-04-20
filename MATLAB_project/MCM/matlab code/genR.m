function [res] = genR ()
% generates random variable: 1+/-maxNoise

global maxNoise;

res = 1-maxNoise+2*maxNoise*rand();

end