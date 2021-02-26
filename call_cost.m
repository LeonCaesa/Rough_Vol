
function result = call_cost(x)
% J = x(1)
kappa = x(1);
var_sigma = x(2);
a = x(3);
c = x(4);
b = x(5);


warning('off','all')

data_test = load('put_data.mat');
%data_test = load('call_data.mat');
alpha = data_test.alpha;
d = data_test.d;
prices= data_test.data.Last;
T = data_test.T;
K = data_test.data.Strike;
delta = data_test.delta;
vix0 = data_test.UnderlyingPrice;
result = 0;
for i= 1:length(K)
   disp(i)
   true = prices(i);
   fit = put_price(K(i), vix0(i), kappa, var_sigma, a, c, b, d, T(i), delta, alpha);
   %fit = call_price(K(i), J, kappa, var_sigma, a, c, b, d, T(i), delta, alpha);
   %result = result + ((true-fit)/true)^2;
   result = result + (true-fit)^2;
   %result(:,i) = (true-fit)^2;
end
%result = sum(result./length(K));
result = result/length(K);
% 
% parpool(4);
% pctRunOnAll warning('off','MATLAB:integral:NonFiniteValue');
% num_option = length(K);
% parfor j = 1:num_option
%     data_test = load('put_data.mat');
%     alpha = data_test.alpha;
%     d = data_test.d;
%     prices= data_test.data.Last;
%     T = data_test.data.T;
%     K = data_test.data.Strike;
%     delta = data_test.delta
%     
%     disp(j);
%     true_price = prices(j);
%     temp_k = K(j)
%     temp_T = T(j)
%     fit = put_price(temp_k, J, kappa, var_sigma, a, c, b, d, temp_T, delta, alpha);
%     temp(:,j) = (true_price-fit)^2;
% end
% delete(gcp('nocreate'));

%result = mean(temp);

end