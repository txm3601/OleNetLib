function [ output ] = cropIn( input, varargin )
%%
% input is a image
% varargin can be like this : 'location', 'center' 
% or 'crop_top', 'crop_bot' appear together

p = inputParser;
defaultLoc = false;
expectedLocations = 'center';

addOptional(p, 'top', -1);
addOptional(p, 'bot', -1);

addParameter(p,'location', defaultLoc,...
             @(x) any(validatestring(x, expectedLocations)));

parse(p, varargin{:})

%%
assert(ndims(input)>=2, 'input should be a matrix, at least 2 dimensionals');

[M N ~ ] = size(input);
if p.Results.location == 'center'
    M 
    
else
    assert(p.Results.location ~= -1 && strcmp(p.Results.location ~= -1), ...
        'bot and top should be appear the same time' );
     if ndims( input ) > 2
        output(:,:,1) = cropIn( input(:,:,1), crop_top, crop_bot );
        output(:,:,2) = cropIn( input(:,:,2), crop_top, crop_bot );
        output(:,:,3) = cropIn( input(:,:,3), crop_top, crop_bot ); 
     else
        ymin_up = floor( M * crop_top );
        ymin_down = floor( M * crop_bot );
        xmin = 0;%floor( N * crop_param  );
        rect_H= M - ymin_up - ymin_down;
        rect_W = N;% - xmin*2;
        rect = [xmin ymin_up rect_W rect_H];
        output = imcrop(input, rect);
    end

end


end

