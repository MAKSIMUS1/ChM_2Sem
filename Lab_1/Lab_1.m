%Вариант 11
%Метод средних прямоугольников
%f=@(x)(sin(x) ./ x .^ 3);%Функция a
f=@(x)((2 .*sqrt(3)) ./(sqrt(3 - 9 .* x .^ 2) .* asin(sqrt(3) .* x)));%Функция b
a=0.4;
b=0.5;
eps = 0.001;
Sum = 0;
n = 10;
h=(b-a)/n;
I_old=(f(a)+f(b))*h/2;
I_new=I_old/2+h*f(a+h)*h;
eps_pr=abs(I_new-I_old)/3;
while(eps_pr>eps)
    I_old=I_new;
    Sum=0;
    for j=0:n-1
        Sum=Sum+f(a+j*h+h/2);
    end
    I_new=Sum*h;
    eps_pr=abs(I_new-I_old)/3;
end
eps_pr = abs(I_new - integral(f,a,b));
eps_teor = abs(I_new / integral(f,a,b));
disp('              Метод средних прямоугольников');
disp(['Значение интеграла: ',num2str(I_new)])
disp(['Шаг: ',num2str(h)])
disp(['Абсолютная погрешность: ',num2str(eps_pr)])
disp(['Кол-во разбиений: ', num2str(n)])
disp(['Относительная погрешность:', num2str(eps_teor)])

%Метод трапеции
Sum=0;
I_old=(f(a)+f(b))*h/2;
I_new=I_old/2+h*f(a+h)*h; eps_pr=abs(I_new-I_old)/3;
while(eps_pr>eps)
    I_old=I_new;
    Sum=0;
    for j=0:n-1
        Sum=Sum + (f(a+j*h) + f(a+(j+1)*h));
    end
    I_new=Sum*h/2;
    eps_pr=abs(I_new-I_old)/3;
end
eps_pr =  abs(I_new - integral(f,a,b));
eps_teor = abs(I_new / integral(f,a,b));
disp('              Метод трапеций');
disp(['Значение интеграла: ',num2str(I_new)])
disp(['Шаг: ',num2str(h)])
disp(['Абсолютная погрешность: ',num2str(eps_pr)])
disp(['Кол-во разбиений: ', num2str(n)])
disp(['Относительная погрешность:', num2str(eps_teor)])

%Метод Симпсона
Sum_n=0;
Sum_m=0;
I_old=(f(a)+f(b))*h/2;
n1 = n;
h1 = h /2;
I_new=I_old/2+h*f(a+h)*h;
eps_pr=abs(I_new-I_old)/15;
while(eps_pr>eps)
    I_old=I_new;
    Sum=0;
    Sum_s=0;
    Sum_n=0;
    Sum_m=0;
    h1=h/2;
    n1=2*n;
    for j=2:2:n-1
        Sum_n=Sum_n+f(a+j*h);
    end
    for j=1:2:n
        Sum_m=Sum_m+f(a+j*h);
    end
    Sum_s=f(a)+f(b);
    Sum=Sum_s+2*Sum_n+4*Sum_m;
    I_new=Sum*(h/3);
    eps_pr=abs(I_new-I_old)/15;
end
eps_pr =  abs(I_new - integral(f,a,b));
eps_teor = abs(I_new / integral(f,a,b));
disp('              Метод Симпсона');
disp(['Значение интеграла: ',num2str(I_new)])
disp(['Шаг: ',num2str(h)])
disp(['Абсолютная погрешность: ',num2str(eps_pr)])
disp(['Кол-во разбиений: ', num2str(n)])
disp(['Относительная погрешность:', num2str(eps_teor)])