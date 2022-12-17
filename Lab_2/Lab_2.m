X = [ 1 1.3 1.5 2 2.3 3 3.2 4 ];
Y = [ 12 13 15 20 24 28 31 35 ];
subplot(4,1,1)
plot(X,Y)

f = method_of_smaller_squares(X, Y);
subplot(4,1,2)
plot(X,f(X))

X1 = [ 0 1 2 4 ];
Y1 = [ 0.2 0.9 2.1 3.7 ];
subplot(4,1,3);
plot(X1,Y1);

X2 = [ -2 -1 0 1 2 ];
Y2 = [ 6 2 -1 -2 -1 ];
subplot(4,1,4);
plot(X2,Y2);
%Иными словами: мы ищем такую прямую, 
%что сумма квадратов длин расстояний от всех точек до этой прямой минимальна:
function y = method_of_smaller_squares(X, Y)
    n = size(X, 2);%8
    A = [n sum(X); sum(X) sum(X.^2)];  
    B = [sum(Y); sum(X.*Y)];
    C = inv(A).*B;
    A0 = C(1);
    A1 = C(2);
    y = @(x)A1+A0.*x;
end