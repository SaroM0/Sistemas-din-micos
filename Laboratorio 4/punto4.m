

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
ylabel('Movimiento'); % Etiqueta el eje posicion y velocidad
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



