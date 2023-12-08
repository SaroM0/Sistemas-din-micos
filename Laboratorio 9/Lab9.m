clc,clear;
% ========================= PUNTO 1 =======================================

% Se leen los audios y se guardan los valores de f e y
[yr,fr]=audioread("borgesRuido.wav");
[yf,ff]=audioread("borgesFiltrado.wav");
    
%Se reproduce el audio (se dejó comentado para no interferir la ejecución)
%{
sound(yr,fr);
pause(22);
sound(yf,ff);
%}
%% 

% ========================= PUNTO 2 =======================================

%{
 Se itera i de 50 a 10049 para indexar los valores de la matriz x y el
 vector y
%}
k=1;
for i=50:10049
    y(k)=yf(i,1);
    x(k,:)=yr(i-49:i,1);
    k=k+1;
end

% Se aplica la formula de regresion lineal y se guarda en b
b=inv(transpose(x)*x)*(transpose(x)*y');

% PUNTO 4 - usando la funcion se grafica la respuesta en frecuencia del fil
graficaFrecFiltro(b,1,ff);

%% 

% ========================= PUNTO 3 =======================================

%{
 Se itera i de 6 a 10049 para indexar los valores de la matriz x y el
 vector y
%}
k=1;
for i = 6:10050
    y_1(k)=yf(i,1);

    % En este caso se concatena a y b en la matriz x
    x_1(k,:)=[yr(i-5:i)', yf(i-5:i-1)'];
    k=k+1;
end

% Se calcula la regresion lineal dejandola en theta
theta=inv(transpose(x_1)*x_1)*(transpose(x_1)*y_1');

% Se sacan los valores de a y b que estan en el vector theta
b=theta(1:6);
a=theta(7:11);

% PUNTO 4 - usando la funcion se grafica la respuesta en frecuencia del fil
graficaFrecFiltro(b,a,ff);