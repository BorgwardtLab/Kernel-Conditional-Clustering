function [X, y, z, k] = read_data(data)

if strcmp(data, 'Face')
    load('Face.mat');
    y = pose + 1;
    z = identity + 1;
    k = length(unique(y));  
elseif strcmp(data, 'Face4')
    load('Face.mat');
    y = pose + 1;
    z = identity + 1;
    X = X(identity<4, :);
    z = z(identity<4, :);
    y = y(identity<4);
    k = length(unique(y));          
elseif strcmp(data, 'Multi')
    load('Multi.mat');
    z = Z';
    y = y';
    k = length(unique(y));          
elseif strcmp(data, 'DLBCL')
    load('DLBCL.mat');
    z = Z';
    y = y';
    k = length(unique(y));        
elseif strcmp(data, 'Webkb')
    load('Webkb.mat');
    X = double(full(X));
    z = double(y2' + 1);
    y = double(y1' + 1);
    k = length(unique(y));     
elseif strcmp(data, 'Simu1')
    load('Simu1.mat');
    X = double(X);
    z = double(z' + 1);
    y = double(y' + 1);
    k = length(unique(y));    
elseif strcmp(data, 'Simu2')
    load('Simu2.mat');
    X = double(X);
    z = double(z' + 1);
    y = double(y' + 1);
    k = length(unique(y));  
elseif strcmp(data, 'Simu3')
    load('Simu3.mat');
    X = double(X);
    z = double(z');
    y = double(y' + 1);
    k = length(unique(y));      
end
