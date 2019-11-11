function Training_Data = ReadFace(Training_Path)
% ---------- Construct 2D matrix from all of the 1D image vectors in the training data file ------------
flist = dir(strcat(Training_Path,'\*.jpg'));
%strcat将Path与、*.jpg连接起来
%dir读取所在文件夹的文件并保存在一个n*1的struct数组，这里的作用主要是算文件数量
Training_Data = [];
for imidx = 1:length(flist)
    fprintf('Constructing Training Image Data Space [%d] \n', imidx); 
    path = strcat(Training_Path,strcat('\',int2str(imidx),'.jpg'));%每个图片的具体路径
    img = imread(path);
    [irow icol] = size(img);
    temp = reshape(img',irow*icol,1);   % 将二维图像转成一维向量
    Training_Data = [Training_Data temp];   %将每一个图片的向量都整合到Training_Data这个列表里(128*128;n张图片)
end
fprintf('\n');