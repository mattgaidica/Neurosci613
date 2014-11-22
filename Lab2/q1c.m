% set gsyn=2,5,8
i=4;
while(true)
    pulsei=[i;4];
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(pulsei);

    cell1spikes = extractSpikes(spiketimes,1,10);
    cell2spikes = extractSpikes(spiketimes,2,10);

    ratio = length(cell1spikes)/length(cell2spikes);
    if(ratio==1)
        disp(['1:1 Firing: gsyn=8,I1=',num2str(i),',I2=4']);
    end
    if(ratio>1)
        break;
    end
    i=i+1;
end

% >> q1c
% 1:1 Firing: gsyn=2,I1=4,I2=4
% 1:1 Firing: gsyn=2,I1=5,I2=4

% >> q1c
% 1:1 Firing: gsyn=5,I1=7,I2=4
% 1:1 Firing: gsyn=5,I1=8,I2=4

% >> q1c
% 1:1 Firing: gsyn=8,I1=8,I2=4
% 1:1 Firing: gsyn=8,I1=9,I2=4


