close all;clc;clear;
R_forward= @(z) 1+z;
R_backward= @(z) (1-z).^-1 ;
R_trapezoidal= @(z) (1+z./2)./(1-z./2);
R_rk2= @(z) 1+z+(z.^2)/2;
R_rk4= @(z) 1+z+(z.^2)/2 + (z.^3)/6+ (z.^4)/24;
abp=@(x) ((1+3.*x/2)+sqrt((1+3.*x/2).^2-2.*x))/2;
abn=@(x) ((1+3.*x/2)-sqrt((1+3.*x/2).^2-2.*x))/2;

J=-10;
dt=0:0.001:0.3;
z=J*dt;
f=abs(R_forward(z));
b=abs(R_backward(z));
tr=abs(R_trapezoidal(z));
r2=abs(R_rk2(z));
r4=abs(R_rk4(z));
ap=abs(abp(z));
an=abs(abn(z));
figure
plot(dt, [f; b; tr; r2; r4;ap;an])
legend('forward', 'backward', 'trapezoidal/midpoint', 'rk2', 'rk4', 'ab -positive','ab-negative')
title('J=-10');
xlabel('dt');
ylabel('|R(J*dt)|');
ylim([0 1])

u0=1;
t_min=0;
t_max=1.5;

F=@(u,t) -10*u;
f=@(u,t) exp(J*t);
t_exact=0:0.01:1.5;
solution=f(1,t_exact);


figure
dt=0.27854;%exact=0.27853;
u1=RK4(t_min,t_max,u0,F,dt);
t=linspace(0,1.5,length(u1));
plot(t_exact, solution, t, u1);
title('RK4, barely unstable (dt=0.27854) ');
legend('exact', 'approx')




figure
dt=0.2500; %exact=0.27853;
u1=RK4(t_min,t_max,u0,F,dt);
t=linspace(0,1.5,length(u1));
plot(t_exact, solution, t, u1);
title('RK4, barely unstable (dt=0.2500) ');
legend('exact', 'approx')

figure
% Save legend entry
LegendStrings{1}='exact'; 
dt=0.01:0.06:0.30;
dt(end)=.28;
plot(t_exact, solution);
for i=1:length(dt)
    LegendStrings{i+1}= ['dt = ',num2str(dt(i))];
    u1=abs(RK4(t_min,t_max,u0,F,dt(i)));
    t=linspace(0,1.5,length(u1));
    plot(t_exact, solution, t, u1);
    hold on;
    plot(t,u1)
end
ylabel('|u(t)|');
xlabel('t');
title('RK4 for unstable, stable timesteps');
legend(LegendStrings);
