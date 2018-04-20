function [] = printRules(rules)
% prints rules corresponding to index

global trafficLight;
global hasPriority;
global TL;

if (rules.priority(1) == -1)
    display('Best configuration of rules was not found!');
    return;
end

setRules(rules);

display('Priority rules:');
display(hasPriority);

if (TL)
    display('Traffic light rules:');
    display('Presence:');
    display(trafficLight.isPresent);
    display('Queue sizes:');
    display(trafficLight.queueSize);
    display('Green signal times:');
    display(trafficLight.greenTime);
    display('Off times:');
    display(trafficLight.offTime);
end

end