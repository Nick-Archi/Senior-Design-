%% Diagnose Senior Design Project
% Editors: 
%   Nicholas Arcibong
% listdlg function for menu option?

clear
clc

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

%% begin algorithm

