%% clear workspace , and command window, close all figures already open.
close all, clear all, clc;
%% read the RGB image and create figure
frame = imread('inputPS0Q2.jpg');
figure(1);
%% swap channels
% the problem can be solved by two different approach
% 1 - built-in permute function
% 2 - traditional channel swapping
R = frame(:,:,1);
G = frame(:,:,2);
B = frame(:,:,3);
frameSwapped(:,:,1) = G;
frameSwapped(:,:,2) = R;
frameSwapped(:,:,3) = B;
imwrite(frameSwapped, 'swapImgPS0Q2.png');
subplot(3,2,1), imshow(frameSwapped);
title('R and G channels Swapped');
%% Convert RGB frame to Grayscale
frameGray =  rgb2gray(frame);
imwrite(frameGray, 'grayImgPS0Q2.png');
subplot(3,2,2), imshow(frameGray);
title('Grayscale Frame');
% the problem can be solved by two different approach
% 1 - built-in imcomplement function
% 2 - exploiting Matlab data class features
frameNegative = 255-frameGray;
imwrite(frameNegative, 'negativeImgPS0Q2.png');
subplot(3,2,3), imshow(frameNegative);
title('Negative Frame');
%% Flip the frame
frameFlipped = fliplr(frameGray); 
imwrite(frameFlipped, 'mirrorImgPS0Q2.png');
subplot(3,2,4), imshow(frameFlipped);
title('Flipped Frame');
%% Average Gray Frame with Flipped
frameAverage = (frameGray+frameFlipped)/2;
imwrite(frameAverage, 'avgImgPS0Q2.png');
subplot(3,2,5), imshow(frameAverage);
title('Averaged Frame (Gray+Flipped)/2');
%% Add Noise
N = uint8(randi(255, size(frameGray)));
save('noise.mat', 'N');
frameClipped = frameGray+N;
imwrite(frameClipped, 'addNoiseImgPS0Q2.png');
subplot(3,2,6), imshow(frameClipped);
title('Noisy Frame');