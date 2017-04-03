function [ vectorOut ] = DetermineUser( symptoms, area )
%   DetermineUser function is used to ask the user
%   to select all of the symptoms that they are experiencing
%   after determining which body area the user selected in the
%   previous stage...

%   inputs: 
%   bodyArea -> cell array that contains the symptoms
%   area -> string that contains the body area selected
%
%   outputs:
%   vectorOut -> vector that has the indicies that were selected


[vectorOut, ok] = listdlg('PromptString', area,...
       'SelectionMode', 'multiple',...
       'ListString',symptoms);
end

