function [ output ] = inverter( input )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   Basically a simple inverter
%   Allows for selecting and deselecting of symptoms based on the users
%   choice

%   input:
%   input -> logical 

%   output:
%   output -> logical

switch(input)
    
    case 0        
        output = 1;
        
    case 1
        output = 0;
        
end

end

