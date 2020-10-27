function [S,E] = Metropolis(S,T,J,L)  
    k=1;
    beta=1/(k*T);  
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
                dE = 2*J * S(i,j,k)*(S(i,inc(j),k) + S(inc(i),j,k) + S(i,decr(j),k) + S(decr(i),j,k)+S(i,j,inc(k))+S(i,j,decr(k))); 
                if( (dE <= 0) || (exp(-beta*dE) > rand) ) 
                    S(i,j,k) = -S(i,j,k);  
                    E = E+J*S(i,j,k)*(S(i,inc(j),k) + S(inc(i),j,k) + S(i,decr(j),k) + S(decr(i),j,k)+S(i,j,inc(k))+S(i,j,decr(k)));
                else
                    E = E -J*S(i,j,k)*(S(i,inc(j),k) + S(inc(i),j,k) + S(i,decr(j),k) + S(decr(i),j,k)+S(i,j,inc(k))+S(i,j,decr(k)));
                end
            end
        end
    end
    E = E/L^3;
end
