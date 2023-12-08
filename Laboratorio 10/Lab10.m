close all
clear all
clc

%% --- Leer datos --- 
load('price2.mat')

%% organización de los datos --- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%espacio para construir la matriz H, el vector Y y realizar la regresión
%lineal

k=1;
for i=3:48
    Y(k)=price2(1,i+1);
    H(k,:)=[price2(i)', price2(i-1)', price2(i-2)'];
    k=k+1;
end

theta1=inv(transpose(H)*H)*(transpose(H)*Y');

p=1;
for i=3:48
    new(p)=theta1(1)*price2(i)+theta1(2)*price2(i-1)+theta1(3)*price2(i-2);
    p=p+1;
end

figure
hold on
plot(price2(4:49))
plot(new)
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% --- regresión con regularización L2 ---

fun=@norm_reg_L2; % objetive function 
theta0 = theta1;
Aconstr=[];
bconstr=[];
Aeq=[];
beq=[];
lb=[];
ub=[];
nonlcon=[];

gamval = [0,logspace(0,10,300),logspace(10,16,300)] ;

for i=1:1:length(gamval)
    gamma=gamval(i);
    opts = optimset('MaxFunEvals',40000,'MaxIter',10000);
    [thetasol, Jval]= fmincon(@(theta)fun(theta,Y,H,gamma),theta0,Aconstr,bconstr,Aeq,beq,lb,ub,nonlcon,opts);
    thetasol1(:,i)=thetasol;% guardar solución
    Jsol(i)=Jval;%guardar valor función de costo
    theta0=thetasol; %redefinir el valor inicial para el siguiente ciclo

end


figure
hold all
plot(gamval,thetasol1(1,:))
plot(gamval,thetasol1(2,:))
plot(gamval,thetasol1(3,:))
set(gca, 'XScale', 'log')

figure
plot(gamval,Jsol)
set(gca, 'XScale', 'log')

%% regresión con regularización L1
% 
fun=@norm_reg_L1; % objetive function 
theta20 = theta1;
Aconstr=[];
bconstr=[];
Aeq=[];
beq=[];
lb=[];
ub=[];
nonlcon=[];


for i=1:1:length(gamval)
    gamma=gamval(i);
    opts = optimset('MaxFunEvals',40000,'MaxIter',10000);
    [thetasol, Jval]= fmincon(@(theta)fun(theta,Y,H,gamma),theta20,Aconstr,bconstr,Aeq,beq,lb,ub,nonlcon,opts);
    thetasol2(:,i)=thetasol;
    Jsol2(i)=Jval;
    theta20=thetasol;

end

figure
hold all
plot(gamval,thetasol2(1,:))
plot(gamval,thetasol2(2,:))
plot(gamval,thetasol2(3,:))
set(gca, 'XScale', 'log')


figure
plot(gamval,Jsol2)
set(gca, 'XScale', 'log')


%% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Acá va el código que calcule la salida estimada usando solamente los dos
% %parámetros no cero de theta
% 
% 
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
