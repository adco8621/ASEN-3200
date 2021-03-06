%% Attitude hw 1
%% 1

DCM = [ 0.26726, 0.53452, 0.80178;...
       -0.44376, 0.80684,-0.38997;...
       -0.85536,-0.25158, 0.45284];
   
u = [-50;100;75];

V = DCM*u

%% 2

findDCM(40,25,0,123)

%% 3

% a

a = findDCM(35,35,35,321)

b = findDCM(35,35,35,313)

% b

a1 = eig(a)
b1 = eig(b)

%% 4

c = findDCM(50,25,70,313)
d = c*[1;0;0]

acosd(dot([1;0;0],d))

%% 5

% a = dV/dt + omega x V
a = [12,0,0]+cross([0,0,8],[8,4,0])

%% 6
syms x y z

cross([x,y,0],[x,y,z])