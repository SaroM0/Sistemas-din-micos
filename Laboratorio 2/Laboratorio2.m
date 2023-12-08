
%============================Punto 3=======================================

% Se declaran las variables de tiempo y amplitud recuperadas de g
tiempo = out.g.time;
amplitud = out.g.signals.values;

% Se grafica la funcion g con plot especificando nombres, titulo y grid
plot(tiempo, amplitud);
xlabel('Tiempo');
ylabel('Amplitud');
title('Gráfica de la función g');
grid on;

%============================Punto 2=======================================

%a) La matriz a continuación contiene la representacion del sistema de
%ecuaciones establecido para la solución del problema.
T=[1,1,1;1,1,-3;-1,1,0]

%La matriz R contiene los valores a los que las ecuaciones establecidas
%estaban igualadas.
R= [20;0;-1]

%I es una variable a la que se le asignó la función inv usada
%para encontrar la inversar de la matriz T.
I= inv(T)

%La variable F tiene asignada la operación de multiplicación de la matriz T
%invertida, que se encuentra en la variable I, con la matriz R. Lo anterior
%es la solución al problema haciendo uso de matrices.
F= I*R


%b) A continuación se hace uso de la función solve para resolver el
%problema por medio del uso de ecuaciones.
% Uso syms para indicar que variables quiero resolver.
syms h m n

%Asigno a eqns las ecuaciones que me van a ayudar a resolver el sistema
eqns=[h + m + n == 20, h + m - 3*n == 0, -h + m == -1];

% Por último asigno a una variable (S) la solución obtenida con la función solve
S = solve(eqns,[h m n])


%============================Punto 1=======================================

%{
Estas variables son con el único propósito de verificar que la función
 esté operando correctamente
%}
a=verificar_palindromo(6006)
b=verificar_palindromo(7337)
c=verificar_palindromo(289717982)
d=verificar_palindromo(01234)
e= verificar_palindromo(' ana lava lana')
f=verificar_palindromo('se van a sus naves')
g=verificar_palindromo('sor rebeca hace berros')
h=verificar_palindromo('la ruta natura')
i=verificar_palindromo([ 1 4 6 9])
j=verificar_palindromo('no traces en ese carton')
k=verificar_palindromo(' sometamos o matemos')
l=verificar_palindromo(2547987452)
m=verificar_palindromo('Yo hago yoga hoy')
n=verificar_palindromo('La ruta nos aporto otro paso al natural') 

%{
se declara el nombre de la función y las entradas. En este caso solo una
 ya que le entra o un número o una frase
%}
function palindromo = verificar_palindromo (entrada) 
    %{
    Este condicional con "isa" es para comprobar si la entrada es un
    número. En el caso que si, se le asigna a cadena el número, pero
    convertido a str. 
    %}
    if isa(entrada,'double') 
        cadena = num2str(entrada); 
    %{
    Si no es número entonces es frase, en este caso se le quitan los
    espacios. Lower pone todo en minúscula en caso de que haya una
    mayúscula en la frase. 
    %}
    else 
        cadena = entrada(find(~isspace(entrada))); 
        cadena=lower(cadena); 
    end
    %{
    Se le asigna a esta variable la cadena pero invertida, ya sea número 
    o frase
    %}
    verificar= flip(cadena); 
    %{
    Este condicional es para confirmar si concuerda la cadena invertida
 con la orginal. En el caso de que si, la función arroja un 1.
    %}
    if verificar==cadena 
        palindromo=1;
    %{
    De lo contrario arroja un 0.
    %}
    else 
        palindromo=0; 
    end
end 
  


   






