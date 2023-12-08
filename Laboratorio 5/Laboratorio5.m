%=========================== PUNTO 1 ======================================

clc,clear;
%{ 
Se lee el audio dado con audioread y se guarda la frecuencia en Fs y la
informacion de la señal en y
%}
[y,Fs] = audioread('Audio5.mp3');

b=zeros(1,5734); % Se crea un arreglo b de 0's de tamaño 5734
b(2)=0.5; % En la posicion 2 se indexa 0.5
b(5734)=0.5; % En la ultima posicion se indexa 0.5

%{ 
Se aplica un filtro a la señal de audio y usando el filtro definido por 
b e 1.
%}
f=filter(b,1,y);
%{ 
Se reproduce el sonido usando sound con la señal f, la frecuencia fs y a 24
bits
%}
sound(f,Fs,24);
pause(4); %Pausa la ejecucion durante 4segundos
%=========================== PUNTO 2 ======================================
% b) ======================================================================
clear,clc;

[y,Fs] = audioread('Audio5.mp3');

b=zeros(1,5001); % Se crea un arreglo b de 0's de tamaño 
b(1)=1;% En la posicion 1 se indexa 1
b(5001)=(0.5)^3; % En la posicion 5001 se indexa (0.5)^3
c=zeros(1,8821); % Se crea un arreglo c de 0's de tamaño 
c(1)=1; % En la posicion 1 se indexa 1
c(8821)=(0.9)^5; % En la posicion 5001 se indexa (0.9)^5

f=filter(b,c,y);
    
sound(f,Fs);
pause(4); %Pausa la ejecucion durante 4segundos

% c) ===================================================================

clear,clc;

[y,Fs] = audioread('Audio5.mp3');

b=zeros(1,5001); % Se crea un arreglo b de 0's de tamaño 
b(1)=1;
b(5001)=(0.5)^3;
c=zeros(1,8821); % Se crea un arreglo c de 0's de tamaño 
c(1)=1;
c(8821)=(0.96)^5;

f=filter(b,c,y);
    
sound(f,Fs);
pause(4); %Pausa la ejecucion durante 4segundos

% c) ===================================================================

clear,clc;

[y,Fs] = audioread('Audio5.mp3');

b=zeros(1,5001); % Se crea un arreglo b de 0's de tamaño 
b(1)=1;
b(5001)=(0.5)^3;
c=zeros(1,8821); % Se crea un arreglo c de 0's de tamaño 
c(1)=1;
c(8821)=(1.05)^5;

f=filter(b,c,y);
    
sound(f,Fs);
% ======================================================================