clear all;
clc;
L=4;
J=1;
K=1;
itt =1000;
itt_dep=0.8*itt;
calc = itt-itt_dep+1;


for k=1:2*L,
    for i=1:2*L,
        for j=1:2*L,
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
n_spin=3*n_spin;

M=0;


Tx=[];
E=0;
Mx=[];
Ex=[];
Cvx=[];
Xx=[];
Tc=0;


for T = 0:0.1:7
    T
    for i=1:itt
        [S,Em]=metropolis(S,T,J,n_spin,2*L);
        M(i) = sum(sum(sum(S)))/n_spin;
        E(i) = Em;

    end
    Mm = sum(M(itt_dep:itt))/calc;
    Em = sum(E(itt_dep:itt))/calc;
    Cv = (sum(E(itt_dep:itt).^2)/calc - (sum(E(itt_dep:itt))/calc)^2)/(K*itt*T^2);
    X = (sum(M(itt_dep:itt).^2)/calc - (sum(M(itt_dep:itt))/calc)^2)/(K*itt*T);
    Mx=[Mx Mm];
    Tx=[Tx T];
    Ex=[Ex Em];
    Cvx=[Cvx Cv];
    Xx=[Xx X];  
end

x=max(Cvx(2:length(Cvx)));
for i=2:length(Cvx)
    if(Cvx(i)==x)
     Tc=Tx(i);   
    end
        
end

figure(1);
subplot(2,2,1);
plot(Tx,Mx,'+')
ylim([-1,1]);
xlabel('T'); ylabel('<M>');
title(['aimantation        Tc = ',num2str(Tc)]);
grid on
hold on;
    
subplot(2,2,2)
plot(Tx,Ex,'*')
xlabel('T'); ylabel('<E>');
title('énergie');   
grid on
hold on; 
    
subplot(2,2,3)
plot(Tx,Cvx,'*')
xlabel('T'); ylabel('Cv');
title('chaleur spécifique');
grid on
hold on; 
    
subplot(2,2,4)
plot(Tx,Xx,'*')
xlabel('T'); ylabel('X');
title('susceptibilté');
hold on; 
grid on