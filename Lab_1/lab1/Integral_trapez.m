%Метод трапеций

f=@(x)((2 .*sqrt(3)) ./(sqrt(3 - 9 .* x .^ 2) .* asin(sqrt(3) .* x)));% Функция b
g=@(x)(sin(x) ./ x .^ 3);% Функция a
a=0.4;
b=0.5;
n1=10;
n2=100;
int_of_f_1=trap(a,b,f,n1);
int_of_f_2=trap(a,b,f,n2);
int_of_f_3=integral(f,a,b);

int_of_g_1=trap(a,b,g,n1);
int_of_g_2=trap(a,b,g,n2);
int_of_g_3=integral(g,a,b);

delta_abs_f1=abs(int_of_f_3-int_of_f_2);
delta_abs_f2=abs(int_of_f_3-int_of_f_1);
delta_rel_f1=delta_abs_f1/int_of_f_3;
delta_rel_f2=delta_abs_f2/int_of_f_3;


delta_abs_g1=abs(int_of_g_3-int_of_g_2);
delta_abs_g2=abs(int_of_g_3-int_of_g_1);
delta_rel_g1=delta_abs_g1/int_of_g_3;
delta_rel_g2=delta_abs_g2/int_of_g_3;


disp('              Метод трапеций');
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

function sum=trap(a,b,f,n)
    h=(b-a)/n;
    sum=0;
    for i=a:h:b
        if i~=b
            sum=sum +(f(i)+f(i+h))/2.*h;
        end
    end
end