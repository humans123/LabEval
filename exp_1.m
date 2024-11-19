clc
clear all
% User input for amplitude and phase
A = input('Enter the amplitude of the sinusoidal wave: ');
phase = input('Enter the phase of the sinusoidal wave  ');
f=.5;
% Convert phase to radians

% Time vector
t = -20:0.01:20;

% Sinusoidal Wave
sin_wave = A * sin(2*pi*f*t + phase);

% Plotting the sinusoidal wave
figure;
plot(t, sin_wave);
title('Sinusoidal Wave,102206221');
xlabel('Time');
ylabel('Amplitude');
