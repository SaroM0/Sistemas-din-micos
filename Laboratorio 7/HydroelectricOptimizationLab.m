%% Optimización de hidroituango
close all
clear all
clc


%% Cargar Datos
load('DataPrecio.mat');

%% Definición de parámetros
inF=1070;
x0 = [inF; 0];
stor0 = 90000; % initial vol. of water stored in the reservoir (Acre-Feet)
k1 = 0.00003; % K-factor coefficient
k2 = 9; % K-factor offset
precio=price(1);
St=10000;


%% Optimización con FMINCON
options = optimset('MaxFunEvals',Inf,'MaxIter',5000,...
    'Algorithm','interior-point','Display','iter');

%fun=@H2_norm_reg_L1
fun=@HydroelectricProfit;
Aconstr=[];
bconstr=[];
Aeq=[];
beq=[];
lb=[0 0];
ub=[inf inf];
nonlcon=[];

[x, Jval]= fmincon(@(x)fun(x,inF,St,k1,k2,precio),x0,Aconstr,bconstr,Aeq,beq,lb,ub,nonlcon,options);


%%  plot cost function

ft=310000:10:311000;
fv=0.000001:0.00000001:0.000002;
[X,y]=meshgrid(ft,fv);

for i = 1:length(ft)
    for j = 1:length(fv)
        x=[ft(i),fv(j)];
        m(i,j)=HydroelectricProfit(x,inF,St,k1,k2,precio);
    end
end

surf(X,y,m);





