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
num_iteration = 0;
% Define the coefficient matrix
A = [R6+R1+R2, -R1, -R2;
    -R1, R3+R4+R1, -R4; 
    -R2, -R4, R5+R4+R2];

% Initialize a matrix to store results
currents = zeros(num_values, 3); % 3 columns for I1, I2, I3

for i = 1:num_values
    V1 = V1_values(i);
  
    % Define the constant matrix
    B = [V1; V2; V3];
    
    % Initialize solution vector
    x = zeros(3, 1);
    
    % Set maximum number of iterations and tolerance
    max_iterations = 10000;
    tolerance = 1e-6;
    
    % Perform Gauss iteration
    for iter = 1:max_iterations
        x_new = zeros(3, 1);
        
        for j = 1:3
            sum_term = 0;
            for k = 1:3
                if k ~= j
                    if k < j
                        sum_term = sum_term + A(j, k) * x_new(k);
                    elseif k > j
                        sum_term = sum_term + A(j, k) * x(k);
                    end
                end
            end
            x_new(j) = (B(j) - sum_term) / A(j, j);
        end
        
        % Check for convergence
        if norm(x_new - x) < tolerance
            break;
        end
        x = x_new;
    end
    currents(i, 4) = iter;
    % Store current values in the matrix
    currents(i,1) = x(1);
    currents(i,2) = x(2);
    currents(i,3) = x(3);

    % 假设您想要将结果保存到名为 "currents.csv" 的文件中
    file_name = 'Gauss.csv';

    % 将 currents 矩阵写入 CSV 文件
    csvwrite(file_name, currents);
end
