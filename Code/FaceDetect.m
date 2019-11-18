
disp('Pick a Photo From to reco the people')
[filename, pathname] = uigetfile({'*.jpg'},'Pick a Testing Photo From Imagedata please');
Image = [pathname, filename];
img = imread(Image);
 

Training_dataPath = 'G:\GithubCode\Face-Recognition-Using-PCA\TrainData';

detector = vision.CascadeObjectDetector;
bboxes=detector(img);

% % 测试3：UpperBody
% release(detector);
% detector.ClassificationModel='UpperBody';
% detector.MergeThreshold=3;%适当增加合并阈值
% bboxes=detector(img);

[number, useless] = size(bboxes);
face=cell(1,number);

for i = 1:number
    bboxes(i,1) = bboxes(i,1)-20;
    bboxes(i,2) = bboxes(i,2)-20;
    bboxes(i,3) = bboxes(i,3)+40;
    bboxes(i,4) = bboxes(i,4)+40;
end

for i = 1:number
    face{i} = imcrop(img,bboxes(i,:));
end

for i = 1:number
    face{i} = imresize(face{i},[128,128]);
end

for i = 1:number
    grayimg = rgb2gray(face{i});
    BWimg = grayimg;
%     [width,height]=size(grayimg);
% 
%     T1=120;%阈值
%     for j=1:width
%         for k=1:height
%             if(grayimg(j,k)<T1)
%                 BWimg(j,k)= 0;
%             else
%                 BWimg(j,k)= 255;
%             end
%         end
%     end
    
    path = strcat(Training_dataPath,strcat('\',int2str(i),'.jpg'));
    imwrite(BWimg,path);
end
    
    
% ‘nearest’： 改变图像尺寸时采用最近邻插值算法；此为默认算法
% ‘bilinear’：采用双线性插值算法；
% ‘bicubic’： 采用双三次插值算法，
imshow(BWimg);
%FrontalFaceCART=insertObjectAnnotation(img,'rectangle',bboxes,'Face');
%imshow(FrontalFaceCART);title('FrontalFaceCART');