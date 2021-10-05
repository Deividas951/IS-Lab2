% Data preperation
x = [0.1:1/22:1];
d =  (2 + 0.3*cos(2*pi*x/0.2)) + 0.5*sin(4*pi*x + 2)./3;
figure(1), plot(x, d), grid on;
% First layer
w11_1 = rand(1)*0,2;
w21_1 = rand(1)*0,2;
w31_1 = rand(1)*0,2;
w41_1 = rand(1)*0,2;
b1_1 = rand(1)*0,2;
b2_1 = rand(1)*0,2;
b3_1 = rand(1)*0,2;
b4_1 = rand(1)*0,2;
% Second layer
w11_2 = rand(1)*0,2;
w12_2 = rand(1)*0,2;
w13_2 = rand(1)*0,2;
w14_2 = rand(1)*0,2;
b1_2 = rand(1)*0,2;

n = 0.1;
% Network's response
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
    v1_2 = y1_1.*w11_2+b1_2;
    v2_2 = y2_1.*w12_2+b1_2;
    v2_3 = y3_1.*w13_2+b1_2;
    v2_4 = y4_1.*w14_2+b1_2;
    % Output Activation function
    y1_2 = 3*x+9;
    % Error calculation
    y = y1_2;
    e = d(indx) - y;
    % Error output layer gradient calculation
    delta1_2 = (3*y1_2).*e;
    % Error hidden layer gradient calculation
    delta1_1 = y1_1.*(1-y1_1).*delta1_2*w11_2;
    delta2_1 = y2_1.*(1-y2_1).*delta1_2*w12_2;
    delta3_1 = y3_1.*(1-y3_1).*delta1_2*w13_2;
    delta4_1 = y4_1.*(1-y4_1).*delta1_2*w14_2;
   % Update output layer weights
    w11_2 = w11_2 + n*delta1_2*y1_1;
    w12_2 = w12_2 + n*delta1_2*y2_1;
    w13_2 = w13_2 + n*delta1_2*y3_1;
    w14_2 = w14_2 + n*delta1_2*y4_1;
    b1_2 = b1_2 + n*delta1_2;
   % Update hidden layer weights
   w11_1 = w11_1 + n*delta1_1*x(indx);
   w21_1 = w21_1 + n*delta2_1*x(indx);
   w31_1 = w31_1 + n*delta3_1*x(indx);
   w41_1 = w41_1 + n*delta4_1*x(indx);
   b1_1 = b1_1 + n*delta1_1;
   b2_1 = b2_1 + n*delta2_1;
   b3_1 = b3_1 + n*delta3_1;
   b4_1 = b4_1 + n*delta4_1;
 
   
   
end

Y = zeroes(1,length(x));
for indx = 1:Length(x)
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
    v1_2 = y_1*w11_2+b1_2;
    v2_2 = y_1*w12_2+b1_2;
    v2_3 = y_1*w13_2+b1_2;
    v2_4 = y_1*w14_2+b1_2;
    % Output Activation function
    y1_2 = 3*x+9;
    % Error calculation
    y = y1_2;
    Y(indx) = y;
end