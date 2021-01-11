function result = phi_x(l , a, c , b)    
     result = exp(a * gamma(-c) * ((b- 1i * l).^c - b.^c));
