function [] = graficaFrecFiltro(b,a,fs)
    %función que grafica el espectro en frecuencia del filtro de
    %coeficientes b,a y frecuencia de muestreo fs

    ff=fs/2;
    ptos=1000;
    f=0:ff/ptos:ff-1;
    [h,w] = freqz(b,a,ptos);
    figure
    plot(f,abs(h))
    ylabel('Magnitud')
    xlabel('Frecuencia [Hz]')
    
    
end

