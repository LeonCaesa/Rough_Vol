
function result = call_cost(x)

J = x(1);
kappa = x(2);
var_sigma = x(3);
a = x(4);
c = x(5);
b = x(6);

data_test = load('put_data.mat');
alpha = data_test.alpha;
d = data_test.d;
prices= data_test.data.Last;
T = data_test.data.T;
K = data_test.data.Strike;
delta = data_test.delta;

result = 0;
for i= 1:length(K)
   disp(i)
   true = prices(i);
   fit = put_price(K(i), J, kappa, var_sigma, a, c, b, d, T(i), delta, alpha);
   result = result + ((true-fit)/true)^2;
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