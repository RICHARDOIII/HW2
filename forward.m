function [u] = forward(umin,umax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    
    t=umin:dt:(umax-dt);
    u=zeros(1,length(t)+1);
    u(1)=cond;
    for i=1:length(t)
        u(i+1)=u(i)+dt*f(u(i),t(i));
    end
end

