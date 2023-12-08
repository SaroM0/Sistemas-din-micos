%% Cargar datos
clc
clear all
load('propertySales.mat');
%% Creación de la base de datos
x=[];
y=[];

%%% 
%Creen la matriz de ejemplos X, y el vector de salida Y. 
%%%

k=1;
for i=3:48
    y(k)=price2(i+1);
    x(k,:)=[2, price2(i)', price2(i-1)', price2(i-2)'];
    k=k+1;
end
j=47;
for i=3:50
    y(j)=price3(i+1);
    x(j,:)=[3, price3(i)', price3(i-1)', price3(i-2)'];
    j=j+1;
end
n=95;
for i=3:50
    y(n)=price4(i+1);
    x(n,:)=[4, price4(i)', price4(i-1)', price4(i-2)'];
    n=n+1;
end
m=143;
for i=3:48
    y(m)=price5(i+1);
    x(m,:)=[5, price5(i)', price5(i-1)', price5(i-2)'];
    m=m+1;
end

y=y';

%% Preprocesamiento de X y Y 
% En esta celda los datos se separan en datos de entrenamiento y datos de
% prueba. Así mismo, se preprocesan de tal forma que tanto las variables (columnas de x)
% como las salidas (y) esten dentro del rango [0,1]. 

% A la hora de trabajar con redes neuronales, y en general con cualquier
% algoritmo de aprendizaje, una buena práctica es separar los datos en sets
% de entrenamiento y prueba. Esto se debe a que ustedes quieren verificar
% la eficiencia del modelo en datos "reales", datos que no haya visto la
% red durante el entrenamiento.

% El prepocesamiento de datos es tambien una técnica usual del area. Cada
% método de preprocesamiento tiene fines distintos. Por ejemplo, la
% normalización (el que estan aplicando aquí) se usa para que todas las
% variables de entrada esten dentro del mismo rango de valores (usualmente [0,1])
% esto ayuda a que los pesos de la red no se vean sesgados por la diferencia de las magnitudes de las entradas.  

lim_train_data = round(0.8*size(x,1));

x_train = x(1:lim_train_data,:);
y_train = y(1:lim_train_data,:);

x_max = max(x_train);
x_min = min(x_train);
y_max = max(y_train);
y_min = min(y_train);

x_train = (x_train-x_min)./(x_max-x_min);
y_train = (y_train-y_min)./(y_max-y_min);

x_test = (x(lim_train_data:end,:)-x_min)./(x_max-x_min);
y_test = (y(lim_train_data:end,:)-y_min)./(y_max-y_min);
%% Entrenamiento 
epochs=12000; %% Una época equivale a una pasada entera por la base de datos
lr=0.001; %% taza de aprendizaje lr, learning rate, alpha, etc...
clc

% La inicialización de los pesos de una red neuronal es un tema relevante
% que todavía se encuentra en investigación. En este laboratorio ustedes
% van a utilizar una técnica muy conocida llamada He/Xavier initialization.

[w,b]=initialize_weights(size(x,2),30,1); 

w_init=w;
b_init=b;

% Arreglos que almacenan el costo del modelo en cada iteración para el set de prueba y entrenamiento
train_cost=[]; 
test_cost=[];

% Función de activación, otras posibles opciones son @sigmoid (función
% logística), @linear_fun (función lineal Z=WA) o 
% @relu (Rectified linear unit, muy utilizada en redes profundas)

att_fun = @act_tanh;
for i=1:epochs
    activations = forward_propagation(x_train,att_fun,w,b);
    test_activations = forward_propagation(x_test,att_fun,w,b);
    actual_cost=cost_function(y_train',activations{2});
    train_cost = [train_cost,actual_cost];
    test_cost = [test_cost,cost_function(y_test',test_activations{2})];
    grads = back_propagation(y_train',x_train,activations,att_fun,w);
    [w,b] = update_weights(w,b,grads,lr);
    if mod(i,500) == 0
        message=['Epoca: ',num2str(i),' Función de costo: ',num2str(actual_cost)];
        disp(message)
    end
end
%% Grafica de la función del comportamiento de la función de costo durante el entrenamiento
figure
plot(train_cost)
hold on
plot(test_cost) 
legend('train cost','test cost')
title('cost')
hold off
%% Graficas de la predicción versus la salida real
% Con la red entrenada hallé las salidas predichas por el modelo para
% los datos de prueba y entrenamiento. Grafique cada set de datos con su respectiva salida deseada (y_train,y_test). 

% Hint: forward_propagation es una función que ejecuta la propagación hacia adelante de la red. 
% Recibe como parámetos de entrada la matriz X ,la función de activación de la capa escondida, 
% la celda con las matrices de pesos w y los biases b

train_predictions = forward_propagation(x_train, att_fun, w, b);
test_predictions = forward_propagation(x_test, att_fun, w, b);

figure
plot(y_train);
hold on;
plot(train_predictions{end});
legend('Real Train','Pred Train')
title('train');
legend;
hold off;

figure
plot(y_test);
hold on;
plot(test_predictions{end});
legend('Real Test','Pred Test')
title('test');
legend;
hold off;


