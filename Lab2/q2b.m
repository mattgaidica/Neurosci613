%values from 2a
figure;
for taus=45:50
    [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(taus);
    freq=1000/mean(isis1);
    disp(['gsyn=0,taus=',num2str(taus),',freq=',num2str(freq)]);
    plot(freq,taus,'o');
    hold on;
end
title('q2b');
xlabel('freq (Hz)');
ylabel('taus');

% >> q2b
% gsyn=-8,taus=45,freq=13.615
% gsyn=-8,taus=46,freq=13.4995
% gsyn=-8,taus=47,freq=13.3759
% gsyn=-8,taus=48,freq=13.2545
% gsyn=-8,taus=49,freq=13.134
% gsyn=-8,taus=50,freq=13.0202

% >> q2b
% gsyn=0,taus=45,freq=17.9616
% gsyn=0,taus=46,freq=17.9616
% gsyn=0,taus=47,freq=17.9616
% gsyn=0,taus=48,freq=17.9616
% gsyn=0,taus=49,freq=17.9616
% gsyn=0,taus=50,freq=17.9616