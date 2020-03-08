function [ u ] = midpoint(tmin,tmax,cond,f,dt)
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
    t=tmin+dt:dt:(tmax-dt);
    u=zeros(1,length(t)+1);
    u(1)=cond;
    counter=0;
    for i=1:length(t)
        options=optimset('Display','off');
        F=@(un) (un-u(i)-(dt)*(f((un+u(i))/2,(t(i)+dt+t(i))/2)));
        u(i+1)=fsolve(F,u(i),options);
        counter=counter+2.5;
        
    end
    setGlobalx(counter)
end