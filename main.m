function [result] = main()




alpha = 1.78;
var_sigma = 0.8;
t = 1;
T = 1;
delta = 6/73;
d = 0.6;
kappa = 5;

a = 10;
b = 1;
c = 0.7;
J = 0.5;
%K = 0.5;


values1 = zeros();
values2 = zeros();
m = 1;
for K= 0:0.1:0.8
    disp(K)
    values1(m) = call_price(K, J, kappa, var_sigma, a, c, b, d, T, delta, alpha);
    values2(m) = put_price(K, J, kappa, var_sigma, a, c, b, d, T, delta, alpha);
    m = m+1;
end



% K
plot(0:0.1:0.8, real(values1), 'DisplayName','Call Price')
hold on;
plot(0:0.1:0.8, real(values2), 'DisplayName','Put Price')
legend('-DynamicLegend');    
xlabel('K') 
ylabel('P(K)') 


end