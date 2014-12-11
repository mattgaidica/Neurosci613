allStd=[];
for sigma=0:0.1:5
    % modified to accept sigma, return hist counts
    [spiketimes,freqs,nisis,Iapp,counts]=ILIFnetwork_syn(n,W,sigma);
    disp(['Sigma:',num2str(sigma),', Std of hist counts:',num2str(std(counts))]);
    allStd = [allStd std(counts)];
end

figure;
plot(0:0.1:5,allStd);
title('Std of Hist Bins');
xlabel('Sigma')
ylabel('Std')

%  q1a
% Average cell frequency is     29.712 
% Average network frequency is    108.165 
% Sigma:0, Std of hist counts:10.8555
% Average cell frequency is     28.386 
% Average network frequency is   1138.683 
% Sigma:0.5, Std of hist counts:3.8169
% Average cell frequency is     33.260 
% Average network frequency is   1309.355 
% Sigma:1, Std of hist counts:3.2349
% Average cell frequency is     35.963 
% Average network frequency is   1381.381 
% Sigma:1.5, Std of hist counts:2.0013
% Average cell frequency is     37.370 
% Average network frequency is   1384.492 
% Sigma:2, Std of hist counts:2.2771
