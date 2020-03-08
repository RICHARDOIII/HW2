function [ u ] = RK2(tmin,tmax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    t=tmin:dt:(tmax);
    u=zeros(1,length(t)-1);
    u(1)= cond;
    c=1;
    for i=1:length(t)-1
        t2=t(i)+dt/2;
        u2=u(i)+(dt/2)*f(u(i),t(i));
        u(i+1)=u(i)+dt*(f(u2,t2));
    end
    c=c+2.75;
end