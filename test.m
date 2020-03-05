clear;clc;close all;

%% Exact
syms u(t)
ode = diff(u,t) == -50*(u-cos(t));
cond = u(0)==0;
uSol(t) = dsolve(ode,cond);

%% Setup
f=@(u,t) -50*(u -cos(t));
%timesteps=.0333;
timesteps=[.0333,.02,.01,0.005];
conds=0;%u(0)=1
%% Forwards
forwards=cell(length(timesteps),1);
for i=1:length(timesteps)
forwards{i}=forward(0,1,conds,f,timesteps(i));
end
hold on
[fo]=show(forwards,timesteps);
t=linspace(0,1,length(fo));
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
%% backwards
back=cell(length(timesteps),1);
for i=1:length(timesteps)
back{i}=backwards(0,1,conds,timesteps(i));
end
[ba]=show(back,timesteps);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
%% trapzoid
traps=cell(length(timesteps),1);
for i=1:length(timesteps)
traps{i}=trap(0,1,conds,f,timesteps(i));
end
[tra]=show(traps,timesteps);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
%% Midpoint
hold on
mid=cell(length(timesteps),1);
for i=1:length(timesteps)
mid{i}=midpoint(0,1,conds,timesteps(i));
end
[mi]=show(mid,timesteps);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
%% RK2

%% ADAM
timesteps=[.016,.01,0.005,.002];
hold on
adam=cell(length(timesteps),1);
for i=1:length(timesteps)
adam{i}=AB2(0,1,conds,f,timesteps(i));
end
[ada]=show(adam,timesteps);
plot(t,uSol(t),'^')
legend('t=.016','t=.01','t=.005','t=.002','exact')
hold off
figure
%% all
    hold on
    t=linspace(0,1,length(fo));
    plot(t,ba)
    plot(t,fo)
    plot(t,uSol(t))
    t=linspace(0,1,length(tra));
    plot(t,tra)
    plot(t,mi)
    legend('Backwards','Forwards','Exact','Trapezoidal','Midpoint')

%%plotting method
function [fo]=show(fo,timesteps)   
    fo=cell2mat(cellfun(@(x)   x(:),fo,'uniformoutput',false));
    time=1./timesteps;
for i=1:length(timesteps)
   t= linspace(0,1,time(i));
   plot(t,fo(1:length(t)),'LineWidth',1)
   if i~=length(timesteps)
   fo(1:length(t))=[];
   end
end
end