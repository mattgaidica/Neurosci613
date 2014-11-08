trialFreqs=[];
curRange=0:0.5:10;
j=1;
for i=curRange
    disp(i)
    [t,v,spiketimes,isis]=LIF(i);
    if(~isempty(isis))
        trialFreqs(j)=1000/(mean(isis)); %ms->s,f=1/period
    else
        trialFreqs(j)=0; %only one spike
    end
    j=j+1;
end
h1=figure;
plot(curRange,trialFreqs);
title('Frequency vs. Input Current');
xlabel('Current (uA)');
ylabel('Frequency (Hz)');
%saveas(h1,'question4b.png','png');