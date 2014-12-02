% generate_Figure_1.m

figure(1);

dos('copy EXAMPLES\A\params.m . /Y');
%!cp EXAMPLES/A/params.m .
subplot(321); gamma_simulator; u=get(gca,'Xlim'); v=get(gca,'Ylim');
text(0.90*u(2),0.80*v(2),'A','Fontsize',18, 'BackgroundColor', 'white');

dos('copy EXAMPLES\B\params.m . /Y'); % DOESN'T OVERWRITE params.m FILE
%!cp EXAMPLES/B/params.m .
subplot(322); gamma_simulator; u=get(gca,'Xlim'); v=get(gca,'Ylim');
text(0.90*u(2),0.80*v(2),'B','Fontsize',18, 'BackgroundColor', 'white');

dos('copy EXAMPLES\C\params.m . /Y');
%!cp EXAMPLES/C/params.m .
subplot(323); gamma_simulator; u=get(gca,'Xlim'); v=get(gca,'Ylim');
text(0.90*u(2),0.80*v(2),'C','Fontsize',18, 'BackgroundColor', 'white');

dos('copy EXAMPLES\D\params.m . /Y');
%!cp EXAMPLES/D/params.m .
subplot(324); gamma_simulator; u=get(gca,'Xlim'); v=get(gca,'Ylim');
text(0.90*u(2),0.80*v(2),'D','Fontsize',18, 'BackgroundColor', 'white');

dos('copy EXAMPLES\E\params.m . /Y');
%!cp EXAMPLES/E/params.m .
subplot(325); gamma_simulator; u=get(gca,'Xlim'); v=get(gca,'Ylim');
text(0.90*u(2),0.80*v(2),'E','Fontsize',18, 'BackgroundColor', 'white');

dos('copy EXAMPLES\F\params.m . /Y');
%!cp EXAMPLES/F/params.m .
subplot(326); gamma_simulator; u=get(gca,'Xlim'); v=get(gca,'Ylim');
text(0.90*u(2),0.80*v(2),'F','Fontsize',18, 'BackgroundColor', 'white');

exportfig(gcf,'Figure_1','Color','gray');
% exportfig is not part of the standard Matlab distribution, but can be 
% downloaded free of charge from Matlab Central. It is included in this 
% directory. 

