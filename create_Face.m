path = [pwd '/faces_4/'];
folderlist = dir(path);
data = zeros(624, 960);
identity = zeros(624, 1);
pose = zeros(624, 1);
expression = zeros(624, 1);
eye = zeros(624, 1);
count = 1;
id = cell(624, 1);
for i = 1:length(folderlist)
    namei = folderlist(i).name;
    if namei(1) ~= '.'
        pathi = strcat(path, '/', namei);
        filelist = dir(pathi);
        for j = 1:length(filelist)
            namej = filelist(j).name;
            b = strfind(namej, '4.pgm');
%             sl = length(namej(1));
%             pl = length('_4.pgm');
%             b = (sl >= pl && strcmp(s(sl-pl+1:sl), '_4.pgm')) || isempty('_4.pgm');
            if namej(1) ~= '.' & b 
                file = strcat(pathi, '/', namej);
                image = imread(file);
                vec = reshape(image, [1, 960]);
                data(count, :) = vec;
                identity(count) = i;
                id{count} = namej;
                if ~isempty(strfind(namej, 'straight'))
                    pose(count) = 0;
                elseif ~isempty(strfind(namej, 'left'))
                    pose(count) = 1;
                elseif ~isempty(strfind(namej, 'right'))
                    pose(count) = 2;
                elseif ~isempty(strfind(namej, 'up'))
                    pose(count) = 3;
                else
                    disp('error!')
                end
                if ~isempty(strfind(namej, 'neutral'))
                    expression(count) = 0;
                elseif ~isempty(strfind(namej, 'happy'))
                    expression(count) = 1;
                elseif ~isempty(strfind(namej, 'sad'))
                    expression(count) = 2;
                elseif ~isempty(strfind(namej, 'angry'))
                    expression(count) = 3;
                else
                    disp('error!')
                end
                if ~isempty(strfind(namej, 'open'))
                    eye(count) = 0;
                elseif ~isempty(strfind(namej, 'sunglasses'))
                    eye(count) = 1;
                else
                    disp('error!')
                end                
                count = count + 1;
            end
        end
    end
end
identity = identity - min(identity);
X = data;
save('Face.mat', 'X', 'identity', 'pose', 'expression', 'eye');
exit()
