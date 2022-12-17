%Метод симсона

f=@(x)((2 .*sqrt(3)) ./(sqrt(3 - 9 .* x .^ 2) .* asin(sqrt(3) .* x)));% Функция b
g=@(x)(sin(x) ./ x .^ 3);% Функция a
a=0.4;
b=0.5;
n1=10;
n2=100;
arr(1)=simson(a,b,f,n1);
arr(2)=simson(a,b,f,n2);
arr(3)=integral(f,a,b);

arr_g(1)=simson(a,b,g,n1);
arr_g(2)=simson(a,b,g,n2);
arr_g(3)=integral(g,a,b);

delta_abs_f1=abs(arr(3)-arr(2));
delta_abs_f2=abs(arr(3)-arr(1));
delta_rel_f1=delta_abs_f1/arr(3);
delta_rel_f2=delta_abs_f2/arr(3);


delta_abs_g1=abs(arr_g(3)-arr_g(2));
delta_abs_g2=abs(arr_g(3)-arr_g(1));
delta_rel_g1=delta_abs_g1/arr_g(3);
delta_rel_g2=delta_abs_g2/arr_g(3);

disp('              Метод симпсона');
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
function sum = simson(a,b,f,n)
    h = (b-a)/n;
    sum = 0;
    k1 = 0; 
    k2 = 0;
    for i=1:2:n
        k1 = k1 + f(a + i*h);
        k2 = k2 + f(a + (i+1)*h);
    end
    sum=h/3*(f(a) + 4*k1 + 2*k2);
end