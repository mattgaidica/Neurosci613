trialFreqs=[];
for i=1:60
    disp(i)
    [t,v,spiketimes,isis]=HH(i,false);
    if(~isempty(isis))
        trialFreqs(i)=1000/(mean(isis)); %ms->s,f=1/period
    else
        trialFreqs(i)=0; %only one spike
    end
end
h1=figure;
plot(trialFreqs);
title('Frequency vs. Input Current');
xlabel('Current (uA)');
ylabel('Frequency (Hz)');
saveas(h1,'question2a.png','png');