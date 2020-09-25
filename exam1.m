%% Exam 1

%% Problem 1

% Part a

Cib = findDCM(90,30,0,'213')

% part b

i3 = [0 0 1]';

i3b = Cib*i3

% part c

b3 = [0 0 1]';

b3i = Cib'*b3

% part d

qib = [0 0 0.3584 0.9336]'

eul = quat2axis(qib)

%part e

Cia = quat2dcm(qib)

% part f

a2 = [0 1 0]';

a2b = Cia*a2;

angle = angle3vec(a2b,[1 0 0])

%% problem 2

% part a

omeg = cross([3 0 0.3],[0 3 1])

%% functions I wrote previously

function angle = angle3vec(u,v)
angle = rad2deg(atan2(norm(cross(u,v)),dot(u,v)));
end

function [axis] = quat2axis(q)

theta = rad2deg(acos(q(4))*2);

axis(1:3) = q(1:3)./sind(theta/2);
axis(4) = theta;

end

function C = quat2dcm(q)

C(1,1) = q(1)^2-q(2)^2-q(3)^3+q(4)^4;
C(1,2) = 2*(q(1)*q(2)+q(3)*q(4));
C(1,3) = 2*(q(1)*q(3)-q(2)*q(4));
C(2,1) = 2*(q(1)*q(2)-q(3)*q(4));
C(2,2) = -q(1)^2+q(2)^2-q(3)^3+q(4)^4;
C(2,3) = 2*(q(2)*q(3)+q(1)*q(4));
C(3,1) = 2*(q(1)*q(3)+q(2)*q(4));
C(3,2) = 2*(q(2)*q(3)-q(1)*q(4));
C(3,3) = -q(1)^2-q(2)^2+q(3)^3-q(4)^4;

end

function DCM=findDCM(x,y,z,order)

Rx=[1    0           0;
    0    cosd(x)   sind(x);
    0    -sind(x)  cosd(x)];

Ry=[cosd(y)      0       -sind(y);
    0            1       0;
    sind(y)      0       cosd(y)];

Rz=[cosd(z)        sind(z)        0;
    -sind(z)       cosd(z)        0;
    0              0              1];

order = fliplr(order);

if order(1) == '1'
    DCM = Rx;
elseif order(1) == '2'
    DCM = Ry;
else
    DCM = Rz;
end

for i = 2:3
    
    if order(i) == '1'
        DCM = DCM*Rx;
    elseif order(i) == '2'
        DCM = DCM*Ry;
    else
        DCM = DCM*Rz;
    end
    
end



end
