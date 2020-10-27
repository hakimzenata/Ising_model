clear all;
clc;
L=4;
J=1;
K=1;
itt =10000;
itt_dep=0.8*itt;
calc = itt-itt_dep+1;


for i=1:2*L,
    for j=1:2*L,
        for k=1:2*L,
            if(mod(j,2)==0 || mod(i,2)==0||mod(k,2)==0)
                S(i,j,k)=0;
                if( mod(k,2)==0)
                    if(mod(i,2)==0 && mod(j,2)==0 )
                        S(i,j,k)=1;
                    end
                end
            else
                S(i,j,k)=1;
            end
        end
    end
end
n_spin=0;
for i=1:2*L
    for j=1:2*L
        for k=1:2*L
            if(S(i,j,k)==1)
                n_spin=n_spin+1;
            end  
        end
    end
end

M=0;


Tx=[];
E=0;
Mx=[];
Ex=[];
Cvx=[];
Xx=[];
Tc=0;
T=0;
[S,Em]=metropolis(S,T,J,n_spin,2*L);
x=sprintf('%d',Em);
disp(x);
