function spikes=extractSpikes(spiketimes,cell,afterMs)
    spiketimes = spiketimes(spiketimes(:,1)>afterMs,:);
    spikes=spiketimes(spiketimes(:,2)==cell);
end