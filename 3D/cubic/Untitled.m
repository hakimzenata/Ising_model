clear all;
itt = 10000;
L1=2;

A=1;

for i=1:L1,
    for j=1:L1
        for k=1:L1
                S(i,j,k)=0;
        end
    end
end
for i=1:L1,
    for j=1:L1
        for k=1:L1
                J(i,j,k)=0;
        end
    end
end
for i=1:L1,
    for j=1:L1
        for k=1:L1
                K(i,j,k)=0;
        end
    end
end
for i=1:L1,
    for j=1:L1
        for k=1:L1
                L(i,j,k)=0;
        end
    end
end
for i=1:L1,
    for j=1:L1
        for k=1:L1
                M(i,j,k)=0;
        end
    end
end
for i=1:L1,
    for j=1:L1
        for k=1:L1
                N(i,j,k)=0;
        end
    end
end
T1=0;
T2=1;
T6=2;
T3=3;
T4=4.5;
T5=5;



for i=1:itt
    i
    [S,Em1]=Metropolis(S,T1,A);
    [J,Em2]=Metropolis(J,T2,A);
    [K,Em3]=Metropolis(K,T6,A);
    [L,Em4]=Metropolis(L,T3,A);
    [M,Em5]=Metropolis(M,T4,A);
    [N,Em6]=Metropolis(N,T5,A);
    M1(i) = sum(sum(sum(S)))/L1^3;
    M2(i) = sum(sum(sum(J)))/L1^3;
    M3(i) = sum(sum(sum(K)))/L1^3;
    M4(i) = sum(sum(sum(L)))/L1^3;
    M5(i) = sum(sum(sum(M)))/L1^3;
    M6(i) = sum(sum(sum(N)))/L1^3;
    
end

figure(1);
subplot(3,2,1);
plot(M1);
ylim([-1,1]);
xlabel('Metropolis itterations T=0','FontSize',12.5); 
ylabel('M','FontSize',12.5);

subplot(3,2,2);
plot(M2);
ylim([-1,1]);
xlabel('Metropolis itterations T=1','FontSize',12.5); 
ylabel('M','FontSize',12.5);

subplot(3,2,3);
plot(M6);
ylim([-1,1]);
xlabel('Metropolis itterations T=2','FontSize',12.5); 
ylabel('M','FontSize',12.5);

subplot(3,2,4);
plot(M3);
ylim([-1,1]);
xlabel('Metropolis itterations T=3','FontSize',12.5); 
ylabel('M','FontSize',12.5);

subplot(3,2,5);
plot(M4);
ylim([-1,1]);
xlabel('Metropolis itterations T=4.5','FontSize',12.5); 
ylabel('M','FontSize',12.5);

subplot(3,2,6);
plot(M5);
ylim([-1,1]);
xlabel('Metropolis itterations T=5','FontSize',12.5); 
ylabel('M','FontSize',12.5);

