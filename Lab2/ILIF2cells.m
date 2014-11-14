function [t_tot,v_tot,u_tot,spiketimes,isis1,isis2,s_tot]=ILIF2cells(pulsei)

%RUN by entering the following at the matlab command window prompt:
%  [t,v,u,spiketimes,isis1,isis2,s]=ILIF2cells(amplitude of desired current pulse);

% Set model parameter values
a=0.02;
b=0.2;
c=-65;
d=8;
vthresh=30;
vpeak=35;
% set synapse parameter values
gsyn=0;
taus=15;
% set constant applied current
Iapp = pulsei;

% Set up connectivity matrix W
W = [0 1; 1 0];

%Set initial values for v & u
v=-70*ones(2,1)+[0; 10];
u=-14*ones(2,1)+[0; 5];
s=zeros(2,1);

% set time of simulation = tend, time step = deltat, and number of
% solution points computed totalpts
tend=2000;
deltat=0.1;
totalpts=tend/deltat;

% initialize storage vector 
v_tot=zeros(totalpts,2);
u_tot=zeros(totalpts,2);
s_tot=zeros(totalpts,2);

spiketimes=[];
% store initial values
v_tot(1,:)=v';
u_tot(1,:)=u';

% step through time to compute solution
for i=2:totalpts
    t=i*deltat;
    %Use Euler’s method to integrate eq.
    %Iapp = pulsei*heavyside(t-ton)*heavyside(toff-t);
    v = v + deltat*(0.04*v.^2 + 5*v + 140 - u + Iapp + gsyn*W*s);
    u = u + deltat*(a*(b*v - u));
    %set v_tot,u_tot at this time point to the current value of v, u
    v_tot(i,:)=v';
    u_tot(i,:)=u';
    %check if any v has exceeded spike threshold. 
    fired=find(v>=vthresh);
    if ~isempty(fired)
        % reset cells that spiked
        v(fired)=c;
        u(fired)=u(fired)+d;
        % cut off spike peak to vpeak
        v_tot(i,fired)=vpeak;
        % save spiketimes: [time of spike, cell that spiked]
        if isempty(spiketimes)
            spiketimes=horzcat(t*ones(length(fired),1), fired);
        else
            spiketimes=[spiketimes; t*ones(length(fired),1), fired];
        end
    end
    if ~isempty(spiketimes)
        % compute synaptic output for each cell
        c1=spiketimes(spiketimes(:,2)==1,1);
        c1synout=sum(exp(-(t-c1)/taus));
        c2=spiketimes(spiketimes(:,2)==2,1);
        c2synout=sum(exp(-(t-c2)/taus));
        s = [c1synout; c2synout];
        s_tot(i,:) = s';
    end
        
end


%Plot the neuron’s membrane potential.
figure(1)
t_tot=[0:deltat:tend-deltat]';
plot(t_tot,v_tot(:,1),t_tot,v_tot(:,2),'r');

%compute interspike intervals
isis1=[];
isis2=[];
cell1=spiketimes(spiketimes(:,2)==1,1);
cell2=spiketimes(spiketimes(:,2)==2,1);
isis1=diff(cell1);
isis2=diff(cell2);

% heaviside function for current pulse
    function hside=heavyside(x)
            if x >= 0
                hside = 1;
            else
                hside = 0;
            end
        end
       

end