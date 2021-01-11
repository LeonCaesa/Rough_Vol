
function result= inte_l2(l, K ,J, kappa, var_sigma, a, c, b, d, T, delta, alpha, threshold)
disp(l)
%second_multy = @(l) K * exp(-1i * K^2 *l) + (sqrt(pi)/2 - igamma(3/2, 1i* K^2 * l))/ sqrt(1i * l);
second_multy = @(l) K * exp(-1i * K^2 *l) + (1i * sqrt(pi)/2 - igamma(3/2, 1i* K^2 * l))/ sqrt(1i * l); %call

temp = real(second_multy(l) .* phi_I_square(l, J, kappa, var_sigma, a, c, b, d, T, delta, alpha)/(1i * l));

if l >= threshold
    disp('enter')
    result = 0;
else
    result = temp;

end
    