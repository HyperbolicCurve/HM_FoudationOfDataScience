% Define the financial function
F = @(x) 2 * x.^2 .* sin(x) + 0.8 * x.^3;

% Define numerical differentiation methods
forward_difference = @(f, x, delta_x) (f(x + delta_x) - f(x)) / delta_x;
backward_difference = @(f, x, delta_x) (f(x) - f(x - delta_x)) / delta_x;
central_difference = @(f, x, delta_x) (f(x + delta_x) - f(x - delta_x)) / (2 * delta_x);

% Define the interval [1, 5]
x_values = linspace(1, 5, 100);

% Define different step sizes
delta_x_values = [0.02, 0.2, 0.5];

% Plot for each delta_x
for i = 1:length(delta_x_values)
    delta_x = delta_x_values(i);

    % Calculate gradients
    gradient_forward = forward_difference(F, x_values, delta_x);
    gradient_backward = backward_difference(F, x_values, delta_x);
    gradient_central = central_difference(F, x_values, delta_x);

    % Plot financial function
    figure;
    plot(x_values, F(x_values), 'LineWidth', 2, 'DisplayName', 'F(x)');
    hold on;

    % Plot gradients
    plot(x_values, gradient_forward, '--', 'DisplayName', ['Forward, \Deltax=', num2str(delta_x)]);
    plot(x_values, gradient_backward, '--', 'DisplayName', ['Backward, \Deltax=', num2str(delta_x)]);
    plot(x_values, gradient_central, '--', 'DisplayName', ['Central, \Deltax=', num2str(delta_x)]);

    xlabel('x');
    ylabel('Function Value / Gradient');
    title(['Financial Function and Numerical Gradients (\Deltax=', num2str(delta_x), ')']);
    legend();
    grid on;

    hold off;
end
