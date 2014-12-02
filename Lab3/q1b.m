%function modified to accept gsyn
for gsyn=1:5
    [spiketimes]=ILIF_ExcNetwork(n,W,gsyn);
    spikes1 = extractSpikes(spiketimes,1,0);
    spikes2 = extractSpikes(spiketimes,2,0);
    spikesDiff = mean(spikes1-spikes2);
    
    disp(['gsyn=',num2str(gsyn),', Neighbor time diff (ms):',num2str(spikesDiff)]);
    
    title(['gsyn=',num2str(gsyn)]);
end

% gsyn=1, Neighbor time diff (ms):NaN
% gsyn=2, Neighbor time diff (ms):NaN
% gsyn=3, Neighbor time diff (ms):NaN
% gsyn=4, Neighbor time diff (ms):10.8455
% gsyn=5, Neighbor time diff (ms):7.4571