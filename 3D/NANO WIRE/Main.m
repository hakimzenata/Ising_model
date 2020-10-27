s=2;
g=-3/2;


L1=5;
L2=5;
Ng=7;
Ns=7;
Rss=1;
Rsg=-1;
Jss=1;
Jgg=1;
Jsg=-1;
h=0.1;
d=0;
N=Ns*L1+Ng*L2;
itt=100000;
itt_dep=0.8*itt;
calc = itt-itt_dep+1;

Mtot=[];
Msm=[];
Mgm=[];
Tx=[];
E_t=[];
X_tot=[];
X_s=[];
X_g=[];
Mg=[];
Ms=[];

    
for k=1:L1,
    for i=1:3,
        for j=1:5,
            if(mod(i,2)==0 || mod(j,2)==0)
                 S(i,j,k)=s;
            else
                 S(i,j,k)=0;
            end
        end
    end
        S(2,2,k)=0;
        S(2,4,k)=0;
end
for k=1:L2,
    for i=1:3,
        for j=1:5,
            if(mod(i,2)==0 || mod(j,2)==0)
                 G(i,j,k)=g;
            else
                 G(i,j,k)=0;
            end
        end
    end
        G(2,2,k)=0;
        G(2,4,k)=0;
end
for T=3:0.1:7,
    T
     for it=1:itt
        [ S,G,H ] = metropolis( S,G,Jss,Jgg,Jsg,T,h,d,N,L1,L2); 
        E(it) = H;
        Ms(it)=sum(sum(sum(S(:,:,1:L1))))/(L1*Ns);
        Mg(it)=sum(sum(sum(G(:,:,1:L2))))/(L2*Ng);
        M(it)=(L1*Ns*Ms(it)+L2*Ng*Mg(it))/N;
     end
    Msm=[Msm sum(Ms(itt_dep:itt))/calc];
    Mgm=[Mgm sum(Mg(itt_dep:itt))/calc];
    Mtot=[Mtot sum(M(itt_dep:itt))/calc];
    X_mt = (sum(M(itt_dep:itt).^2)/calc - (sum(M(itt_dep:itt))/calc)^2)/(itt*T);
    X_ms = (sum(Ms(itt_dep:itt).^2)/calc - (sum(Ms(itt_dep:itt))/calc)^2)/(itt*T);
    X_mg = (sum(Mg(itt_dep:itt).^2)/calc - (sum(Mg(itt_dep:itt))/calc)^2)/(itt*T);
    Tx=[Tx T];
    X_tot=[X_tot X_mt];
    X_s=[X_s X_ms];  
    X_g=[X_g X_mg];  
end
figure(1);
plot(Tx,Msm,'*',Tx,Mgm,'bo',Tx,Mtot,'+');
grid on
hold on;

figure(2);
plot(Tx,X_s,'*',Tx,X_g,'bo');
S_max = find(max(X_s) == X_s);
Tc_S = Tx(S_max);
G_max = find(max(X_g) == X_g);
Tc_G = Tx(G_max);
str = ['Tc(G) = ',num2str(Tc_G),'Tc(S) = ',num2str(Tc_G)];
text(Tc_G,G_max,str,'HorizontalAlignment','right');
grid on
hold on;