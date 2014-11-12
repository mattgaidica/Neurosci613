for i=6.2:.01:6.3
    [t,v,spiketimes,isis]=HH(i);
    %look for presence of spikes near end (within one ISI)
    if(spiketimes(end)+mean(isis)>1100)
        disp('Current at which pulses extend to the end:')
        disp(i)
        break;
    end
end