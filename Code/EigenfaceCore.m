function [m, A, Eigenfaces] = EigenfaceCore(Training_Data)

%----------------------------计算均值图像 ------------------------
% ---------------------计算协方差矩阵 --------------------------
m = mean(Training_Data,2);%求每一行的均值
% [a, b] = size(Training_Data);
% disp([ 'T_D:',num2str(a), ',', num2str(b)]);
% [a, b] = size(m);
% disp([ 'm:',num2str(a), ',',num2str(b)]);
Train_Number = size(Training_Data,2);%有多少张图片
temp_m = [];  
for i = 1 : Train_Number
    temp_m = [temp_m m];%将均值转化成与traini_data相同维数的矩阵
end
A = double(Training_Data) - temp_m;%原始数据-均值

%-------------------用SVD求特征向量
%--------------------求协方差矩阵的特征值
disp('Computing...Wait a second please')
L = A'*A;%协方差矩阵
%size(L)
[V D] = eig(L); %求矩阵L的全部特征值，构成对角阵D，并求A的特征向量构成V的列向量。

%-----------------------------排序并消除特征值---------------
Eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1000 ) % 设置阈值
        Eig_vec = [Eig_vec V(:,i)]; %将V中每一列的特征值转成一维的列表
    end
end

Eigenfaces = A * Eig_vec;%特征脸，得到c个长度为h的列向量(V1...Vn)
                          %y=test*Eig_vec，求y与vi的距离，最小的vi就是该人脸的分类的类标号