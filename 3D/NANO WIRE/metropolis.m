function [ S,G,E ] = metropolis( S,G,Jss,Jgg,Jsg,T,h,d,N,L1,L2)
    beta=1/T;   
    E=0;
    for k=1:L1+L2 
        for j=1:5
            for i=1:3
                H=0;
                if(k<=L1)
                    H=Hxx(i,j,k,L1,S,Jss)+h*S(i,j,k)+Hsg(i,j,k,S,G,Jsg,L1,L2)+d*S(i,j,k)*S(i,j,k);
                else
                    H=Hxx(i,j,k-L1,L2,G,Jgg)+h*G(i,j,k-L1)+Hsg(i,j,k-L1,S,G,Jsg,L1,L2)+d*G(i,j,k-L1)*G(i,j,k-L1);
                end
                dE=2*H;
                if((dE <= 0) || (exp(-beta*dE) > rand) )
                    if(k<=L1)
                        S(i,j,k)=-S(i,j,k);
                    else
                        G(i,j,k-L1)=-G(i,j,k-L1);
                    end
                    E = E+H;
                else
                    E = E-H;
                end
            end
        end
    end
    E=E/N;
end

