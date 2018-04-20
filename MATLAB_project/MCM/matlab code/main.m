function [] = main()
% main function: finds optimat configuration of rules
% makes simulations of traffic for all possible configurations of rules
% and finds the configuration with the shortest Cummulative Waiting Time.

clc;                                                % clears console output
clear;                                              % clears variables
display('===START OF SIMULATION===');

% PARAMETERS

statsFile = 'stats/stats_';                         % root of statistical input file (TAB seperated)
ext = '.txt';                                       % extension of statistical input file

numOfSimulations = 1;                               % number of equivalent simulations
global scalingFactor;
scalingFactor = 300;
iterLength = 2*scalingFactor;                       % size of one step (in sec) (should be 2sec)
% scalingFactor = 1   ===> time for one simulation = 10 min
% scalingFactor = 30  ===> time for one simulation = 20 sec
% scalingFactor = 300 ===> time for one simulation = 2  sec

global numOfIters;
numOfIters = floor(12*60*60/iterLength);            % length of iteration

% STRUCTURE

initiateConstants();
initiateStatistics(statsFile,ext);

% SEARCH FOR MIN CWT

bestRules.priority = -1;
minCWT = intmax;

global maxPriorityIndex;
global maxPresenceIndex;
global maxQueueIndex;
global maxGreenIndex;
global maxOffIndex;

% MODIFIERS

global TL;
TL = input('Allow traffic lights? (1 or 0):');

if (TL)                 % TRAFFIC LIGHTS ARE ALLOWED

    % information
    numOfRules = maxPriorityIndex*maxPresenceIndex*maxQueueIndex*maxGreenIndex*maxOffIndex;
    display(strcat('Number of Rules = :',int2str(numOfRules)));
    display(strcat('Number of Simulations = :',int2str(numOfSimulations)));
    expTime = round(numOfSimulations*10*numOfRules/scalingFactor);
    expHrs  = floor(expTime/60);
    expDays = floor(expHrs/24);
    expHrs  = mod  (expHrs, 24);
    expMins = mod  (expTime,60);
    display(strcat('Expected execution time = :',int2str(expDays), ...
                                 ' days and :', int2str(expHrs), ...
                                 ' hours and :', int2str(expMins),' mins'));
    display('---------');

    % iteration of all configurations of rules
    progress = 0;                                   % progress indicator
    for priority = 0:maxPriorityIndex
    for present  = 0:maxPresenceIndex
    for queue    = 1:maxQueueIndex
    for green    = 1:maxGreenIndex
    for off      = 1:maxOffIndex

        rules.priority  = priority;
        rules.present   = present;
        rules.queue     = queue;
        rules.greenTime = green;
        rules.offTime   = off;

        setRules(rules);
        cwt = simulate(numOfSimulations);
        if cwt < minCWT
            minCWT = cwt;
            bestRules = rules;
        end

    end
    end
    end
    end
    % progress indicator
    if (floor(100*priority/maxPriorityIndex) > progress)
        progress = floor(100*priority/maxPriorityIndex);
        display(strcat(int2str(progress),'% completed...'));
    end
    end

else                    % TRAFFIC LIGHTS ARE NOT ALLOWED

    % information
    display(strcat('Number of Rules = :',int2str(maxPriorityIndex)));
    display(strcat('Number of Simulations = :',int2str(numOfSimulations)));
    expTime = round(numOfSimulations*10*maxPriorityIndex/scalingFactor);
    expHrs  = floor(expTime/60);
    expMins = mod  (expTime,60);
    display(strcat('Expected execution time = :',int2str(expHrs), ...
                                 ' hours and :', int2str(expMins),' mins'));
    display('---------');

    % iteration of all configurations of rules
    progress = 0;                                   % progress indicator
    for priority = 0:maxPriorityIndex

        rules.priority  = priority;
        setRules(rules);
        
        cwt = simulate(numOfSimulations);
        if cwt < minCWT
            minCWT = cwt;
            bestRules = rules;
        end

        if (floor(100*priority/maxPriorityIndex) > progress)
            progress = floor(100*priority/maxPriorityIndex);
            display(strcat(int2str(progress),'% completed...'));
        end
    end
end
    
% RESULTS & POSTPROCESSING

printRules(bestRules);

display('===END OF SIMULATION===')
end