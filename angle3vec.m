function angle = angle3vec(u,v)
    angle = rad2deg(atan2(norm(cross(u,v)),dot(u,v)));
end