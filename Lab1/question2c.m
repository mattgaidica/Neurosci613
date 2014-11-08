spikeData=[];
j=1;
curRange=105:0.1:110; %est. range from 2b
for i=curRange
    [t,v,spiketimes,isis]=HH(i,false);
    spikeData(j,:) = [i,length(spiketimes)];
    j=j+1;
end
h1=figure;
plot(spikeData(:,1),spikeData(:,2));
title('Spike Count vs. Current')
xlabel('Current (uA)')
ylabel('Spike Count')
saveas(h1,'question2c.png','png');

depolarizeIdx = find(spikeData(:,2)==1);
disp('depolarize block:')
disp(spikeData(depolarizeIdx(1),1))
% current:108
