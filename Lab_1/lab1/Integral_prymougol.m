%Метод средних прямоугольников

f=@(x)((2 .*sqrt(3)) ./(sqrt(3 - 9 .* x .^ 2) .* asin(sqrt(3) .* x)));% Функция b
g=@(x)(sin(x) ./ x .^ 3);% Функция a
a=0.4;
b=0.5;
n1=10;
n2=100;
int_of_f_1=rectangle(a,b,f,n1);
int_of_f_2=rectangle(a,b,f,n2);
int_of_f_3=integral(f,a,b);
int_of_g_1=rectangle(a,b,g,n1);
int_of_g_2=rectangle(a,b,g,n2);
int_of_g_3=integral(g,a,b);

delta_abs2=abs(int_of_f_3-int_of_f_2);
delta_abs3=abs(int_of_f_3-int_of_f_1);
delta_rel2=delta_abs2/int_of_f_3;
delta_rel3=delta_abs3/int_of_f_3;

disp('              Метод средних прямоугольников');
disp('Значение интеграла функции b с разбиением на 10: ')
disp(int_of_f_1)
disp('Значение интеграла функции b с разбиением на 100: ')
disp(int_of_f_2)
disp('Значение интеграла функции a с разбиением на 10: ')
disp(int_of_g_1)
disp('Значение интеграла функции a с разбиением на 100: ')
disp(int_of_g_2)
disp('Абсолютная погрешность: ')
disp(delta_abs3)
disp('Относительная погрешность:')
disp(delta_rel3)

function s = rectangle(a,b,f,n)
h=(b-a)/n;
s=0;
for i=a:h:(b-h)
    s=s+f(i+(h/2))*h;
end
end