function Training_Data = ReadFace(Training_Path)
% ---------- Construct 2D matrix from all of the 1D image vectors in the training data file ------------
flist = dir(strcat(Training_Path,'\*.jpg'));
%strcat��Path�롢*.jpg��������
%dir��ȡ�����ļ��е��ļ���������һ��n*1��struct���飬�����������Ҫ�����ļ�����
Training_Data = [];
for imidx = 1:length(flist)
    fprintf('Constructing Training Image Data Space [%d] \n', imidx); 
    path = strcat(Training_Path,strcat('\',int2str(imidx),'.jpg'));%ÿ��ͼƬ�ľ���·��
    img = imread(path);
    [irow icol] = size(img);
    temp = reshape(img',irow*icol,1);   % ����άͼ��ת��һά����
    Training_Data = [Training_Data temp];   %��ÿһ��ͼƬ�����������ϵ�Training_Data����б���(128*128;n��ͼƬ)
end
fprintf('\n');