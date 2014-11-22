data=[0 4]; %stated in q1d
for gsyn=1:8
    i=4;
    while(true)
        pulsei=[i;4];
        %temporarily modified to accept gsyn
        [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(pulsei,gsyn);

        cell1spikes = extractSpikes(spiketimes,1,10);
        cell2spikes = extractSpikes(spiketimes,2,10);

        ratio = length(cell1spikes)/length(cell2spikes);
        if(ratio==1)
            disp(['1:1 Firing: gsyn=',num2str(gsyn),',I1=',num2str(i),',I2=4']);
            data = [data;[gsyn i]];
        end
        if(ratio>1)
            break;
        end
        i=i+1;
    end
end
figure;
plot(data(:,2),data(:,1),'o');
ylabel('gsyn values');
xlabel('I1 values');
title('q1d');

% >> q1d
% 1:1 Firing: gsyn=1,I1=4,I2=4
% 1:1 Firing: gsyn=2,I1=4,I2=4
% 1:1 Firing: gsyn=2,I1=5,I2=4
% 1:1 Firing: gsyn=3,I1=4,I2=4
% 1:1 Firing: gsyn=3,I1=5,I2=4
% 1:1 Firing: gsyn=3,I1=6,I2=4
% 1:1 Firing: gsyn=4,I1=5,I2=4
% 1:1 Firing: gsyn=4,I1=6,I2=4
% 1:1 Firing: gsyn=4,I1=7,I2=4
% 1:1 Firing: gsyn=5,I1=7,I2=4
% 1:1 Firing: gsyn=5,I1=8,I2=4
% 1:1 Firing: gsyn=6,I1=8,I2=4
% 1:1 Firing: gsyn=7,I1=9,I2=4
% 1:1 Firing: gsyn=8,I1=8,I2=4
% 1:1 Firing: gsyn=8,I1=9,I2=4