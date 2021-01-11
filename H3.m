
function H_result = H3(t, s, d, kappa, delta)
    if t - s + delta < (1-d) / kappa
        nominator = (t-s+delta)^d - (t - s)^d;
        denominator = delta * gamma(d+1);
         H_result =nominator/denominator;
    
    elseif (t-s < (1-d)/kappa)&((1-d)/kappa <= t-s+delta)
        nominator1 = ((1-d)/kappa).^d  - (t-s).^d;
        denominator1 = delta * gamma(d+1);
        nominator2 = exp(-kappa * (t - s + delta) + 1 - d) -1;
        denominator2 = kappa ^d*delta* (1 - d)^(2 - d)  *gamma(d-1);
         H_result =nominator1/denominator1 + nominator2/ denominator2;
        
    else
        nominator = exp(-kappa * (t - s + delta) +1 -d) * (exp(kappa * delta ) -1);
        denominator = kappa^d * delta * (1-d)^(2-d) * gamma(d-1);
         H_result = -nominator/denominator;
         
    end
end
