function [vector_deuda] = pago_deuda(Zt,Dt)
%{Se declaran los parametros de entrada, en este caso Zt es el valor
% mensual que pagará la persona y Dt es la deuda actual. La función
% devuelce un vector con el que es posible graficar}
m=Dt;
%Esta variable guarda el valor de la deuda inicial
r=0.03;
%r es el interés mensual, en este caso, 3%
p=1;
%Inicializa el periodo
total=0;
%Guarda el valor total pagado. 
while Dt(p)>0
%La condición de parada es cuando la deuda actual sea igual a o
    Dt(p+1)= (1+r)*Dt(p)-Zt;
    %Ecuación de interés compuesto
    total=total+Zt+r*Dt(p);
    %Le suma por cada iteración lo que se pagó ese mes
    p=p+1
    %Hace posible el recorrido hasta la condición de parada
end
adicional=total-m;
%Guarda el valor adicional pagado a la deuda inicial 
porcentaje=(adicional*100)/m
%{Este es el porcentaje adicional al inicial, para eso se guarda la deuda 
%inicial en una variable aparte}
figure
stem(Dt)
xlabel('Meses')
ylabel('Deuda')
title('Tiempo en pagar la deuda')
%variables para graficar el vector que devuelve la función
end


