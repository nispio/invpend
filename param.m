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

% Define the Performance weightings  Q, R here
Q = eye(4);
R = eye(4);


% Define the dynamic and control matrices  P.A, P.B, P.C here
P.A = [ 0,                        0,                             1, 0;
        0,                        0,                             0, 1;
        0,             -P.g*P.m/P.M,    -P.k*P.k/(P.M*P.R*P.r*P.r), 0;
        0,  (P.M+P.m)*P.g/(P.M*P.L), P.k*P.k/(P.M*P.R*P.r*P.r*P.L), 0 ];

P.B = [ 0;   0; P.k/(P.M*P.R*P.r);  -P.k/(P.M*P.R*P.r*P.L)];

P.C = [1 0 0 0; 0 1 0 0];

P.x0 = [0; 0.5; 0; 0;];

% Define anything else for the controller you might need 

