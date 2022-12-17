F = @(x) x.^3+0.4.*x-1.2;
X = -10:1:10;
plot(X,F(X));
a = -1;
b  = 1;
eps = 0.01;

[der1, der2] = der();
der();
%----------------Метод деления отрезка пополам-------------
while abs(a - b) > eps
    x0 = (a + b) / 2; 
    if ((F(x0) * F(a)) < 0) 
        b = x0;
    else
        a = x0;
    end
end
x0;
%----------------------------------------------------------

a = -1;
b = 1;
%----------------Метод Ньютона-----------------------------
if F(a)*der2(a) > 0
    Xk = b;
else
    Xk = a;
end
while abs(F(Xk)) > eps
    X0 = Xk;
    Xk =  X0 - (F(X0)/(der1(X0)));
    Yk = F(Xk);
end
X0;
%----------------------------------------------------------


a = -1;
b  = 1;
%---------------Метод простой итерации---------------------
X0_ = metod_prost_iteraz(F,a,eps,der1);
function q = metod_prost_iteraz(F,a,eps,der1)
    M = @(a) 1.01.*der1(a);
    p = M(a);
    func_2 = @(q) q-F(q)./p; 
    q = a;
    proverka = 1;
    while proverka > eps
        q = a;  
        a = func_2(q);
        proverka = abs(a - q);
    end
end
%----------------------------------------------------------

%Производная и производная второго порядка
function [der1, der2] = der()
    syms x; %переменная
    f = x.^3+0.4.*x-1.2;
    der1 = matlabFunction(diff(f));
    der2 = matlabFunction(diff(f, 2));
end

