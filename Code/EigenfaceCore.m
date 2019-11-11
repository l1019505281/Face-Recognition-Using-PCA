function [m, A, Eigenfaces] = EigenfaceCore(Training_Data)

%----------------------------�����ֵͼ�� ------------------------
% ---------------------����Э������� --------------------------
m = mean(Training_Data,2);%��ÿһ�еľ�ֵ
% [a, b] = size(Training_Data);
% disp([ 'T_D:',num2str(a), ',', num2str(b)]);
% [a, b] = size(m);
% disp([ 'm:',num2str(a), ',',num2str(b)]);
Train_Number = size(Training_Data,2);%�ж�����ͼƬ
temp_m = [];  
for i = 1 : Train_Number
    temp_m = [temp_m m];%����ֵת������traini_data��ͬά���ľ���
end
A = double(Training_Data) - temp_m;%ԭʼ����-��ֵ

%-------------------��SVD����������
%--------------------��Э������������ֵ
disp('Computing...Wait a second please')
L = A'*A;%Э�������
%size(L)
[V D] = eig(L); %�����L��ȫ������ֵ�����ɶԽ���D������A��������������V����������

%-----------------------------������������ֵ---------------
Eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1000 ) % ������ֵ
        Eig_vec = [Eig_vec V(:,i)]; %��V��ÿһ�е�����ֵת��һά���б�
    end
end

Eigenfaces = A * Eig_vec;%���������õ�c������Ϊh��������(V1...Vn)
                          %y=test*Eig_vec����y��vi�ľ��룬��С��vi���Ǹ������ķ��������