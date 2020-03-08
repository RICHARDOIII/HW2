function [ u ] = RK4(tmin,tmax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    t=tmin:dt:(tmax-dt);
    u=zeros(1,length(t));
    u(1)= cond;
    counter=0;
    for i=1:length(t)
        u1=f(u(i),t(i));
        u2=f(u(i)+(dt/2)*u1,t(i)+(dt/2));counter=counter+1;
        u3=f(u(i)+(dt/2)*u2,t(i)+(dt/2));counter=counter+.5;
        u4=f(u(i)+(dt)*u3,t(i)+(dt));counter=counter+.5;
        u(i+1)=u(i)+dt*((1/6)*u1+(2/6)*u2+(2/6)*u3+(1/6)*u4);counter=counter+1;
    end
    setGlobalx(counter)
end