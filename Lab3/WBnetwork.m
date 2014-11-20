function [spiketimes]=WBnetwork(n,W)

%RUN by entering the following at the matlab command window prompt:
%  [spiketimes]=WBnetwork(n,W);

% simulates network of Wang-Buzsaki neurons
num = n;

%%
% % set synapse parameter values
gsyn = 0.0; taus = 1;


%% Solve WB network model
T0 = 0; T1 = 3000;
tspan=[T0 T1];

WBftn = @(t,y)WBeqns(t, y, num, W, gsyn, taus);

% set initial conditions
% random initial voltages
 v0=-70*ones(num,1) + 15*rand(num,1);
h0=zeros(num,1); %+ rand(n,1);
n0=zeros(num,1); %+ rand(n,1);
s0=zeros(num,1);

ICs = [v0; h0; n0; s0];

[T, sol] = ode23(WBftn, tspan, ICs);
index = 1:num;
v = sol(:, index);
h = sol(:, num+index);
n = sol(:, 2*num+index);
s = sol(:,3*num+index);

% %% plot voltage traces
% hh = figure(1); hold off;
% cc = hsv(num);
% for j = 1: size(v,2)
%     plot(T, v(:,j),'color',cc(j,:),'LineWidth',1); hold on;
% end
% axis([T1-500 T1 -70 30]);
% %legend('cell 0', 'cell 1','cell 2', 'cell 3','cell 4','cell 5','cell 6')
% set(gca,'fontsize',30,'fontweight','bold')
% ylabel('Voltage (mV)','fontsize',35,'fontweight','bold')
% xlabel('Time (ms)','fontsize',35,'fontweight','bold')

%% generate raster plot from vout
for k=1:num
    [spkht spkind]=findpeaks(v(:,k),'minpeakheight',-10);
    spktimes=T(spkind);
    if k == 1
        spiketimes=horzcat(spktimes,k*ones(length(spktimes),1));
    else
        spiketimes=[spiketimes; spktimes, k*ones(length(spktimes),1)];
    end
end

%%

% Plot raster plot
hh = figure(2); hold off;
clear x y
x = spiketimes(:,1); y = spiketimes(:,2)-1;
plot(x,y,'ok','MarkerSize',4,'MarkerFaceColor','k') 
axis([0 T1 -0.2 num-1+.2])
set(gca,'fontsize',30,'fontweight','bold')
xlabel('Time (ms)','fontsize',35,'fontweight','bold')
ylabel('Cell number','fontsize',35,'fontweight','bold')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% consider spiking before Iapp pulse
spiketimes1=spiketimes(spiketimes(:,1)<1200,:);

% compute cell frequencies
freqs=zeros(num,1);
for i=1:num
    cspikes=spiketimes1(spiketimes1(:,2)==i);
    if length(cspikes)>=2
        cisis=diff(cspikes);
        freqs1(i)=1/(mean(cisis)/1000);
    else
        freqs1(i)=0;
    end
end
% print out average cell frequency
avcfreq1 = mean(freqs1(freqs1~=0));
fprintf('Average cell frequency before current pulse is %10.3f \n',avcfreq1)

% consider spiking after Iapp pulse
spiketimes2=spiketimes(spiketimes(:,1)>1450,:);

% compute cell frequencies
freqs=zeros(num,1);
for i=1:num
    cspikes=spiketimes2(spiketimes2(:,2)==i);
    if length(cspikes)>=2
        cisis=diff(cspikes);
        freqs2(i)=1/(mean(cisis)/1000);
    else
        freqs2(i)=0;
    end
end
% print out average cell frequency
avcfreq2=mean(freqs2(freqs2~=0));
fprintf('Average cell frequency after current pulse is %10.3f \n',avcfreq2)

end
