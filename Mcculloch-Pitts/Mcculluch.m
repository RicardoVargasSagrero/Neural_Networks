%% Compuertas NOT, AND, OR con neurona Mcculluch-pitts
% Primero se tiene la tabla de verdad de la compuerta

tVerdad = [0,1;1,0];
%% 
% Como el entrenamiento es a prueba y error entonces asignamos los valores 
% de w y teta

w = 1;
teta = -1;
%% 
% Ahora probramos el modelo matematico
% 
% n = p * w

n = tVerdad(1,1)* w;
%% 
% Entramos a la parte de la comparacion con el umbral n > teta

for i = 1:2
    n = tVerdad(i,i)* w;
    if ( n > teta)
        a = 0;
        if(a == tVerdad(i,i))
            resultadoNOT(1,i) = 1;
        else 
            resultadoNOT(1,i) = 0;
        end
    end
end
%% 
% Solo se obtuvieron los resultados esperados con teta = 0; 
%% *Compuerta AND de 2 entradas*
% Tabla de verdad de la compuerta AND de 2 entradas

tand = [0,0,0;0,1,0;1,0,0;1,1,1];
%% 
% **