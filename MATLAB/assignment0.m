% Problem 1
num1= [1 6 -2];
den1= [1 7 8];
sys1=tf(num1, den1);
pzmap(sys1)
p=pole(sys1);
S=isstable(sys1);
disp(S)

% Problem 2
a1=[1 1];
b1=[1 5];
num2=conv(a1, b1);
a2= [1 6];
b2=[1 -9];
den2=conv(a2, b2);
sys2=tf(num2, den2);
pzmap(sys2)
p1=pole(sys2);
S1=isstable(sys2);
disp(S1)

% Problem 3
a3=[1 6];
b3=[1 7];
num3=conv(a3, b3); 
a4=[1 10];
b4=[1 11];
%c4=[1 0]; %to check type 1 function
%den3=conv(conv(a4, b4),c4); % convolution of checking type 1 function
den3=conv(a4, b4);
%sys3=tf(num3,den3); % checking transfer function for type 1
p2=pole(sys3);

type=input('enter the type');
new_fun=check_type(type);
newden=conv(den3,new_fun);
sys3=tf(num3, newden);
pzmap(sys3)

[num3,den3] = tfdata(sys3,'v'); % extract numerator and denominator
num_degree = length(num3)-1; % numerator degree
den_degree = length(den3)-1; % denominator degree
switch true
    case num_degree == 1 && den_degree == 1
        disp('The system is a first-order system')
    case num_degree == 2 && den_degree == 2
        disp('The system is a second-order system')
    case num_degree == 3 && den_degree == 3
        disp('The system is a third-order system')
    case num_degree > den_degree
        disp('The system is a higher-order system with more poles than zeroes')
    otherwise
        disp('The system is a higher-order system with more zeroes than poles')
end

zero_poles = sum(p2 == 0); % count the number of poles at the origin
if zero_poles == 0
    disp('System is Type 0')
elseif zero_poles == 1
    disp('System is Type 1')
elseif zero_poles == 2
    disp('System is Type 2')
else
    disp('System is of higher order')
end
