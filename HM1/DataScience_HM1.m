R1 = 20;
R2 = 15;
R3 = 25;
R4 = 20;
R5 = 30;
R6 = 40;
V2 = 0;
V3 = 200;
%% task1
% Varying V1 from 0 to 100 in steps of 2
V1_values = 0:2:100;
num_values = length(V1_values);

% Initialize a matrix to store results
currents = zeros(num_values, 3); % 3 columns for I1, I2, I3

for i = 1:num_values
    V1 = V1_values(i);
    
    % Define the coefficient matrix
    A = [R6+R1+R2, -R1, -R2;
         -R1, R3+R4+R1, -R4;
         -R2, -R4, R5+R4+R2];
    
    % Define the constant matrix
    B = [V1; V2; V3];
    
    % Solve the system of equations using the backslash operator
    currents(i, :) = A \ B;

    % 假设您想要将结果保存到名为 "currents.csv" 的文件中
    file_name = 'Direct_Solution.csv';

    % 将 currents 矩阵写入 CSV 文件
    csvwrite(file_name, currents);
end