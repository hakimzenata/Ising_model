
L1=8;
L2=16;
L3=32;
J=1;
k=1;
itt = 10000;
itt_dep=0.8*itt;
numero = itt-itt_dep+1;
for i=1:L2
    for j=1:L2
        G(i,j)=1;
    end
end

for i=1:L1
    for j=1:L1
        S(i,j)=1;
    end
end
for i=1:L3
    for j=1:L3
        A(i,j)=1;
    end
end



E1=0;
E2=0;
E3=0;
Tx=[];
Mx1=[];
Mx2=[];
Mx3=[];
Ex1=[];
Ex2=[];
Ex3=[];
Cvx1=[];
Cvx2=[];
Cvx3=[];
Xx1=[];
Xx2=[];
Xx3=[];


for T = 0:0.1:4.5
    T
    for i=1:itt
        [S,Em1]=Metropolis(S,T,J,L1);
        [G,Em2]=Metropolis(G,T,J,L2);
        [A,Em3]=Metropolis(A,T,J,L3);
        M1(i) = sum(sum(S))/L1^2;
        M2(i) = sum(sum(G))/L2^2;
        M3(i) = sum(sum(A))/L3^2;
        E1(i) = Em1;
        E2(i) = Em2;
        E3(i) = Em3;

    end
    Mm1 = sum(M1)/itt;
    Mm2 = sum(M2)/itt;
    Mm3 = sum(M3)/itt;
    Em1 = sum(E1)/itt;
    Em2 = sum(E2)/itt;
    Em3 = sum(E3)/itt;
    Cv1 = (sum(E1(itt_dep:itt).^2)/numero - (sum(E1(itt_dep:itt))/numero)^2)/(k*itt*T^2);
    Cv2 = (sum(E2(itt_dep:itt).^2)/numero - (sum(E2(itt_dep:itt))/numero)^2)/(k*itt*T^2);
    Cv3 = (sum(E3(itt_dep:itt).^2)/numero - (sum(E3(itt_dep:itt))/numero)^2)/(k*itt*T^2);
    X1 = (sum(M1(itt_dep:itt).^2)/numero - (sum(M1(itt_dep:itt))/numero)^2)/(k*itt*T);
    X2 = (sum(M2(itt_dep:itt).^2)/numero - (sum(M2(itt_dep:itt))/numero)^2)/(k*itt*T);
    X3 = (sum(M3(itt_dep:itt).^2)/numero - (sum(M3(itt_dep:itt))/numero)^2)/(k*itt*T);
    Mx1=[Mx1 Mm1];
    Mx2=[Mx2 Mm2];
    Mx3=[Mx3 Mm3];
    Tx=[Tx T];
    Ex1=[Ex1 Em1];
    Ex2=[Ex2 Em2];
    Ex3=[Ex3 Em3];
    Cvx1=[Cvx1 Cv1];
    Cvx2=[Cvx2 Cv2];
    Cvx3=[Cvx3 Cv3];
    Xx1=[Xx1 X1];  
    Xx2=[Xx2 X2];
    Xx3=[Xx3 X3];
end

figure(1)
subplot(2,2,1);
plot(Tx,Mx1,'bo',Tx,Mx2,'*',Tx,Mx3,'*')
ylim([-1,1]);
xlabel('T'); ylabel('<M>');
title('aimantation');
grid on
hold on;
legend('L=2','L=4','L=6','L=10');
    
subplot(2,2,2)
plot(Tx,Ex1,'bo',Tx,Ex2,'*',Tx,Ex3,'*')
ylim([-4,0]);
xlabel('T'); ylabel('<E>');
title('énergie');
grid on
hold on; 
legend('L=2','L=4','L=6','L=10');
    
subplot(2,2,3)
plot(Tx,Cvx1,'bo',Tx,Cvx2,'*',Tx,Cvx3,'.')
xlabel('T'); ylabel('Cv');
title('chaleur spécifique');
grid on
hold on;
legend('L=2','L=4','L=6','L=10');
    
subplot(2,2,4)
plot(Tx,Xx1,'bo',Tx,Xx2,'*',Tx,Xx3,'.')
xlabel('T'); ylabel('X');
title('susceptibilté');
hold on; 
grid on
legend('L=2','L=4','L=6','L=10');