function drawPendulum(u,L,gap,width,height)

% define persistent variables
persistent base_handle
persistent rod_handle
persistent bob_handle
persistent wheel1_handle
persistent wheel2_handle

% process inputs to function
x        = u(1);  % Cart position
theta    = u(2);  % pendulum angle
t        = u(3);

% first time function is called, initialize plot and persistent vars
if t==0
   figure(1), clf
   track_width=5;  % width of x-axis
   plot([-track_width,track_width],[0,0],'k'); % plot track
   hold on
   base_handle = drawBase(x, width, height, gap, [], 'normal');
   rod_handle  = drawRod(x, theta, L, gap, height, [], 'normal');
   bob_handle  = drawBob(x, theta, L, gap, height, [], 'normal');
   wheel1_handle  = drawWheel(x, width, -1, gap, [], 'normal');
   wheel2_handle  = drawWheel(x, width, 1, gap, [], 'normal');
   axis([-track_width, track_width, -L, 2*track_width-L]);
   axis square;
   grid;
   % at every other time step, redraw base and rod
else
   drawBase(x, width, height, gap, base_handle);
   drawRod(x, theta, L, gap, height, rod_handle);
   drawBob(x, theta, L, gap, height, bob_handle);
   drawWheel(x, width, -1, gap, wheel1_handle);
   drawWheel(x, width, 1, gap, wheel2_handle);
   drawnow
end


end  % function  drawPendulum

   
%
%=======================================================================
% drawBase
% draw the base of the pendulum
% return handle if 3rd argument is empty, otherwise use 3rd arg as handle
%=======================================================================
%
function handle = drawBase(x, width, height, gap, handle, mode)
  
  X = [x-width/2, x+width/2, x+width/2, x-width/2];
  Y = [gap, gap, gap+height, gap+height];

  if isempty(handle)
    handle = fill(X,Y,[205 133 63]/255);
  else
    set(handle,'XData',X,'YData',Y);
  end
end   % function drawBase
 
%
%=======================================================================
% drawRod
% draw the pendulum rod
% return handle if 3rd argument is empty, otherwise use 3rd arg as handle
%=======================================================================
%
function handle = drawRod(x, theta, L, gap, height, handle, mode)
width = 0.075;
  X = [x-width/2, x+width/2, x+width/2+L*sin(theta), x-width/2+L*sin(theta)];
  Y = [gap+height, gap+height, gap+height + L*cos(theta), gap+height+L*cos(theta)];

  if isempty(handle),
    handle = fill(X,Y,[245 222 179]/255);
  else
    set(handle,'XData',X,'YData',Y);
  end

end  % function drawRod

%
%=======================================================================
% drawBob
% draw the pendulum Bob
% return handle if 3rd argument is empty, otherwise use 3rd arg as handle
%=======================================================================
%
function handle = drawBob(x, theta, L, gap, height, handle, mode)
  width = 1.5*gap;
  pos = [x+L*sin(theta)-width/2 gap+height+L*cos(theta)-width/2 width width];

  if isempty(handle)
    handle = rectangle('Position', pos, ...
                       'Curvature', [1,1], ...
                       'FaceColor', [245 222 179]/255);
  else
    set(handle, 'Position', pos);
  end

end  % function drawBob

%
%=======================================================================
% drawWheel
% draw a wheel of the cart
% return handle if 3rd argument is empty, otherwise use 3rd arg as handle
%=======================================================================
%
function handle = drawWheel(x, width, offset, gap, handle, mode)
  diam = 1.5*gap
  pos = [x+offset*(width-diam)/2.1-diam/2 0 diam diam];

  if isempty(handle)
    handle = rectangle('Position', pos, ...
                       'Curvature', [1,1], ...
                       'FaceColor', [205 133 63]/255);
  else
    set(handle, 'Position', pos);
  end

end  % function drawWheel

  