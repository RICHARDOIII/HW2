function [ u ] = midpoint(tmin,tmax,cond,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    t=tmin+dt:dt:(tmax-dt);
    u=zeros(1,length(t)+1);
    u(1)=cond;
    for i=1:length(t)
        u(i+1)=(u(i)-25*(dt)*u(i)+50*dt*cos(t(i)+dt))/(1+25*dt);
    end
end