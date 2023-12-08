% =========================== PUNTO 1 =====================================
% Limpia la ventana de comandos y borra las variables existentes
clc, clear;

% Define el numero iteraciones
ciclo = 5;

% Inicializa una matriz 6x6 de ceros
m = zeros(6);

% Se definen las casillas negras iniciales de t=1
m(3,3)=1;
m(4,4)=1;
m(4,5)=1;
m(3,3)=1;
m(4,5)=1;
m(5,4)=1;
m(5,3)=1;

% Realiza un bucle for con la cantidad de iteraciones y crea un grafico
figure;
for i = 1:ciclo
     m
     bar3(m);
     title(['Generación ', num2str(i)]);
     xlabel('Columnas');
     ylabel('Filas');
     pause(3)
     m = Generacion(m); % Llama a la funcion Generacion
end

% =========================== PUNTO 2 =====================================


%En esta primera parte establecemos las condicones iniciales para el
%sistema
n=10
s=0
p=10
a=0.8
b= 0.2
c= 0.4
d= 20
i= 1
%creamos un condicional para incrementar el indice
for i=1:n
%s represente las semillas producidas, i es el año, d la cantidad de
%semillas al final de cada año y p la cantidad de plantas en cada
%generación
s(i+1)=d* p(i)
%Para esta segunda ecuación tnemos encuenta también a que representa las
%semillas que germinan en el año n y las semillas que germinan en el año
%n+1
p(i+1)=a*c*s(i+1)+b*c*(i)
end
%Tambien tenecmos en cuenta que el aumento del índice o del año
% esta limitado hasta n, que es el año 10 por el que se pregunta en el
% problema
plot(s)
figure
plot(p)

% =========================== PUNTO 1 =====================================

% Función para calcular la siguiente generación
function [m] = Generacion(m)
    [a,b] = size(m);
    % Crea una copia de la matriz original
    for i = 1:a
         for j = 1:b
         c(i,j) = m(i,j);
         end
    end
    
    % Recorre la matriz original para aplicar las reglas de las casillas
    for i = 1:a
         for j = 1:b
             n = vecinos(c,i,j); % Calcula el número de vecinos negros
             if (c(i,j)== 1) && (n == 3)
               m(i,j) = 1; % Casilla negra con 3 vecinos negros
            end
            
            if (c(i,j)== 1) && (n == 2)
               m(i,j) = 1; % Casilla negra con 2 vecinos vivos
            end
            
            if (c(i,j)== 1) && (n < 2)
               m(i,j) = 0; % Casilla negra con menos de 2 vecinos -> blanca
            end
            
            if (c(i,j)== 1) && (n > 3)
               m(i,j) = 0; % Casilla negra con mas de 3 vecinos -> blanca
            end
            
            if (c(i,j)== 0) && (n == 3)
               m(i,j) = 1; % Casilla blanca con 3 vecinos negras -> negra
            end

         end
    end
end

% Funcion para contar el número de vecinos negras
function n = vecinos(m,x,y)
    [a,b] = size(m);
    n = 0;
    for i = x-1:x+1
         for j = y-1:y+1
             if (i>=1) && (i<=a) && (j>=1) && (j<=b) && ~((i==x) && (j==y))
                 if m(i,j) == 1
                    n = n + 1; % Incrementa el contador de vecinos negros
                 end
             end
         end
    end
end
