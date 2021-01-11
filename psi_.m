function result =  psi_(l, x, delta, var_sigma)
    multiply = 1i * l  * var_sigma / delta;
    first_ = real((phi_z(1.0)^delta -1.0)/ log(phi_z(1.0))) * cos(x) ;
    second_ = imag((phi_z(1.0)^delta -1.0)/ log(phi_z(1.0))) * sin(x) ;        
    result = exp(multiply .* (first_ - second_ + delta));
end
     