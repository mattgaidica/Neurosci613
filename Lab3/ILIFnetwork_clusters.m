function [spiketimes,freqs,nisis]=ILIFnetwork_clusters(n,W)

%RUN by entering the following at the matlab command window prompt:
%  [spiketimes,freqs,nisis]=ILIFnetwork_clusters(n,W);

% Set model parameter values
a=0.02;
b=0.2;
c=-65;
d=8;
vthresh=30;

% set synapse parameter values
gsyn=-2;
taus=15;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set applied current, pulse or constant
% constant applied current
Iapp = 4*ones(50,1);
%Iapp = 6*ones(50,1);
%Iapp(10)=4;

% heterogeneous constant applied current
%sigma=0.2;
%Iapp = 6*ones(50,1)+sigma*rand(50,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Set initial values for v & u
% random initial conditions
% v=-70*ones(n,1) + 10*rand(n,1);
% u=-14*ones(n,1) + 5*rand(n,1);

% spread initial conditions
% v=-70*ones(n,1) + linspace(0,10,50)';
% u=-14*ones(n,1) + linspace(1,7,50)';

% initial conditions for 5 clusters
v=-70*ones(n,1);
u=-14*ones(n,1);
v(1:10)=v(1:10)+3;
u(1:10)=u(1:10)+2;
v(11:20)=v(11:20)+5;
u(11:20)=u(11:20)+4;
v(21:30)=v(21:30)+8;
u(21:30)=u(21:30)+6;
v(31:40)=v(31:40)+10;
u(31:40)=u(31:40)+8;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set time of simulation = tend, time step = deltat, and number of
% solution points computed totalpts
tend=2000;
deltat=0.1;
totalpts=tend/deltat;

% initialize storage vector 
%v_tot=zeros(totalpts,2);
%u_tot=zeros(totalpts,2);
%s_tot=zeros(totalpts,2);

spiketimes=[];
s=zeros(n,1);

% store initial values
%v_tot(1,:)=v';
%u_tot(1,:)=u';

% step through time to compute solution
for i=2:totalpts
    t=i*deltat;
    
    % uncomment if applied current pulse, comment otherwise
    %Iapp = pulsei*heavyside(t-ton)*heavyside(toff-t)*ones(n,1);
    
    %Use Euler’s method to integrate eq.
    v = v + deltat*(0.04*v.^2 + 5*v + 140 - u + Iapp + gsyn*W*s);
    u = u + deltat*(a*(b*v - u));
    %set v_tot,u_tot at this time point to the current value of v, u
    %v_tot(i,:)=v';
    %u_tot(i,:)=u';
    %check if any v has exceeded spike threshold. 
    fired=find(v>=vthresh);
    if ~isempty(fired)
        % reset cells that spiked
        v(fired)=c;
        u(fired)=u(fired)+d;
        % cut off spike peak to vpeak
        %v_tot(i,fired)=vpeak;
        % save spiketimes: [time of spike, cell that spiked]
        
        if isempty(spiketimes)
            spiketimes=horzcat(t*ones(length(fired),1), fired);
        else
            spiketimes=[spiketimes; t*ones(length(fired),1), fired];
        end
    end
    if ~isempty(spiketimes)
        % compute synaptic output for each cell
        for j=1:n
            cellout=spiketimes(spiketimes(:,2)==j,1);
            cellout=sum(exp(-(t-cellout)/taus));
            s(j)=cellout;
            %s_tot(i,:)=s';
        end
    end 
end


% Plot raster plot
figure(1)
plot(spiketimes(:,1),spiketimes(:,2),'.')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% consider final 1000 msec of simulation
spiketimes2=spiketimes(spiketimes(:,1)>1000,:);

% compute cell frequencies
freqs=zeros(50,1);
for i=1:n
    cspikes=spiketimes2(spiketimes2(:,2)==i);
    if length(cspikes)>=2
        cisis=diff(cspikes);
        freqs(i)=1/(mean(cisis)/1000);
    else
        freqs(i)=0;
    end
end
% print out average cell frequency
avcfreq=mean(freqs(freqs~=0));
fprintf('Average cell frequency is %10.3f \n',avcfreq)

% compute average network frequency
nisis=diff(spiketimes2(:,1));
nisis=nisis(nisis>0.11);
avnfreq=1/(mean(nisis)/1000);
fprintf('Average network frequency is %10.3f \n',avnfreq)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %Plot the neuron’s membrane potential.
% figure(1)
% t_tot=[0:deltat:tend-deltat]';
% %t_tot=[0:deltat:tend-deltat]';
% plot(t_tot,v_tot(:,1),t_tot,v_tot(:,2),'r');
% 
% %compute interspike intervals
% cell1=spiketimes(spiketimes(:,2)==1,1);
% cell2=spiketimes(spiketimes(:,2)==2,1);
% isis1=diff(cell1);
% isis2=diff(cell2);

% heaviside function for current pulse
    function hside=heavyside(x)
            if x >= 0
                hside = 1;
            else
                hside = 0;
            end
        end
       

end