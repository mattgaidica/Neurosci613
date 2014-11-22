gsyn=3;
figure;
for taus=5:20
    %modified to accept gsyn and taus
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(gsyn,taus);
    freq=1000/mean(isis1);
    plot(freq,taus,'o');
    hold on;
end
title('gsyn=3');
xlabel('freq (Hz)');
ylabel('taus');

taus=15;
figure;
for gsyn=1:8
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(gsyn,taus);
    freq=1000/mean(isis1);
    plot(freq,gsyn,'o');
    hold on;
end
title('taus=15');
xlabel('freq (Hz)');
ylabel('gsyn');

gsyn=0;
figure;
for taus=5:20
    %modified to accept gsyn and taus
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(gsyn,taus);
    freq=1000/mean(isis1);
    plot(freq,taus,'o');
    hold on;
end
title('gsyn=0');
xlabel('freq (Hz)');
ylabel('taus');