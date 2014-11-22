figure;
for gsyn=-8:0.1:-7
    %modified to accept gsyn
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(gsyn);
    
    %after 100ms from start (3rd input)
    cell1spikes = extractSpikes(spiketimes,1,100);
    cell2spikes = extractSpikes(spiketimes,2,100);
    freq=1000/mean(isis1);
    
    if(length(cell1spikes)==length(cell2spikes))
        if(max(abs(cell1spikes-cell2spikes))<10)
            disp(['synchrony @ taus=47,gsyn=',num2str(gsyn),',freq=',...
                num2str(freq)]);
            plot(freq,gsyn,'o');
            hold on;
        end
    end
end
title('q2c');
xlabel('freq');
ylabel('gsyn');

% >> q2c
% synchrony @ taus=47,gsyn=-8,freq=13.3759
% synchrony @ taus=47,gsyn=-7.9,freq=13.411
% synchrony @ taus=47,gsyn=-7.8,freq=13.4471
% synchrony @ taus=47,gsyn=-7.7,freq=13.4806
% synchrony @ taus=47,gsyn=-7.6,freq=13.517
% synchrony @ taus=47,gsyn=-7.5,freq=13.5413