function [x,y] = cursorValues4e(f)
%When click, output the row and columb number and pixel value
imshow(f)
[x,y] = ginput(4);
close(figure)
end

