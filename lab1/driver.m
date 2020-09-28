% ASEN 3200 Lab 2
% Plotting Predicted vs Actual Precession rates and periods


clear;clc;close all

r = convlength(25.5/2,'in','m');
l = convlength(6.5,'in','m');
m = 2.98;
g = 9.81;

data = [42,8.8;46,9;50,9.9;53,10.3];

omeg_s = [30:70]*(1000/3600); %km/hr -> m/s

omeg_s = omeg_s./r; %rad/s

omeg_p = (l*g)./(r^2.*omeg_s);

time = (2*pi)./omeg_p;

omeg_s = omeg_s * r * (3600/1000);
figure
title('Precession Period vs Tire Spin Rate')
hold on
plot(omeg_s,time)
f = fit(data(:,1),data(:,2),'poly1');
plot(f)
for i = 1:4
    plot(data(i,1),data(i,2),'o')
end
legend('Predicted Curve')
xlabel('Tire Spin Rate [km/hr]')
ylabel('Precession Period [s]')

figure
title('Precession Rate vs Tire Spin Rate')
hold on
plot(omeg_s,omeg_p)
f2 = fit(data(:,1),(2*pi)./data(:,2),'poly1');
plot(f2)
for i = 1:4
    plot(data(i,1),(2*pi)./data(i,2),'o')
end
legend('Predicted Curve','Fitted Curve')
xlabel('Tire Spin Rate [km/hr]')
ylabel('Precession Rate [rad/sec]')