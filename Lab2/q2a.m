saveDir = uigetdir;
for taus=1:60
    %modified to accept taus
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(taus);
    
    %after 100ms from start (3rd input)
    cell1spikes = extractSpikes(spiketimes,1,100);
    cell2spikes = extractSpikes(spiketimes,2,100);
    
    %spikes must be within 10ms of eachother for "synchrony"
    if(length(cell1spikes)==length(cell2spikes))
        if(max(abs(cell1spikes-cell2spikes))<10)
            disp(['synchrony @ taus:',num2str(taus)]);
        end
        if(min(abs(cell1spikes-cell2spikes))>25)
            disp(['anti-synchrony @ taus:',num2str(taus)]);
        end
    end
    if(abs(length(cell1spikes)-length(cell2spikes))>10)
        disp(['suppresion @ taus:',num2str(taus)]);
    end
    saveas(1,fullfile(saveDir,['q2a_taus=',num2str(taus),'.png']),'png');
end

% >> q2a
% anti-synchrony @ taus:1
% anti-synchrony @ taus:2
% anti-synchrony @ taus:3
% anti-synchrony @ taus:4
% anti-synchrony @ taus:6
% anti-synchrony @ taus:10
% anti-synchrony @ taus:13
% anti-synchrony @ taus:15
% anti-synchrony @ taus:17
% anti-synchrony @ taus:19
% anti-synchrony @ taus:21
% anti-synchrony @ taus:23
% anti-synchrony @ taus:24
% anti-synchrony @ taus:26
% anti-synchrony @ taus:28
% anti-synchrony @ taus:30
% anti-synchrony @ taus:31
% anti-synchrony @ taus:33
% anti-synchrony @ taus:34
% anti-synchrony @ taus:37
% anti-synchrony @ taus:38
% anti-synchrony @ taus:41
% anti-synchrony @ taus:42
% synchrony @ taus:45
% synchrony @ taus:46
% synchrony @ taus:47
% synchrony @ taus:48
% synchrony @ taus:49
% synchrony @ taus:50
% suppresion @ taus:53
% suppresion @ taus:54
% suppresion @ taus:55
% suppresion @ taus:56
% suppresion @ taus:57
% suppresion @ taus:58
% suppresion @ taus:59
% suppresion @ taus:60