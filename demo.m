close all
clear
clc

%% get demo image
bw = imread('demo.png');
bw = im2bw(bw);
bw = imdilate(bw, strel('disk', 1));

%% set up parameters for line detection

p = struct();
p.theta_step = 0.5; % resolution for theta values (selectivity of line angles)
p.peak_threshold = 0.3; % threshold for peak detection (0.3 - 30% of max intensity)
p.line_fillgap = 10; % if two adjucent lines have distance smaller - merge them
p.line_minlength = 10; % if line is smaller than this, do not count it
p.split_bw = 1; % split image into segments or not
p.show_bw_plots = 1; % show plot with found lines for first 20 segments (for debugging)
p.angletol = 10; % if two lines cross each other with angle smaller than this, merge them

%% detect lines
bwlines = getlinesforbw(bw, p);
disp(bwlines);

%% show the detected lines
figure
showfoundlines(bw, bwlines)