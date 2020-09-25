function [axis] = quat2axis(q)
    
    theta = rad2deg(acos(q(4))*2);
    
    axis(1:3) = q(1:3)./sind(theta/2);
    axis(4) = theta;

end