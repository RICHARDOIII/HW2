clear;clc;close all;

%% Exact
syms u(t)
ode = diff(u,t) == -50*(u-cos(t));
cond = u(0)==0;
uSol(t) = dsolve(ode,cond);

%% Setup
f=@(u,t) -50*(u -cos(t));
timesteps=.01;
%timesteps=[.025,.01,.0025,.001];
conds=0;%u(0)=1
%% Forwards
forwards=cell(length(timesteps),1);
for i=1:length(timesteps)
forwards{i}=forward(0,1,conds,f,timesteps(i));
end
hold on
[fo]=show(forwards,timesteps);
t=linspace(0,1,length(fo));
plot(t,uSol(t))
hold off
figure
%% backwards
back=cell(length(timesteps),1);
for i=1:length(timesteps)
back{i}=backwards(0,1,conds,timesteps(i));
end
[ba]=show(back,timesteps);
plot(t,uSol(t))
hold off
figure

%% all
    hold on
    t=linspace(0,1,length(fo));
    plot(t,ba)
    plot(t,fo)
    plot(t,uSol(t))
%%plotting method
function [fo]=show(fo,timesteps)   
    fo=cell2mat(cellfun(@(x)   x(:),fo,'uniformoutput',false));
    time=1./timesteps;
for i=1:length(timesteps)
   t= linspace(0,1,time(i));
   plot(t,fo(1:length(t)))
   if i~=length(timesteps)
   fo(1:length(t))=[];
   end
end
end