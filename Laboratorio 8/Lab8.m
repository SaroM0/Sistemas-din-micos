% ============================ PUNTO 2 ====================================

clc,clear;

% Declaracion de las condiciones iniciales
x_1=[1;0];
x_2=[0;0.5];
x_3=[0;1];
x_4=[0;2];
a=0.03;

% Bucle de 50 iteraciones
for k = 1:50
    % Actualizacion de las coordenadas de x_1
    x_1(:,k+1) = x_1(:,k)-a*((x_1(:,k)-x_2(:,k))+(x_1(:,k) ...
        -x_3(:,k))+(x_1(:,k)-x_4(:,k)));
    % Actualizacion de las coordenadas de x_2
    x_2(:,k+1) = x_2(:,k)-a*((x_2(:,k)-x_1(:,k))+(x_2(:,k) ...
        -x_3(:,k))+(x_2(:,k)-x_4(:,k)));
    % Actualizacion de las coordenadas de x_3
    x_3(:,k+1) = x_3(:,k)-a*((x_3(:,k)-x_1(:,k))+(x_3(:,k) ...
        -x_2(:,k))+(x_3(:,k)-x_4(:,k)));
    % Actualizacion de las coordenadas de x_4
    x_4(:,k+1) = x_4(:,k)-a*((x_4(:,k)-x_1(:,k))+(x_4(:,k) ...
        -x_2(:,k))+(x_4(:,k)-x_3(:,k)));
end

% Se grafica el comportamiento
figure
hold on
plot(x_1(1,:),x_1(2,:))
plot(x_2(1,:),x_2(2,:))
plot(x_3(1,:),x_3(2,:))
plot(x_4(1,:),x_4(2,:))
hold off

% ============================ PUNTO 3 ====================================

clc,clear;

% Declaracion de las condiciones iniciales
x_1=[10;0];
x_2=[0;2];
x_3=[0;4];
x_4=[3;3];
a=0.03;

% Bucle de 50 iteraciones
for k = 1:50
    % Actualizacion de las coordenadas de x_1
    x_1(:,k+1) = x_1(:,k)-a*((x_1(:,k)-x_2(:,k)) ...
        +(x_1(:,k)-x_3(:,k))+(x_1(:,k)-x_4(:,k)));
    % Actualizacion de las coordenadas de x_2
    x_2(:,k+1) = x_2(:,k)-a*((x_2(:,k)-x_1(:,k)) ...
        +(x_2(:,k)-x_3(:,k))+(x_2(:,k)-x_4(:,k)));
    % Actualizacion de las coordenadas de x_3
    x_3(:,k+1) = x_3(:,k)-a*((x_3(:,k)-x_1(:,k)) ...
        +(x_3(:,k)-x_2(:,k))+(x_3(:,k)-x_4(:,k)));
    % Actualizacion de las coordenadas de x_4
    x_4(:,k+1) = x_4(:,k)-a*((x_4(:,k)-x_1(:,k)) ...
        +(x_4(:,k)-x_2(:,k))+(x_4(:,k)-x_3(:,k))); 
end

% Se grafica el nuevo comportamiento
figure
hold on
plot(x_1(1,:),x_1(2,:))
plot(x_2(1,:),x_2(2,:))
plot(x_3(1,:),x_3(2,:))
plot(x_4(1,:),x_4(2,:))
hold off

% ============================ PUNTO 4 ====================================

clc,clear;

% Declaracion de las condiciones iniciales
x_1=[1;0];
x_2=[0;0.5];
x_3=[0;1];
x_4=[0;2];
a=0.03;

% Bucle de 600 iteraciones
for k = 1:600
    % Actualizacion de las coordenadas de x_1 del nuevo grafo
    x_1(:,k+1) = x_1(:,k)-a*((x_1(:,k)-x_2(:,k)));
    % Actualizacion de las coordenadas de x_2 del nuevo grafo
    x_2(:,k+1) = x_2(:,k)-a*((x_2(:,k)-x_1(:,k))+(x_2(:,k)-x_3(:,k)));
    % Actualizacion de las coordenadas de x_3 del nuevo grafo
    x_3(:,k+1) = x_3(:,k)-a*((x_3(:,k)-x_2(:,k))+(x_3(:,k)-x_4(:,k)));
    % Actualizacion de las coordenadas de x_4 del nuevo grafo
    x_4(:,k+1) = x_4(:,k)-a*((x_4(:,k)-x_3(:,k)));
end

% Se grafica el comportamiento del nuevo grafo
figure 
hold on
plot(x_1(1,:),x_1(2,:))
plot(x_2(1,:),x_2(2,:))
plot(x_3(1,:),x_3(2,:))
plot(x_4(1,:),x_4(2,:))
hold off