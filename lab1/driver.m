D = 25.5; %[in]
rcm = 6.5; %[in]
m = 2.98; %[kg]

lengths = convlength([D rcm],'in','m');

r = lengths(1)/2;
rcm = lengths(2);

Ixx = m*r^2/2;
Izz = Ixx;
Iyy = m*r^2;

I = diag([Ixx Iyy Izz]);

H_w_o = I*omeg_w_i_g;

omeg_g_i = [0 0 Omeg3];

omeg_w_i_g = [omeg1 0 0]' + omeg_g_i;

M_o = d/dt * H_w_o + cross(omeg_g_i,H_w_o);

