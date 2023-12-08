clc, clear
a=1;
t = 30;
y = [0,1,zeros(1,t-2)];
sol = zeros(1,t);

for k=1:t-2
    y(k+2) = (1+y(k+1)-(1/8)*y(k))/2;
end

for k=0:t-1
    sol(k+1) = (-8/9)*((1/4)^k)+(4/3)*((1/4)^k)*k+(8/9);
end

figure (1)
hold on 
stem(y,'LineWidth',2)
stem(sol,'Marker','*', 'LineWidth',1)
grid on
xlabel('k','FontSize',14)
ylabel('y[k]','FontSize',14)
legend({'Simulacion de ecuacion',...
    'Solucion analitica'},'FontSize',14)