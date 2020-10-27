function [S,Em] = metropolis(S,T,J,n_spin,L)  
    K=1;
    beta=1/(K*T);  
    E = 0; 

    for i=1:L
        inc(i)=i+1;
        decr(i)=i-1;
    end
    inc(L)=1;
    decr(1)=L;

    for i=1:L
        for j=1:L
            for k=1:L
                    dE = 2*J*S(i,j,k)*(S(inc(i),inc(j),decr(k)) + S(inc(i),decr(j),decr(k))...
                        + S(decr(i),inc(j),decr(k)) + S(decr(i),decr(j),decr(k))+ ...
                        S(inc(i),inc(j),inc(k)) + S(inc(i),decr(j),inc(k))...
                        + S(decr(i),inc(j),inc(k)) + S(decr(i),decr(j),inc(k)));
                    if( (dE <= 0) || (exp(-beta*dE) > rand) ) 
                        S(i,j,k) = -S(i,j,k); 
                        E = E+dE/2;
                    else
                        E = E-dE/2;
                    end
            end
        end
    end
    Em = E/n_spin;
end
