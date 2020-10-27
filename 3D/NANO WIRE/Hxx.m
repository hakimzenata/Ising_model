function [ H ] = Hxx(i,j,k,L,S,J)
H=0;
Hxy=0;
Hz=0;
%%Hamiltonien de X et Y
if(i==1 && (j==2|| j==4))
        Hxy=S(i+1,j-1,k)+S(i+1,j+1,k);
        if(j==2)
            Hxy=Hxy+S(i,j+2,k);
        end
        if(j==4)
            Hxy=Hxy+S(i,j-2,k);
        end
end
if(i==3 &&( j==2|| j==4))
    Hxy=S(i-1,j-1,k)+S(i-1,j+1,k);
        if(j==2)
            Hxy=Hxy+S(i,j+2,k);
        end
        if(j==4)
            Hxy=Hxy+S(i,j-2,k);
        end
end
if(i==2 && j==3)
    Hxy=S(i+1,j-1,k)+S(i+1,j+1,k)+S(i-1,j-1,k)+S(i-1,j+1,k)+S(i,j+2,k)+S(i,j-2,k);
end
if(i==2 && j==1)
    Hxy=S(i+1,j+1,k)+S(i-1,j+1,k)+S(i,j+2,k);
end
if(i==2 && j==5)
    Hxy=S(i+1,j-1,k)+S(i-1,j-1,k)+S(i,j-2,k);
    
end
%%Hamiltonien de K
if(k==1)
    Hz=Hz+S(i,j,k+1);
end
if(k==L)
    Hz=Hz+S(i,j,k-1);
end
if(k~=1 && k~=L)
    Hz=Hz+S(i,j,k+1)+S(i,j,k-1);
end 
H=Hxy+Hz;
H=J*H*S(i,j,k);
end