clc;
clear all;
close all;
% Problem 1
C=[1 2 8 15 20 16 16];
p=roots(C);
disp(p)

c1= [5 5];
c2=[3 8 5];
c3=[1 3 3 1];
c=conv(conv(c1,c2),c3);
p1=roots(c);
disp(p1)
%Problem 2
a=[8];
a1=[1 3];
a2=[1 4];
num=conv(conv(a,a1),a2);
b=[1 0];
b1=[1 2];
b2=[1 2 5];
den=conv(conv(b,b1),b2);
sys=tf(num,den);
[p,z]=pzmap(sys);
disp(p)
disp(z)


num1=[1 3 2 1];
den1=[5 3 2 1 1 1];
sys1=tf(num1,den1);
[p1,z1]=pzmap(sys1);
disp(p1)
disp(z1)

%problem 3
e=[100];
e1=[1 5];
e2=[1 4];
num2=conv(conv(e,e1),e2);
disp(num2)
f=[1 0 0];
f1=[1 10];
f2=[1 14];
f3=[1 20];
den2=conv(conv(f,f1),conv(f2,f3));
disp(den2)
sys2=tf(num2,den2);
pzmap(sys2);

g=[100];
g1=[3 2];
num3=conv(g,g1);
h=[1 0];
h1=[5 3];
h3=[6 4];
den3=conv(conv(h,h1),h3);
sys3=tf(num3,den3);
figure(2);
pzmap(sys3);

%problem 4
s=tf('s');
G=100*(s+4)(s+20)/(s^3(s+100)*(s+500));
H= tf(1,1);
sys4=feedback(G,H);
disp(sys4)
sys5=feedback(G,H,+1);
disp(sys5)
