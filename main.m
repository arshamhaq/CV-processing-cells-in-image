clc; clear; close all;
I = im2double(imread("Cells.tif"));
% imshow(I,[])
excel_writer(I,"the_file.xlsx");