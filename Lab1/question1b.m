vprev = 0;
for i=5:.01:6
    disp(i)
    [t,v,spiketimes,isis]=HH(i);
    if(length(spiketimes)>1)
        disp('1current:')
        disp(i)
        disp('1voltage:')
        disp(v(1,end))
    end
end

%1b:5.97, v=-61.2467
%1c:5.98