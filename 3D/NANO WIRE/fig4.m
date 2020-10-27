s=2;
g=-3/2;


L11=5;
L12=10;
L13=15;
L14=30;
d=0;
L2=5;
Ng=7;
Ns=7;
Rss=1;
Rsg=-1;
Jss=1;
Jgg=1;
Jsg=-1;
h=0.1;
N1=Ns*L11+Ng*L2;
N2=Ns*L12+Ng*L2;
N3=Ns*L13+Ng*L2;
N4=Ns*L14+Ng*L2;
itt=10000;
itt_dep=0.8*itt;
calc = itt-itt_dep+1;
T=0.1;

Mtot1=[];
Mtot2=[];
Mtot3=[];
Mtot4=[];
Msm=[];
Mgm=[];
Rx=[];
E_t=[];
X_tot=[];
X_s=[];
X_g=[];
Mg=[];
Ms1=[];

    
for k=1:L11,
    for i=1:3,
        for j=1:5,
            if(mod(i,2)==0 || mod(j,2)==0)
                 S1(i,j,k)=s;
            else
                 S1(i,j,k)=0;
            end
        end
    end
        S1(2,2,k)=0;
        S1(2,4,k)=0;
end
for k=1:L12,
    for i=1:3,
        for j=1:5,
            if(mod(i,2)==0 || mod(j,2)==0)
                 S2(i,j,k)=s;
            else
                 S2(i,j,k)=0;
            end
        end
    end
        S2(2,2,k)=0;
        S2(2,4,k)=0;
end
for k=1:L13,
    for i=1:3,
        for j=1:5,
            if(mod(i,2)==0 || mod(j,2)==0)
                 S3(i,j,k)=s;
            else
                 S3(i,j,k)=0;
            end
        end
    end
        S3(2,2,k)=0;
        S3(2,4,k)=0;
end
for k=1:L14,
    for i=1:3,
        for j=1:5,
            if(mod(i,2)==0 || mod(j,2)==0)
                 S4(i,j,k)=s;
            else
                 S4(i,j,k)=0;
            end
        end
    end
        S4(2,2,k)=0;
        S4(2,4,k)=0;
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

for Rss=-2:0.1:2;
    Rss
     for it=1:itt
         
        [ S1,G,H ] = metropolis( S1,G,Rss,Jgg,Jsg,T,h,d,N1,L11,L2); 
        [ S2,G,H ] = metropolis( S2,G,Rss,Jgg,Jsg,T,h,d,N1,L12,L2); 
        [ S3,G,H ] = metropolis( S3,G,Rss,Jgg,Jsg,T,h,d,N1,L13,L2); 
        [ S4,G,H ] = metropolis( S4,G,Rss,Jgg,Jsg,T,h,d,N1,L14,L2); 
        Ms1(it)=sum(sum(sum(S1(:,:,1:L11))))/(L11*Ns);
        Ms2(it)=sum(sum(sum(S2(:,:,1:L12))))/(L12*Ns);
        Ms3(it)=sum(sum(sum(S3(:,:,1:L13))))/(L13*Ns);
        Ms4(it)=sum(sum(sum(S4(:,:,1:L14))))/(L14*Ns);
        Mg(it)=sum(sum(sum(G(:,:,1:L2))))/(L2*Ng);
        M1(it)=(L11*Ns*Ms1(it)+L2*Ng*Mg(it))/N1;
        M2(it)=(L12*Ns*Ms2(it)+L2*Ng*Mg(it))/N2;
        M3(it)=(L13*Ns*Ms3(it)+L2*Ng*Mg(it))/N3;
        M4(it)=(L14*Ns*Ms4(it)+L2*Ng*Mg(it))/N4; 
     end
    Mtot1=[Mtot1 sum(M1(itt_dep:itt))/calc];
    Mtot2=[Mtot2 sum(M2(itt_dep:itt))/calc];
    Mtot3=[Mtot3 sum(M3(itt_dep:itt))/calc];
    Mtot4=[Mtot4 sum(M4(itt_dep:itt))/calc];
    Rx=[Rx Rss]; 
end
figure(1);
plot(Rx,Mtot1,'+',Rx,Mtot2,'*',Rx,Mtot3,'-',Rx,Mtot4,'.');
grid on
hold on;
