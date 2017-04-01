%% Diagnose Senior Design Project
% listdlg function for menu option?
clear
clc

% loading of data
dataMatrix = xlsread('DataMatrix.xlsx');
[num1,txt1,raw1] = xlsread('DataMatrixInformation.xlsx');
[num2,txt2,responseVector] = xlsread('ResponseVector.xlsx');

% extracting information 
symptoms = txt1(1,2:end);
generalBody = symptoms(:,1:28);
head = symptoms(:,29:49);
arms = [];
torso = symptoms(:,50:56);
lowerBody = symptoms(:,57:end);

% defining of variables
bodyAreas = {'General Body', 'Head', 'Arms', 'Torso', 'Lower Body'};
userInput = zeros(1,length(symptoms));

% creation of menu
start = 1;

while(start == 1)
   [select, ok] = listdlg('PromptString', 'Select an area',...
       'SelectionMode', 'single',...
       'ListString',bodyAreas);
    
   if ok == 0
       warning('Program Terminated')
       start = 0;
   
   else
       switch select
           case 1
               disp(bodyAreas{select})
               vec = DetermineUser(generalBody);
           case 2 
               disp(bodyAreas{select})
           case 3
               disp(bodyAreas{select})
           case 4
               disp(bodyAreas{select})
           case 5 
               disp(bodyAreas{select})
               
       end
   end
    
end