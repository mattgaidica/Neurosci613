for taus=50:5:75
    [spiketimes,freqs,nisis]=ILIFnetwork_clusters(n,W,taus);
    disp(['taus=',num2str(taus)]);
    
    saveas(1,['q3a_taus=',num2str(taus),'.png'],'png');
end