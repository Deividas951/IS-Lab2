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
% Network's response
