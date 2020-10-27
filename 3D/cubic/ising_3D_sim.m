clear all;
L1=8;
L2=16;
L3=32;


J=1;
K=1;
itt =1000;
itt_dep=0.8*itt;
calc = itt-itt_dep+1;


for i=1:L1
    for j=1:L1
        for k=1:L1
            S(i,j,k)=1;
        end
    end
end

for i=1:L2
    for j=1:L2
        for k=1:L2
            G(i,j,k)=1;
        end
    end
end
for i=1:L3
    for j=1:L3
        for k=1:L3
            A(i,j,k)=1;
        end
    end
end

Tx=[];
E1=0;
E2=0;
E3=0;
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

for T = 0:0.1:6
    T
    for i=1:itt
        [S,Em1]=Metropolis(S,T,J);
        [G,Em2]=Metropolis(G,T,J);
        [A,Em3]=Metropolis(A,T,J);
        M1(i) = sum(sum(sum(S)))/L1^3;
        E1(i) = Em1;
        M2(i) = sum(sum(sum(G)))/L2^3;
        E2(i) = Em2;
        M3(i) = sum(sum(sum(A)))/L3^3;
        E3(i) = Em3;

    end
    Mm1 = sum(M1(itt_dep:itt))/calc;
    Em1 = sum(E1(itt_dep:itt))/calc;
    Mm2 = sum(M2(itt_dep:itt))/calc;
    Em2 = sum(E2(itt_dep:itt))/calc;
    Mm3 = sum(M3(itt_dep:itt))/calc;
    Em3 = sum(E3(itt_dep:itt))/calc;
    Cv1 = (sum(E1(itt_dep:itt).^2)/calc - (sum(E1(itt_dep:itt))/calc)^2)/(K*itt*T^2);
    X1 = (sum(M1(itt_dep:itt).^2)/calc - (sum(M1(itt_dep:itt))/calc)^2)/(K*itt*T);
    Cv2 = (sum(E2(itt_dep:itt).^2)/calc - (sum(E2(itt_dep:itt))/calc)^2)/(K*itt*T^2);
    X2 = (sum(M2(itt_dep:itt).^2)/calc - (sum(M2(itt_dep:itt))/calc)^2)/(K*itt*T);
    Cv3 = (sum(E3(itt_dep:itt).^2)/calc - (sum(E3(itt_dep:itt))/calc)^2)/(K*itt*T^2);
    X3= (sum(M3(itt_dep:itt).^2)/calc - (sum(M3(itt_dep:itt))/calc)^2)/(K*itt*T);
    Mx1=[Mx1 Mm1];
    Tx=[Tx T];
    Ex1=[Ex1 Em1];
    Cvx1=[Cvx1 Cv1];
    Xx1=[Xx1 X1];
    
    Mx2=[Mx2 Mm2];
    Ex2=[Ex2 Em2];
    Cvx2=[Cvx2 Cv2];
    Xx2=[Xx2 X2];
    
    Mx3=[Mx3 Mm3];
    Ex3=[Ex3 Em3];
    Cvx3=[Cvx3 Cv3];
    Xx3=[Xx3 X3];
end


figure(1)
plot(Tx,Mx1,'bo',Tx,Mx2,'*',Tx,Mx3,'*')
ylim([-1,1]);
xlabel('T'); ylabel('<M>');
grid on
hold on;
legend('L=8','L=16','L=32');
    
figure(2);
plot(Tx,Ex1,'bo',Tx,Ex2,'*',Tx,Ex3,'*')
xlabel('T'); ylabel('<E>');
grid on
hold on; 
legend('L=8','L=16','L=32');
    
figure(3);
plot(Tx,Cvx1,'bo',Tx,Cvx2,'*',Tx,Cvx3,'.')
xlabel('T'); ylabel('Cv');
grid on
hold on;
legend('L=8','L=16','L=32');
    
figure(4);
plot(Tx,Xx1,'bo',Tx,Xx2,'*',Tx,Xx3,'.')
xlabel('T'); ylabel('X');
hold on; 
grid on
legend('L=8','L=16','L=32');