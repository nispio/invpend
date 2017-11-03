function drawPendulum(u,L,gap,width,height)

% define persistent variables
persistent base_handle
persistent rod_handle
    
% process inputs to function
x        = u(1);  % Cart position
theta    = u(2);  % pendulum angle
t        = u(3);

% first time function is called, initialize plot and persistent vars
if t==0,
   figure(1), clf
   track_width=5;  % width of x-axis
   plot([-track_width,track_width],[0,0],'k'); % plot track
   hold on
   base_handle = drawBase(x, width, height, gap, [], 'normal');
   rod_handle  = drawRod(x, theta, L, gap, height, [], 'normal');
   axis([-track_width, track_width, -L, 2*track_width-L]);
   grid;
   % at every other time step, redraw base and rod
else
   drawBase(x, width, height, gap, base_handle);
   drawRod(x, theta, L, gap, height, rod_handle);
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

  if isempty(handle),
    handle = fill(X,Y,'c');
  else
    set(handle,'XData',X,'YData',Y);
    drawnow
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
width = .1;
  X = [x-width/2, x+width/2, x+width/2+L*sin(theta), x-width/2+L*sin(theta)];
  Y = [gap+height, gap+height, gap+height + L*cos(theta), gap+height+L*cos(theta)];

  if isempty(handle),
    handle = fill(X,Y,'k');
  else
    set(handle,'XData',X,'YData',Y);
    drawnow
  end

end  % function drawRod

  