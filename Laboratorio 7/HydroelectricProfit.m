function J = HydroelectricProfit(x,inF,St,k1,k2,price)
    
    % Ac� de debe definir la funci�n de costo
    % J debe contener el valor que se obtiene por la venta de la energ�a
    % x=[flujoTurbina flujoVertedero]
    % inF = flujoRio
    % St = almacenamiento
    % k1 y k2 constantes dadas del sistema  
    % price = precio que se paga por la energ�a
    
    fT=x(1);
    fV=x(2);

    a = St+(inF-fV-fT);
    e = fT*((1/2)*k1*(a+St)+k2);
    
    J= -e*price(1);
    
    
end