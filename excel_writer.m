function [] = excel_writer(I,address)
the_table = {'cell number' , 'area', 'average brightness /255'};
% the_cell = [the_cell ; {1 2 3}];
[count, J] = cell_counter(I);
all_area = zeros(count,1);
all_average = zeros(count,1);
all_index = 1:count;
all_index = all_index.';
for i = 1:size(J,1)
    for j = 1:size(J,2)
        if J(i,j) ~= 0
            all_area(J(i,j)) = all_area(J(i,j)) + 1;
        end
    end
end

for i = 1:count
    the_mask = J;
    the_mask(the_mask~=i) = 0;
    the_mask(the_mask~=0) = 1;
    the_mask = the_mask .* I;
    all_average(i) = sum(sum(the_mask))/all_area(i);
end
all_average = 255 * all_average;
main_table = num2cell([all_index all_area all_average]);
writecell([the_table ; main_table],address,'Sheet',1,'WriteMode','overwritesheet');
end