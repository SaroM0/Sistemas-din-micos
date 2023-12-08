
%============================Punto 1=======================================

clear,clc;

n=1; %Se asigna el inicio del tiempo

T=[30]; %Se guarda el T inicial en un vector. 

R=20; %Temperatura ambiente

T(n+1)=31.111;
%Temperatura después de una hora. 

k =(T(n+1)-T(1))/(R-T(1));
%Se despeja la constante k de la Ley de enfriamiento

while T(n)<37 %El ciclo sigue hasta que la T° del cuerpo sea igual a 37°
    T(n+1)=T(n)+(k*(R-T(n)));%Ley enfriamiento de Newton
    n=n+1; %Para recorrer hora por hora el ciclo. 
end

plot (T) %Se grafica el vector T
xlabel('Horas')
ylabel('Temperatura cuerpo')
title('Hora de muerte')


%============================Punto 2=======================================
clear,clc;

% Espacio de estados ==========================================

A = [0,1;1,1]; % Declaracion de la matriz de solucion A
X = [1;1]; % Declaracion del vector del caso base
k = 10; % Numero de iteraciones 
%{
Declaracion de la variable res (matriz) que va a almacenar el resultado de
la funcion fibonacci a la cual le entran los parametros A,k,X
%}
res = fibonacci(A,k,X); 

% Grafica solucion por espacio de estados =================================

figure % Se usa figure para separar las salidas de las graficas
%{
La funcion plot grafica la primera fila de res que contiene la sucesion de 
fibonacci en un tiempo de 1 a k
%}
plot((1:k), res(1,:)); 
xlabel('Iteraciones'); % Se nombra el eje x como iteraciones
ylabel('Sucesion'); % Se nombra el eje y como sucesion
grid on; % Se activa la cuadricula

% Solución Analitica ==========================================

i=1;
x = [1;1];
res2 = anaFibonacci(A,i,X, x);

% Grafica solucion analitica ==================================

figure % Se usa figure para separar las salidas de las graficas
%{
La funcion plot grafica la primera fila de res2 que contiene la sucesion de 
fibonacci en un tiempo de 1 a k
%}
plot((1:k), res2(1,:));  
xlabel('Iteraciones'); % Se nombra el eje x como iteraciones
ylabel('Sucesion'); % Se nombra el eje y como sucesion
grid on; % Se activa la cuadricula


%============================Punto 3=======================================

clear,clc;

 %Primero se asian los valores de x, y y el número de solucione y se llama
 %la función creada
  [x1,y1]=punto_3(0.125,0.25,70);
  [x2,y2]=punto_3(0.125,0.35,8);
  [x3,y3]=punto_3(0.125,0.15,70);
 %Graficamos las trayectorias de los sistemas por separado
  figure
  hold on
  plot(x1)
  plot(y1)
  legend("x1","y1")
  

  figure
  hold on
  plot(x2)
  plot(y2)
  legend("x2","y2")


  figure
  hold on
  plot(x3)
  plot(y3)
  legend("x3","y3")

  %Graficamos las trayectorias de los sistemas juntas

  figure
  hold on
  plot(y1)
  plot(y2)
  plot(y3)
  legend("y1","y2", "y3")
  figure
  hold on
  plot(x1)
  plot(x2)
  plot(x3)
  legend("x1","x2", "x3")

%============================Punto 4=======================================

% Limpia la ventana de comandos y las variables en el entorno
clc, clear;

% Carga los datos desde el archivo "buildingData.mat" al entorno
load("buildingData.mat")

%i)

%{
Crea un vector de tiempo que va desde 0 hasta 20 segundos con intervalos
 de tiempo Ts
%}
t = 0:Ts:20; 

qp = [0; 0]; % Define el vector de posiciones de los pisos
qv = [0; 0]; % Define el vector de velocidades de los pisos

x = [qp; qv]; % Crea un vector x con los vectores qp y qv en una matriz

% Comienza un loop para calcular las soluciones en un rango k:length(t)
for k = 2:length(t)
    % Calcula la siguiente solución y la agrega a la matriz x
    x(:, end+1) = Ad * x(:, end) + E * w(k); 
    qp(:, end+1) = x(1, end); % Almacena la posición del piso en qp
    qv(:, end+1) = x(2, end); % Almacena la velocidad del piso en qv
end

figure % Crea una nueva figura para la gráfica
% Grafica la posición de los pisos en función del tiempo
plot((1:length(t)), qp); 
hold on % Permite superponer múltiples gráficas en la misma figura
% Grafica la velocidad de los pisos en función del tiempo
plot((1:length(t)), qv); 
xlabel('Tiempo'); % Etiqueta el eje x como tiempo
ylabel('Posicion y Velocidad'); % Etiqueta el eje posicion y velocidad
legend('Posicion', 'Velocidad');
grid on; % Activa la cuadrícula en la gráfica

%ii)

qp1 = [0; 0]; % Declara el vector de posiciones de los pisos
qv1 = [0; 0]; % Declara el vector de velocidades de los pisos

x1 = [qp1; qv1]; % Crea un nuevo vector x para el segundo caso

%{ 
Comienza otro bucle para calcular las soluciones con una señal externa 
u(k) = -F*x(k)
%}
for k = 2:length(t)
    % Calcula la siguiente solución con la señal externa y la agrega a la matriz x1
    x1(:, end+1) = Ad * x1(:, end) + Bd * (-F * x1(:, end)) + E * w(k); 
    qp1(:, end+1) = x1(1, end); % Almacena la posición del piso en qp1
    qv1(:, end+1) = x1(2, end); % Almacena la velocidad del piso en qv1
end

figure % Crea una nueva figura para la segunda gráfica
% Grafica la posición de los pisos en función del tiempo
plot((1:length(t)), qp1); 
hold on % Permite superponer múltiples gráficas en la misma figura
% Grafica la velocidad de los pisos en función del tiempo (segundo caso)
plot((1:length(t)), qv1); 
xlabel('Tiempo'); % Etiqueta el eje x como tiempo
ylabel('Posicion y Velocidad'); % Etiqueta el eje posicion y velocidad
legend('Posicion', 'Velocidad');
grid on; % Activa la cuadrícula en la segunda gráfica


%iii)

figure % Crea una nueva figura para la segunda gráfica
% Grafica la posición de los pisos en función del tiempo
plot((1:length(t)), qp(1,:)); 
hold on % Permite superponer múltiples gráficas en la misma figura
% Grafica la velocidad de los pisos en función del tiempo (segundo caso)
plot((1:length(t)), qp1(1,:)); 
xlabel('Tiempo'); % Etiqueta el eje x como tiempo
ylabel('Movimiento'); % Etiqueta el eje movimiento
legend('i)', 'ii)');
grid on; % Activa la cuadrícula en la segunda gráfica


%iv)

figure % Crea una nueva figura para la segunda gráfica
% Grafica la posición de los pisos en función del tiempo (primer caso)
plot((1:length(t)), qp); 
hold on % Permite superponer múltiples gráficas en la misma figura
% Grafica la posición de los pisos en función del tiempo (segundo caso)
plot((1:length(t)), qp1); 
xlabel('Tiempo'); % Etiqueta el eje x como tiempo
ylabel('Posicion'); % Etiqueta el eje y como posición
legend('i', 'ii'); % Agrega una leyenda para las dos líneas
grid on; % Activa la cuadrícula en la segunda gráfica


% =========================== FUNCIONES ===================================

%============================Punto 1=======================================


%============================Punto 2=======================================

% Funcion analitica Fibonacci =============================================

%{
Se declara la funcion anaFibonacci que recibe como parametros: A,i,X y x.
La funcion realizara un llamado recursivo para hacer 10 iteraciones donde
se aplicara la formula de la solucion analitica a cada valor de i y se
guardara en la variable matriz x en cada iteracion.
%}
function x = anaFibonacci(A,i,X, x)

    if i ~= 10 % Condicional que declara el numero de iteraciones
        y = A^i*X; % Aplicacion de la solucion analitica
        x(:,end+1) = y; % Se guarda el resultado al final de x
        x = anaFibonacci(A,i+1,X, x); % Llamado recursivo a la funcion
      
    end
end

% Funcion estados Fibonacci ===============================================

%{
Se declara la funcion anaFibonacci que recibe como parametros: A,i y X. La 
funcion realizara un llamado recursivo para hacer k iteraciones donde
aplicara la representación en espacio de estados de fibonacci usando el
ultimo vector calculado de x para calcular el proximo
%}
function X = fibonacci(A,k,X)

    if k == 1 % Declaracion del caso recursivo

    else
        x = A*X(:,end); % Aplicacion de la forma de espacio de estados
        X(:, end+1) = x; % Se guarda en la variable X el resultado de x
        X = fibonacci(A,k-1,X); % Llamado recursivo a la funcion
      
    end
end


%============================Punto 3=======================================

%La función recibe como parametro tres variables, que son el valor de x y y
%y el número de soluciones y retorna un vector
function [x,y]= punto_3(vx, vy, s)
%el valor inicial del alpha(a) y beta(b), es el mismo para todo el sistema
%y s es el numero de soluciones que se solicitan
    a=0.5;
    b=0.5;
    s=s;
    %x(1) es la psoición 1 del vector x que contiene l parámetro ingredado
    %para x y y(1) es la posición 1 del vector y que contiene el parametro
    %ingresado para y
    x(1)=vx;
    y(1)=vy;
    %Con el condiconal for aseguramos aumentar la posición del vector y en
    %cada una de estas almacenar el resultado de la operación realizada
    for i=1:s
          x(i+1)=a* x(i) + y(i)*y(i);
          y(i+1)= x(i)+ b*y(i);
    end

end
