clc
clear all
% Data preperation
x = (0.1:1/22:1);
d = (1 + 1.5*sin(3*pi*x/2)) + 2.5*sin(2.8*pi*x)/0.5;
% More difficult function below, 4 neurons are not enough for full
% approximation.
% x = [0.1:1/152:1];
% d =  ((2 + 0.3*cos(2*pi*x/0.2)) + 0.5*sin(4*pi*x + 2)./9)+2;
figure(1), plot(x, d, 'r*'), grid on;
% First layer
w11_1 = randn(1);
w21_1 = randn(1);
w31_1 = randn(1);
w41_1 = randn(1);
w51_1 = randn(1);
b1_1 = randn(1);
b2_1 = randn(1);
b3_1 = randn(1);
b4_1 = randn(1);
b5_1 = randn(1);
% Second layer
w11_2 = randn(1);
w12_2 = randn(1);
w13_2 = randn(1);
w14_2 = randn(1);
w15_2 = randn(1);
b1_2 = randn(1);
cycle = 0;
n = 0.002;
%% Network's response
for ind = 1:100000;
for indx = 1:length(x)
    v1_1 = x(indx)* w11_1 + b1_1;
    v2_1 = x(indx)* w21_1 + b2_1;
    v3_1 = x(indx)* w31_1 + b3_1;
    v4_1 = x(indx)* w41_1 + b4_1;
    % Activation functions
    y1_1 = tanh(v1_1);
    y2_1 = tanh(v2_1);
    y3_1 = tanh(v3_1);
    y4_1 = tanh(v4_1);
    % Second layer
    v1_2 = y1_1*w11_2+y2_1*w12_2+y3_1*w13_2+y4_1*w14_2+b1_2;
    % Output Activation function
    y1_2 = 3*v1_2+2; %3*x+2
    % Error calculation
    y = y1_2;
    e = d(indx) - y;
    % Error output layer gradient calculation
    delta1_2 = 3*e;
    % Error hidden layer gradient calculation
    delta1_1 = (1-(tanh(v1_1))^2)*delta1_2*w11_2;
    delta2_1 = (1-(tanh(v2_1))^2)*delta1_2*w12_2;
    delta3_1 = (1-(tanh(v3_1))^2)*delta1_2*w13_2;
    delta4_1 = (1-(tanh(v4_1))^2)*delta1_2*w14_2;
   % Update output layer weights
    w11_2 = w11_2 + n.*delta1_2.*y1_1;
    w12_2 = w12_2 + n.*delta1_2.*y2_1;
    w13_2 = w13_2 + n.*delta1_2.*y3_1;
    w14_2 = w14_2 + n.*delta1_2.*y4_1;
    b1_2 = b1_2 + n.*delta1_2;
   % Update hidden layer weights
   w11_1 = w11_1 + n*delta1_1*x(indx);
   w21_1 = w21_1 + n*delta2_1*x(indx);
   w31_1 = w31_1 + n*delta3_1*x(indx);
   w41_1 = w41_1 + n*delta4_1*x(indx);
   b1_1 = b1_1 + n*delta1_1;
   b2_1 = b2_1 + n*delta2_1;
   b3_1 = b3_1 + n*delta3_1;
   b4_1 = b4_1 + n*delta4_1;
    cycle = cycle+1;
end
end
cycle2 = 0;
%% Y = zeros(1,length(x));
for indx = 1:length(x)
    v1_1 = x(indx)* w11_1 + b1_1;
    v2_1 = x(indx)* w21_1 + b2_1;
    v3_1 = x(indx)* w31_1 + b3_1;
    v4_1 = x(indx)* w41_1 + b4_1;
    % Activation functions
    y1_1 = tanh(v1_1);
    y2_1 = tanh(v2_1);
    y3_1 = tanh(v3_1);
    y4_1 = tanh(v4_1);
    % Second layer
    v1_2 = y1_1*w11_2+y2_1*w12_2+y3_1.*w13_2+y4_1.*w14_2+b1_2;
    % Output Activation function
    y1_2 = 3*v1_2+2; %3*x+5
    % Error calculation
    yfin = y1_2;
    Y(indx) = yfin;
    cycle2 = cycle2+1;
end
figure
ylim([0,5])
plot(x, d, 'r*',x, Y);

