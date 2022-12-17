A=[2 3 3 3;
   2 2 2 3;
   2 2 1 2;
   2 2 1 1 ];
B=[5;
   5;
   4;
   3];
n = length(A);
C=[A,B];
[m,n]=size(C);
tic
for k=1:m-1
p=C(k,k)./C(k+1:m,k);
P=repmat(p,1,n-k+1);
C(k+1:m,k:n)=repmat(C(k,k:n),m-k,1)-P.*C(k+1:m,k:n);
end
toc
X(m)=C(m,n)/C(m,n-1);
tic
for k=m-1:-1:1
C(1:k,k+1)=C(1:k,k+2)-X(k+1)*C(1:k,k+1);
X(k)=C(k,k+1)/C(k,k);
end
toc
disp( X(1) );
disp( X(2) );
disp( X(3) );
disp( X(4) );