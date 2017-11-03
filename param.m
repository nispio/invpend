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



% Define the dynamic and control matrices  P.A, P.B, P.C here



% Define anything else for the controller you might need 

