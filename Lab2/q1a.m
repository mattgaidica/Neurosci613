parts = [0 0 0];
i=4;
saveDir=uigetdir;
while(true)
    pulsei=[i;4];
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(pulsei);

    cell1spikes = extractSpikes(spiketimes,1,10);
    cell2spikes = extractSpikes(spiketimes,2,10);

    ratio = length(cell1spikes)/length(cell2spikes);
    if(mod(length(cell1spikes),length(cell2spikes))==0)
        disp(['m:n integer divisor found, I1=',num2str(i)]);
        disp([num2str(ratio),':1']);
        if(ratio==3)
            parts(1,1)=1;
        end
    end
    if(ratio>1 && ratio<2 && ~parts(1,2))
        disp(['m:n(1:2), I1=',num2str(i)]);
        parts(1,2)=1;
    end
    if(ratio>2 && ratio<3 && ~parts(1,3))
        disp(['m:n(2:3), I1=',num2str(i)]);
        parts(1,3)=1;
    end
    
    saveas(1,fullfile(saveDir,['q1_I1=',num2str(i),'_I2=4','.png']),'png');
    if(all(parts))
        break;
    end
    i=i+1;
end

% q1a
% m:n integer divisor found, I1=4
% 1:1
% m:n integer divisor found, I1=5
% 1:1
% m:n integer divisor found, I1=6
% 1:1
% m:n(1:2), I1=7
% m:n integer divisor found, I1=9
% 2:1
% m:n integer divisor found, I1=10
% 2:1
% m:n integer divisor found, I1=13
% 2:1
% m:n(2:3), I1=14
% m:n integer divisor found, I1=18
% 3:1