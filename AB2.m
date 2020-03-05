function [ u ] = AB2(tmin,tmax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    t=tmin:dt:(tmax-dt);
    u=zeros(1,length(t)+1);
    u(1)= cond;
    u(2)=u(1)+dt*f(u(1),t(1));
    for i=2:length(t)-1
        u(i+1)=u(i)+dt*(1.5*f(u(i),t(i))-(1/2)*f(u(i-1),t(i-1)));
    end
end