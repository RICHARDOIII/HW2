clear all;clc;close all;

f=@(u,t) -50*(u -cos(t));
timesteps=[.025,.01,.0025,.001];
conds=0;
forw=zeros(1,length(timesteps));
for i=1:length(timesteps)

tempforward=forward(0,1,conds,f,timesteps(i));
forw(i)=tempforward(end);
end
time=0:timesteps(end):1;
figure
plot(time,tempforward)
figure
plot(timesteps,forw);