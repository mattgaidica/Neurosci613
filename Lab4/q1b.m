for gsynNum=-2:-1:-10
    [spiketimes,freqs,nisis,Iapp]=ILIFnetwork_syn(n,W,gsynNum);
    figure;
    plot(Iapp,freqs,'*');
    title(['gsynNum:',num2str(gsynNum)]);
    disp(num2str(gsynNum));
end