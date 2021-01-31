function [result] = main()

call=false;
load('matlab.mat');
if call
    data = vixoption(vixoption.Type=='call',:);
else
    data= vixoption(vixoption.Type=='put',:);
end

data = data(data.diff==0,:);
data = data(1:11,:);
%data = data(1:2,:);
%plot(data.Strike, data.Last)

%data_temp = data((data.UnderlyingPrice==11.47)|(data.UnderlyingPrice==26.67),:);
%plot(data_temp.Strike, data_temp.Last)

T = data.T/365;
K = data.Strike;
delta = 6/73;
alpha = 1.78;
d = 0.6;
save('put_data.mat');



warning('off','all')
%call_cost(lb)
clear

lb = [0;0;0;0;0.05;0];
ub = [1;10;1;100;0.9;100];
% for ga
opts = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping}, 'Display', 'iter');
opts = optimoptions(opts,'UseVectorized', false,'UseParallel', true);
opts = optimoptions(opts,'MaxGenerations', 2,'MaxStallGenerations', 100,'PopulationSize', 2);
[x,fval,exitFlag,output,population,scores] = ga(@call_cost,6,[],[],[],[], lb, ub, [], opts);


% for pattern search
%x0 = lb + rand(size(lb)).*(ub - lb);
x0= [0.7943, 1.7991, 0.9263,70.8180, 0.7939, 31.7151];
opts = optimoptions('patternsearch','Display','iter','PlotFcn',@psplotbestf);
opts = optimoptions(opts,'AccelerateMesh',true, 'UseParallel', true);
opts = optimoptions(opts,'MaxIterations', 100);
[x,fval,exitflag,output] = patternsearch(@call_cost, x0,[],[],[],[], lb, ub, [], opts);



alpha = 1.78;
t = 1;
T = 1;
d = 0.6;
delta = 6/73;


% var_sigma = 0.2;
% kappa = 5;
% a = 100;
% b = 50;
% c = 0.7;
% J = 0.5;


J = x(1);
kappa = x(2);
var_sigma = x(3);
a = x(4);
c = x(5);
b = x(6);


values1 = zeros();
values2 = zeros();
m = 1;
for K= 10:1:20
    disp(K)
    %values1(m) = call_price(K, J, kappa, var_sigma, a, c, b, d, T, delta, alpha);
    values2(m) = put_price(K, J, kappa, var_sigma, a, c, b, d, T, delta, alpha);
    m = m+1;
end
% 
% 
% 
% 
% plot(0:0.1:0.8, real(values1), 'DisplayName','Call Price')
% hold on;
% plot(10:1:20, real(values2), 'DisplayName','Put Price')
% legend('-DynamicLegend');    
% xlabel('K') 
% ylabel('P(K)') 


end