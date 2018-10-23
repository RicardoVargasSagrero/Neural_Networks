%a) El usuario da en una matriz los valores de los vectores prototipo y por 
%separado el vector de entrada, b) El programa construye la red de Hamming 
%y si converge indica al usuario a que clase pertenece el vector de entrada.
%Notas: i) El programador decide el valor de epsilon, 
%ii) Un número máximo de iteraciones, por ejemplo t=50, esto para evitar 
%que el programa se cicle. c) El programa debe presentar una gráfica de la 
%evolución de los valores del vector a2 y desplegar en pantalla el último valor.
%Como entrada de este programa se recibiran los vectores prototipo de cada
%una de las clases. Definidad como x1, x2, xn NombreVariable
fprintf('\t\tHamming Network\n');
%Vectores prototipo
W=[];
%Clases
clase = [];
%Lectura del archivo
aux = 0;
file = fopen('matrices.txt','r');
if file == 1
    disp('El archivo no se pudo abrir correctamente');
else
    while feof(file) == 0
        aux=aux+1;
        %lectura de linea por linea
        data = fgetl(file);
        %Dividimos los valores y el nombre de las clases
        [C,matches] = strsplit(data,'\s*[^a-zA-Z]\s*','DelimiterType','RegularExpression');
        %Se guardan los nombres de las clases 
        clase{aux} = char(C{2});
        %Se guardan los valores de los vectores
        W{aux} = str2num(matches{1});
    end
    S = aux;
    R = size(W{1},2);
    W2 = [];
    %for de i = 1 hasta el S de l en l 
    for i=1:1:S
        [A] = W{i};
        for j=1:1:S
            W2(i,j) = A(j);
        end
    end
    disp('W1');
    disp(W);
    disp('W2');
    disp(W2);
    %ya que el valor de 
    Z =[1 -1 -1;1 1 -1];
    W2 = Z;
    %Se calcular el valor del bias 
    b = []; 
    for i=1:1:S
        b(i) = R;
    end
    %calculamos el valor de epsilon 
    var = 1/S-1;
    %Multiplicando el valor aleatorio dado por 'var' obtenemos que el valor
    %aleatorio se quede en un rango de 0 y 'var'
    Ep = rand()*var;
    if Ep < 0
        Ep = Ep*-1;
    end
    Wp = eye(S);
    %Una ve tiendo epsilon calculamos la matris de pesos 
    for i=1:1:S
        for j=1:1:S
            if Wp(i,j) == 0
                Wp(i,j) = -Ep;
            end
        end
    end
    %Se ingresa el valor de entrada 
    p=[-1;-1;-1];
    disp('p');
    disp(p);
    %Una vez teniendo e valor de P empezamos con las iteraciones de hamming
    %Comenzamos calculando la capa Feedfoward (solo una vez)
    b = b';
    a0 =(W2*p)+b;
    disp('a0');
    disp(a0);
    %Ahora una vez calculada la capa Feedfoward podemos empezar con la capa
    %recurrente.
    %Esta parte debe repertirse hasta que converja la solucion, esto quiero
    %decir solo una salida debe terner un valor y la demas deben ser 0
    iteracion = 1;
    disp('Valores de la matriz de pesos');
    disp(Wp);
    disp('Iteracion 1');
    banderaRep = 0;
    x = [];
    
    a1 = poslin(Wp*a0);
    for c=1:1:S
        x(c) = c;
    end
    plot(x,a1);
    ylabel('Cambios en a');
    xlabel('Iteraciones');
    title('Red de hamming');
    hold on
    x = zeros(S,1);
    a2 = poslin(Wp*a1);
    for c=1:1:S
        x(c) = c;
    end
    plot(x,a1);
    hold on
    x = zeros(S,1);
    disp('a1');
    disp(a1);
    disp('a2');
    disp(a2);
    a3 = a2;
    cad = "Iteracion %d\na%d ="; 
    converje = 0;
    while iteracion < 100
        hold on
        iteracion = iteracion + 1;
        str = sprintf(cad,iteracion,iteracion);
        disp(str);
        disp(a1);
        a2 = poslin(Wp*a1);
        for c=1:1:S
            x(c) = c;
        end
        plot(x,a1);
        x = zeros(S,1);
        for i=1:1:size(a2)
            disp(a2(i));
            if a2(i) == 0
                banderaRep = 1;
            end
        end
        disp('Grafica de evolucion de valores');
        if banderaRep == 1
            if a3 == a2 
                converje = 1;
                break
            end
        end
        a3 = a2;
    end
    if converje == 1
        cad = "La funcion converje a un tipo de vertor: %s";
        for i=1:1:S
            class = clase{i};
        end
        str = sprintf(cad,class);
        disp(str);
    end
    hold off
    disp('Fin de la funcion');
end
