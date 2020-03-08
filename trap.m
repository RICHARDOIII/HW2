function [ u ] = trap(tmin,tmax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    t=tmin+dt:dt:(tmax-dt);
    u=zeros(1,length(t));
    u(1)=cond;
    c=1;
    for i=1:length(t)
        options=optimset('Display','off');
        F=@(un) (un-u(i)-(dt/2)*(f(un,t(i)+dt)+f(u(i),t(i))));
        u(i+1)=fsolve(F,u(i),options);
        c=c+3.25;
    end
    setGlobalx(c);
end

