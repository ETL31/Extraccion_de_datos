clc
clear

E=importdata('direccion.txt'); % rireccion
D = E*pi/180; %angulos en radianes ()
V=importdata('velocidad.txt'); % velocidad

[fi,co]=size(D);
u = [fi co];
v = [fi co];
%descomposicion de la matriz en u y v
for i = 1:fi
    for j = 1:co
        if D(i,j) >=0 && pi/2 >= D(i,j)
            u(i,j)= -V(i,j)*cos(D(i,j));
            v(i,j)= -V(i,j)*sin(D(i,j));
        elseif D(i,j) >= pi/2 && pi >= D(i,j)
            u(i,j)= -V(i,j)*cos(D(i,j)-pi/2);
            v(i,j)= V(i,j)*sin(D(i,j)-pi/2);
        elseif D(i,j) >= pi && 3*pi/2 >= D(i,j)
            u(i,j)= V(i,j)*cos(D(i,j)-pi);
            v(i,j)= V(i,j)*sin(D(i,j)-pi);
       elseif D(i,j) >= 3*pi/2 && 2*pi >= D(i,j)
            u(i,j)= V(i,j)*cos(D(i,j)-3*pi/2);
            v(i,j)= -V(i,j)*sin(D(i,j)-3*pi/2);
        end          
    end
end

u
v

dx= 5*110 % 1° lat/ling =110km
dy= 5*110

for j=2:size(v,2)-2  % son las mismas dimensions
    for  i=2:size(v,1)-2
        P(i,j)=(v(i+1+1,j+1)-v(i-1+1,j+1 ))/(4*dy)-(u(i+1,j+1+1)-u(i+1,j-1+1))/(4*dx);
    end
end

P

xnodos = linspace(0,1,18);
ynodos = linspace(0,1,13);
surf(xnodos,ynodos,P);
title ('mallado');
xlabel('x');
ylabel('y');


        
        



