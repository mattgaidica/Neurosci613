%clear variables
% allStd=[];
% allPie = [];

allStd = [allStd std(counts)];
allPie = [allPie p_ei];
for i=1:2
    figure(i);
    title('p_ie=1');
    saveas(i,['q3b_1_',num2str(i)],'png');
end