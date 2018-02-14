% partition data matrix into 10 folds
function [p_0, p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8, p_9] = partition (data)

    % can put n into parameters for true implementation of
    % n-fold partition
    n = 10;

    data_rows = size(data,1);
    part_rows = floor(data_rows/n);
    part = zeros(n-1);
    for i = 1:(n-1)
        part(i) = part_rows * i;
    end
    
    p_0 = data(1:part(1),:);
    p_1 = data(part(1)+1:part(2),:);
    p_2 = data(part(2)+1:part(3),:);
    p_3 = data(part(3)+1:part(4),:);
    p_4 = data(part(4)+1:part(5),:);
    p_5 = data(part(5)+1:part(6),:);
    p_6 = data(part(6)+1:part(7),:);
    p_7 = data(part(7)+1:part(8),:);
    p_8 = data(part(8)+1:part(9),:);
    p_9 = data(part(9)+1:end,:);

end