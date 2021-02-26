function [result] = main()

call = false;
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
UnderlyingPrice = data.UnderlyingPrice;
%save('call_data.mat');
save('put_data.mat');



warning('off','all')
%call_cost(lb)
clear

%lb = [0;0;0;0;0.05;0];
%ub = [1000;10;1;100;0.9;100];
lb = [0;0;0;0.05;0];
ub = [10;1;100;0.9;100];

% for ga
opts = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping}, 'Display', 'iter');
opts = optimoptions(opts,'UseVectorized', false,'UseParallel', true);
opts = optimoptions(opts,'MaxGenerations', 100,'MaxStallGenerations', 100,'PopulationSize', 15);
[x,fval,exitFlag,output,population,scores] = ga(@call_cost,6,[],[],[],[], lb, ub, [], opts);


% for pattern search
%x0 = lb + rand(size(lb)).*(ub - lb);
x= [0.7943, 1.7991, 0.9263,70.8180, 0.7939, 31.7151];
x = [0.0131    1.7991    0.0201   70.8180    0.8564    7.7151];
%x = [0.9940 1.5717 0.9932 80.0280 0.8269 74.1761];
x = [ 0.9706 5.5717 0.9854 16.0280 0.1706 42.1761];
x =   [0.1818    0.4965    0.3685    9.1126    0.8191   11.7418];
x0=  [0.1818    0.4965    0.2348    9.1126    0.5791   10.1119]; %error 0.5965
%x0 = [15^2, 5, 0.2, 100, 0.7, 50];
x0 = [1.2812    0.1608   88.0000    0.6961    4.0000];
x0 = [5, 0.2, 100, 0.7, 50];
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
% J = 15^2;

%x = [315.0000    6.2539    0.7569   19.8750    0.3875   49.0000];% T = 90
x0 =[ 302.0000    2.5000    0.9812   36.0000    0.7078   18.0000]; % T=90/365
x0 = [382.0000    1.2500    0.0124   88.0000    0.7000    4.0000];
x0 = [382.0000    1.2812    0.1608   88.0000    0.6961    4.0000]; %error = 1.22096
J = x(1);
kappa = x(2);
var_sigma = x(3);
a = x(4);
c = x(5);
b = x(6);


values1 = zeros();
values2 = zeros();
m = 1;

K = data.Strike;
%K = 10:1:20;
T = data.T/365;
vix0 = 15;
for j= 1:length(K)
    disp(j)
    %values1(m) = call_price(K, J, kappa, var_sigma, a, c, b, d, T, delta, alpha);
    %values2(j) = put_price(K(j), J, kappa, var_sigma, a, c, b, d, T(j), delta, alpha);
    values2(j) = put_price(K(j), vix0, kappa, var_sigma, a, c, b, d, T(j), delta, alpha);
    %m = m+1;
end

plot(K, values2, 'o');
hold on;
plot(K, data.Last, '+');

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