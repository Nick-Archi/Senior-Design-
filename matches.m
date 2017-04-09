function [ vector ] = matches( illnesses, userInput )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%
%   Description: 
%       Function returns a vector that will contain the number of times
%       there was a match with a particular symptom, from the matrix that
%       contains all the illness and whether they have that symptom or not,
%       and the same symptom in the vector that contains the user's
%       response to the questions. 
%       
%       Essentially, it just compares each row of the dataMatrix with the
%       userInput to find the number of times there was a match.
%
%
%   Inputs:
%       illnesses -> logical matrix that contains the illnesses and
%       corresponding symptoms
%   
%       userInput -> vector that contains the selection from the user
%
%   Outputs:
%
%       vector -> vector that contains the number of matches that each
%       illness had with the userInput

    % take the size of the illness matrix
    [row, column] = size(illnesses);
    vector = [];
    
    % matches -> used to total the amount of matches
    matches = 0;
    
    % go through each row in the illness matrix
    for x = 1:1:row
        % copy a single row from illness matrix
        current = illnesses(x,:);
        
        matches = sum(current .* userInput);
        vector(x) = matches;
    end
    
end

