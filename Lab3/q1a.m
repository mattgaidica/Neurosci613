%function modified to accept gsyn
for gsyn=5:12
    [spiketimes]=ILIF_ExcNetwork(n,W,gsyn);
    spikes1 = extractSpikes(spiketimes,1,0);
    spikes2 = extractSpikes(spiketimes,2,0);
    spikesDiff = mean(spikes1-spikes2);
    
    disp(['gsyn=',num2str(gsyn),', Neighbor time diff (ms):',num2str(spikesDiff)]);
    
    title(['gsyn=',num2str(gsyn)]);
end

% gsyn=5, Neighbor time diff (ms):7.3385
% gsyn=6, Neighbor time diff (ms):5.9643
% gsyn=7, Neighbor time diff (ms):4.9786
% gsyn=8, Neighbor time diff (ms):4.2
% gsyn=9, Neighbor time diff (ms):3.8083
% gsyn=10, Neighbor time diff (ms):3.6
% gsyn=11, Neighbor time diff (ms):3.3
% gsyn=12, Neighbor time diff (ms):3.0967