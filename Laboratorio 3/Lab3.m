
%=================================Punto 1==================================
pago_deuda(814252,17496000)
%pago_deuda(524880,17496000)
pago_deuda(524880,8748000)

%=================================Punto 2==================================
punto_2(0.9);
punto_2(2.8);
punto_2(3.55);
punto_2(3.88);
%=================================Punto 3==================================

i = 30; % Se establecen 30 iteraciones para todos los puntos

% a)

%Se declaran las variables para la función

% Parametros constante que definen el comportamiento del sistema
r1 = 2.89;
a1 = 0.099;
b1 = 3.075;
c1 = 1.09;

x1 = 0.5; % Condicion inicial de las presas
y1 = 0.3; % Condicion inicial de los predadores
var1 = [x1;y1]; % Se crea el vector var con x y y
%{
 Se declara var como el resultado de la función LotkaVolterra que recibe 
como parametros r,a,b,c,x,y,i y var.
%}
var1 = LotkaVolterra(r1,a1,b1,c1,x1,y1,i, var1);

%{
 Se grafica mediante plot estableciendo el tiempo de 1 hasta i y la primera
fila de la matriz var con el comportamiento
%}
figure
plot((1:i+1), var1(1,:));
hold on; % Se utiliza hold on para poder almacenar el plot anterior
plot((1:i+1), var1(2,:)); % Se grafica la segunda fila de var

xlabel('Tiempo'); % Se añade la etiqueta de Tiempo en X
ylabel('Poblacion'); % Se añade la etiqueta de Poblacion en Y
legend('Presas', 'Predadores'); % Se añade la leyenda de la grafica
grid on; % Se habilita la cuadricula
hold off;

% b)

%Se declaran las variables para la función

% Parametros constante que definen el comportamiento del sistema
r2 = 2.41;
a2 = 1.19;
b2 = 3.91;
c2 = 0.45;

x2 = 0.5; % Condicion inicial de las presas
y2 = 0.6; % Condicion inicial de los predadores
var2 = [x2;y2]; % Se crea el vector var con x y y
%{
 Se declara var como el resultado de la función LotkaVolterra que recibe 
como parametros r,a,b,c,x,y,i y var.
%}
var2 = LotkaVolterra(r2,a2,b2,c2,x2,y2,i, var2);

%{
 Se grafica mediante plot estableciendo el tiempo de 1 hasta i y la primera
fila de la matriz var con el comportamiento
%}
figure
plot((1:i+1), var2(1,:));
hold on; % Se utiliza hold on para poder almacenar el plot anterior
plot((1:i+1), var2(2,:)); % Se grafica la segunda fila de var

xlabel('Tiempo'); % Se añade la etiqueta de Tiempo en X
ylabel('Poblacion'); % Se añade la etiqueta de Poblacion en Y
legend('Presas', 'Predadores'); % Se añade la leyenda de la grafica
grid on; % Se habilita la cuadricula
hold off;

% c)

%Se declaran las variables para la función

% Parametros constante que definen el comportamiento del sistema
r3 = 2.41;
a3 = 1.43;
b3 = 3.91;
c3 = 0.25;

x3 = 0.2; % Condicion inicial de las presas
y3 = 0.3; % Condicion inicial de los predadores
var3 = [x3;y3]; % Se crea el vector var con x y y
%{
 Se declara var como el resultado de la función LotkaVolterra que recibe 
como parametros r,a,b,c,x,y,i y var.
%}
var3 = LotkaVolterra(r3,a3,b3,c3,x3,y3,i, var3);

%{
 Se grafica mediante plot estableciendo el tiempo de 1 hasta i y la primera
fila de la matriz var con el comportamiento
%}
figure
plot((1:i+1), var3(1,:));
hold on; % Se utiliza hold on para poder almacenar el plot anterior
plot((1:i+1), var3(2,:)); % Se grafica la segunda fila de var

xlabel('Tiempo'); % Se añade la etiqueta de Tiempo en X
ylabel('Poblacion'); % Se añade la etiqueta de Poblacion en Y
legend('Presas', 'Predadores'); % Se añade la leyenda de la grafica
grid on; % Se habilita la cuadricula
hold off;


%{
Declaracion de la funcion recursiva LotkaVolterra que recibe como 
parametros r,a,b,c asi como x y y que son las condiciones iniciales y un
vector var que almacenara los arreglos de las iteraciones.
%}
function var = LotkaVolterra(r,a,b,c,x,y,i, var)
    if i > 0
        newX = r * x * (1 - x)  - a * x * y;
        newY = -c * y + b * x * y;

        var(:, end+1) = [newX; newY];

        var = LotkaVolterra(r, a, b, c, newX, newY, i - 1, var); 
    end
end

%=================================Punto 2==================================

%Primero se declara la función $punto_2$, con un parametro de entrada r, 
% que es un numero entero, y con un vector de salida [x]. Retorna es un
% vector que almacena todas las soluciones de la 
% ecuación y que luego muestra una gráfica con los resultados progresivos
% de este modelo.
function [x]= punto_2(r)
%en la primera posición de mi vector x asigno un numero que será la 
% condición inicial
    x(1)=0.2
%el condicional for se encarga de establecer el recorrido, desde 
% el índice 1 (primera posición) hasta el 30. Además se encarga de pasar
% a la siguiente posición del vector, sumando 1, para así hacer la 
% operación indicada en la ecuación.
    for i=1:30
          x(i+1)= r* x(i) * (1-x(i))
    end
%finalizo el condicional
figure
stem(x)
end    
%finalmente con stem grafico el vector que obtuve y finalizo la función

