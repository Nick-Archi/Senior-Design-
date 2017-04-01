function [ updated ] = changeUserInput( userInput, sel, offset )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%
%   input
%   userInput -> vector of 0s and 1s that is to be updated
%   sel -> vector that contains the selection to be updated   
%   offset -> number that corresponds to the body category selected in
%   order to correctly change the right entry

%   output
%   updated -> contains the updated userInput vector

% offset the values...
sel = sel + offset;

for value = 1:1:length(sel)
    
    userInput(sel(value)) = inverter(userInput(sel(value)));
        
end

updated = userInput;

end

