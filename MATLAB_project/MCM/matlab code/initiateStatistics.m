function [] = initiateStatistics(statsFile, ext)
% sets parameters from statistical data
% No additional details.

global numOfINroads;
global numOfOUTroads;
global scalingFactor;

global stats;
stats = zeros(numOfINroads,numOfOUTroads,12);       % hourly statistical data for every direction

global maxNoise;
maxNoise = 0.05;                                    % how much noise should be used in simulation

for counter=1:12
    if counter < 10
        fileName = strcat(statsFile,'0',int2str(counter),ext);
    else
        fileName = strcat(statsFile, int2str(counter),ext);
    end
    stats(:,:,counter) = importdata(fileName,'\t'); % tab seperated statistics file for every hour
end

stats = round (stats / scalingFactor);

end