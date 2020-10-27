function [ Hs_g ] = Hsg(i,j,k,S,G,Jsg,L1,L2)
Hs_g=0;
if(k==L1 || k==L1+1)
    Hs_g=Jsg*S(i,j,L1)*G(i,j,1);
end
end

