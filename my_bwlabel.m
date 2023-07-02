function [J] = my_bwlabel(I)
J = I;
guide_table = I;
count = 1;
while(any(guide_table,"all"))
    the_flag = 0;
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            if(guide_table(i,j) == 1)
                curr_i = i;
                curr_j = j;
                the_flag = 1;
                break;
            end
           
        end
        if the_flag == 1
            break;
        end
    end
    %----------------------------choose one pixel in image to fill the
    %region
    %---------------------------------------------------------------
    [J,guide_table] = filler(I,J,guide_table,curr_i,curr_j,count);
    count = count + 1;
    disp(count - 1)
end
end