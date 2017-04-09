%% Diagnose Senior Design Project
% Editors: 
%   Nicholas Arcibong
% listdlg function for menu option?

clear
clc
close all

% loading of data
disp('Loading Data...')
dataMatrix = xlsread('DataMatrix.xlsx');
[num1,txt1,raw1] = xlsread('DataMatrixInformation.xlsx');
[num2,txt2,responseVector] = xlsread('ResponseVector.xlsx');

% extracting information 
disp('Extracting information...')
symptoms = txt1(1,2:end);
generalBody = symptoms(:,1:28);
head = symptoms(:,29:49);
arms = {'empty'};
torso = symptoms(:,50:56);
lowerBody = symptoms(:,57:end);

% offset
% used to change the correct value in the userInput vector
headOffset = 28;
armsOffset = 0;
torsoOffset = 49;
lowerBodyOffset = 56;

% defining of variables
bodyAreas = {'General Body', 'Head', 'Arms', 'Torso', 'Lower Body'};
userInput = zeros(1,length(symptoms));
vec = [];

% creation of menu
start = 2;

while(start == 2)
   [select, ok] = listdlg('PromptString', 'Select an area',...
       'SelectionMode', 'single',...
       'ListString',bodyAreas);
    
   if ok == 0
       % end the selection portion
       start = menu('End selection of symptoms?','Yes','No');
   
   else
       % determine which body category they selected       
       % determine the symptoms to display and get back a response
       % **** still currently need to figure out how to change the correct
       % values....
       switch select
           case 1
               fprintf('%s selected...\n', bodyAreas{select})
               vec = DetermineUser(generalBody, bodyAreas{select});
               userInput = changeUserInput(userInput, vec, 0);
           case 2 
               fprintf('%s selected...\n', bodyAreas{select})
               vec = DetermineUser(head, bodyAreas{select});
               userInput = changeUserInput(userInput, vec, headOffset);               
           case 3
               fprintf('%s selected...\n', bodyAreas{select})
               vec = DetermineUser(arms, bodyAreas{select});
               userInput = changeUserInput(userInput, vec, armsOffset);                              
           case 4
               fprintf('%s selected...\n', bodyAreas{select})
               vec = DetermineUser(torso, bodyAreas{select});
               userInput = changeUserInput(userInput, vec, torsoOffset);                              
           case 5 
               fprintf('%s selected...\n', bodyAreas{select})
               vec = DetermineUser(lowerBody, bodyAreas{select});
               userInput = changeUserInput(userInput, vec, lowerBodyOffset);                                             
       end
       
   end
    
end % end of selection

warning('Symptoms have been selected')

%% Algorithm 1 
% Description:
%   Take the user's input through the dataMatrix and find the illness
%   with the most matches. Matches are made when an illness and the
%   userInput have a 1 in the same place, indicating that there's that
%   symptom in that illness.

disp('Begin...')
totalMatch = matches(dataMatrix, userInput);

% get the index where the max occurred
indexOfMax = find(max(totalMatch) == totalMatch);
fprintf('The illness with the most matches was...%s\n',responseVector{indexOfMax})

% menu option for asking if they would like to display all the matches made
choice = menu('Display all illnesses and their matches?','Yes','No');
if(choice == 1)
    fprintf('\n')
    transposeMatch = totalMatch'; % needed to transpose the vector from a row vector to a column vector
    T = table(categorical(responseVector),transposeMatch,'VariableNames',{'Illnesses', 'Matches'});
    disp(T)
    fprintf('\n')
end

disp('End...')

%% Algorithm 2
% Description:
%   Each illness will be a point on a line with a certain distance. Each
%   point is obtained by multiplying each illness with a Multiplier vector
%   and summing the total of that vector to obtain a scalar. 

% %% Algorithm 3 ** Probably not going to work since each disease is unique...
% % Description:
% %   DataMatrix is fed into a classification tree algorithm which then
% %   produces a model. The UserInput vector is then fed into
% %   this model to make a prediction on what illness the user might have.
% 
% % Creation Tree
% disp('Creation of Tree...')
% tree = fitctree(dataMatrix, responseVector);
% disp('Creation done...')
% 
% % Prediction
% disp('Predict Illness...')
% label = predict(tree, userInput);
