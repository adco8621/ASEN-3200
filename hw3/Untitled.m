%3a
I = [20 -10 0; -10 30 0; 0 0 40];
w = [10;20;30];

H = I*w

Tr = .5*dot(w,H)

DCM = findDCM(30,-30,120,'313')


quat = q_from_dcm(DCM)

z = [0 0 1]';

zn = DCM*z

angle = rad2deg(atan2(norm(cross(z,zn)),dot(z,zn)))