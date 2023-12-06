% Define the financial function
F = @(x) 2 * x.^2 .* sin(x) + 0.8 * x.^3;

% Define numerical differentiation methods
central_difference = @(f, x, delta_x) (f(x + delta_x) - f(x - delta_x)) / (2 * delta_x);

% Define the interval [1, 5] and step size
x_values = linspace(1, 5, 100);
delta_x = 0.01; % Choose a small delta_x for accuracy

% Compute financial flux using central difference
financial_flux = (central_difference(@(x) central_difference(F, x, delta_x), x_values + delta_x, delta_x) ...
                 - central_difference(@(x) central_difference(F, x, delta_x), x_values - delta_x, delta_x)) / (2 * delta_x);

% Plot financial function and financial flux
figure;
yyaxis left;
plot(x_values, F(x_values), 'LineWidth', 2, 'DisplayName', 'F(x)');
ylabel('Function Value');

yyaxis right;
plot(x_values, financial_flux, '--', 'LineWidth', 2, 'DisplayName', '\Phi(x)');
ylabel('Financial Flux');

xlabel('x');
title('Financial Function and Financial Flux');
legend();
grid on;
