function [ u ] = trap(tmin,tmax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    t=tmin+dt:dt:(tmax-dt);
    u=zeros(1,length(t)+1);
    u(1)=cond;
    for i=1:length(t)
        u(i+1)=(u(i)+(dt/2)*(f(u(i),t(i))+50*cos(t(i))))/(1+25*dt);
    end
end

