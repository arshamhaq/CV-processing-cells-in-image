function [J_,guide_table_] = filler(I,J,guide_table,i,j,count)
J_ = J;
guide_table_ = guide_table;
%--------------------------------
J_(i,j) = count;
guide_table_(i,j) = 0;
try%---------------------------UP
    if guide_table_(i - 1,j) == 1
        [J_,guide_table_] = filler(I,J_,guide_table_,i-1,j,count);
    end
catch
end
try%---------------------------LEFT
    if guide_table_(i,j-1) == 1
        [J_,guide_table_] = filler(I,J_,guide_table_,i,j - 1,count);
    end
catch
end
try%---------------------------Right
    if guide_table_(i,j + 1) == 1
        [J_,guide_table_] = filler(I,J_,guide_table_,i,j + 1,count);
    end
catch
end
try%---------------------------DOWN
    if guide_table_(i + 1,j) == 1
        [J_,guide_table_] = filler(I,J_,guide_table_,i+1,j,count);
    end
catch
end
end