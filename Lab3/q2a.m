%function modified to accept taus
allAv1 = [];
allAv2 = [];
allStd1 = [];
allStd2 = [];
for taus=1:5
    disp(['taus=',num2str(taus)]);
    curAv1 = [];
    curAv2 = [];
    for i=1:5
        [spiketimes,avcfreq1,avcfreq2]=WBnetwork(n,W,taus);
        curAv1(i) = avcfreq1;
        curAv2(i) = avcfreq2;
    end
    allAv1(taus) = mean(curAv1);
    allAv2(taus) = mean(curAv2);
    allStd1(taus) = std(curAv1);
    allStd2(taus) = std(curAv2);
end

% taus=1
% Average cell frequency before current pulse is      2.166 
% Average cell frequency after current pulse is      2.130 
% Average cell frequency before current pulse is      2.198 
% Average cell frequency after current pulse is      2.157 
% Average cell frequency before current pulse is      2.164 
% Average cell frequency after current pulse is      2.229 
% Average cell frequency before current pulse is      2.168 
% Average cell frequency after current pulse is      2.341 
% Average cell frequency before current pulse is      2.075 
% Average cell frequency after current pulse is      2.290 
% taus=2
% Average cell frequency before current pulse is      2.445 
% Average cell frequency after current pulse is      2.497 
% Average cell frequency before current pulse is      2.062 
% Average cell frequency after current pulse is      2.608 
% Average cell frequency before current pulse is      2.354 
% Average cell frequency after current pulse is      2.660 
% Average cell frequency before current pulse is      2.687 
% Average cell frequency after current pulse is      2.773 
% Average cell frequency before current pulse is      2.292 
% Average cell frequency after current pulse is      2.848 
% taus=3
% Average cell frequency before current pulse is      2.483 
% Average cell frequency after current pulse is      2.868 
% Average cell frequency before current pulse is      2.706 
% Average cell frequency after current pulse is      2.650 
% Average cell frequency before current pulse is      2.412 
% Average cell frequency after current pulse is      3.429 
% Average cell frequency before current pulse is      2.511 
% Average cell frequency after current pulse is      3.510 
% Average cell frequency before current pulse is      2.886 
% Average cell frequency after current pulse is      2.749 
% taus=4
% Average cell frequency before current pulse is      2.776 
% Average cell frequency after current pulse is      3.203 
% Average cell frequency before current pulse is      2.259 
% Average cell frequency after current pulse is      3.218 
% Average cell frequency before current pulse is      3.305 
% Average cell frequency after current pulse is      2.943 
% Average cell frequency before current pulse is      2.865 
% Average cell frequency after current pulse is      3.447 
% Average cell frequency before current pulse is      2.869 
% Average cell frequency after current pulse is      3.831 
% taus=5
% Average cell frequency before current pulse is      3.506 
% Average cell frequency after current pulse is      3.726 
% Average cell frequency before current pulse is      2.705 
% Average cell frequency after current pulse is      4.821 
% Average cell frequency before current pulse is      3.366 
% Average cell frequency after current pulse is      3.645 
% Average cell frequency before current pulse is      3.278 
% Average cell frequency after current pulse is      3.952 
% Average cell frequency before current pulse is      2.992 
% Average cell frequency after current pulse is      4.828 