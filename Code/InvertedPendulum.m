
clear all;
clc;

%% * Initialisation

M = 1.22;       % mass of the cart (kg)
m = 0.12;       % mass of the pendulum (kg)
b = 2.28133;    % friction of the cart (N)
l = 0.146;      % length to pendulum centre of mass (m)
I = 0.0139231;  % inertia of the pendulum (kg m2)

g = 9.81;        % Acceleration of Gravity (m/s2)

%% * System parameters

C = (M + m) * (I + m*l^2) - m^2*l^2;

num = [m*l/C, 0];
den = [1, b*(I+m*l^2)/C, -m*g*l*(M+m)/C, -b*m*g*l/C];

%% * System model

%    - Transfer function
InvertPendulumTF = tf(num, den);

%    - Zero-Pole-Gain form
InvertPendulumZPK = zpk(InvertPendulumTF);

%% * Analysis

%    Q2 - Steability analysis

%    - Find zeros and poles of the open-loop system
olzpkInfo = get(InvertPendulumZPK);

%    - Root locus
figure(1);
clf;
rlocus(InvertPendulumTF);
%      1 pole (3.24) on the right-hand-side of the root locus

%    Q3 - Step and impulse response
figure(2);
clf;
step(InvertPendulumTF);

figure(3);
clf;
impulse(InvertPendulumTF);

%% * Off-line Design
close all;
sisotool(InvertPendulumTF);

%    - Lead and lag compensator cannot make it stable
