function result = phi_I_square(l, J, kappa, var_sigma, a, c, b, d, t, delta, alpha)
    pd = makedist('Stable','alpha',alpha,'beta',0,'gam',(t)^(1-alpha),'delta',0);
    fun = @(x) psi_(l, x, delta, var_sigma) .* pdf(pd,x);
    constant = integral(fun, -Inf, Inf, 'AbsTol', 1e-2);
 
    first = 1i* l * J;
    inte_loginside_real = @(s) real(log(phi_x(l * H3(t, s, d, kappa, delta), a, c, b)));
    inte_loginside_complex = @(s) imag(log(phi_x(l * H3(t, s, d, kappa, delta), a, c, b)));
    
    
    second_real = integral(inte_loginside_real, 0, t, 'AbsTol', 1e-2);
    second_complex = integral(inte_loginside_complex, 0, t, 'AbsTol', 1e-2);
    
    %second(isnan(second)) = -Inf -Inf* 1i;
    %second(isnan(second)) = exp(-l);
    result = exp(first).* exp(complex(second_real, second_complex)).* constant;
     
end
