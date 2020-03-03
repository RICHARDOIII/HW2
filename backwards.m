function [u] = backwards(tmin,tmax,cond,dt)
%BACKWARDS Summary of this function goes here
%   Detailed explanation goes here
    t=tmin+dt:dt:(tmax);
    u=zeros(1,length(t)+1);
    u(1)=cond;
    for i=1:length(t)
        u(i+1)=(u(i)+(dt*50*cos(t(i))))/(1+50*dt);
    end
end

