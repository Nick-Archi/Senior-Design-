function [ updated ] = changeUserInput( userInput, sel, offset )
%   changeUserInput, update the UserInput vector based on whether a 
%   selection was made on a symptom. 
%   
%   If a selection is made on a symptom that wasn't selected before
%   then it selects that symptom. If a selection is made on a symptom
%   that was already selected then it deselects it.
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
    
    % grabs current value in userInput vector and switches it
    userInput(sel(value)) = inverter(userInput(sel(value))); 
        
end

% update the values
updated = userInput;

end

