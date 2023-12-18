% Define the financial function
F = @(x) 2 * x.^2 .* sin(x) + 0.8 * x.^3;
Gradient = @(x) 4 * x .* sin(x) + 2 * x.^2 .* cos(x) + 2.4 * x.^2; 

% Define numerical differentiation methods with consideration for endpoints
one_sided_difference_start = @(f, x, delta_x) (f(x + delta_x) - f(x)) / delta_x;
one_sided_difference_end = @(f, x, delta_x) (f(x) - f(x - delta_x)) / delta_x;

% Define numerical differentiation method (central difference)
central_difference = @(f, x, delta_x) (f(x + delta_x) - f(x - delta_x)) / (2 * delta_x);

% Define the interval [1, 5] and step size
x_values = linspace(1, 5, 100);
delta_x = 0.01; % Choose a small delta_x for accuracy

% Compute financial flux using one-sided difference at the start
financial_flux_start = one_sided_difference_start(@(x) Gradient(x), x_values(1), delta_x);

% Compute financial flux using one-sided difference at the end
financial_flux_end = one_sided_difference_end(@(x) Gradient(x), x_values(end), delta_x);

% Compute financial flux using central difference for the interior points
financial_flux_interior = central_difference(@(x) Gradient(x), x_values(2:end-1), delta_x);

% Concatenate all parts of financial flux
financial_flux = [financial_flux_start, financial_flux_interior, financial_flux_end];

% Plot financial function and financial flux
figure;
yyaxis left;
plot(x_values, Gradient(x_values), 'LineWidth', 2, 'DisplayName', 'Gradient(x)');
ylabel('Flux Value');

yyaxis right;
plot(x_values, financial_flux, '--', 'LineWidth', 2, 'DisplayName', 'f``(x)');
ylabel('Financial Flux');

xlabel('x');
title('Gradient Function and Financial Flux');
legend();
grid on;
