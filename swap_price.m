function result = swap_price(J, kappa, var_sigma, a, c, b, d, T, delta, alpha)
inte_l = @(l) real((1 - phi_I_square(l, J, kappa, var_sigma, a, c, b, d, T, delta, alpha))/(sqrt(l^3)));
result = 1/sqrt(2*pi) * integral(inte_l, 0, inf, 'ArrayValued',true, 'AbsTol', 1e-1);