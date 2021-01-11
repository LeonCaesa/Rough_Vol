function H_result = H2(t, s, d, kappa, delta)
    first = gamma(d);
    second = exp(kappa * delta) * (gamma(d) - igamma(d, -kappa * (t-s)));
    third = igamma(d, -kappa * (t-s + delta));
    nominator = exp(-kappa .* (t -s +delta)) .* (first - second - third) ;
    denominator = (-kappa)^d * delta * gamma(d);
    H_result = real(nominator/denominator);
end
