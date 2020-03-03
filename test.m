clear all;clc;

f=@(u,t) -50*(u -cos(t));

forward(0,1,conds,f,.05)