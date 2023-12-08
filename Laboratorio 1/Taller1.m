
%==============================PUNTO 1=====================================

% Declaración de las matrices A,C y el vector B
A = [1,1/2; 1/3,1/4; 1/5,1/8];
B = [5,-2];
C = [4,7/4,9/4; 1,2,3];

%a)
% Multiplica las matrices A y C para obtener la matriz D
D=A*C;

%b)
%{
Multiplica las matrices A y B para obtener la matriz D
E=A*B;
No es posible realizar dicha operación ya que as dimensiones no son 
compatibles, es decir, para que puedan multiplicarse, como A es una
matriz 3*2, B deberia tener dos filas, pero no es as ́ı, 
́esta es una matriz 1*3
Error: Incorrect dimensions for matrix multipli cation
%}

%c)
% Suma la matriz A con C' para obtener la matriz F
F=A+C';

%d)
%{
calcula la matriz G al multiplicar la matriz B por la matriz A, luego
restarle el producto de la transposición de la matriz C por la matriz A
G = B*A-C'*A;
no puede realizarse ya que
en el momento de realizar las multiplicaciones,
las dimensiones no son correctas. Para que puedan
multiplicarse dos matrices las columnas de la primera
deben tener la misma dimensi ́on que las filas de la
segunda y en este caso esto no pasa
Error: Incorrect dimensions for matrix multiplication
%}

%e)
%{
calcula la matriz H al primero multiplicar 2 por la matriz C, restarle 6
veces la transposición de la matriz A, y luego multiplicar el resultado
por la transposición de la matriz B
H = (2*C-6*A')*B';
No es posible realizar esta
operaci ́on debido a que, despues de desarrollar la
operaci ́on que esta entre parentesis y multiplicarla con
la matriz B, las dimensiones no son correctas.
Error: Incorrect dimensions for matrix multiplication
%}

%f)
%{
calcula la matriz I al multiplicar la matriz A por la matriz C y luego
restarle el producto de la matriz C por la matriz A
I = A*C-C*A;
Al resolver la resta las dos ma-
trices implicadas deben tener exactamente las mismas
dimensiones. En la primera multiplicaci ́on se obtiene una
matriz de tama ̃no 3*3 y en la segunda se obtiene una
matriz 2*2, las cuales no tienen la mismas dimensiones
y por tanto no se puede realizar la operacion
Error: Arrays have incompatible sizes for this operation
%}

%g)
%{
calcula la matriz J al multiplicar la matriz A por su transposición y
luego sumarle el producto de la transposición de la matriz C por la matriz
C
%}
J = A*A'+C'*C;

%h)
%{
Calcula la matriz K al realizar una multiplicación elemento por elemento
de la matriz B consigo misma
%}
K = B.*B;

%==============================PUNTO 2=====================================

% Se declara la matriz AA
AA= [4,2,2;-3,1,4;1,0,3;5,-1,5];

% a)
%{
Se extrae la fila 1 para multiplicarla por 1/4 y se retorna modificada
%}
AA(1,:) = (AA(1,:))*1/4;

% b)
%{
Se extrae la fila 2 para multiplicar la fila 1 por 3 y
sumarla a la fila 2. Luego, retorna ya modificada
%}
AA(2,:) = AA(2,:)+(AA(1,:)*3);

% c)
%{
Se extrae la fila 3 para multiplicar la fila 1 por -1 y
sumarla a la fila 3. Luego, retorna ya modificada
%}
AA(3,:) = AA(3,:)+(AA(1,:)*-1);

% d)
%{
Se extrae la fila 4 para multiplicar la fila 1 por -5 y
sumarla a la fila 4. Luego, retorna ya modificada
%}
AA(4,:) = AA(4,:)+(AA(1,:)*-5);

% e)
%{
Se crea una variable AB que va a almacenar
la fila 2 para despues tener libertad de extraer y
reemplazar la fila 2 por la fila 4. Por ultimo, se extrae la
fila 4 para reemplazarla por la fila 2 almacenada en la
variable AB
%}
AB = AA(2,:);

AA(2,:) = AA(4,:);

AA(4,:) = AB;


%==============================PUNTO 3=====================================

% Se declaran los vectores a,b,c y d
a = [1,3];
b = [2,4];
c = [5;3];
d = 9;

% Se concatenan los vectores a,b resultando en una matriz de 2x2
M = [a;b];

% Se concatenan M,c resultando en una matriz 2x3
M = [M,c];

%{ 
Se concatenan los vectores d y c' (se saca la transpuesta de c para poder
concatenarlas), resultando en una matriz 1x3
%}
X = [d,c'];

% Se concatenan las matrices M,X verticalmente resultando una matriz 3x3
M = [M;X];

% Se concatenan los vectores a',c resultando en una matriz 2x2
Z = [a',c];

%{ 
Se concatena verticalmente el vector b con la matriz Z resultando en una
matriz 3x2 
%}
Z = [b;Z];

%{
Finalmente como las dimensiones coinciden para concatenar M,Z se realiza la
operación resultando en la matriz e esperada
%}
M = [M,Z];

%==============================PUNTO 4=====================================

% Declaración de los arreglos A1, A2
A1 =  [1,3,5,7,9];
A2 = [2,4,6,8]; 

%{ 
Llamada a la funcion sortArrays con parametros A1, A2 y se almacena el
resultado en A3
%}
A3 = sortArrays(A1,A2); 

%{ 
Declaracion de la funcion sortArrays con parametros x,y y se almacena en la
variable sortedArrays
%}
function sortedArrays = sortArrays(x,y)

% Concatenacion de los arreglos x,y en la variable AR
AR = [x,y];

%{
Llamada de la funcion sort que ordena el arreglo AR y se almacena el
resultado en la variable sortedArrays
%}
sortedArrays = sort(AR);

% Fin de la función
end

%==========================================================================
