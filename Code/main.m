clear all
close all
clc

% Training_Path = 'G:\GithubCode\Face-Recognition-Using-PCA\TrainDatabase';%使用网上数据集
Training_Path = 'G:\GithubCode\Face-Recognition-Using-PCA\TrainData';  %使用自己做的数据集
Testing_Path = 'G:\GithubCode\Face-Recognition-Using-PCA\TestDatabase';    %Set your directory for testing data file



flist = dir(strcat(Training_Path,'\*.jpg'));

[Image,bboxes] = FaceDetect(1,Training_Path);

disp('Pick a Testing Photo From TestDatabase please')
[filename, pathname] = uigetfile({'*.jpg'},'Pick a Testing Photo From TestDatabase please');
disp('Hold a second for computing')
TestImage = [pathname, filename];
im = imread(TestImage);

% disp('Pick a Photo From to reco the people')
% [filename, pathname] = uigetfile({'*.jpg'},'Pick a Testing Photo From Imagedata please');
% disp('Hold a second for computing')
% TestImage = [pathname, filename];
% im = imread(TestImage);

Training_Data = ReadFace(Training_Path);
[m, A, Eigenfaces] = EigenfaceCore(Training_Data);
[OutputName,OutputNumber] = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(Training_Path,'\',OutputName);
SelectedImage = imread(SelectedImage);

%Visualize_Eigenface(Eigenfaces,128,128);

figure('name','Recognition Result')
subplot(1,3,1);
imshow(im)
title('Test Image');

subplot(1,3,2);
imshow(SelectedImage);
title('Recognition Result');
disp('Done')
ShowImg(OutputNumber,bboxes,Image);
