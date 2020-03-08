function [u] = forward(tmin,tmax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    
    t=tmin:dt:(tmax);
    u=zeros(1,length(t)-2);
    u(1)=cond;
    counter=0;
    for i=1:length(t)
        u(i+1)=u(i)+dt*f(u(i),t(i));counter=counter+1;
    end
    setGlobalx(counter)
end

