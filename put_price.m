
function result = put_price(K, J, kappa, var_sigma, a, c, b, d, T, delta, alpha)
    % put
    second_multy = @(l) K * exp(-1i * K^2 *l) + (sqrt(pi)/2 - igamma(3/2, 1i* K^2 * l))/ sqrt(1i * l);
    inte_l = @(l) real(second_multy(l) .* phi_I_square(l, J, kappa, var_sigma, a, c, b, d, T, delta, alpha)/(1i * l));
    result = K/2 - 1/pi * integral(inte_l, 0, inf, 'ArrayValued',true, 'AbsTol', 1e-1);
    
%     temp_intel = 1;
%     tol = 0.003;
%     values2 = zeros();
%     m = 1;
%     while temp_intel > tol
%         temp_intel = inte_l(m-1 + 0.01);
%         values2(m) = temp_intel;
%         m = m + 1;
%     end
%     
%     trapz_area = cumtrapz(values2);
    %result = K/2 - 1/pi * trapz_area(length(trapz_area));
    
    
    % inte_l set evaluation of integral to 0 when l is large
    %inte_ltemp = @(l) inte_l2(l, K ,J, kappa, var_sigma, a, c, b, d, T, delta, alpha);
    %result = K/2 - 1/pi * integral(inte_ltemp, 0, inf, 'ArrayValued',true, 'AbsTol', 1e-2);

    
    
%     values1 = zeros(1, 300);
%     values2 = zeros(1, 300);
%     for m= 1:300
%         disp(m);
%         %values1(m) = inte_loginside(m-1);
%         %values1(m) = real(phi_I_square(m-1, J, kappa, var_sigma, a, c, b, d, T, delta, alpha));
%         %values2(m) = 1/pi * integral(inte_l, 0, inf, 'ArrayValued',true, 'AbsTol', 1e-2) - K/2;
%         values2(m) = inte_l(m);
%     end
%     % CF
%     plot(1:100, values1)
%     % Inte_l
%     plot(1:300, values2)
     
    
end

