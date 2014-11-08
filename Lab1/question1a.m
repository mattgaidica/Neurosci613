for i=2.2:.01:2.3
    [t,v,spiketimes,isis]=HH(i);
    if(~isempty(spiketimes))
        disp(i)
        break;
    end
end

%rheobase=2.25