%clear all
data = csvread('out.csv');
% 490 rain_x = zeros(490,9); % Creating features for Binary classification training
Data_x = zeros(490,10); % Creating labels for Binary classification training
for ii = 1: 490
    for j = 1:10
        Data_x(ii,j) = data(ii,j);   %Read training label y
    end
end


for ii = 1: 490
    for j = 1:10
        Train_x(ii,j) = data(ii,j);   %Read training label y
    end
end

Data_y = zeros(490,1); % Creating labels for Binary classification training
for ii = 1: 490
        Data_y(ii,1) = data(ii,11);   %Read training label y
end

Train_y = zeros(490,1); % Creating labels for Binary classification training
for ii = 1: 490
        Train_y(ii,1) = data(ii,11);   %Read training label y
end


% 70 Validation data available
Validation_x = zeros(70,10); % Creating features for Binary classification training
for ii = 1:70
    for j = 1:10
        Validation_x(ii,j) = data(490+ii,j);   %Read training label y
    end
end

Validation_y = zeros(70,1); % Creating labels for Binary classification training
for ii =  1:70
        Validation_y(ii,1) = data(490+ii,11);   %Read training label y
end

% 140 Test data available
Test_x = zeros(125,1);
for ii = 1:125
    for j = 1:10
        Test_x(ii,j) = data(560+ii,j);   %Read training label y
    end
end
Test_y = zeros(125,1);
for ii = 1:125
        Test_y(ii,1) = data(560+ii,11);   %Read training label y
end

Feature_sort = unique(Train_x(:,2));

%% First Layer with complete Training example as node

T = [1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5];
% check the IG for each feature with respective threshold
boundry = [0,0];
converge0 =0; 
while(~converge0)
    [Train_x1,Train_y1,Train_x2,Train_y2, row, col] = CPTS570HW2Q2_1(Train_x,Train_y, Feature_sort,T);
    boundry = [boundry;row col];
    check = sum(Train_y1(:,1)== 2);
    check1 = sum(Train_y1(:,1)== 4);
    check2 = sum(Train_y2(:,1)== 2);
    check3 = sum(Train_y2(:,1)== 4);
    converge1 = 0;converge2 = 0;
    if check == 0 && check1 == length(Train_y1(:,1))
        converge1 = 1;
    end
    if check == length(Train_y1(:,1)) && check1 == 0
       converge1 = 1;
    end
    if check2 == 0 && check3 == length(Train_y2(:,1))
        converge2 = 1;
    end
    if check2 == length(Train_y2(:,1)) && check3 == 0
       converge2 = 1;
    end
    if converge1 ~= 1 && converge2 == 1
       Train_x = Train_x1;
       Train_y = Train_y1;
    else
       Train_x = Train_x2;
       Train_y = Train_y2;
    end
    if converge1 == 1 && converge2 == 1
        converge0 =1;
    end
    
end

%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:70
    if Validation_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Validation_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Validation_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Validation_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Validation_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Validation_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Validation_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Validation_x(ii,boundry(9,1)+1) < T(boundry(9,2))
                                    if Validation_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Validation_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                           y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
   end
    
   if y_pred ~= Validation_y(ii,1)
       error = error + 1;
   end
end

Acc_val = 1-(error/70);

%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:124
    if Test_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Test_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Test_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Test_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Test_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Test_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Test_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Test_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Test_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Test_x(ii,boundry(11,1)+1) <T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                           end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Test_y(ii,1)
       error = error + 1;
   end
end

Acc_test = 1-(error/125);

error = 0;
for ii = 1:490
    if Data_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Data_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Data_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Data_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Data_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Data_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Data_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Data_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Data_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Data_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Data_y(ii,1)
       error = error + 1;
   end
end

Acc_train = 1-(error/490);

y = [Acc_test,Acc_val,Acc_train];


%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:70
    if Validation_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Validation_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Validation_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Validation_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Validation_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Validation_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            %if Validation_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Validation_x(ii,boundry(9,1)+1) < T(boundry(9,2))
                                    if Validation_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Validation_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            %else
                             %   y_pred = 4;
                            %end
                        else
                           y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
   end
    
   if y_pred ~= Validation_y(ii,1)
       error = error + 1;
   end
end

Acc_val = 1-(error/70);

%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:124
    if Test_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Test_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Test_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Test_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Test_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Test_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            %if Test_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Test_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Test_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Test_x(ii,boundry(11,1)+1) <T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            %else
                                y_pred = 4;
                           %end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Test_y(ii,1)
       error = error + 1;
   end
end

Acc_test = 1-(error/125);

error = 0;
for ii = 1:490
    if Data_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Data_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Data_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Data_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Data_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Data_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            %if Data_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Data_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Data_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Data_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            %else
                             %   y_pred = 4;
                            %end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Data_y(ii,1)
       error = error + 1;
   end
end

Acc_train = 1-(error/490);

y1 = [Acc_test,Acc_val,Acc_train];


%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:70
    if Validation_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Validation_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Validation_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Validation_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    %if Validation_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Validation_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Validation_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Validation_x(ii,boundry(9,1)+1) < T(boundry(9,2))
                                    if Validation_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Validation_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                           y_pred = 4;
                        end
                    %else
                     %   y_pred = 4;
                    %end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
   end
    
   if y_pred ~= Validation_y(ii,1)
       error = error + 1;
   end
end

Acc_val = 1-(error/70);

%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:124
    if Test_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Test_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Test_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Test_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    %if Test_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Test_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Test_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Test_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Test_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Test_x(ii,boundry(11,1)+1) <T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                           end
                        else
                            y_pred = 4;
                        end
                    %else
                     %   y_pred = 4;
                    %end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Test_y(ii,1)
       error = error + 1;
   end
end

Acc_test = 1-(error/125);

error = 0;
for ii = 1:490
    if Data_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Data_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Data_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Data_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    %if Data_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Data_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Data_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Data_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Data_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Data_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                            y_pred = 4;
                        end
                    %else
                        %y_pred = 4;
                    %end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Data_y(ii,1)
       error = error + 1;
   end
end

Acc_train = 1-(error/490);

y2 = [Acc_test,Acc_val,Acc_train];

%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:70
    if Validation_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Validation_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Validation_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Validation_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Validation_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Validation_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Validation_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Validation_x(ii,boundry(9,1)+1) < T(boundry(9,2))
                                    if Validation_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        %if Validation_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                         %   y_pred = 2;
                                        %else
                                         %   y_pred = 2;
                                        %end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                           y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
               y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
   end
    
   if y_pred ~= Validation_y(ii,1)
       error = error + 1;
   end
end

Acc_val = 1-(error/70);

%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:124
    if Test_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Test_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Test_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Test_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Test_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Test_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Test_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Test_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Test_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        %if Test_x(ii,boundry(11,1)+1) <T(boundry(11,2))
                                         %   y_pred = 2;
                                        %else
                                         %   y_pred = 2;
                                        %end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                           end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Test_y(ii,1)
       error = error + 1;
   end
end

Acc_test = 1-(error/125);

error = 0;
for ii = 1:490
    if Data_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Data_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            if Data_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Data_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Data_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Data_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Data_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Data_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Data_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        %if Data_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                         %   y_pred = 2;
                                        %else
                                         %   y_pred = 2;
                                        %end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            else
                y_pred = 4;
            end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Data_y(ii,1)
       error = error + 1;
   end
end

Acc_train = 1-(error/490);

y3 = [Acc_test,Acc_val,Acc_train];




%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:70
    if Validation_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Validation_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            %if Validation_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Validation_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Validation_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Validation_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Validation_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Validation_x(ii,boundry(9,1)+1) < T(boundry(9,2))
                                    if Validation_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Validation_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                           y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            %else
             %   y_pred = 4;
            %end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
   end
    
   if y_pred ~= Validation_y(ii,1)
       error = error + 1;
   end
end

Acc_val = 1-(error/70);

%% 10 boundries, 10 leaf nodes
% Validation Accuracy
error = 0;
for ii = 1:124
    if Test_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Test_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            %if Test_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Test_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Test_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Test_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Test_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Test_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Test_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Test_x(ii,boundry(11,1)+1) <T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                           end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            %else
             %   y_pred = 4;
            %end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Test_y(ii,1)
       error = error + 1;
   end
end

Acc_test = 1-(error/125);

error = 0;
for ii = 1:490
    if Data_x(ii,boundry(2,1)+1) < T(boundry(2,2))
        if Data_x(ii,boundry(3,1)+1) < T(boundry(3,2))
            %if Data_x(ii,boundry(4,1)+1) < T(boundry(4,2))
                if Data_x(ii,boundry(5,1)+1) < T(boundry(5,2))
                    if Data_x(ii,boundry(6,1)+1) < T(boundry(6,2))
                        if Data_x(ii,boundry(7,1)+1) < T(boundry(7,2))
                            if Data_x(ii,boundry(8,1)+1) < T(boundry(8,2))
                                if Data_x(ii,boundry(9,1)+1)< T(boundry(9,2))
                                    if Data_x(ii,boundry(10,1)+1) < T(boundry(10,2))
                                        if Data_x(ii,boundry(11,1)+1) < T(boundry(11,2))
                                            y_pred = 2;
                                        else
                                            y_pred = 2;
                                        end
                                    else
                                        y_pred = 4;
                                    end
                                else
                                    y_pred = 4;
                                end
                            else
                                y_pred = 4;
                            end
                        else
                            y_pred = 4;
                        end
                    else
                        y_pred = 4;
                    end
                else
                    y_pred = 4;
                end
            %else
             %   y_pred = 4;
            %end
        else
            y_pred = 4;
        end
    else
        y_pred = 4;
    end
    
   if y_pred ~= Data_y(ii,1)
       error = error + 1;
   end
end

Acc_train = 1-(error/490);

y4 = [Acc_test,Acc_val,Acc_train];
labels={'ID3'; 'Prunning branch 8'; 'Prunning branch 6';'Prunning branch 10'; 'Prunning branch 4'};
yy = [y;y1; y2;y3;y4];
barh(yy);
set(gca,'yticklabel',labels);
xlabel('Accuracy bar plot for Decision trees');
xlim([0 1])
legend('Testing','Validation','training');

