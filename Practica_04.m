%% Pr�ctica 4: Convoluci�n y Correlaci�n de se�ales en tiempo continuo
%% Datos generales:
% Autores:
%
% * Luis Enrique Hernandez Lugardo
%
% * Silverio Jim�nez Cesar Antonio
%
%%
%% Objetivos:
% * Conocer m�todos b�sicos de integraci�n num�rica
% * Manipulaci�n de instrucciones en MATLAB
% * Simular convoluciones y correlaciones de se�ales continuas
%% Introducci�n
% Elabore un reporte de los m�todos descritos en la lista
% de reproducci�n que incluya el desarrollo de los ejemplos expuestos. 
%
% * 1. M�todos num�ricos: Teorema fundamental del C�lculo, Integraci�n 1
% <https://www.youtube.com/watch?v=OFHAN-WwLEw&t=2s>
%%
% <<v1_eq01.png>>
%
% segun el teorema fundamental del calculo primero tendriamos que ver si es
% integrable. (Recordando que toda funcion continua es integrable en un intervalo cualquiera)
% 
% <<v1_eq02.png>>
% 
% 
% <<v1_eq03.png>>
% 
% El problema que encontramos es que no existe una antiderivada
% 
% <<v1_eq04.png>>
% 
% Considerando un polinomio.
% 
% <<v1_eq05.png>>
% 
% Eligiendo aproximaf la funcion con el polinomio constante
% 
% <<v1_eq06.png>>
% 
%%
%
% * 2. M�todos num�ricos: Newton-Cotes, regla del trapecio, Integraci�n 2
% <https://www.youtube.com/watch?v=Fe79KWPf0Do&t=4s>
%%
% Este m�todo es eficiente si se conocen los valores de la funci�n en puntos igualmente separados. Si se pueden cambiar los 
% puntos en los cuales la funci�n es evaluada otros m�todos como la cuadratura de Gauss son probablemente m�s eficientes.
% 
%%
% <<v2_eq01.png>>
% 
% 
% <<v2_eq02.png>>
% 
% Funcion igual a un polinomio de grado 1,2,3...n que concide con la funcion en
% determinados puntos mas un termino de error
% 
% <<v2_eq03.png>>
% 
% Formula cerrada de (n+1)puntos  de Newton-Cotes, donde:
% 
% <<v2_eq04.png>>
% 
% 
% <<v2_eq05.png>>
% 
% Debemos encontrar el valor de xi como parte real y parte imaginaria.
% 
% <<v2_eq06.png>>
% 
% Realizamos la integral de la exponencial.
% 
% <<v2_eq07.png>>
% 
%%
%
% * 3. M�todos num�ricos: Newton-Cotes, regla de Simpson, regla de 3/8 de Simpson, Integraci�n 3
% <https://www.youtube.com/watch?v=Ykgdo9Sr354>
%%
% Se utilizan los polin�mios de intercalacion de lenguaje
% 
% <<v3_eq01.png>>
%
% 
% <<v3_eq02.png>>
%
% formula cerrada de (n+1) puntos de Newton.
% 
% <<v3_eq03.png>>
% 
% 
% 
% <<v3_eq04.png>>
% 
% 
% 
% <<v3_eq05.png>>
% 
% 
% 
% <<v3_eq06.png>>
% 
% 
% 
% <<v3_eq07.png>>
% 
% 

%%
% * 4. M�todos num�ricos: regla del trapecio compuesta , regla de Simpson compuesta, Integraci�n 4
% <https://www.youtube.com/watch?v=UJMZviPb6GE&t=1s>
%%
% Formulas cerradas de newton-Cotes Compuestas
% se divide en varios trapecios para tener una mejor aproximacion de la
% funci�n.
%%
% <<V4_EQ1.PNG>>
%
%%
% La regla compuesta del trapecio nos muestra la manupulacion del error de
% que los puntos intermedios se tengran que evaluar dos veces.
% 
%%
%
% <<V4_EQ2.PNG>>
%%
%
% En la regla compuesta de simpson estamos restringidos a que el numero de
% subinterbalos sea par para que cada dos formen una parabola.
%%
%
% <<V4_EQ3.PNG>>
%%
% * 5. M�todos num�ricos: Cuadratura Gaussiana, Integraci�n 5
% <https://www.youtube.com/watch?v=6i4N328QbpY&t=3s>
%
%%
% <<V5_EQ1.PNG>>
%
%%
%% Desarrollo
% Para el desarrollo se tienen que resolver cada uno de los siguientes
% problemas comenzando una nueva secci�n (para la publicaci�n) en cada uno de ellos.
% 
%% Problema 1 PR04
% Realiza la convoluci�n de las siguientes se�ales
%
% $g(t)=(1-t)[u(t)+u(-t-1)]+(t+1)[u(t-1)+(-t-2)]$
%
% $h(t)=u(t)+u(-t-1)$
%
%
% La se�al tiene como funcion anal�tica la siguiente imagen.
%%
% 
% <<FORMULAPR04-1_1.PNG>>
% 
%%
% El resultado de cada grafica y su comvolucion es el siguiente.
%
clear all
figure(12)
subplot(1,3,1)
syms t
x1=piecewise(t<0,0,0<t<1,1-t,1<t<2,t-1,t>2,0);
fplot(x1,[-1,3],'r')
grid on
title('g(t)')
xlabel('t')
ylabel('g(t)')
axis([-3 3 -3 3])
subplot(1,3,2)
x2=piecewise(t<0,0,0<t<1,1,t>1,0);
fplot(x2,[0,3],'r')
grid on
title('h(t)')
xlabel('t')
ylabel('h(t)')
axis([-2 2 -2 2])
x=@(t) ((-1*t)+1).*(t>=0&t<=1) + (t-1).*(t>1&t<=2);
y=@(t) 1.*(t>=0&t<=1);
t1=(0:0.01:1);
t2=(1:0.01:2);
t3=(2:0.01:3);
subplot(1,3,3)
hold on
plot(t1,(t1-(t1.^2/2)))
plot(t2,((t2.^2)-3*t2+5/2))
plot(t3,(-((t3.^2)/2)+2*t3-3/2))
grid on
title('x(t)*h(t)')
axis([-1 3.6 -2 2]);
%%
% <<giff_1.gif>>
%
%% Problema 3 PR04
% Realiza la convoluci�n de las siguientes se�ales
% 
% $g(t)=t[u(t)+u(-t-1)]+[u(t-1)+u(-t-2)]$
%
% $h(t)=[u(t-1)+u(-t-3)]$
%
%
% La se�al tiene como funcion anal�tica la siguiente imagen.
%%
% <<FORMULAPR04-33.PNG>>
%
%%
% El resultado de cada grafica y su comvolucion es el siguiente.
%%
clear all
figure(13)
subplot(1,3,1)
syms t
x1=piecewise(t<0,0,0<t<1,t,1<t<2,1,t>2,0);
fplot(x1,[-1,3],'r')
grid on
title('g(t)')
xlabel('t')
ylabel('g(t)')
axis([-3 3 -3 3])
subplot(1,3,2)
x2=piecewise(t<1,0,1<t<3,1,t>3,0);
fplot(x2,[0,3],'r')
grid on
title('h(t)')
xlabel('t')
ylabel('h(t)')
axis([-2 4 -2 2])
t1=(1:0.01:2);
t2=(2:0.01:3);
t3=(3:0.01:4);
t4=(4:0.01:5);
subplot(1,3,3)
hold on
plot(t1,(((t1-1).^2)/2))
plot(t2,(t2-(3/2)))
plot(t3,(3/2-((t3-3).^2)/2))
plot(t4,5-t4)
grid on
title('x(t)*h(t)')
axis([-1 7 -2 2]);
%%
% <<PR4_02.GIF>>
%
%% Problema e) PR06
% Realice la autocorrelacion de la siguiente se�al
%
% $x1(t) = u(t) - 2u(t - 3) + u(t - 4)$
%
% Utiliza la equivalencia que prefieras
%
% la funci�n anal�tica queda de la siguiente forma:
%
%%
% <<FORMULAPR04-3.PNG>>
%
%%
figure (10)
x1 = @(t) heaviside(t)-(2.*heaviside(t-3))+heaviside(t-4);  % % Definimos un x1
x11 = @(t) heaviside(-t)-(2.*heaviside(-t-3))+heaviside(-t-4); % % La invertimos
subplot (1,4,1)
syms t
fplot (x1,[-10,10], 'r')
grid on
title ('x1(t)')
axis ([-10 10, -5 5 ]);
figure(11)
t=[-10:0.01:10];
plot (t, x11 (t))
grid on
title('x11(t)')
axis([-10  10 , -5  5]);
%%
%
% <<pr6_e.gif>>
%
%% Problema f) PR06
%
% Realiza la correlaci�n de $R_x0x1(t)$ con las se�ales definidas en los ejercicios
% anteriores, utiliza la equivalencia que prefieras 
%
% la funci�n anal�tica queda de la siguiente forma:
%
% 
%%
% <<FORMULAPR04-4.PNG>>
%
%%
figure( 1 )
subplot (1,4,1)
syms t
x0 = @ (t) heaviside (t) - (2.*heaviside(t-2))+heaviside(t-4);
fplot (x0,[-10 , 10], 'r' )
grid on
title ( 'x0(t)' )
axis ([-10 10, -5 5]);
subplot (1,4,2)
x1 = @(t) heaviside(t)-( 2.*heaviside(t-3))+heaviside(t-4);
fplot(x1, [-10 ,10 ], 'r' )
hold on
title('x1(t)')
axis ([-10 10, -5 5]);
%%
% haciendo a x1 (-t) en x2
%%
x2 = @(t) heaviside(-t)-( 2.*heaviside (-t- 3 )) + heaviside (-t- 4 );
%%
%
% <<pr6_f.gif>>
%
%%
