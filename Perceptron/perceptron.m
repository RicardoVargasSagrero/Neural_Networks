%RED PERCEPTRON metodo grafico y con aprendizaje
disp('RED PERCEPTRON');
%Lectura del archivo 
nameFile = input('Ingrese el nombre del archivo a abrir:\n ','s');
file = fopen(nameFile);
if file == -1
    disp('El archivo no se pudo abrir exitosamente');
else
    M = importdata(nameFile);
    disp(M);
end
%Con este punto anterior se ingresa la matriz de pesos 
% y se puede obtener el tamanio de la matriz m,n
[columnas,filas] = size(M);
fclose(file);
r = filas-1;
%A continuacion se muestran las opciones para realizar la
%clasificacion. Opcion 1. Regla de aprendizaje unificada,
%Opcion 2. Metodo grafico
disp('Ingrese una de las opciones');
disp('1). Regla unificada de aprendizaje');
disp('2).Método gráfico');
opcion = input('Opcion: ','s');
%Ahora se obtiene los valores de los targets que son la todos lo de la 
%ultima columna
target = M(:,filas);
w2 = [];
disp(opcion);
if opcion == '1' 
    %Regla de aprendizaje, se ingresan los valores de entrada
    %Se recibe el valor maximo de iteraciones
    iteracionMax = input('\nIngrese el valor maximo de iteracion');
    % Valor de Error 
    b2 = [];
    e2 = [];
    w2 = [];
    error = input('\nIngrese el valor para Error en iteracion');
    e1 = [iteracionMax,filas];
    %Se inicializan los valores aleatorios para w y b
    [j,k] = size(M(1,:));
    l = k-1;
    %Se generan las canciones 
    w =1 +(2-1)*rand([j 1]);
    W = w';
    w2 = cat(1,w2,W);
    disp('w');
    disp(w);
    b = 0 + (2-0)*rand(1,1);
    b2 = cat(1,b2,b);
    disp('b');
    disp(b);
    %Proceso de aprendizaje 
    c = 0;
    for x = 1:iteracionMax
        for k = 1:columnas
            for d = 1:r
                p(1,d) = M(k,d);
                P = p;
            end
            fprintf('Iteración %d.%d\n',k,x);
            a = hardlim(w*P+b);
            disp('a');
            disp(a);
            disp(M(k,filas));
            %Se compara con target
            if a == M(k,filas)
                c = c + 1;
                fprintf('contador = %d',c);
            else
                %Reglas de aprendizaje 
                e = M(k,filas) - a;
                e2 = cat(1,e2,e);
                %e1(x,k) = e;
                disp('e');
                disp(e);
                disp('p');
                disp(P);
                disp(p);
                disp('W');
                disp(W);
                b1 = b + e;
                b2 = cat(1,b2,b1);
                w1 = W + e*P;
                w2 = cat(1,w2,w1);
                fprintf('w1:\n');
                b = [];
                b = b1;
                disp(b);
                W = [];
                W = w1;
                disp(W);
                e = [];
                b1=[];
                P=[];
                w1=[];
                a=[];
            end
        end
        if isequal(c,col) && isequal(x,iteracionMax)
            [t1,t2] = size(w2);
            [ta1,ta2] = size(e2);
            [tam1,tam2] = size(b2);
            file2 = fopen('resultado.txt','w');
            fprintf(file2,'W = [');
            for f1 = 1:t1
                for f2 = 1:t2
                    fprintf(file2,'%f ',e2(ta1,ta2));
                end
            end
            fprintf(file2,']\n');
            fprintf(file2,'Error = [');
            for f3 = 1:ta1
               for f4 = 1:ta2
                  fprintf(file2,'%f  ',e3(ta1,ta2));
               end
            end
            fprintf(file2,']\n\nB = [');
            for f5 = 1: tam1
                for f6 = 1:tam2
                   fprintf(file2,'%f  ',b2(tam1,tam2)); 
                end
            end
            fprintf(file2,']\n');
            fclose(file2);
            subplot(1,3,1),plot(w2),title('Grafica W');
            subplot(1,3,2),plot(b2),title('Grafica B');
            subplot(1,3,3),plot(e2),title('Grafica Error');
            return
        elseif isequal(c,columnas) && x < iteracionMax
            [t1,t2] = size(w2);
            [ta1,ta2] = size(e2);
            [tam1,tam2] = size(b2);
            fprintf('\nCriterio de finalizacino');
            file2 = fopen('resultado.txt','w');
            fprintf(file2,'W = [');
            for f1 =1:t1
               for f2 = 1:t2
                  fprintf(file2,'%f  ',w2(t1,t2));
               end
            end
            fprintf(file2,']\n\nError = [');
            for f3 = 1:ta1
                for f4 = 1:ta2
                    fprintf(file2,'%f  ',e2(ta1,ta2));
                end
            end
            fprintf(file2, ']\n\nB = [');
            for f5 = 1:tam1
                for f6 = 1:tam2
                    fprintf(file2,'%f  ',b2(tam1,tam2));
                end
            end
            fprintf(file2,']\n');
            fclose(file2);
            subplot(1,3,1),plot(w2),title('Grafica W');
            subplot(1,3,2),plot(b2),title('Grafica B');
            subplot(1,3,3),plot(e2),title('Grafica Error');
            return
        else
            c = 0;
            continue
        end
    end
else
    disp('No se cumple la condicion');
end