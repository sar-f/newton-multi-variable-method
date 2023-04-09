syms X Y;
f = 4*X^2  - 4*X*Y + 2* Y^2;
x(1) = 2;
y(1) = 3;
e = 10^(-8); 
geradian = [subs(diff(f, X),[X,Y], [x(1),y(1)]) subs(diff(f, Y), [X,Y], [x(1),y(1)])]; % Geradian
dx2 = diff(diff(f, X),X);
dy2 = diff(diff(f, Y),Y);
dxy = diff(diff(f, X),Y);
Hessian = [ subs(dx2, [X,Y], [x(1),y(1)]), subs(dxy, [X,Y], [x(1),y(1)]);...
    subs(dxy, [X,Y], [x(1),y(1)]), subs(dy2, [X,Y], [x(1),y(1)])]; % Hessian
inverse = inv(Hessian); 
disp(inverse)
i = 1;
while norm(geradian) > e
    S = [x(i),y(i)]';
    p = S -inverse*geradian';
    x(i+1)=p(1,1);
    y(i+1) = p(2,1);
    i = i+1;
    geradian = [subs(diff(f, X),[X,Y], [x(i),y(i)]) subs(diff(f, Y), [X,Y], [x(i),y(i)])]; %geradian
   
    Hessian = [subs(dx2, [X,Y], [x(i),y(i)]), subs(dxy, [X,Y], [x(i),y(i)]);...
        subs(dxy, [X,Y], [x(i),y(i)]), subs(dy2, [X,Y], [x(i),y(i)])]; % Hessian
    inverse = inv(Hessian);
end

disp(x(i));
disp(y(i));