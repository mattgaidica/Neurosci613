function [t,v,spiketimes,isis] = HH(pulsei)

%RUN by entering the following at the matlab command window prompt:
%  [t,v,spiketimes,isis]=HH(amplitude of desired current pulse);

% set simulation timespan in ms
tspan = [0 1100];

% set initial conditions [V(t=0); m(t=0); h(t=0); n(t=0)]
v0 = [-64.9997;0.0529;0.5961;0.3177];

% Call the ODE solver ode15s.
% output: t = time stamp vector of size [j by 1]. v = [j by 4] matrix with
% column 1 = voltage, column 2 = m, column 3 = h, column 4 = n
[t,v] = ode23(@hh,tspan,v0);


% determine spike times and interspike intervals
[peaks, locs]=findpeaks(v(:,1),'MINPEAKHEIGHT',-10);
spiketimes=t(locs);
isis=diff(spiketimes);

% plot Voltage vs time
plot(t,v(:,1),spiketimes,peaks,'*')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Define a function containing the HH equations. Input parameter 
    % pulsei that is amplitude of applied current pulse 
    function dvdt = hh(t,v)
    % set HH parameter values
    c=1;
    gna=120;
    gk=36;
    gl=0.3;
    ena=50;
    ek=-77;
    el=-54.4;
    % set time on and time off of applied current pulse
    ton=100;
    toff=1100;
    ton2=2000;
    toff2=2000;
    % HH equations
    dvdt(1) = (-gna*(v(2)^3)*v(3)*(v(1)-ena)-gk*(v(4)^4)*(v(1)-ek)...
            -gl*(v(1)-el) + pulsei*heavyside(t-ton)*heavyside(toff-t)+ pulsei*heavyside(t-ton2)*heavyside(toff2-t))/c;
    dvdt(2) = alpham(v(1))*(1-v(2))-betam(v(1))*v(2);
    dvdt(3) = alphah(v(1))*(1-v(3))-betah(v(1))*v(3);
    dvdt(4) = alphan(v(1))*(1-v(4))-betan(v(1))*v(4);
    dvdt=dvdt';
    
        function am=alpham(x)
            am=-0.1*(x+40)/(exp(-(x+40)/10)-1);
        end
        
        function bm=betam(x)
            bm=4*exp(-(x+65)/18);
        end
        
        function ah=alphah(x)
            ah=0.07*exp(-(x+65)/20);
        end
        
        function bh=betah(x)
            bh=1.0/(exp(-(x+35)/10)+1);
        end
        
        function an=alphan(x)
            an=-0.01*(x+55)/(exp(-(x+55)/10)-1);
        end
        
        function bn=betan(x)
            bn=0.125*exp(-(x+65)/80);
        end
        
        function hside=heavyside(x)
            if x >= 0
                hside = 1;
            else
                hside = 0;
            end
        end
        
    end
end
