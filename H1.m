function H_result = H1(t, s, d, kappa, delta)
    nominator = gammainc(kappa*(t - s), d, 'upper') * gamma(d) - gammainc(kappa*(t - s + delta), d, 'upper') * gamma(d);
    denominator = kappa^d * delta * gamma(d);
    H_result = nominator/denominator;
end


