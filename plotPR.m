%% Compute the PR from the sorted descriptor list

% Variables Declarations
truePositive  = 0;
precisionList = [];
recallList    = [];

%% 1) Extract the Query class which is between 1-20 according to the file name
%% provided on the image folder

% The query image is the first image in the sorted dst array
% The dst is a 2D array where the first column is the distance and 
% the second column is the image index 

% Get the file name of the image
queryImgName = allfiles(dst(1,2)).name;

% Get the class of the image in string then convert it to a double
queryImgClass = str2double(strtok(queryImgName,'_'));

%% 2) Extract the Candidate class which is between 1-20 according to the 
%%    file names provided on the image folder

% similar steps as Step 1)

candidateImgName  = [];
candidateImgClass = [];

for i = 1:length(dst)
    candidateImgName  = allfiles(dst(i,2)).name;
    candidateImgClass(i) = str2double(strtok(candidateImgName,'_')); 
end

%% 3) Calculate Precision: TP/TP+FP and Recall: TP/ TP+FN
%% TP = True Positives where class predicted as Positive which is True
%% FP = False Positives where class predicted as Positve which is False
%% FN = False Negatives where class predicted as Negative which was False
for i = 1:length(dst)
    if candidateImgClass(i) == queryImgClass
        truePositive = truePositive + 1;
    end

    precisionList(i) = truePositive ./i;
    recallList(i) = truePositive ./length(dst); 

end

plot(recallList, precisionList);
title('PR Curve')
xlabel('Recall');
ylabel('Precision');