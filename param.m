% Clear persistent variables in functions
clear pendulum
clear drawPendulum
clear controller

% Define initialization parameters
P.x0 = [0;0;0;0];%Initial States [ x; theta; xdot; thetadot]
P.g  = 9.8;  % gravity
P.M  = 1; % cart mass kg
P.m  = 0.1; % pendulum bob weight
P.L  = 2; % length of pendulum rod meters
P.k  = 1;
P.R  = 4;
P.r  = 0.02;

% Define the dynamic and control matrices  P.A, P.B, P.C here
P.A = [ 0,                        0,                             1, 0;
        0,                        0,                             0, 1;
        0,             -P.g*P.m/P.M,    -P.k*P.k/(P.M*P.R*P.r*P.r), 0;
        0,  (P.M+P.m)*P.g/(P.M*P.L), P.k*P.k/(P.M*P.R*P.r*P.r*P.L), 0 ];

P.B = [ 0;   0; P.k/(P.M*P.R*P.r);  -P.k/(P.M*P.R*P.r*P.L)];

P.C = [1 0 0 0; 0 1 0 0];

% Approximate maximum values
x_max = 0.01;    % meters deviation
theta_max = 0.2; % radians from vertical
dx_max = 15;     % meters/second
dtheta_max = 20; % radians/second
q_max = [x_max, theta_max, dx_max, dtheta_max]';

% Max cart acceleration (m/s^2)
ddx_max = 3;
u_max = ddx_max/P.B(3);

% Define the Performance weightings  Q, R here
Q = diag(1./(q_max.*q_max));
R = 1/u_max^2;

% Solve for the feedback gain term K
[P.K, P.P, P.E] = lqr(P.A, P.B, Q, R);
