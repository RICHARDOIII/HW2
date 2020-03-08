clear;clc;close all;

%% Exact
syms u(t)
ode = diff(u,t) == -50*(u-cos(t));
cond = u(0)==0;
uSol(t) = dsolve(ode,cond);
A=[];
%% Setup
f=@(u,t) -50*(u -cos(t));
%timesteps=.0333;
N=[30,60,100,240]';
timesteps=1./N;
conds=0;%u(0)=1
%% Forwards
forwards=cell(length(timesteps),1);
M=timesteps;
figure
for i=1:length(timesteps)
forwards{i}=zeros(length(N),1);
forwards{i}=forward(0,1,conds,f,timesteps(i));
M(i)=getGlobalx;setGlobalx(0);
end
figure
hold on
[fo,e]=show(forwards,timesteps,uSol);
t=linspace(0,1,length(fo));
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
% Error
show(e,timesteps,uSol);
title('Explicit')
hold off
figure
%loglog
er= error(e);
plot(log(N),log(er));
title('Explicit |E| loglog')
a=polyfit(log(N),log(er),1);
A=[A a(1)];
hold off
figure
plot(log(er),log(M))
title('Explicit Work loglog')
figure
hold on 

%% backwards
back=cell(length(timesteps),1);
for i=1:length(timesteps)
back{i}=backwards(0,1,conds,f,timesteps(i));
M(i)=getGlobalx;setGlobalx(0);
end
[ba,e]=show(back,timesteps,uSol);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
% Error
show(e,timesteps,uSol);
title('Implicit')
hold off
figure
%loglog
er= error(e);
plot(log(N),log(er));
title('Implicit |E| loglog')
a=polyfit(log(N),log(er),1);
A=[A a(1)];
figure
plot(log(er),log(M))
title('Implicit Work loglog')
figure
hold on 
%% trapzoid
traps=cell(length(timesteps),1);
for i=1:length(timesteps)
traps{i}=trap(0,1,conds,f,timesteps(i));
end
[tra,e]=show(traps,timesteps,uSol);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
% Error
show(e,timesteps,uSol);
title('Trapezoid')
hold off
figure
%loglog
er= error(e);
plot(log(N),log(er));
title('Trapezoid |E| loglog')
a=polyfit(log(N),log(er),1);
A=[A a(1)];
figure
plot(log(er),log(M))
title('Trapezoid Work loglog')
figure
hold on 
%% Midpoint
hold on
mid=cell(length(timesteps),1);
for i=1:length(timesteps)
mid{i}=midpoint(0,1,conds,f,timesteps(i));
end
[mi,e]=show(mid,timesteps,uSol);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
% Error
show(e,timesteps,uSol);
title('Midpoint')
hold off
figure
%loglog
er= error(e);
plot(log(N),log(er));
title('Midpoint |E| loglog')
a=polyfit(log(N),log(er),1);
A=[A a(1)];
figure
plot(log(er),log(M))
title(' Midpoint Work loglog')
figure
hold on 
%% RK2
hold on
RUK2=cell(length(timesteps),1);
for i=1:length(timesteps)
RUK2{i}=RK2(0,1,conds,f,timesteps(i));
end
title('Runge Kutta 2')
[rk2,e]=show(RUK2,timesteps,uSol);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
% Error
show(e,timesteps,uSol);
title('RK2')
hold off
figure
%loglog
er= error(e);
plot(log(N),log(er));
title('RK2 |E| loglog')
a=polyfit(log(N),log(er),1);
A=[A a(1)];
figure
plot(log(er),log(M))
title('RK2 Work loglog')
figure
hold on 
%% RK4
hold on
RUK4=cell(length(timesteps),1);
for i=1:length(timesteps)
RUK4{i}=RK4(0,1,conds,f,timesteps(i));
M(i)=getGlobalx;setGlobalx(0);
end
title('Runge Kutta 4')
[rk4,e]=show(RUK4,timesteps,uSol);
plot(t,uSol(t),'^')
legend('t=.0333','t=.02','t=.01','t=.005','exact')
hold off
figure
hold on
% Error
show(e,timesteps,uSol);
title('RK4')
hold off
figure
%loglog
er= error(e);
plot(log(N),log(er));
title('RK4 |E| loglog')
a=polyfit(log(N),log(er),1);
A=[A a(1)];
figure
plot(log(er),log(M))
title(' RK4 Work loglog')
figure
hold on 

%% ADAM
N=[60,120,240,480]';
timesteps=1./N;
hold on
adam=cell(length(timesteps),1);
for i=1:length(timesteps)
adam{i}=AB2(0,1,conds,f,timesteps(i));
end
[ada,e]=show(adam,timesteps,uSol);
plot(t,uSol(t),'^')
legend('t=.016','t=.01','t=.005','t=.002','exact')
hold off
figure
hold on
% Error
show(e,timesteps,uSol);
title('AB2')
hold off
figure
%loglog
er= error(e);
plot(log(N),log(er));
title('AB2 |E| loglog')
a=polyfit(log(N),log(er),1);
A=[A a(1)];
figure
plot(log(er),log(M))
title(' AB2 Work loglog')
figure
hold on 
%% all
    t=linspace(0,1,length(fo));
    plot(t,ba,'d')
    plot(t,fo,'s')
    plot(t,uSol(t),'LineWidth',1.5)
    t=linspace(0,1,length(tra));
    plot(t,tra,'o')
    plot(t,mi,'+')
    t=linspace(0,1,length(ada));
    plot(t,ada,'x')
    t=linspace(0,1,length(rk2));
    plot(t,rk2,'v')
    plot(t,rk4,'*')
    legend('Backwards','Forwards','Exact','Trapezoidal','Midpoint','AB2','RK2','RK4')
disp('Backwards   Forwards  Trapezoidal Midpoint   RK2      RK4      AB2')
disp('Expected')
E=[ -1 -1 -2 -2 -2.5 -4 -2];
disp(E)
disp('Observed')
disp(A)
disp('Error %')
disp(100*((E-A)./E))
disp(' We see the Trapezoid is one of the best methods out of the bunch. RK4 is pretty good beating the others in Work and the error is kinda the smallest when looking at the plots, but it requires a certain amount of timesteps to be viable, showing it''s instablity. The explicit methos are wicked cheap but the error is pretty terrible compared to the rest of them. I prefer the Trapezoid and Implicit due to their inherent stability.') 
%%plotting method
function [fo,e]=show(fo,timesteps,uSol)
   uSol = matlabFunction(uSol);
   e = cell(length(timesteps),1);
for i=1:length(timesteps)
   temp=fo(i);
   temp=cell2mat(cellfun(@(x)   x(:),temp,'uniformoutput',false));
   t= linspace(0,1,length(temp));
   e{i}=temp-uSol(t)';
   plot(t,temp,'LineWidth',1)
end
    fo=temp;
end
%% return list of final errors
function [ er] = error( e)
   er=size(e);
   er = zeros(er(1),1);
   for i=1:length(er)
     temp=e(i);
     temp=cell2mat(cellfun(@(x)   x(:),temp,'uniformoutput',false));
     er(i)=abs(temp(end));
   end
   end