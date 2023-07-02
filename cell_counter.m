function [count,J] = cell_counter(I)
thresh = multithresh(I,5);
I = imquantize(I,thresh(1));
I = I - 1;
SE = strel('disk',7);
SE2 = strel('disk',4);
I = imerode(I,SE);
I = imdilate(I,SE2);

imshow(I,[])
J = my_bwlabel(I);
count = max(max(J));
figure, imshow(J,[])
end